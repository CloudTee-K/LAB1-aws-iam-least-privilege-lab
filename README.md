# LAB1-aws-iam-least-privilege-lab
Hands-on AWS IAM security lab demonstrating privilege escalation, least-privilege remediation, and permission boundary enforcement using Terraform and AWS CLI.

**LAB 1 — AWS IAM: Least Privilege & Privilege Escalation Prevention**
**Overview**

This lab demonstrates how misconfigured AWS IAM permissions lead to privilege escalation, one of the most common causes of cloud breaches, and how to secure IAM environments using least privilege and permission boundaries.

The lab intentionally introduces insecure IAM policies, exploits them using realistic attack techniques, then remediates the vulnerabilities using defense-in-depth IAM controls.
All fixes are validated through AWS CLI testing.



**Objectives**

_By completing this lab, you will learn how to:

Identify dangerous IAM misconfigurations

Simulate real-world IAM privilege escalation attacks

Design least-privilege IAM policies

Enforce permission boundaries to cap privileges

Validate security controls using AWS CLI

Document IAM security outcomes professionally
_

**Lab Architecture**
IAM Components

**IAM Users**

_dev-user

ops-user_

**IAM Roles**

_EC2Role

ReadOnlySecurityRole_

**IAM Policies**

_Over-permissive policy (intentionally insecure)

Least-privilege custom policies

Permission boundary policy
_

**Threat Model
Attacks Simulated
**

**IAM privilege escalation**

_Wildcard permission abuse (iam:*)

Policy self-attachment

iam:PassRole abuse

Unauthorized role assumption_

**Why This Matters**

IAM misconfigurations are consistently ranked as the #1 cloud security risk and are a primary cause of full AWS account compromise.


**LAB PHASES**
**PHASE 1 — Insecure Setup (Vulnerability Introduction)
Actions**

Create IAM users with over-permissive policies

Grant excessive IAM permissions (iam:*)

Do not apply permission boundaries

**Result**

**Low-privileged users can:**

Create IAM users

Attach admin policies

Escalate privileges

**❌ Environment is vulnerable**


**PHASE 2 — Privilege Escalation Simulation
Example Escalation Test (AWS CLI)**
_aws iam create-user --user-name attacker_
**Expected Result (Before Fix)**
_User created successfully_

**Privilege escalation confirmed**


**PHASE 3 — Remediation & Hardening
Security Fixes Applied
**
Rewrote IAM policies using least privilege

Removed wildcard permissions (iam:*)

Explicitly denied high-risk IAM actions

Implemented IAM Permission Boundaries

Restricted role assumption and policy attachment


**Example Least-Privilege Policy (Terraform)**
data "aws_iam_policy_document" "ec2_read_only" {
  statement {
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups"
    ]
    resources = ["*"]
  }
}


**PHASE 4 — Validation & Testing**

**Re-Test Escalation Attempt**
_aws iam create-user --user-name attacker_

**Expected Result (After Fix)**
_AccessDenied_

**Privilege escalation blocked**



**Key Takeaways**

Least privilege is mandatory but not sufficient alone

Permission boundaries prevent catastrophic IAM abuse

IAM security must be tested, not assumed

Terraform enables repeatable, auditable IAM security



