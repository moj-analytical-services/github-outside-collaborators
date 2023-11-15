locals {
  default_tags = {
    Terraform              = "true"
    business-unit          = "Platforms"
    application            = "GitHub Outside Collaborator"
    is-production          = "true"
    environment-name       = "production"
    owner                  = "Operations Engineering: operations-engineering@digital.justice.gov.uk"
    infrastructure-support = "Operations Engineering: operations-engineering@digital.justice.gov.uk"
    runbook                = "https://runbooks.operations-engineering.service.justice.gov.uk/"
    source-code            = "https://github.com/moj-analytical-services/github-outside-collaborators"
  }
}
