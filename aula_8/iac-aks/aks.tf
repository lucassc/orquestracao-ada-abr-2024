resource "azurerm_kubernetes_cluster" "k8s" {
  name                    = "aks-cluster"
  location                = azurerm_resource_group.environment_rg.location
  resource_group_name     = azurerm_resource_group.environment_rg.name
  dns_prefix              = "k8s"
  node_resource_group     = "aks-node-pool-resources"
  private_cluster_enabled = false
  kubernetes_version      = "1.28.5"

  role_based_access_control_enabled = true
  oidc_issuer_enabled               = true

  api_server_access_profile {
    authorized_ip_ranges = ["0.0.0.0/0"]
  }

  default_node_pool {
    name            = "default"
    os_disk_size_gb = 50
    type            = "VirtualMachineScaleSets"
    node_count      = var.agent_count
    vm_size         = var.vm_size
    vnet_subnet_id  = azurerm_subnet.internal.id
  }

  identity { type = "SystemAssigned" }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }
}
