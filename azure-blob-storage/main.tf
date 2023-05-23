resource "azurerm_resource_group" "example" {
  name     = var.nazwa_grupy_zasobow
  location = var.lokalizacja
}

resource "azurerm_storage_account" "example" {
  name                     = var.nazwa_konta_przechowywania
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.nazwa_kontenera_przechowywania
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.nazwa_bloba_przechowywania
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.typ_bloba_przechowywania
}
