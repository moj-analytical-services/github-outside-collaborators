module "mojspeakr" {
  source     = "./modules/repository-collaborators"
  repository = "mojspeakr"
  collaborators = [
    {
      github_user  = "dipad-fran-bryden"
      permission   = "admin"
      name         = "Francesca Bryden"
      email        = "francesca.bryden@dft.gov.uk"
      org          = "Department for Transport"
      reason       = "Creator and maintainer of package"
      added_by     = "Nick Walters nick.walters@digital.justice.gov.uk"
      review_after = "2024-06-13"
    },

  ]
}
