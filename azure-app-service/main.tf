resource "azurerm_resource_group" "example" {
  name     = var.nazwa_grupy_zasobow
  location = var.lokalizacja
}

resource "azurerm_app_service_plan" "example" {
  name                = var.nazwa_planu_uslugi_aplikacji
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "example" {
  name                = var.nazwa_uslugi_aplikacji
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
