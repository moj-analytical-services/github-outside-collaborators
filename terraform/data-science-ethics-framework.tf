module "data-science-ethics-framework" {
  source     = "./modules/repository-collaborators"
  repository = "data-science-ethics-framework"
  collaborators = [
    {
      github_user  = "mikekatell"
      permission   = "push"
      name         = "Michael Katell"
      email        = "mkatell@turing.ac.uk"
      org          = "The Alan Turing Institute"
      reason       = "To collaborate on the MoJ's Data Science Ethics Framework"
      added_by     = "sheila.ladva@justice.gov.uk"
      review_after = "2024-07-11"
    },
    {
      github_user  = "chrisdburr"
      permission   = "push"
      name         = "Christopher Burr"
      email        = "cburr@turing.ac.uk"
      org          = "The Alan Turing Institute"
      reason       = "To collaborate on the MoJ's Data Science Ethics Framework"
      added_by     = "sheila.ladva@justice.gov.uk"
      review_after = "2024-07-11"
    },
    {
      github_user  = "semelihadjiloizou"
      permission   = "push"
      name         = "Semeli Hadjiloizou"
      email        = "shadjiloizou@turing.ac.uk"
      org          = "The Alan Turing Institute"
      reason       = "To collaborate on the MoJ's Data Science Ethics Framework"
      added_by     = "sheila.ladva@justice.gov.uk"
      review_after = "2024-07-11"
    },
  ]
}
