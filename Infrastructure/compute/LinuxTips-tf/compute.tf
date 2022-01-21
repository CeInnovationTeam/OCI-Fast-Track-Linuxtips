resource "oci_core_instance" "instance1" {
  availability_domain = data.oci_identity_availability_domain.ads.name
  compartment_id      = oci_identity_compartment.compartimentotrial.id
  image               = "ocid1.image.oc1.iad.aaaaaaaaffh3tppq63kph77k3plaaktuxiu43vnz2y5oefkec37kwh7oomea"
  shape               = "VM.Standard2.1"
  display_name =   "vm-linuxtips"
  create_vnic_details {
        #Required
        subnet_id  = oci_core_subnet.subnet1.id
        #Optional
        assign_public_ip = "true"
        display_name        = "vm-linuxtips"
        hostname_label      = "vm-linuxtips"
    }
 
  metadata = { 
    ssh_authorized_keys = var.ssh_public_key
    }


}

output "instance_ip_addr" {
  value = ["${oci_core_instance.instance1.public_ip}", 
  "${oci_core_instance.instance1.private_ip}"]
}


