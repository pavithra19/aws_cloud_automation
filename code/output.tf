output "ec2_public_dns" {
  value       = aws_instance.app_server.public_dns
  description = "Public DNS of the app server"
}