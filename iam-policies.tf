data "aws_iam_policy_document" "dev_least_privilege" {
  statement {
    sid    = "EC2ReadOnly"
    effect = "Allow"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVolumes"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "dev_ec2_readonly" {
  name        = "Dev-EC2-ReadOnly"
  description = "Least-privilege EC2 read-only access for dev user"
  policy      = data.aws_iam_policy_document.dev_least_privilege.json
}

