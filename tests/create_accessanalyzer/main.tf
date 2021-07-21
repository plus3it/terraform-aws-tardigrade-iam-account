module "create_iam_account" {
  source = "../../"

  create_accessanalyzer = true
  analyzer_name         = "AccessAnalyzer"
  analyzer_type         = "ACCOUNT"
}
