module "logstash" {
  source = "git::https://github.com/AlienX456/SoundMonitor-IAC-Infrastructure-Common.git//ecs_logstash_elastic_services?ref=2.2.0"

  service-name= "${var.service_name}-service"
  family_name = var.service_name
  cpu= "256"
  memory= "512"
  number_of_tasks="1"

  aws_provider_key= var.aws_provider_key
  aws_provider_secret= var.aws_provider_secret

  kafka_bootstrap_server_one= var.kafka_bootstrap_server_one

  aws_ecr_account_url = var.aws_ecr_account_url
  ecr_image_tag= var.ecr_image_tag

  device_selector= "cpu"

  user = var.user
  password = var.password
}
