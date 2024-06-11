module "airflow-legislation-documentstore" {
  source     = "./modules/repository-collaborators"
  repository = "airflow-legislation-documentstore"
  collaborators = [
    {
      github_user  = "lmwilkigov"
      permission   = "push"
      name         = "Liam Wilkinson"
      email        = "liam.wilkinson@cabinetoffice.gov.uk"
      org          = "Cabinet Office/No 10"
      reason       = "Collaboration with no10 on a x-govt project relating to legislation."
      added_by     = "chloe.pugh1@justice.gov.uk"
      review_after = "2025-05-29"
    },
  ]
}