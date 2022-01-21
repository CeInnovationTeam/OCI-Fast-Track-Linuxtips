resource "oci_core_volume" "test_block_volume_paravirtualized" {
  availability_domain = data.oci_identity_availability_domain.ads.name
  compartment_id      = oci_identity_compartment.compartimentotrial.id
  display_name        = "StorageLinuxtips"
  size_in_gbs         = 100
}

resource "oci_core_volume_attachment" "test_block_volume_attach_paravirtualized" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.instance1.id
  volume_id       = oci_core_volume.test_block_volume_paravirtualized.id
  # Set this to attach the volume as read-only.
  #is_read_only = true
}