module "alpha-cjs-data" {
  source     = "./modules/repository-collaborators"
  repository = "alpha-cjs-data"
  collaborators = [
    {
      github_user  = "lewissheppard"
      permission   = "push"
      name         = "Lewis Sheppard"
      email        = "Lewis.Sheppard@cps.gov.uk"
      org          = "CPS"
      reason       = "Collaboration on analysis of the Alpha-CJS data which links MoJ courts data to CPS data"
      added_by     = "laura.williams2@justice.gov.uk"
      review_after = "2024-12-05"
    },
    {
      github_user  = "OviB9"
      permission   = "push"
      name         = "Ovidiu Brudan"
      email        = "ovidiu.brudan@cps.gov.uk"
      org          = "CPS"
      reason       = "Collaboration on analysis of the Alpha-CJS data which links MoJ courts data to CPS data"
      added_by     = "laura.williams2@justice.gov.uk"
      review_after = "2024-12-05"
    },
  ]
}
