module "data_accelerator_invest" {
  source     = "./modules/repository-collaborators"
  repository = "data_accelerator_invest"
  collaborators = [
    {
      github_user  = "amelianoonan1-nhs"
      permission   = "push"
      name         = "Amelia Noonan"
      email        = "amelia.noonan1@nhs.net"
      org          = "NHS"
      reason       = "able to read code and make changes/comments to it"
      added_by     = "kate.bailey@justice.gov.uk"
      review_after = "2024-08-01"
    },
  ]
}
