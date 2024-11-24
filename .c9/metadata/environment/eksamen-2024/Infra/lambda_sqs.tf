{"changed":true,"filter":false,"title":"lambda_sqs.tf","tooltip":"/eksamen-2024/Infra/lambda_sqs.tf","value":"# Opprett SQS-kø\nresource \"aws_sqs_queue\" \"image_processing_queue\" {\n  name                        = \"image-processing-queue\"\n  visibility_timeout_seconds  = 30 # Maks behandlingstid for Lambda\n}\n\n# IAM-rolle for Lambda\nresource \"aws_iam_role\" \"lambda_execution_role\" {\n  name = \"lambda-execution-role\"\n\n  assume_role_policy = jsonencode({\n    Version = \"2012-10-17\"\n    Statement = [\n      {\n        Action    = \"sts:AssumeRole\"\n        Effect    = \"Allow\"\n        Principal = {\n          Service = \"lambda.amazonaws.com\"\n        }\n      }\n    ]\n  })\n}\n\n# IAM-policy for tilgang til SQS, S3 og logging\nresource \"aws_iam_role_policy\" \"lambda_policy\" {\n  name = \"lambda-sqs-s3-policy\"\n  role = aws_iam_role.lambda_execution_role.id\n\n  policy = jsonencode({\n    Version = \"2012-10-17\"\n    Statement = [\n      # SQS-tilgang\n      {\n        Action = [\n          \"sqs:ReceiveMessage\",\n          \"sqs:DeleteMessage\",\n          \"sqs:GetQueueAttributes\"\n        ]\n        Effect   = \"Allow\"\n        Resource = aws_sqs_queue.image_processing_queue.arn\n      },\n      # S3-tilgang\n      {\n        Action = [\n          \"s3:PutObject\"\n        ]\n        Effect   = \"Allow\"\n        Resource = \"arn:aws:s3:::pgr301-couch-explorers/*\"\n      },\n      # Logging-tilgang\n      {\n        Action = [\n          \"logs:CreateLogGroup\",\n          \"logs:CreateLogStream\",\n          \"logs:PutLogEvents\"\n        ]\n        Effect = \"Allow\"\n        Resource = \"arn:aws:logs:*:*:*\"\n      }\n    ]\n  })\n}\n","undoManager":{"mark":-2,"position":0,"stack":[[{"start":{"row":0,"column":0},"end":{"row":63,"column":0},"action":"insert","lines":["# Opprett SQS-kø","resource \"aws_sqs_queue\" \"image_processing_queue\" {","  name                        = \"image-processing-queue\"","  visibility_timeout_seconds  = 30 # Maks behandlingstid for Lambda","}","","# IAM-rolle for Lambda","resource \"aws_iam_role\" \"lambda_execution_role\" {","  name = \"lambda-execution-role\"","","  assume_role_policy = jsonencode({","    Version = \"2012-10-17\"","    Statement = [","      {","        Action    = \"sts:AssumeRole\"","        Effect    = \"Allow\"","        Principal = {","          Service = \"lambda.amazonaws.com\"","        }","      }","    ]","  })","}","","# IAM-policy for tilgang til SQS, S3 og logging","resource \"aws_iam_role_policy\" \"lambda_policy\" {","  name = \"lambda-sqs-s3-policy\"","  role = aws_iam_role.lambda_execution_role.id","","  policy = jsonencode({","    Version = \"2012-10-17\"","    Statement = [","      # SQS-tilgang","      {","        Action = [","          \"sqs:ReceiveMessage\",","          \"sqs:DeleteMessage\",","          \"sqs:GetQueueAttributes\"","        ]","        Effect   = \"Allow\"","        Resource = aws_sqs_queue.image_processing_queue.arn","      },","      # S3-tilgang","      {","        Action = [","          \"s3:PutObject\"","        ]","        Effect   = \"Allow\"","        Resource = \"arn:aws:s3:::pgr301-couch-explorers/*\"","      },","      # Logging-tilgang","      {","        Action = [","          \"logs:CreateLogGroup\",","          \"logs:CreateLogStream\",","          \"logs:PutLogEvents\"","        ]","        Effect = \"Allow\"","        Resource = \"arn:aws:logs:*:*:*\"","      }","    ]","  })","}",""],"id":1}]]},"ace":{"folds":[],"scrolltop":51,"scrollleft":0,"selection":{"start":{"row":63,"column":0},"end":{"row":63,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":16,"state":"start","mode":"ace/mode/terraform"}},"timestamp":1732358381035}