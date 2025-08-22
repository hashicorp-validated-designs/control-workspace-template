# App Team Control Workspace

From this control workspace you can create app specific workspaces. The `main.tf` has 2 examples:
1. creating just a workspace using a public module
2. creating a workspace and a repo using an embedded module

```hcl
module "appteam_workspace" {
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
```


<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appteam_workspace_and_repo"></a> [appteam\_workspace\_and\_repo](#module\_appteam\_workspace\_and\_repo) | ./modules/app_workspace | n/a |
| <a name="module_appteam_workspace_only"></a> [appteam\_workspace\_only](#module\_appteam\_workspace\_only) | alexbasista/workspacer/tfe | >= 0.13 |

## Resources

| Name | Type |
|------|------|
| [tfe_organization.current](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |
| [tfe_project.current](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TFC_PROJECT_NAME"></a> [TFC\_PROJECT\_NAME](#input\_TFC\_PROJECT\_NAME) | n/a | `any` | n/a | yes |
| <a name="input_TFC_WORKSPACE_SLUG"></a> [TFC\_WORKSPACE\_SLUG](#input\_TFC\_WORKSPACE\_SLUG) | This is a magic vars: https://developer.hashicorp.com/terraform/cloud-docs/run/run-environment | `any` | n/a | yes |
<!-- END_TF_DOCS -->