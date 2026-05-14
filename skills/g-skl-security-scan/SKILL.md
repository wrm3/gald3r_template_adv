---
name: g-skl-security-scan
description: SAST-style static analysis for hardcoded secrets, injection patterns, insecure deserialization, path traversal, and other critical vulnerabilities. Severity-ranked findings with line references and remediation guidance.
---
# g-skl-security-scan

**Activate for**: `@g-security-scan`, "scan for secrets", "check for injection", "security analysis", "hardcoded credentials", "SAST", "find vulnerabilities", "pentest prep", "pre-deploy security check".

Note: This skill complements `g-skl-code-review` (which has an OWASP checklist). Use `g-security-scan` when you want a **focused security-only deep scan** on specific files or after a major change.

---

## Scope Declaration

Before scanning, confirm scope:
- Files/directories to scan (default: all modified files in current PR/commit)
- Language(s) detected
- Severity threshold (default: report Critical + High; flag Moderate)

---

## Scan Pass 1: Secret Detection

### Patterns to flag (Critical — always block)

| Pattern | Example | Action |
|---------|---------|--------|
| API keys | `OPENAI_API_KEY = "sk-..."` | Flag, redact, move to env var |
| Private keys | `-----BEGIN RSA PRIVATE KEY-----` | Flag immediately |
| AWS keys | `AKIA[0-9A-Z]{16}` | Flag, rotate |
| DB passwords | `password = "real_password"` | Flag, move to vault |
| JWT secrets | `secret = "my-jwt-secret"` | Flag |
| GitHub tokens | `ghp_[A-Za-z0-9]{36}` | Flag, rotate |

### Annotate findings
```
[CRITICAL] Hardcoded API key
  File: src/config.py:42
  Line: OPENAI_KEY = "sk-proj-abc123..."
  Fix:  Replace with: OPENAI_KEY = os.getenv("OPENAI_API_KEY")
        Remove value from git history if already committed.
```

---

## Scan Pass 2: Injection Vulnerabilities

### SQL Injection (High)
Look for: string concatenation or f-strings in SQL queries.
```python
# BAD:
query = f"SELECT * FROM users WHERE id = {user_id}"
cursor.execute(query)

# BAD:
cursor.execute("SELECT * FROM " + table_name + " WHERE id = " + str(uid))

# GOOD (parameterized):
cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
```

### Command Injection (High)
Look for: `subprocess`, `os.system`, `eval`, `exec` with user-controlled data.
```python
# BAD:
os.system(f"grep {user_input} /var/log/app.log")
subprocess.run(user_cmd, shell=True)

# GOOD:
subprocess.run(["grep", user_input, "/var/log/app.log"], shell=False)
```

### SSTI / Template Injection (High)
Look for: Jinja2/Mako `render_template_string` or `Template(user_input)`.

### XSS (Moderate for API/backend; High for SSR)
Look for: unescaped user content in HTML responses, `innerHTML =`, `dangerouslySetInnerHTML`.

---

## Scan Pass 3: Insecure Deserialization

### Python (High)
```python
# BAD:
data = pickle.loads(user_bytes)
data = yaml.load(user_str)   # without Loader=yaml.SafeLoader

# GOOD:
data = json.loads(user_str)
data = yaml.safe_load(user_str)
```

### JavaScript (High)
```javascript
// BAD:
eval(userInput)
new Function(userInput)()
JSON.parse(userInput)  // OK but validate schema after
```

---

## Scan Pass 4: Path Traversal

Look for: user-controlled values used in file path construction without sanitization.
```python
# BAD:
filepath = f"/app/uploads/{filename}"
open(filepath, "r")

# GOOD:
safe_path = os.path.join("/app/uploads", os.path.basename(filename))
open(safe_path, "r")
```

---

## Scan Pass 5: Auth & Session Issues

- [ ] Routes that modify state lack authentication decorator
- [ ] JWT decode without signature verification (`algorithms=["none"]`)
- [ ] Session cookies missing `HttpOnly`, `Secure`, `SameSite` flags
- [ ] Rate limiting absent on auth endpoints (`/login`, `/reset-password`)
- [ ] CORS `allow_origins="*"` on non-public APIs

---

## Scan Pass 6: Dependency-Level (Quick)

Run `g-skl-dependency-audit` for a full dep scan. Here, just flag:
- Any `import` of packages known to be deprecated/CVE-riddled (e.g., `pyjwt < 2.0`, `urllib3 < 1.26`)
- `requirements.txt` with unpinned `*` or `>=` without upper bound

---

## Report Format

```
## Security Scan Report
Date: YYYY-MM-DD
Files scanned: N
Language(s): Python / TypeScript / etc.
Tool: g-skl-security-scan (manual SAST pattern matching)

### Summary
| Severity | Count |
|----------|-------|
| Critical | N     |
| High     | N     |
| Moderate | N     |

### Findings

#### [CRITICAL-001] Hardcoded API Key
- **File**: src/config.py:42
- **Pattern**: OPENAI_KEY = "sk-proj-..."
- **Risk**: Credential exposure in repository
- **Fix**: Move to environment variable. If committed: rotate key immediately, use `git filter-repo` to scrub.

#### [HIGH-001] SQL Injection
- **File**: api/users.py:87
- **Pattern**: f"SELECT * FROM users WHERE name = '{name}'"
- **Risk**: Database exfiltration/manipulation
- **Fix**: Use parameterized query: `cursor.execute("... WHERE name = %s", (name,))`
```

### Clean Bill
```
✓ No critical or high-severity findings in N files scanned.
  (N moderate findings — see below for details)
```

---

## False Positive Protocol

If a finding is intentional (e.g., test fixture with fake key):
- Add `# nosec: test-only fake credential` comment above the line
- Security scan will skip annotated lines in future runs

---

## Integration with g-go-review

When invoked from `g-go-review`:
1. Auto-scope to files changed in the current task/PR
2. **Critical findings** → review FAIL (block `[✅]`)
3. **High findings** → review FAIL unless annotated with `# nosec:`
4. **Moderate/Low** → report but do not fail; create BUG entry via `g-skl-bugs`
