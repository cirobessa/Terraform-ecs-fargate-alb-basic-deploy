resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_task_execution_role"
 
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
        "Effect": "Allow",
        "Principal": {
         "Service": "ecs-tasks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }    
  ]
}
EOF
}

resource "aws_iam_policy" "ecs_permissions" {
  name        = "my_ecs_permissions"
  description = "Permissions to enable CT"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecs:StartTask",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }    
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "ecs_attachment" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.ecs_permissions.arn
}

