#################
# Configuration #
#################

variable "xdr_distribution_id" {
  type = string
  description = "distribution id for Cortex XDR agent tenant"
  default = ""
}

variable "xdr_docker_secret" {
  type = string
  default = ""
  description = "dockerconfigjson for Cortex XDR agent"
}

variable "endpoint_tags" {
  type = string
  description = "comma separated key value pair for daemonset tagging"
  default = ""
}

variable "business_unit" {
  type    = string
  default = "Platforms"
}

variable "application" {
  type    = string
  default = "Palo Alto Cortex XDR Agent"
}

variable "is_production" {
  type    = string
  default = "true"
}

variable "namespace" {
  type    = string
  default = "cortex-xdr"
}

variable "environment_name" {
  type    = string
  default = "production"
}

variable "team_name" {
  type    = string
  default = ""
}

variable "infrastructure_support" {
  type    = string
  default = ""
}
