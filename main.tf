
resource "kubernetes_namespace" "cortex-xdr" {
  metadata {
    name = "cortex-xdr"

    labels = {
      "app.kubernetes.io/name"                         = "cortex-xdr"
      "component"                                      = "cortex-xdr"
      "cloud-platform.justice.gov.uk/environment-name" = "production"
      "cloud-platform.justice.gov.uk/is-production"    = "true"
      "pod-security.kubernetes.io/enforce"             = "privileged"
      "pod-security.kubernetes.io/warn"                = "privileged"
      "pod-security.kubernetes.io/audit"               = "privileged"


    }

    annotations = {
      "cloud-platform.justice.gov.uk/application"                   = "Palo Alto Cortex XDR Agent"
      "cloud-platform.justice.gov.uk/business-unit"                 = "Platforms"
      "cloud-platform.justice.gov.uk/owner"                         = "Cloud Platform: platforms@digital.justice.gov.uk"
      "cloud-platform.justice.gov.uk/source-code"                   = "https://github.com/ministryofjustice/cloud-platform-infrastructure"
      "cloud-platform-out-of-hours-alert"                           = "true"
    }
  }
  lifecycle {
    ignore_changes = [metadata]
  }
}


resource "helm_release" "cortex-xdr" {
  name       = "cortex-xdr-agent"
  chart      = "paloaltonetworks/cortex-xdr"
  namespace  = "cortex-xdr"
  repository = "https://paloaltonetworks.github.io/cortex-helm"
  timeout    = 600
  version    = "1.7.0"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    dockerconfig = var.xdr_docker_secret
    distribution_id = var.xdr_distribution_id
    endpoint_tags = var.endpoint_tags
  })]

  depends_on = [
    kubernetes_namespace.cortex-xdr
  ]

  lifecycle {
    ignore_changes = [keyring]
  }
}
