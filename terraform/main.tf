provider "github" {
  owner = "moj-analytical-services"
  token = var.github_token
  # Enable this to run locally and comment out the app_auth block
  # token = var.github_token
  #   write_delay_ms = "1000"
  #   read_delay_ms  = "1000"

  # This uses environment variables stored in GitHub secrets to authenticate, comment this out to run locally and use token auth
  # https://registry.terraform.io/providers/integrations/github/latest/docs
  # app_auth {}
}
