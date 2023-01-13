module "cjs-scorecard" {
  source     = "./modules/repository-collaborators"
  repository = "cjs-scorecard"
  collaborators = [
    {
      github_user  = "leigh-moj"
      permission   = "push"
      name         = "tbc"
      email        = "tbc"
      org          = "tbc"
      reason       = "tbc"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2023-06-13"
    },
  ]
}
