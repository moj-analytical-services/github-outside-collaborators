module "criminal-scenario-tool" {
  source     = "./modules/repository-collaborators"
  repository = "criminal-scenario-tool"
  collaborators = [
    {
      github_user  = "martinmcmoj"
      permission   = "maintain"
      name         = "tbc"
      email        = "tbc"
      org          = "tbc"
      reason       = "tbc"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2023-12-10"
    },
  ]
}
