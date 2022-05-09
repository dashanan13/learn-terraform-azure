variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  type = string
  default = "delete-this"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type = string
  default = "westeurope"
}

variable "sizes" {
  description = "The size of the VM deployed."
  type = string
  default = "Standard_B4ms"
}

variable "length" {
  default = "2"
  type = number
  description = "length of the pet name"
}

variable "password_change" {
  default = "true"
  type = bool
}

variable "sizeoptns" {
  default = ["Standard_B2s", "Standard_D4ads_v5","Standard_B12ms"]
  type = list
}

variable "size-map" {
type = map
  default = {
    "normal" = "Standard_B4ms"
    "extreme" = "Standard_B12ms"
  }
}

variable "filecontent" {

}


