
variable "parent" {
  description = "Parent organization or folder, formatted as organizations/ORG_ID or folders/FOLDER_ID."
  type        = string

  validation {
    condition     = can(regex("^(organizations|folders)/[0-9]+$", var.parent))
    error_message = "parent must be formatted as organizations/ORG_ID or folders/FOLDER_ID."
  }
}

variable "names" {
  description = "Names of the folders to create under the parent."
  type        = list(string)
  default     = []

  validation {
    condition     = length(var.names) == length(distinct(var.names))
    error_message = "Folder names must be unique."
  }
}

variable "prefix" {
  description = "Optional prefix used to make folder names unique."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Whether to protect folders from deletion or recreation."
  type        = bool
  default     = true
}

variable "set_roles" {
  description = "Whether to configure folder IAM roles using the admin inputs."
  type        = bool
  default     = false
}

variable "all_folder_admins" {
  description = "IAM members receiving the configured folder-admin roles across all folders."
  type        = list(string)
  default     = []
}

variable "per_folder_admins" {
  description = "Optional IAM members and roles configured per folder name."
  type = map(object({
    members = list(string)
    roles   = optional(list(string))
  }))
  default = {}
}
