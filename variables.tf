# Azurerm Configuraions
provider "azurerm" {
    version = "=2.15.0"
    features {}
    subscription_id   = "${var.subscriptionId}"
    client_id         = "${var.clientId}"
    client_secret     = "${var.clientSecret}"
    tenant_id         = "${var.tenantId}"
}

variable "subscriptionId" {
    description = "Azure Subscription"
}

variable "clientId" {
    description = "Azure Service Principle Id"
}

variable "clientSecret" {
    description = "Azure Service Principle Secret"
}

variable "tenantId" {
    description = "Azure Tenant Id"
}