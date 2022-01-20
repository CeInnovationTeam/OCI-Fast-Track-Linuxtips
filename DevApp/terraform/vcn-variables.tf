# Network Details
## CIDRs
variable "network_cidrs" {
  type = map(string)

  default = {
    VCN-CIDR                      = "10.20.0.0/16"
    PRIVATE-SUBNET-CIDR           = "10.20.10.0/24"
    PUBLIC-SUBNET-CIDR            = "10.20.20.0/24"
    ENDPOINT-SUBNET-CIDR          = "10.20.0.0/28"
    ALL-CIDR                      = "0.0.0.0/0"
  }
}