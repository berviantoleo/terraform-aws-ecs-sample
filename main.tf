terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.9"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Environment = "Dev"
    }
  }
}

resource "aws_default_vpc" "my-personal-web" {

}

resource "aws_default_subnet" "my-personal-web" {
  availability_zone = var.ecs-default-region-0
}

resource "aws_default_subnet" "my-personal-web-1" {
  availability_zone = var.ecs-default-region-1
}

resource "aws_security_group" "my-personal-web" {
  name        = "${var.name_prefix}-allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_default_vpc.my-personal-web.id

  ingress {
    description = "Allow HTTP for all"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "my-personal-web" {
  name               = "${var.name_prefix}-${var.elb-name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my-personal-web.id]
  subnets            = [aws_default_subnet.my-personal-web.id, aws_default_subnet.my-personal-web-1.id]
}


resource "aws_lb_target_group" "my-personal-web" {
  name        = "${var.name_prefix}-${var.target-group-name}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.my-personal-web.id
}

resource "aws_lb_listener" "my-personal-web" {
  load_balancer_arn = aws_lb.my-personal-web.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-personal-web.arn
  }
}


resource "aws_ecs_cluster" "my-personal-web" {
  name = "${var.name_prefix}-${var.cluster-name}"
}

resource "aws_ecs_cluster_capacity_providers" "my-personal-web" {
  cluster_name = aws_ecs_cluster.my-personal-web.name

  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "my-personal-web" {
  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions = jsonencode([
    {
      name      = "${var.name_prefix}-api"
      image     = "nginx:${var.nginx-version}"
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "my-personal-web" {
  name            = "${var.name_prefix}-ecs-service"
  cluster         = aws_ecs_cluster.my-personal-web.id
  task_definition = aws_ecs_task_definition.my-personal-web.arn
  desired_count   = var.ecs-service-size
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_default_subnet.my-personal-web.id, aws_default_subnet.my-personal-web-1.id]
    security_groups  = [aws_security_group.my-personal-web.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.my-personal-web.arn
    container_name   = "${var.name_prefix}-api"
    container_port   = 80
  }
}
