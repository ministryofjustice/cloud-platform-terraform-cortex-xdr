dockerPullSecret:
  create: false

  # In case you want to create your own docker pull secret, enter its name here
  name: ""

  # Docker's config json encoded in base64.
  # This value is a must in order to pull the image from the private repository.
  # This value can be retrieved from the tenant.
  # In case you want to set the value from here, set `create` to true
  value: "${dockerconfig}"

deploymentSecret:
  # Set to "false" to inject distributionId externally, e.g. Vault-agent-injector
  create: true

serviceAccount:
  # create/don't create service account
  create: true

  # Name of the service account
  name: "xdr-agent-user"

  openshift:
    # SecurityConstraintContext are general constraints for our service account user
    # and are necessary for openshift
    scc:
      create: false

platform:
  # Deploy on TalOS platform
  talos: false
  # Deploy on GCOS platform
  gcos: false
  # Deploy on bottlerocket platform
  bottlerocket: false

rbac:
  # create/don't create Cluster Role and Cluster Role Bindings
  create: true

agent:
  # Agent distribution id should be retrieved from the tenant
  distributionId: "${distribution_id}"

  # The default distribution server comes with the image but it can be changed
  # through here (for development) if needed
  distributionServer: ""

  # Proxies for the agent to use, for example: 10.10.10.1:8080,10.10.10.2:8080
  proxyList: ""

  # Tags describing the endpoint, for example: "main,dev-machine1,test 123"
  endpointTags: "{$endpoint_tags}"

  # Name of the kuberenetes cluster - optional
  clusterName: ""

daemonset:
  # node labels to match pods with
  nodeSelector:
    kubernetes.io/os: linux

  podAnnotations:
    container.apparmor.security.beta.kubernetes.io/cortex-agent: unconfined

  affinity: {}

  priorityClassName: ""

  # Makes pods runnable on all nodes including master node.
  tolerations:
  - operator: Exists
    effect: NoSchedule
  - operator: Exists
    effect: PreferNoSchedule
  - operator: Exists
    effect: NoExecute

  # Default strategy to update the daemonset
  updateStrategy: RollingUpdate

  # Time for which k8s waits for the agent's pod to terminate gracefully.
  terminationGracePeriodSeconds: 90

  image:
    # image repository url, can be retrieved from the tenant
    repository: europe-west2-docker.pkg.dev/xdr-uk-2104535898207/agent-docker/cortex-agent

    # Only pull image if it doesn't exist in cache
    pullPolicy: IfNotPresent

    tag: "8.5.0.125392"

  # These values are the recommended values for cortex agent
  # and are not recommended to change!
  resources:
    limits:
      cpu: "1500m"
      memory: "2Gi"
    requests:
      cpu: "200m"
      memory: "600Mi"
  selinuxOptionsSpcT: false

namespace:
  create: false
  name: "cortex-xdr"