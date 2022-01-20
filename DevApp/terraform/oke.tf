resource "oci_containerengine_cluster" "oci_oke" {
    #Required
    compartment_id = oci_identity_compartment.devops_compartment.id
    kubernetes_version = "v1.21.5"
    name = "${var.app_name}-OKE"
    vcn_id = oci_core_vcn.vcn_devops.id

    #Optional
    endpoint_config {

        #Optional
        is_public_ip_enabled = "true"
        subnet_id = oci_core_subnet.sub_net_endpoint.id
    }
    options {
        service_lb_subnet_ids = [oci_core_subnet.sub_net_public.id]
    }
}

resource "oci_containerengine_node_pool" "oke_node_pool" {
    #Required
    cluster_id = oci_containerengine_cluster.oci_oke.id
    compartment_id = oci_identity_compartment.devops_compartment.id
    kubernetes_version = "v1.21.5"
    name =  "${var.app_name}-pool"
    node_shape = var.node_pool_shape

    node_config_details {
        #Required
        placement_configs {
            #Required
            availability_domain = data.oci_identity_availability_domains.ADs.availability_domains.0.name
            subnet_id = oci_core_subnet.sub_net_privada.id
        }
        size = var.num_pool_workers
    }
    node_shape_config {

        #Optional
        memory_in_gbs = var.node_pool_node_shape_config_memory_in_gbs
        ocpus = var.node_pool_node_shape_config_ocpus
    }
    node_source_details {
        #Required
        image_id = var.node_pool_shape != "VM.Standard.A1.Flex"? element([for source in data.oci_containerengine_node_pool_option.oci_oke_node_pool_option.sources : source.image_id if length(regexall("Oracle-Linux-7.9-20[0-9]*.*", source.source_name)) > 0], 0) : element([for source in data.oci_containerengine_node_pool_option.oci_oke_node_pool_option.sources : source.image_id if length(regexall("Oracle-Linux-7.9-aarch64-20[0-9]*.*", source.source_name)) > 0], 0)
        source_type = "IMAGE"
    }
}