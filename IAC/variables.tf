
variable "aws_provider_key" {
  description = "AWS key for deploy and infrastructure providing"
}

variable "aws_provider_secret" {
  description = "AWS secret for deploy and infrastructure providing"
}

variable "repository_name" {
  description = "Name of repository"
}

variable "kafka_bootstrap_server_one" {
  description =  "Endpoint of kafka server one"
}

variable "aws_ecr_account_url" {
  description = "ECR url"
}

variable "ecr_image_tag" {
  description = "Inferencer latest image tag"
}
