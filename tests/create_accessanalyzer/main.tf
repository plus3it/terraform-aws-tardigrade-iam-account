provider "aws" {
  region = "us-east-1"
}

module "create_iam_account" {
  source = "../../"

  providers = {
    aws = aws
  }

  create_accessanalyzer = true
  analyzer_name         = "AccessAnalyzer"
  analyzer_type         = "ACCOUNT"
}
