variable "registo_ecr" {
  type = string
  description = "Endereco ARN do Repositorio ECR"
  default = "822405693021.dkr.ecr.us-east-1.amazonaws.com/nome-app"
}

variable "region" {
  type = string
  description = "REGIAO DO DEPLOY"
  default = "us-east-1"
}

variable "proj-nome" {
  type = string
  description = "REGIAO DO DEPLOY"
  default = "frontend"
}
