module "dsa_data_linking" {
  source     = "./modules/repository-collaborators"
  repository = "dsa_data_linking"
  collaborators = [
    {
      github_user  = "mjchalkley"
      permission   = "pull"
      name         = "tbc"
      email        = "tbc"
      org          = "tbc"
      reason       = "tbc"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2023-06-13"
    },
  ]
}
