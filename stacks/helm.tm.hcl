globals "helm" {
  # renovate: datasource=helm depName=external-dns registryUrl=https://registry-1.docker.io/bitnamicharts/
  version   = "6.29.1"
  name      = global.name
  namespace = "external-dns"
  chart     = "oci://registry-1.docker.io/bitnamicharts/external-dns"
}