module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 5.2"

  parent = "folders/65552901371"

  names = [
    "dev",
    "staging",
    "production",
  ]

  set_roles = true

  per_folder_admins = {
    dev = {
      members = [
        "group:gcp-developers@domain.com"
      ],
    },
    staging = {
      members = [
        "group:gcp-qa@domain.com"
      ],
    }
    production = {
      members = [
        "group:gcp-ops@domain.com"
      ],
    }
  }

  all_folder_admins = [
    "group:gcp-security@domain.com",
  ]
}

