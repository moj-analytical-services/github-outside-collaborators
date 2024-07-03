module "github-outside-collaborators" {
  source     = "./modules/repository-collaborators"
  repository = "github-outside-collaborators"
  collaborators = [
    {
      github_user  = "crushaforbes"
      permission   = "push"
      name         = "Crusha Forbes"
      email        = "crushaforbes@gmail.com"
      org          = "Crusha Test Org"
      reason       = "Test new token works"
      added_by     = "tamsin.forbes@digital.justice.gov.uk"
      review_after = "2024-07-04"
    },
  ]
}
