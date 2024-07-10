output "resource_group_name" {
  value = var.rg_name
}

output "cr1_admin_username" {
  value       = azurerm_container_registry.azcr1.admin_username
}

output "cr1_admin_password" {
  value       = azurerm_container_registry.azcr1.admin_password
  sensitive   = true
}

output "cr2_admin_username" {
  value       = azurerm_container_registry.azcr2.admin_username
}

output "cr2_admin_password" {
  value       = azurerm_container_registry.azcr2.admin_password
  sensitive   = true
}

output "public_ip_address" {
  value       = azurerm_public_ip.publicip1.ip_address
}