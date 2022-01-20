output "vcn_id"{
    value = oci_core_vcn.vcn_devops.id
}

output "subnet_public_id"{
    value = oci_core_subnet.sub_net_public.id
}

output "subnet_private_id"{
    value = oci_core_subnet.sub_net_privada.id
}

output "subnet_endpoint_id"{
    value = oci_core_subnet.sub_net_endpoint.id
}

