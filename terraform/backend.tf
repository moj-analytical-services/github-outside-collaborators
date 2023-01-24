terraform {
  # `backend` blocks do not support variables, so the following are hard-coded here:
  # - S3 bucket name, which is created [here](https://github.com/ministryofjustice/cloud-platform-environments/blob/main/namespaces/live.cloud-platform.service.justice.gov.uk/operations-engineering/resources/s3-ap-gh-collab-repo.tf)
  backend "s3" {
    encrypt        = true
    bucket         = "cloud-platform-7432180341a66d72d042a5a59ee86291"
    region         = "eu-west-2"
    dynamodb_table = "cp-aef9fedfd0102b39"
    key            = "github-outside-collaborators/terraform.tfstate"
  }
}
