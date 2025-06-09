# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {

  cloud {
      organization = "hashi-org-TF"
      workspaces {
        name = "hvs-terraform"
      }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.42.0"
    }
  hcp = {
      source = "hashicorp/hcp"
      version = "0.94.1"
    }
  }
  required_version = "~> 1.2"
}

# Specify the app in the project (one app_name per data block)
data "hcp_vault_secrets_app" "aws_app" {
  app_name = "terraform"
}

# Replace your existing secret references with
# data.hcp-vault-secrets_app.aws_app.secret-name
