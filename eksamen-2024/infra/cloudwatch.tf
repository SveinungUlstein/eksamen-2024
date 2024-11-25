variable "notification_email" {
  description = "seinung.ulstein@gmail.com"
  type        = string
}

resource "aws_cloudwatch_metric_alarm" "sqs_oldest_message_age" {
  alarm_name                = "sqs-alarm-oldest-message-27"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "ApproximateAgeOfOldestMessage"
  namespace                 = "AWS/SQS"
  period                    = 20
  statistic                 = "Maximum"
  threshold                 = 1 
  alarm_description         = "Alarm når den eldste meldingen i SQS er eldre enn 5 minutter"
  dimensions = {
    QueueName = "lambda_queue_27"
  }

  # Send varsler via SNS
  alarm_actions = [aws_sns_topic.sqs_alarm_topic.arn]
}

resource "aws_sns_topic" "sqs_alarm_topic" {
  name = "sqs-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sqs_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
