# Validation — LAB 1: IAM Least Privilege & Escalation Prevention

## Purpose
To ensure the IAM security controls prevent privilege escalation and enforce least privilege.

---

## Steps Performed

1. **Test Over-Permissive Policy**
```bash
aws iam create-user --user-name attacker

Expected Result: ✅ Allowed (demonstrates vulnerability)

2. Test Role Assumption

aws sts assume-role --role-arn arn:aws:iam::123456789012:role/AdminRole --role-session-name test

Expected Result: ✅ Succeeds (before fix)

After fix: ❌ AccessDenied

Test PassRole Abuse
aws iam pass-role --role-name AdminRole --user-name DevUser

Expected Result: ❌ AccessDenied

Verify Permissions

Dev user can only perform actions allowed by least-privilege policy

All escalation paths return AccessDenied
