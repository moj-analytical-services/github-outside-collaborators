module "prisonsreadyreckoner" {
  source     = "./modules/repository-collaborators"
  repository = "prisonsreadyreckoner"
  collaborators = [
    {
      github_user  = "tcritchley"
      permission   = "pull"
      name         = "Thomas Critchley"
      email        = "TCritchley@no10.gov.uk"
      org          = "No10/Cabinet Office"
      reason       = "To perform an analytical deep dive into MoJ's prison demand projections"
      added_by     = "simon.whitaker@justice.gov.uk"
      review_after = "2025-02-28"
    },
    {
      github_user  = "isabel-cox"
      permission   = "pull"
      name         = "Isabel Cox"
      email        = "isabel.cox@cabinetoffice.gov.uk"
      org          = "No10/Cabinet Office"
      reason       = "To perform an analytical deep dive into MoJ's prison demand projections"
      added_by     = "simon.whitaker@justice.gov.uk"
      review_after = "2025-02-28"
    },
  ]
}
