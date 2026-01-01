
data "aws_iam_policy_document" "dev_boundary" {
  statement {
    effect = "Deny"
    actions = [
      "iam:*",
      "organizations:*"
    ]
    resources = ["*"]
  }
}



data "aws_iam_policy_document" "permission_boundary" {
  statement {
    sid    = "DenyPrivilegeEscalation"
    effect = "Deny"

    actions = [
      "iam:CreateUser",
      "iam:AttachUserPolicy",
      "iam:PutUserPolicy",
      "iam:PassRole",
      "iam:CreateRole",
      "iam:UpdateAssumeRolePolicy"
    ]

    resources = ["*"]
  }
}

