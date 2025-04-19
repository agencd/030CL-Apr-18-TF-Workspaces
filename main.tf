terraform {
  backend "s3" {
    bucket = "mytfstatebackend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    tfe = {
      version = "~> 0.64.0"
    }
  }
}

provider "tfe" {
  version  = "~> 0.64.0"
}

resource "tfe_workspace" "test" {
  name         = "fred"
  organization = "CL030-DevOps"
}

resource "tfe_workspace_settings" "test-settings" {
  workspace_id   = tfe_workspace.test.id
  execution_mode = "local"
}