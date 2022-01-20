## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

terraform {
  required_version = ">= 0.14"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">=4.34.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "2.0.1" # Latest version as March 2021 = 3.1.0. Using 2.0.1 (April, 2020) for ORM compatibility
    }
    local = {
      source  = "hashicorp/local"
      version = "1.4.0" # Latest version as March 2021 = 2.1.0. Using 1.4.0 (September, 2019) for ORM compatibility
    }
    random = {
      source  = "hashicorp/random"
      version = "2.3.0" # Latest version as March 2021 = 3.1.0. Using 2.3.0 (July, 2020) for ORM compatibility
    }
  }
}


provider "oci" {
  alias        = "home_region"
  tenancy_ocid = var.tenancy_ocid
  region       = "sa-saopaulo-1"
}

provider "oci" {
  alias        = "current_region"
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}
