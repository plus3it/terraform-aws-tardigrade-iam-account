module "create_accessanalyzer" {
  source = "../../"

  account_alias   = null
  password_policy = null

  access_analyzer = {
    name = "AccessAnalyzer"
    type = "ACCOUNT"
  }
}
