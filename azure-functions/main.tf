resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_function_app" "example" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  os_type                    = "linux"

  site_config {
    linux_fx_version = "DOCKER|appsvc/azure-functions-dotnet-core2.2:latest"
    always_on        = "true"

    scm_type = "LocalGit"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "dotnet"
    WEBSITE_RUN_FROM_PACKAGE       = "1"
    APPINSIGHTS_INSTRUMENTATIONKEY = "00000000-0000-0000-0000-000000000000"
  }
}


resource "azurerm_function_app_function" "example" {
  name                      = var.function_name
  resource_group_name       = azurerm_resource_group.example.name
  app_service_name          = azurerm_function_app.example.name
  function_app_id           = azurerm_function_app.example.id
}
