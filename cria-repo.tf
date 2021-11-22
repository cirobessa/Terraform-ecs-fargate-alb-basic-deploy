#provider "aws" {
#  version = "~> 2.0"
#  region  = "us-east-1" #  REGIAO DO REPOSITORIO
#}

resource "aws_ecr_repository" "nome-app" {
  name = var.proj-nome #  NOME DO REPOSITORIO ECR
}
