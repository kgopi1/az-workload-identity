data "azuredevops_project" "project" {
  name = "awi"
}

data "azuread_client_config" "current" {}

resource "azuredevops_serviceendpoint_azurerm" "example" {
  project_id                             = data.azuredevops_project.project.id
  service_endpoint_name                  = "awi-terraform"
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azuread_application_registration.wi.client_id
  }
  azurerm_spn_tenantid      = data.azuread_client_config.current.tenant_id
  azurerm_subscription_id   = "7d36b290-05bd-4bc4-a670-89b4e4749eb3"
  azurerm_subscription_name = "KGLab02"
}