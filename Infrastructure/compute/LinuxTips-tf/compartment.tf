resource "oci_identity_compartment" "compartimentotrial" {
    #Required
    compartment_id = var.tenancy_ocid
    description = "Compartimento Trial Linux Tips"
    name = "Compartimento-Trial4"


}