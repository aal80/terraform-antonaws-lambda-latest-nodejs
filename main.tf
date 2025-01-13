data "aws_iam_policy_document" "logs" {
  statement {
    effect = "Allow"

    actions = compact([
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ])

    resources = ["log_group_arn"]
  }
}

# resource "aws_iam_role_policy" "logs" {
#   count = local.create_role && var.attach_cloudwatch_logs_policy ? 1 : 0

#   name   = "${local.policy_name}-logs"
#   role   = aws_iam_role.lambda[0].name
#   policy = data.aws_iam_policy_document.logs[0].json
# }



# resource "aws_iam_role" "exec_role" {
#     name = "asd"
# }