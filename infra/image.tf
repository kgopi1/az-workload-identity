data "azurerm_resource_group" "example" {
  name = "labpoc"
}


resource "azurerm_shared_image_gallery" "example" {
  name                = "example_image_gallery"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  description         = "Shared images and things."

  tags = {
    Hello = "There"
    World = "Example"
  }
}