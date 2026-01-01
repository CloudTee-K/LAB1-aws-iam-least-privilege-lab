resource "aws_iam_user" "dev_user" {
  name = "dev-user"
}

resource "aws_iam_user_policy_attachment" "dev_overperm" {
  user       = aws_iam_user.dev_user.name
  policy_arn = aws_iam_policy.dev_ec2_readonly.arn
}

