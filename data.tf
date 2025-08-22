locals {
  organization = data.tfe_organization.current
  project      = data.tfe_project.current 
}

data "tfe_organization" "current" {
  name = split("/",var.TFC_WORKSPACE_SLUG)[0]
}

data "tfe_project" "current" {
  name         = var.TFC_PROJECT_NAME
  organization = local.organization.name
}

