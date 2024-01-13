variables {
  name-prefix = "test"
}

run "some_resources_should_have_prefix" {
  command = plan

  assert {
    condition     = aws_ecs_service.my-personal-web.name == "test-ecs-service"
    error_message = "ECS Service didn't have prefix"
  }

  assert {
    condition     = aws_ecs_cluster.my-personal-web.name == "test-leo-cluster"
    error_message = "ECS Cluster didn't have prefix"
  }

  assert {
    condition     = aws_lb.my-personal-web.name == "test-lb-tf"
    error_message = "ALB didn't have prefix"
  }

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].name == "test-api"
    error_message = "Container didn't have prefix"
  }
}

run "default_subnet_should_configured_correctly" {
  command = plan

  assert {
    condition     = aws_default_subnet.my-personal-web.availability_zone == "ap-southeast-1a"
    error_message = "Default Subnet 1 didn't configured"
  }

  assert {
    condition     = aws_default_subnet.my-personal-web-1.availability_zone == "ap-southeast-1b"
    error_message = "Default Subnet 2 didn't configured"
  }
}

run "nginx_version_should_be_correct" {
  command = plan

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].image == "nginx:latest"
    error_message = "Wrong configured image"
  }
}

run "task_cpu_and_memory_should_be_configured" {
  command = plan

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].cpu == 1024
    error_message = "Wrong configured cpu for container"
  }

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].memory == 2048
    error_message = "Wrong configured memory for container"
  }

  assert {
    condition     = aws_ecs_task_definition.my-personal-web.cpu == "1024"
    error_message = "Wrong configured cpu for fargate"
  }

  assert {
    condition     = aws_ecs_task_definition.my-personal-web.memory == "2048"
    error_message = "Wrong configured memory for fargate"
  }

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].cpu == tonumber(aws_ecs_task_definition.my-personal-web.cpu)
    error_message = "CPU didn't same"
  }

  assert {
    condition     = jsondecode(aws_ecs_task_definition.my-personal-web.container_definitions)[0].memory == tonumber(aws_ecs_task_definition.my-personal-web.memory)
    error_message = "Memory didn't same"
  }
}
