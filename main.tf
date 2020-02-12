provider "aws" {
}

resource "aws_iam_account_alias" "this" {
  count = var.create_iam_account && var.account_alias != "" ? 1 : 0

  account_alias = var.account_alias
}

resource "aws_accessanalyzer_analyzer" "this" {
  count = var.create_iam_account && var.create_accessanalyzer ? 1 : 0

  analyzer_name = var.analyzer_name
  type          = var.analyzer_type
  tags          = var.tags
}

resource "aws_iam_account_password_policy" "this" {
  count = var.create_iam_account ? 1 : 0

  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  minimum_password_length        = var.minimum_password_length
  max_password_age               = var.max_password_age
  password_reuse_prevention      = var.password_reuse_prevention
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_uppercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
}
