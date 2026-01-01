# Threat Model — LAB 1: IAM Least Privilege & Escalation Prevention

## Overview
This lab focuses on the #1 cloud breach vector: **IAM privilege escalation**.  
Attackers often exploit overly permissive IAM policies, wildcards, and misconfigured roles to gain elevated privileges.

---

## Assets
- IAM Users: `Dev`, `Ops`
- IAM Roles: `EC2Role`, `ReadOnlySecurityRole`
- IAM Policies: Custom JSON policies, Permission Boundaries

---

## Threats
| Threat | Description | Exploit Path |
|--------|-------------|--------------|
| Privilege Escalation | A user with minimal access elevates to Admin | Create new IAM user, attach policies, PassRole abuse |
| Policy Wildcard Abuse | Over-permissive policy allows actions on all resources | Using `Action: "*"` in a policy |
| Role Assumption Abuse | User assumes high-privilege role they shouldn’t | Exploit trust relationships in roles |

---

## Security Controls
- Least privilege policies per user/role
- Permission boundaries to cap maximum privileges
- Role separation and principle of least privilege

---

## Validation Approach
- Attempt forbidden actions via AWS CLI  
- Verify `AccessDenied` responses  
- Confirm IAM users cannot escalate privileges

