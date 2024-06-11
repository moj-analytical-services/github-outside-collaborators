module "dfe_moj_dashboard" {
  source     = "./modules/repository-collaborators"
  repository = "dfe_moj_dashboard"
  collaborators = [
    {
      github_user  = "JennyMcNally"
      permission   = "push"
      name         = "Jennifer McNally"
      email        = "Jenny.MCNALLY@education.gov.uk"
      org          = "Department for Education"
      reason       = "Cross-gov analysis project on the MoJ-DfE share"
      added_by     = "julia.landsiedel@justice.gov.uk"
      review_after = "2025-03-31"
    },
    {
      github_user  = "AnnaThomas2"
      permission   = "push"
      name         = "Anna Thomas"
      email        = "Anna.THOMAS@education.gov.uk"
      org          = "Department for Education"
      reason       = "Cross-gov analysis project on the MoJ-DfE share"
      added_by     = "julia.landsiedel@justice.gov.uk"
      review_after = "2025-03-31"
    },
    {
      github_user  = "LauraHunnikin"
      permission   = "push"
      name         = "Laura Hunnikin"
      email        = "Laura.HUNNIKIN@education.gov.uk"
      org          = "Department for Education"
      reason       = "Cross-gov analysis project on the MoJ-DfE share"
      added_by     = "julia.landsiedel@justice.gov.uk"
      review_after = "2025-03-31"
    },
  ]
}
