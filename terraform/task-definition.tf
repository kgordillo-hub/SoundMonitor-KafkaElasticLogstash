resource "aws_ecs_task_definition" "main" {
  family = var.family-name
  container_definitions = <<EOF
  [
    {
      "name": "repo-inferencer",
      "image": "602326443068.dkr.ecr.us-east-1.amazonaws.com/soundmonitor-logstash:${var.ecr_image_tag}",
      "cpu": 0,
      "portMappings": [],
      "essential": true,
      "environment": [
          {
              "name": "AWS_ACCESS_KEY_ID",
              "value": "${var.aws_es_key_id}"
          },
          {
              "name": "AWS_SECRET_ACCESS_KEY",
              "value": "${var.aws_es_key_secret}"
          },
          {
              "name": "AWS_ELASTIC_ENDPOINT",
              "value": "${var.aws_es_endpoint}"
          }
      ],
      "mountPoints": [],
      "volumesFrom": [],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
              "awslogs-group": "/ecs/monitor-logstash",
              "awslogs-region": "us-east-1",
              "awslogs-stream-prefix": "ecs"
          }
      }
    }
  ]
  EOF

  cpu = 256
  memory = 512
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  execution_role_arn = aws_iam_role.monitor-logstash-execution-role.arn
}