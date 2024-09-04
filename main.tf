resource "aws_iam_account_alias" "this" {
  count = var.account_alias != null ? 1 : 0

  account_alias = var.account_alias.name
}

resource "aws_accessanalyzer_analyzer" "this" {
  count = var.access_analyzer != null ? 1 : 0

  analyzer_name = var.access_analyzer.name
  type          = var.access_analyzer.type
  tags          = var.access_analyzer.tags

  dynamic "configuration" {
    for_each = var.access_analyzer.configuration != null ? [var.access_analyzer.configuration] : []
    content {
      unused_access {
        unused_access_age = configuration.value.unused_access.unused_access_age
      }
    }
  }
}

resource "aws_iam_account_password_policy" "this" {
  count = var.password_policy != null ? 1 : 0

  allow_users_to_change_password = var.password_policy.allow_users_to_change_password
  hard_expiry                    = var.password_policy.hard_expiry
  max_password_age               = var.password_policy.max_password_age
  minimum_password_length        = var.password_policy.minimum_password_length
  password_reuse_prevention      = var.password_policy.password_reuse_prevention
  require_lowercase_characters   = var.password_policy.require_lowercase_characters
  require_numbers                = var.password_policy.require_numbers
  require_symbols                = var.password_policy.require_symbols
  require_uppercase_characters   = var.password_policy.require_uppercase_characters
}
