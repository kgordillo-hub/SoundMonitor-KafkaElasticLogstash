module "logstash" {
  source = "git::https://github.com/AlienX456/SoundMonitor-IAC-Infrastructure-Common.git//ecs_logstash_elastic_services"

  service-name= "${var.service_name}-service"
  family-name = var.service_name
  cpu= "256"
  memory= "512"
  number_of_tasks="1"
  aws_account_id= var.aws_account_id

  aws_provider_key= var.aws_provider_key
  aws_provider_secret= var.aws_provider_secret

  kafka_bootstrap_server_one= var.kafka_bootstrap_server_one

  ecr_image_tag= var.ecr_image_tag
  ecr_image_repo= var.ecr_image_repo

  device_selector= "cpu"
}