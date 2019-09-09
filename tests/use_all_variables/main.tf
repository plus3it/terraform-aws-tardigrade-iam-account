provider "aws" {
  region = "us-east-1"
}

module "create_iam_account" {
  source = "../../"

  providers = {
    aws = aws
  }

  create_iam_account             = true
  account_alias                  = "4b11c890088301dfcd760b9b3539371b"
  allow_users_to_change_password = false
  hard_expiry                    = true
  minimum_password_length        = "16"
  max_password_age               = "120"
  password_reuse_prevention      = "5"
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = true
  require_symbols                = true
}
