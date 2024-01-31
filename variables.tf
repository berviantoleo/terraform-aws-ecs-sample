variable "ecs-default-region-0" {
  type        = string
  default     = "ap-southeast-1a"
  description = "Default Availability Zone 1 for ECS cluster"
}

variable "ecs-default-region-1" {
  type        = string
  default     = "ap-southeast-1b"
  description = "Default Availability Zone 1 for ECS cluster"
}

variable "name_prefix" {
  type        = string
  default     = "my-personal-web"
  description = "Each non-default resource will have this prefix. The resource name will be <prefix>-<resource actual name>"
}

variable "elb-name" {
  type        = string
  default     = "lb-tf"
  description = "Load Balancer Name"
}

variable "target-group-name" {
  type        = string
  default     = "lb-tg"
  description = "Load Balancer Target Group Name"
}

variable "cluster-name" {
  type        = string
  default     = "leo-cluster"
  description = "ECS Cluster Name"
}

variable "nginx-version" {
  type        = string
  default     = "latest"
  description = "NGINX Container Version"
}

variable "cpu" {
  type        = number
  default     = 1024
  description = "Container Service Max CPU"
}

variable "memory" {
  type        = number
  default     = 2048
  description = "Container Service Max Memory"
}

variable "ecs-service-size" {
  type        = number
  default     = 2
  description = "Container Service Desired Count"
}
