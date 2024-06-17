output "resource_group_name" {
  value = var.existent_resource_group_name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.example.name
}

output "cr_admin_username" {
  value       = azurerm_container_registry.example.admin_username
}

output "cr_admin_password" {
  value       = azurerm_container_registry.example.admin_password
  sensitive   = true
}