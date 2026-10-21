
output "folder_ids" {
  description = "IDs of the folders created by the upstream module."
  value       = module.folders.ids_list
}

output "folder_names" {
  description = "Names of the folders created by the upstream module."
  value       = module.folders.names_list
}

