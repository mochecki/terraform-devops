variable "location" {
  description = "Region where the resources will be deployed."
  type        = string
}

variable "environment" {
  description = "Target environment."
  type        = string
}

variable "prefix" {
  description = "The prefix which should be used for all resources."
  type        = string
}
