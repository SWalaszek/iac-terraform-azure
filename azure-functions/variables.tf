variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "location" {
  description = "Lokalizacja grupy zasobów"
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa konta magazynowania"
  type        = string
}

variable "app_service_plan_name" {
  description = "Nazwa planu usługi aplikacji"
  type        = string
}

variable "function_app_name" {
  description = "Nazwa aplikacji funkcji"
  type        = string
}

variable "function_name" {
  description = "Nazwa funkcji"
  type        = string
}
variable "subscription_id" {
  description = "ID docelowej subskrypcji Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID dzierżawy Azure Active Directory"
  type        = string
}

variable "client_id" {
  description = "ID aplikacji Azure Active Directory"
  type        = string
}

variable "client_secret" {
  description = "Sekret powiązany z aplikacją Azure Active Directory"
  type        = string
  sensitive   = true
}
