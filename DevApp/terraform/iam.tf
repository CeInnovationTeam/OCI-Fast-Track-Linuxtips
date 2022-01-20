resource "oci_identity_compartment" "devops_compartment" {
    #Required
    compartment_id = var.compartment_id
    description = "Compartimento para o deploy de ferramentas de DevOps"
    name = local.compartment_name
}

resource "oci_identity_dynamic_group" "devops_dynamic_group" {
    #Required
    compartment_id = var.tenancy_ocid
    description = "Devapp DG"
    matching_rule = "All {instance.compartment.id = '${local.compartment_ocid}'}"
    name = local.dg_name
}

resource "oci_identity_policy" "devops_policy" {
    compartment_id = oci_identity_compartment.devops_compartment.id
    description = "Policy para as ferramentas de DevApp"
    name = "DevOps_Policy"
    statements = local.oci_policies_compartment
    depends_on = [oci_identity_dynamic_group.devops_dynamic_group]
}

resource "oci_identity_policy" "scanning_image_policy" {
    compartment_id = var.tenancy_ocid
    description = "Policy para habilitar o scan de vulnerabilidade do OCIR"
    name = "Scanning_Image_Policy"
    statements = local.oci_policies_tenancy
}

locals {

    compartment_name = "DevApp"
    compartment_ocid = oci_identity_compartment.devops_compartment.id
    dg_name = "DevApp"

    oci_policies_compartment = [
        "Allow any-user to use functions-family in compartment ${local.compartment_name} where ALL {request.principal.type= 'ApiGateway', request.resource.compartment.id = '${oci_identity_compartment.devops_compartment.id}'}",
        "Allow dynamic-group ${local.dg_name} to manage all-resources in compartment ${local.compartment_name}"
    ]

    oci_policies_tenancy = [
        "Allow service vulnerability-scanning-service to read repos in tenancy"
    ]

}