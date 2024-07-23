resource "azuread_application_registration" "wi" {
  display_name = "azdo-wi"
}


resource "azuread_service_principal" "wi" {
  client_id = azuread_application_registration.wi.client_id
}

resource "azuread_application_federated_identity_credential" "wi-federation" {
  application_id = azuread_application_registration.wi.id
  display_name   = "azdo-repo-wi"
  description    = "Azure Devops Service connection using WI"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://vstoken.dev.azure.com/b07438a9-4777-4fca-a8d2-b4fb29def561"
  subject        = "sc://kglab02/AWI/awi-terraform"
  # subject      = "sc://{ORG_NAME}/{REPO_NAME}/{CONNECTION_NAME}"
}


data "azurerm_client_config" "example" {
}

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "role" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.wi.object_id
}