resource "oci_apigateway_gateway" "devops_api" {
    #Required
    compartment_id = oci_identity_compartment.devops_compartment.id
    subnet_id = oci_core_subnet.sub_net_public.id
    endpoint_type = "PUBLIC"
    display_name = "${var.app_name}-APIGW"
}