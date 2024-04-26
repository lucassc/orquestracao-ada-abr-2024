


variable "resource_group_location" {
  description = "Location of the resource group."
}

variable "agent_count" {
  description = "Number of k8s workers"
}

variable "vm_size" {
  description = "VM Size of k8s workers - Default node pool"
}

variable "subnet_network" {
  description = "Virtual network address space"
}

variable "virtual_network" {
  description = "Variable for create virtual network"
}