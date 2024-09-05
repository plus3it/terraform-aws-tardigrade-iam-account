# terraform-aws-tardigrade-iam-account

Terraform module to manage AWS account password policy

## Testing

At the moment, testing is manual:

Note:  This test should be run in an account that doesn't already have an
existing AccessAnalyzer.

```
# Replace "xxx" with an actual AWS profile, then execute the integration tests.
export AWS_PROFILE=xxx 
make terraform/pytest PYTEST_ARGS="-v --nomock"
```

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_analyzer"></a> [access\_analyzer](#input\_access\_analyzer) | Object of attributes for an IAM Access Analyzier | <pre>object({<br>    name = optional(string, "AccountAnalyzer")<br>    type = optional(string, "ACCOUNT")<br>    tags = optional(map(string))<br><br>    configuration = optional(object({<br>      unused_access = object({<br>        unused_access_age = number<br>      })<br>    }))<br>  })</pre> | `{}` | no |
| <a name="input_account_alias"></a> [account\_alias](#input\_account\_alias) | Object of attributes for the IAM account alias | <pre>object({<br>    name = string<br>  })</pre> | `null` | no |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | Object of attributes for the IAM account password policy | <pre>object({<br>    allow_users_to_change_password = optional(bool, true)<br>    hard_expiry                    = optional(bool, false)<br>    max_password_age               = optional(string, "90")<br>    minimum_password_length        = optional(string, "14")<br>    password_reuse_prevention      = optional(string, "24")<br>    require_lowercase_characters   = optional(bool, true)<br>    require_numbers                = optional(bool, true)<br>    require_symbols                = optional(bool, true)<br>    require_uppercase_characters   = optional(bool, true)<br>  })</pre> | `{}` | no |

## Outputs

No outputs.

<!-- END TFDOCS -->
