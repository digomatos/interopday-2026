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

resource "local_file" "demo_summary" {
  filename = "${path.module}/generated-${var.project_name}.txt"
  content  = <<-EOT
  Projeto: ${var.project_name}
  Objetivo: demonstrar Infrastructure as Code sem depender de credenciais cloud
  Ferramenta: Terraform
  Efeito: cria um arquivo local para validar fluxo e sintaxe
  EOT
}

output "generated_file" {
  value = local_file.demo_summary.filename
}
