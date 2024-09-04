variable "access_analyzer" {
  description = "Object of attributes for an IAM Access Analyzier"
  type = object({
    name = optional(string, "AccountAnalyzer")
    type = optional(string, "ACCOUNT")
    tags = optional(map(string))

    configuration = optional(object({
      unused_access = object({
        unused_access_age = number
      })
    }))
  })
  default = {}
}

variable "account_alias" {
  description = "Object of attributes for the IAM account alias"
  type = object({
    name = string
  })
  default = null
}

variable "password_policy" {
  description = "Object of attributes for the IAM account password policy"
  type = object({
    allow_users_to_change_password = optional(bool, true)
    hard_expiry                    = optional(bool, false)
    max_password_age               = optional(string, "90")
    minimum_password_length        = optional(string, "14")
    password_reuse_prevention      = optional(string, "24")
    require_lowercase_characters   = optional(bool, true)
    require_numbers                = optional(bool, true)
    require_symbols                = optional(bool, true)
    require_uppercase_characters   = optional(bool, true)
  })
  default = {}
}
