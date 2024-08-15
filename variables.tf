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
