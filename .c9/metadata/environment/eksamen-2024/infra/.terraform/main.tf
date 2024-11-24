{"filter":false,"title":"main.tf","tooltip":"/eksamen-2024/infra/.terraform/main.tf","undoManager":{"mark":9,"position":9,"stack":[[{"start":{"row":0,"column":0},"end":{"row":92,"column":1},"action":"insert","lines":["# Prefix variable","variable \"prefix\" {","  type        = string","  description = \"Prefix for all resource names\"","}","","# IAM Role for Lambda Execution","resource \"aws_iam_role\" \"lambda_exec_role\" {","  assume_role_policy = jsonencode({","    \"Version\": \"2012-10-17\",","    \"Statement\": [","      {","        \"Action\": \"sts:AssumeRole\",","        \"Effect\": \"Allow\",","        \"Principal\": {","          \"Service\": \"lambda.amazonaws.com\"","        }","      }","    ]","  })","","  name = \"${var.prefix}_lambda_exec_role\"","}","","# Inline Policy for Amazon Comprehend with full access","resource \"aws_iam_role_policy\" \"lambda_comprehend_policy\" {","  name = \"${var.prefix}_LambdaComprehendPolicy\"","  role = aws_iam_role.lambda_exec_role.id","","  policy = jsonencode({","    \"Version\": \"2012-10-17\",","    \"Statement\": [","      {","        \"Effect\": \"Allow\",","        \"Action\": \"comprehend:*\",","        \"Resource\": \"*\"","      }","    ]","  })","}","","# Attach policy to the role","resource \"aws_iam_role_policy_attachment\" \"lambda_basic_execution\" {","  role       = aws_iam_role.lambda_exec_role.name","  policy_arn = \"arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole\"","}","","# Lambda Function Resource","resource \"aws_lambda_function\" \"comprehend_lambda\" {","  function_name = \"${var.prefix}_comprehend_lambda_function\"","  runtime       = \"python3.8\"","  handler       = \"comprehend.lambda_handler\"","  role          = aws_iam_role.lambda_exec_role.arn","  filename      = \"lambda_function_payload.zip\"","","  environment {","    variables = {","      LOG_LEVEL = \"DEBUG\"","    }","  }","}","","# Lambda Function URL Resource","resource \"aws_lambda_function_url\" \"comprehend_lambda_url\" {","  function_name       = aws_lambda_function.comprehend_lambda.function_name","  authorization_type  = \"NONE\"","}","","# Allow Lambda URL to invoke the function","resource \"aws_lambda_permission\" \"allow_lambda_url\" {","  statement_id          = \"AllowLambdaURLInvoke\"","  action                = \"lambda:InvokeFunctionUrl\"","  function_name         = aws_lambda_function.comprehend_lambda.function_name","  principal             = \"*\"","  function_url_auth_type = aws_lambda_function_url.comprehend_lambda_url.authorization_type","}","","# Create a zip file from the Python code (using the local lambda_function.py)","data \"archive_file\" \"lambda_zip\" {","  type        = \"zip\"","  source_file = \"${path.module}/comprehend.py\"","  output_path = \"${path.module}/lambda_function_payload.zip\"","}","","# CloudWatch Log Group for Lambda","resource \"aws_cloudwatch_log_group\" \"comprehend_log_group\" {","  name              = \"/aws/lambda/${var.prefix}_comprehend_lambda_function\"","  retention_in_days = 7","}","","output \"lambda_url\" {","  value =aws_lambda_function_url.comprehend_lambda_url.function_url","}"],"id":1}],[{"start":{"row":7,"column":25},"end":{"row":7,"column":41},"action":"remove","lines":["lambda_exec_role"],"id":2},{"start":{"row":7,"column":25},"end":{"row":7,"column":26},"action":"insert","lines":["m"]},{"start":{"row":7,"column":26},"end":{"row":7,"column":27},"action":"insert","lines":["y"]},{"start":{"row":7,"column":27},"end":{"row":7,"column":28},"action":"insert","lines":["R"]},{"start":{"row":7,"column":28},"end":{"row":7,"column":29},"action":"insert","lines":["I"]},{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"insert","lines":["O"]}],[{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"remove","lines":["O"],"id":3},{"start":{"row":7,"column":28},"end":{"row":7,"column":29},"action":"remove","lines":["I"]}],[{"start":{"row":7,"column":28},"end":{"row":7,"column":29},"action":"insert","lines":["o"],"id":4},{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"insert","lines":["l"]},{"start":{"row":7,"column":30},"end":{"row":7,"column":31},"action":"insert","lines":["e"]},{"start":{"row":7,"column":31},"end":{"row":7,"column":32},"action":"insert","lines":["+"]},{"start":{"row":7,"column":32},"end":{"row":7,"column":33},"action":"insert","lines":["2"]}],[{"start":{"row":7,"column":32},"end":{"row":7,"column":33},"action":"remove","lines":["2"],"id":5},{"start":{"row":7,"column":31},"end":{"row":7,"column":32},"action":"remove","lines":["+"]}],[{"start":{"row":7,"column":31},"end":{"row":7,"column":32},"action":"insert","lines":["-"],"id":6},{"start":{"row":7,"column":32},"end":{"row":7,"column":33},"action":"insert","lines":["2"]},{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["5"]}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"remove","lines":["5"],"id":7}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["6"],"id":8}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"remove","lines":["6"],"id":9}],[{"start":{"row":7,"column":33},"end":{"row":7,"column":34},"action":"insert","lines":["7"],"id":10}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":7,"column":37},"end":{"row":7,"column":37},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1732370620193,"hash":"716da097a96b89dfbe34f43e070198b3ca71c938"}