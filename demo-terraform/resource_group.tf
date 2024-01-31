
resource "random_string" "random_suffix" {
  length = 4
  numeric = true
  special = false
  upper = false
}

resource "azurerm_resource_group" "resource_group" {
    name = format("%s-%s",var.resource_group_name[terraform.workspace]
            ,random_string.random_suffix.result)
    location = var.resource_location
}
