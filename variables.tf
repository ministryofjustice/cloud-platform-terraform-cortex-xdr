#################
# Configuration #
#################

# Add module-specific variables here

########
# Tags #
########
variable "business_unit" {
  description = "Area of the MOJ responsible for the service"
  type        = string
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "is_production" {
  description = "Whether this is used for production or not"
  type        = string
}

variable "team_name" {
  description = "Team name"
  type        = string
}

variable "namespace" {
  description = "Namespace name"
  type        = string
}

variable "environment_name" {
  description = "Environment name"
  type        = string
}

variable "infrastructure_support" {
  description = "The team responsible for managing the infrastructure. Should be of the form <team-name> (<team-email>)"
  type        = string
}

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
