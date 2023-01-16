module "mojspeakr" {
  source     = "./modules/repository-collaborators"
  repository = "mojspeakr"
  collaborators = [
    {
      github_user  = "dipad-fran-bryden"
      permission   = "admin"
      name         = "tbc"
      email        = "tbc"
      org          = "tbc"
      reason       = "tbc"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2023-06-13"
    },
    {
      github_user  = "brydenfrancesca"
      permission   = "admin"
      name         = "tbc"
      email        = "tbc"
      org          = "tbc"
      reason       = "tbc"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2023-06-13"
    },
  ]
}
