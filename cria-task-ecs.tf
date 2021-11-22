
resource "aws_ecs_task_definition" "task_aplicativos" {
  family                   = "task-aplicativos" # Nome da ECS  task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "task-aplicativos",
      "image": "${local.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.proj-nome}:latest",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"] # Definindo o uso do Fargate
  network_mode             = "awsvpc"    # Declara a awsvpc  para o Fargate
  memory                   = 512         # Memoria reservada para o container 
  cpu                      = 256         # CPU reservada para o container
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"
  depends_on		= [ 
aws_iam_policy.ecs_permissions,
 ]
}
