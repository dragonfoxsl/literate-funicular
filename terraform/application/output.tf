output "staging_application_alb" {
  value = aws_alb.staging_application_alb
}

output "staging_application_instance" {
  value = aws_instance.staging_application_instance
}
