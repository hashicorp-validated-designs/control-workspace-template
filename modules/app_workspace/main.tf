resource "github_repository" "mgmt_repository" {
  name                        = var.gh_repo_name
  description                 = "Management repository for "
  visibility                  = var.gh_repo_visibility
  allow_merge_commit          = var.gh_repo_allow_merge_commit
  allow_rebase_merge          = var.gh_repo_allow_rebase_merge
  allow_squash_merge          = var.gh_repo_allow_squash_merge
  delete_branch_on_merge      = var.gh_repo_delete_branch_on_merge
  has_issues                  = var.gh_repo_has_issues
  has_projects                = var.gh_repo_has_projects
  has_wiki                    = var.gh_repo_has_wiki
  vulnerability_alerts        = var.gh_repo_vulnerability_alerts
  web_commit_signoff_required = var.gh_repo_web_commit_signoff_required
  topics                      = var.gh_repo_topics

  template {
    owner                = var.gh_repo_template_owner
    repository           = var.gh_repo_template_repo
    include_all_branches = var.gh_repo_template_include_all_branches
  }
}

module "workspacer_vcs_github_app" {
  source  = "alexbasista/workspacer/tfe"
  version = "0.13.0"

  workspace_name                = var.workspace_name
  organization                  = var.organization
  project_name                  = var.project_name
  workspace_desc                = var.workspace_desc
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  assessments_enabled           = var.assessments_enabled
  file_triggers_enabled         = var.file_triggers_enabled
  queue_all_runs                = var.queue_all_runs
  speculative_enabled           = var.speculative_enabled
  structured_run_output_enabled = var.structured_run_output_enabled
  ssh_key_id                    = var.ssh_key_id
  workspace_tags                = var.workspace_tags
  workspace_map_tags            = var.workspace_map_tags
  terraform_version             = var.terraform_version
  trigger_prefixes              = var.trigger_prefixes
  trigger_patterns              = var.trigger_patterns
  working_directory             = var.working_directory
  force_delete                  = var.force_delete

  vcs_repo = {
    identifier                 = github_repository.mgmt_repository.full_name
    branch                     = var.vcs_repo.branch
    github_app_installation_id = var.vcs_repo.github_app_installation_id
    ingress_submodules         = var.vcs_repo.ingress_submodules
    tags_regex                 = var.vcs_repo.tags_regex
  }
}
