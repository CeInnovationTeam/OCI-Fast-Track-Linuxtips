// Aqui enderca as principais variaveis do projeto      



variable "tenancy_ocid" {}



provider "oci" {
	region = "us-ashburn-1"
}




data "oci_identity_availability_domain" "ads" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}


variable "ssh_public_key" {}