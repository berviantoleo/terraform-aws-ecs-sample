## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_subnet.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_subnet.my-personal-web-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_vpc.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_ecs_cluster.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_lb.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.my-personal-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | ECS Cluster Name | `string` | `"leo-cluster"` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Container Service Max CPU | `number` | `1024` | no |
| <a name="input_ecs-default-region-0"></a> [ecs-default-region-0](#input\_ecs-default-region-0) | Default Availability Zone 1 for ECS cluster | `string` | `"ap-southeast-1a"` | no |
| <a name="input_ecs-default-region-1"></a> [ecs-default-region-1](#input\_ecs-default-region-1) | Default Availability Zone 1 for ECS cluster | `string` | `"ap-southeast-1b"` | no |
| <a name="input_ecs-service-size"></a> [ecs-service-size](#input\_ecs-service-size) | Container Service Desired Count | `number` | `2` | no |
| <a name="input_elb-name"></a> [elb-name](#input\_elb-name) | Load Balancer Name | `string` | `"lb-tf"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Container Service Max Memory | `number` | `2048` | no |
| <a name="input_name-prefix"></a> [name-prefix](#input\_name-prefix) | Each non-default resource will have this prefix. The resource name will be <prefix>-<resource actual name> | `string` | `"my-personal-web"` | no |
| <a name="input_nginx-version"></a> [nginx-version](#input\_nginx-version) | NGINX Container Version | `string` | `"latest"` | no |
| <a name="input_target-group-name"></a> [target-group-name](#input\_target-group-name) | Load Balancer Target Group Name | `string` | `"lb-tg"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs-service-location"></a> [ecs-service-location](#output\_ecs-service-location) | ALB DNS Name |
