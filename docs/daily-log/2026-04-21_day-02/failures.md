# 💥 Failures

## 1. CORS issue
Cause:
- Browser blocked cross-origin request

Fix:
- Enabled Flask-CORS

---

## 2. UFW blocking ports
Cause:
- Firewall restrictions

Fix:
- Allowed ports 5000 and 8080

---

## 3. PostgreSQL authentication failure
Cause:
- Incorrect user/password setup

Fix:
- Created sre_user with password

---

## 4. Sequence permission error
Cause:
- Table permission ≠ sequence permission

Fix:
- Granted privileges on sequences

---

## 🔥 Learning
Failures happen across layers:
- Network
- Security
- Database
- Application
