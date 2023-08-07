module "cjs-scorecard" {
  source     = "./modules/repository-collaborators"
  repository = "cjs-scorecard"
  collaborators = [
    {
      github_user  = "daveallancps"
      permission   = "push"
      name         = "Dave Allan"
      email        = "david.allan@cps.gov.uk"
      org          = "CPS"
      reason       = "They provide us data, and we are sharing access to the code we use to process and validate their data to help with their quality assurance processes"
      added_by     = "katharine.breeze@justice.gov.uk"
      review_after = "2024-05-30"
    },
    {
      github_user  = "sophieyoung11"
      permission   = "push"
      name         = "Sophie Young"
      email        = "sophie.young@cps.gov.uk"
      org          = "CPS"
      reason       = "They provide us data, and we are sharing access to the code we use to process and validate their data to help with their quality assurance processes"
      added_by     = "katharine.breeze@justice.gov.uk"
      review_after = "2024-05-30"
    },
  ]
}
