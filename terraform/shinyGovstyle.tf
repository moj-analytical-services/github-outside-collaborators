module "shinyGovstyle" {
  source     = "./modules/repository-collaborators"
  repository = "shinyGovstyle"
  collaborators = [
    {
      github_user  = "sarahmwong"
      permission   = "maintain"
      name         = "Sarah Wong"
      email        = "sarah.wong@hmrc.gov.uk"
      org          = "HMRC"
      reason       = "A x-gov open sourced package that needs some help maintaining the repo from the working group"
      added_by     = "ross.wyatt@justice.gov.uk"
      review_after = "2024-10-29"
    },
    {
      github_user  = "cjrace"
      permission   = "maintain"
      name         = "Cameron Race"
      email        = "Cameron.RACE@education.gov.uk"
      org          = "DfE"
      reason       = "A x-gov open sourced package that needs some help maintaining the repo from the working group"
      added_by     = "ross.wyatt@justice.gov.uk"
      review_after = "2024-10-29"
    },
  ]
}
