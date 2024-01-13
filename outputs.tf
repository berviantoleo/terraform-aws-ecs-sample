output "ecs-service-location" {
  value = aws_lb.my-personal-web.dns_name
  description = "ALB DNS Name"
}
