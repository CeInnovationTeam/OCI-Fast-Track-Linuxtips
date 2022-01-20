output "cluster_name"{
    value = oci_containerengine_cluster.oci_oke.name
}

output "cluster_ocid"{
    value = oci_containerengine_cluster.oci_oke.id
}

output "node_pool_name"{
    value = oci_containerengine_node_pool.oke_node_pool.name
}

output "node_pool_ocid"{
    value = oci_containerengine_node_pool.oke_node_pool.id
}