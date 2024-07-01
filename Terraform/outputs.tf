output "resource_group_name" {
  value = var.rg_name
}

output "cr_admin_username" {
  value       = azurerm_container_registry.example.admin_username
}

output "cr_admin_password" {
  value       = azurerm_container_registry.example.admin_password
  sensitive   = true
}