# Prefix variable
variable "prefix" {
  type        = string
  description = "Prefix for all resource names"
}

terraform{
required_version = "<= 1.9.0"
backend "s3" {
    bucket = "pgr301-2024-terraform-state"
    key    = "27/terraform.tfstate"
    region = "eu-west-1"
  }
}
# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_role" {
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        }
      }
    ]
  })

  name = "myRole-27v3"
}

# SQS Queue
resource "aws_sqs_queue" "lambda_queue" {
  name = "lambda_queue_27"
}

# Allow SQS to trigger the Lambda function
resource "aws_lambda_permission" "allow_sqs_invoke" {
  statement_id  = "AllowSQSInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.comprehend_lambda.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = aws_sqs_queue.lambda_queue.arn
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.lambda_queue.arn
  function_name    = aws_lambda_function.comprehend_lambda.arn
  batch_size       = 1
}


resource "aws_iam_policy" "lambda_sqs_policy" {
  name   = "lambda-sqs-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sqs:ReceiveMessage",
        "Resource" : aws_sqs_queue.lambda_queue.arn
      },
      {
        "Effect" : "Allow",
        "Action" : "sqs:DeleteMessage",
        "Resource" : aws_sqs_queue.lambda_queue.arn
      },
      {
        "Effect" : "Allow",
        "Action" : "sqs:GetQueueAttributes",
        "Resource" : aws_sqs_queue.lambda_queue.arn
      },
      {
        "Effect" : "Allow",
        "Action" : "s3:PutObject",
        "Resource" : "arn:aws:s3:::pgr301-couch-explorers/*"
      },
      {
        "Effect" : "Allow",
        "Action" : "bedrock:InvokeModel",
        "Resource" : "arn:aws:bedrock:us-east-1::foundation-model/amazon.titan-image-generator-v1"
      }
    ]
  })
}



resource "aws_iam_role_policy_attachment" "lambda_sqs_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_sqs_policy.arn
}

resource "aws_lambda_function" "comprehend_lambda" {
  function_name = "${var.prefix}_comprehend_lambda_function"
  filename      = "lambda_sqs.zip" 
  handler       = "lambda_sqs.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 60

environment {
    variables = {
      LOG_LEVEL = "DEBUG"
      BUCKET_NAME = "pgr301-couch-explorers"
    }
  }

  source_code_hash = filebase64sha256("lambda_sqs.zip")
}

# Lambda Function URL Resource
resource "aws_lambda_function_url" "comprehend_lambda_url" {
  function_name       = aws_lambda_function.comprehend_lambda.function_name
  authorization_type  = "NONE"
}

# Allow Lambda URL to invoke the function
resource "aws_lambda_permission" "allow_lambda_url" {
  statement_id          = "AllowLambdaURLInvoke"
  action                = "lambda:InvokeFunctionUrl"
  function_name         = aws_lambda_function.comprehend_lambda.function_name
  principal             = "*"
  function_url_auth_type = aws_lambda_function_url.comprehend_lambda_url.authorization_type
}


output "lambda_url" {
  value =aws_lambda_function_url.comprehend_lambda_url.function_url
    
}
output "sqs_queue_url" {
  value = aws_sqs_queue.lambda_queue.id
}
