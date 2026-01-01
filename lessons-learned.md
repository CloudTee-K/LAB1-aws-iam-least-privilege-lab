
---

## 3️⃣ `lessons-learned.md`

```markdown
# Lessons Learned — LAB 1: IAM Least Privilege & Escalation Prevention

1. **Always Apply Least Privilege**
   - Wildcards in IAM policies (`Action: "*"`) are dangerous.
   - Each user/role should have only the permissions they need.

2. **Permission Boundaries Are Critical**
   - Boundaries prevent users from escalating privileges even if a policy is over-permissive.
   - They act as a **safety cap** on IAM access.

3. **Test IAM Policies in Stages**
   - First, create an over-permissive policy.
   - Simulate attacks via AWS CLI.
   - Apply fixes, then validate `AccessDenied` responses.

4. **Document Everything**
   - Threat models, validation steps, and lessons learned make labs **interview-ready**.
   - These documents demonstrate both technical skill and security awareness.

5. **Terraform Integration**
   - IAM policies, roles, and permission boundaries can be codified in Terraform.
   - Provides repeatable, auditable infrastructure deployment.

