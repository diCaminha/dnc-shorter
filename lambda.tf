resource "aws_iam_role" "iam_for_dnc_shorter_function" {
  name = "dnc-shorter_function"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "dnc_shorter_function" {
  filename         = "dnc_shorter_payload_function.zip"
  function_name    = "dnc-shorter_function"
  role             = "${aws_iam_role.iam_for_dnc_shorter_function.arn}"
  handler          = "main.handler"
  runtime          = "python3.8"

  environment {
    variables = {
      foo = "bar"
    }
  }
}