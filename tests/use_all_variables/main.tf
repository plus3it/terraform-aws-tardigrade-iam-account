module "create_iam_account" {
  source = "../../"

  account_alias = {
    name = "4b11c890088301dfcd760b9b3539371b"
  }

  access_analyzer = {
    name = "AccountAnalyzer"
    type = "ACCOUNT"

    tags = {
      Name = "AccountAnalyzer"
    }
  }

  password_policy = {
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
}

module "create_unused_access_analyzer" {
  source = "../../"

  account_alias   = null
  password_policy = null

  access_analyzer = {
    name = "AccountUnusedAccessAnalyzer"
    type = "ACCOUNT_UNUSED_ACCESS"

    configuration = {
      unused_access = {
        unused_access_age = 90
      }
    }

    tags = {
      Name = "AccountUnusedAccessAnalyzer"
    }
  }
}
