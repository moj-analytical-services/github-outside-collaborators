module "airflow-cjs-dashboard-data" {
  source     = "./modules/repository-collaborators"
  repository = "airflow-cjs-dashboard-data"
  collaborators = [
    {
      github_user  = "HayleyBird-CPS"
      permission   = "pull"
      name         = "Hayley Bird"
      email        = "Hayley.Bird@cps.gov.uk"
      org          = "CPS"
      reason       = "To be able to view our data validation code so that they can validate their own data rather than rely on our team to do this."
      added_by     = "laura.knowles1@justice.gov.uk"
      review_after = "2024-12-07"
    },
  ]
}
