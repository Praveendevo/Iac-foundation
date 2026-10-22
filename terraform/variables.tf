variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-iac-tf"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "storage_account_name" {
  description = "Globally unique name, 3-24 lowercase letters and numbers"
  type        = string
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "iac-foundation"
  }
}
