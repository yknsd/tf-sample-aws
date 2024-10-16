resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "developers_ec2_readonly" {
  group = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "developers_rds_readonly" {
  group = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

resource "aws_iam_group_membership" "dev_team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.developers.name
}

resource "aws_iam_user" "user_one" {
  name = "test-user-one"
  path = "/users/"
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
  path = "/users/"
}

