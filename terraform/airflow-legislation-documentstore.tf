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
    {
      github_user  = "olivernormand"
      permission   = "pull"
      name         = "Oliver Normand"
      email        = "oliver.normand@cabinetoffice.gov.uk"
      org          = "Cabinet Office"
      reason       = "We are working on a x-govt project using publicly available data."
      added_by     = "chloe.pugh1@justice.gov.uk"
      review_after = "2025-06-12"
    },
  ]
}
