resource "oci_functions_application" "devops_application" {
    #Required
    compartment_id = oci_identity_compartment.devops_compartment.id
    display_name = "${var.app_name}-Application"
    subnet_ids = [oci_core_subnet.sub_net_public.id]

}