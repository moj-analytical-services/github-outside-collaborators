module "create-a-derived-table" {
  source     = "./modules/repository-collaborators"
  repository = "create-a-derived-table"
  collaborators = [
    {
      github_user  = "aove215"
      permission   = "pull"
      name         = "Adrian Van Emmenis"
      email        = "adrian.vanemmenis@hmcts.net"
      org          = "hmcts"
      reason       = "To collaborate with Management info reporting teams to fix an outstanding issue with MI statistics."
      added_by     = "tim.britten@justice.gov.uk"
      review_after = "2025-01-01"
    },
    {
      github_user  = "morbu"
      permission   = "pull"
      name         = "Matthew Rich"
      email        = "matthew.rich2@hmcts.net"
      org          = "hmcts"
      reason       = "To collaborate with Management info reporting teams to fix an outstanding issue with MI statistics."
      added_by     = "tim.britten@justice.gov.uk"
      review_after = "2025-01-01"
    },
  ]
}
