terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

variable "project_name" {
  description = "Nome do projeto para gerar um artefato local durante a demo"
  type        = string
  default     = "interop-copilot-demo"
}

# Melhoria 1: variável de ambiente com validação
variable "environment" {
  description = "Ambiente de execução (dev, staging ou prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser dev, staging ou prod."
  }
}

# Melhoria 2: locals para centralizar valores reutilizáveis
locals {
  project_label = "${var.project_name}-${var.environment}"
  file_content  = <<-EOT
  Projeto:    ${var.project_name}
  Ambiente:   ${var.environment}
  Objetivo:   demonstrar Infrastructure as Code sem depender de credenciais cloud
  Ferramenta: Terraform
  Efeito:     cria um arquivo local para validar fluxo e sintaxe
  EOT
}

resource "local_file" "demo_summary" {
  filename = "${path.module}/generated-${local.project_label}.txt"
  content  = local.file_content
}

output "generated_file" {
  value       = local_file.demo_summary.filename
  description = "Caminho do arquivo gerado pelo Terraform"
}
