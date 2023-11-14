module "dsa_data_linking" {
  source     = "./modules/repository-collaborators"
  repository = "dsa_data_linking"
  collaborators = [
    {
      github_user  = "didartls"
      permission   = "pull"
      name         = "Didar Hussain"
      email        = "didar.hussain@lawsociety.org.uk"
      org          = "The Law Society of England and Wales"
      reason       = "Access to shared LAA data for external agencies used for legal aid market   analysis and statistics covering legal aid agency, crown prosecution service, bar council and the law society"
      added_by     = "Damilola.Oyebade@justice.gov.uk"
      review_after = "2024-11-03"
    },
  ]
}
