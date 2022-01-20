resource "oci_core_vcn" "vcn_devops" {
    #Required
    compartment_id = oci_identity_compartment.devops_compartment.id

    #Optional
    cidr_block = lookup(var.network_cidrs, "VCN-CIDR")
    display_name = "${var.app_name}-VCN"
    dns_label = var.app_name
}

resource "oci_core_nat_gateway" "nat_gateway" {

    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id
}

resource "oci_core_internet_gateway" "internet_gateway" {

    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id
}

resource "oci_core_service_gateway" "service_gateway" {
    #Required
    compartment_id = oci_identity_compartment.devops_compartment.id
    services {
        service_id = lookup(data.oci_core_services.all_services.services[0], "id")
    }
    vcn_id = oci_core_vcn.vcn_devops.id
}

resource "oci_core_route_table" "private_rt" {

    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id
    display_name    = "RT_PRIVADO"
    route_rules {
        network_entity_id   = oci_core_nat_gateway.nat_gateway.id
        cidr_block          = lookup(var.network_cidrs, "ALL-CIDR")
    }
    route_rules {
        description       = "Traffic to OCI services"
        destination       = lookup(data.oci_core_services.all_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = oci_core_service_gateway.service_gateway.id
  }
}

resource "oci_core_route_table" "public_rt" {
    
    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id
    display_name    = "RT_PUBLICO"
    route_rules {
        network_entity_id   = oci_core_internet_gateway.internet_gateway.id
        cidr_block          = lookup(var.network_cidrs, "ALL-CIDR")
    }
}

resource "oci_core_security_list" "security_list_private" {

    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id
    display_name    = "Private_SL"
    egress_security_rules {
        destination         = lookup(var.network_cidrs, "ALL-CIDR")
        protocol            = "all"
        description         = "Allow access to internet"
        destination_type    = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol    = "all"
        source      = lookup(var.network_cidrs, "VCN-CIDR")
        description = "comunication inside VCN"
        source_type = "CIDR_BLOCK"
        stateless   = false
    }
}

resource "oci_core_security_list" "security_list_public" {
    #Required
    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id

    #Optional
    display_name = "Private_SL"
    egress_security_rules {
        destination         = lookup(var.network_cidrs, "ALL-CIDR")
        protocol            = "all"
        description         = "Allow access to internet"
        destination_type    = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol    = "6"
        source      = lookup(var.network_cidrs, "ALL-CIDR")
        description = "Allow SSH"
        source_type = "CIDR_BLOCK"
        stateless   = false

        tcp_options {
        max = "22"
        min = "22"
        }
    }
    ingress_security_rules {
        protocol    = "6"
        source      = lookup(var.network_cidrs, "ALL-CIDR")
        description = "Para o APIGW"
        source_type = "CIDR_BLOCK"
        stateless   = false

        tcp_options {
        max = "443"
        min = "443"
        }
    }
}

resource "oci_core_security_list" "security_list_endpoint" {
    #Required
    compartment_id  = oci_identity_compartment.devops_compartment.id
    vcn_id          = oci_core_vcn.vcn_devops.id

    #Optional
    display_name = "EndPoint_SL"
    egress_security_rules {
        destination         = lookup(var.network_cidrs, "ALL-CIDR")
        protocol            = "all"
        description         = "Allow access to internet"
        destination_type    = "CIDR_BLOCK"
    }
    ingress_security_rules {
        protocol    = "6"
        source      = lookup(var.network_cidrs, "ALL-CIDR")
        description = "Allow OKE Endpoint"
        source_type = "CIDR_BLOCK"
        stateless   = false

        tcp_options {
        max = "6443"
        min = "6443"
        }
    }
    ingress_security_rules {
        protocol    = "6"
        source      = lookup(var.network_cidrs, "VCN-CIDR")
        description = "Allow OKE Endpoint"
        source_type = "CIDR_BLOCK"
        stateless   = false

        tcp_options {
        max = "12250"
        min = "12250"
        }
    }
}

resource "oci_core_subnet" "sub_net_public" {
    compartment_id      = oci_identity_compartment.devops_compartment.id
    display_name        = "subnet_publica"
    vcn_id              = oci_core_vcn.vcn_devops.id
    cidr_block          = lookup(var.network_cidrs, "PUBLIC-SUBNET-CIDR")
    security_list_ids   = [oci_core_security_list.security_list_public.id]
    route_table_id      = oci_core_route_table.public_rt.id
    dns_label           = "public"
}

resource "oci_core_subnet" "sub_net_privada" {
    compartment_id             = oci_identity_compartment.devops_compartment.id
    display_name               = "subnet_privada"
    vcn_id                     = oci_core_vcn.vcn_devops.id
    cidr_block                 = lookup(var.network_cidrs, "PRIVATE-SUBNET-CIDR")
    security_list_ids          = [oci_core_security_list.security_list_private.id]
    route_table_id             = oci_core_route_table.private_rt.id
    prohibit_public_ip_on_vnic = "true"
    dns_label                  = "private"
}

resource "oci_core_subnet" "sub_net_endpoint" {
    compartment_id      = oci_identity_compartment.devops_compartment.id
    display_name        = "subnet_endpoint"
    vcn_id              = oci_core_vcn.vcn_devops.id
    cidr_block          = lookup(var.network_cidrs, "ENDPOINT-SUBNET-CIDR")
    security_list_ids   = [oci_core_security_list.security_list_endpoint.id]
    route_table_id      = oci_core_route_table.public_rt.id
}