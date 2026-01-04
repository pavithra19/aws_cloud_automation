provider "aws" {
  region = var.aws_region
}

# ----------------------------------------------------------------------------------
# For first time: Creating a new EC2 instance. Since we have one in free tier this is commented now after it is created
# ----------------------------------------------------------------------------------
# resource "aws_instance" "new_app_server" {
#   count         = 1 # we can change this count to 3 or 5 for more instances. Since we have 1 instance in Free tier, we set it as 1.
#   ami           = var.ami_id
#   instance_type = "t2.micro"
#   key_name      = var.key_name
#   user_data = <<-EOF
#     #!/bin/bash
#     cd /home/ubuntu/einkaufzentrum/backend
#     source venv/bin/activate
#     nohup python3 app.py &
#   EOF
#   tags = {
#     Name = "Team4NewAppServer"
#   }
# }

# ----------------------------------------------------------------------------------
# Managing the now existing EC2 instance we created (importing the instance using terraform import)
# ----------------------------------------------------------------------------------
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = var.key_name

  # user_data = <<-EOF
  #   #!/bin/bash
  #   cd /home/ubuntu/einkaufzentrum/backend
  #   source venv/bin/activate
  #   nohup python3 app.py &
  # EOF

  tags = {
    Name = "Team4AppServer"
  }
}

# ----------------------------------------------------------------------------------
# Using our existing S3 bucket since we already deployed a web app in it
# ----------------------------------------------------------------------------------
data "aws_s3_bucket" "existing_bucket" {
  bucket = var.s3_bucket
}

# ----------------------------------------------------------------------------------
# CloudWatch log group to store our application logs (additional service)
# ----------------------------------------------------------------------------------
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/team4/app_logs"
  retention_in_days = 7
}

# ----------------------------------------------------------------------------------
# Metric filter: counting the number of API requests by matching logs in our application
# ----------------------------------------------------------------------------------
resource "aws_cloudwatch_log_metric_filter" "request_count_filter" {
  name           = "RequestCountFilter"
  log_group_name = aws_cloudwatch_log_group.app_logs.name
  pattern        = "HTTP REQUEST"

  metric_transformation {
    name      = "RequestCount"
    namespace = "Team4App"
    value     = "1"
  }
}

# ----------------------------------------------------------------------------------
# CloudWatch alarm steup is done on high number of requests so we can monitor our requests (example: > 100 in 5 mins)
# ----------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "high_request_alarm" {
  alarm_name          = "HighRequestAlarm"
  metric_name         = aws_cloudwatch_log_metric_filter.request_count_filter.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.request_count_filter.metric_transformation[0].namespace
  statistic           = "Sum"
  period              = 300  # 5 minutes is set
  evaluation_periods  = 1
  threshold           = 100
  comparison_operator = "GreaterThanThreshold"
  alarm_description   = "Alarm when number of HTTP requests is too high"
}