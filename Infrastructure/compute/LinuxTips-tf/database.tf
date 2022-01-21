resource "random_string" "autonomous_database_admin_password" {
  length      = 16
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
  min_special = 1
}


resource "oci_database_autonomous_database" "autonomous_database" {
  #Required
  admin_password           = random_string.autonomous_database_admin_password.result
  compartment_id           = oci_identity_compartment.compartimentotrial.id
  is_free_tier              = "true"
  db_name                  = "adw"
  cpu_core_count            = 1
  data_storage_size_in_tbs = 1

  #Optional
  db_version                                     = "19c"
  db_workload                                    = "DW"
  display_name                                   = "adw"
license_model           = "LICENSE_INCLUDED"


}


output "autonomous_data_warehouse_admin_password" {
  value = random_string.autonomous_database_admin_password.result
}