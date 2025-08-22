# Define App Workspaces
# Module docs: https://registry.terraform.io/modules/alexbasista/workspacer/tfe/latest

module "appteam_workspace_only" {
  source  = "alexbasista/workspacer/tfe"
  version = ">= 0.13"

  workspace_name = "my-new-ws"
  workspace_desc = "Description of my new Workspace."
  workspace_map_tags = {
    "env" = "dev"
    "team" = "app-team-1"
  }
  
  organization   = local.organization.name
  project_name   = local.project.name

  tfvars = {
    teststring = "iamstring"
    testlist   = ["1", "2", "3"]
    testmap    = { "a" = "1", "b" = "2", "c" = "3" }
  }
}

module "appteam_workspace_and_repo" {
  source = "./modules/app_workspace"

  workspace_name = "test-ws-dmullen"
  organization   = data.tfe_organization.current.name
  project_name   = data.tfe_project.current.name

  gh_repo_name           = "testrepo-dmullen"
  gh_repo_template_owner = "drewmullen"
  gh_repo_template_repo  = "terraform-repo-template"

  vcs_repo = {
    branch                     = "main"
    github_app_installation_id = "ghain-gurYHzDBdnByPE5g"
    ingress_submodules         = true
  }  
}