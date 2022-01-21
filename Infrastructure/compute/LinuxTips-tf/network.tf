


resource "oci_core_vcn" "vcn_tform" {
    #Required
    cidr_block      = "10.0.0.0/16"
    compartment_id  =  oci_identity_compartment.compartimentotrial.id
    #Optional
    display_name    = "vcn-wizard"
    dns_label       = "vcnwizard"
}


resource "oci_core_subnet" "subnet1" {
    #Required
    cidr_block        = "10.0.1.0/24"
    compartment_id    = oci_identity_compartment.compartimentotrial.id
    vcn_id            = oci_core_vcn.vcn_tform.id
    #dhcp_options_id   = "${oci_core_dhcp_options.test_dhcp_options.id}"  
    display_name      = "subnet-publica"
    dns_label         = "subnet1"
    prohibit_public_ip_on_vnic = "false"
    route_table_id    = oci_core_route_table.routetable1.id
    security_list_ids = ["${oci_core_security_list.SecurityListTForm.id}"]
}

/*resource "oci_core_subnet" "subnet1" {
    #Required
    cidr_block        = "10.0.1.0/24"
    compartment_id    = oci_identity_compartment.compartimentotrial.id
    vcn_id            = oci_core_vcn.vcn_tform.id
    display_name      = "subnet1"
    dns_label         = "subnet1"
    prohibit_public_ip_on_vnic = "false"
    route_table_id    = oci_core_route_table.routetable1.id
    security_list_ids = [oci_core_security_list.SecurityListTForm.id]
}*/



resource "oci_core_subnet" "subnet2" {
    #Required
    cidr_block        = "10.0.2.0/24"
    compartment_id    = oci_identity_compartment.compartimentotrial.id
    vcn_id            = oci_core_vcn.vcn_tform.id

    #Optional
    #availability_domain = Nao informar o AD implica em criar subnet regional
    #dhcp_options_id   = "${oci_core_dhcp_options.test_dhcp_options.id}"  
    display_name      = "subnet-privada"
    #dns_label         = "subnet2"
    prohibit_public_ip_on_vnic = "true"
    route_table_id    = oci_core_route_table.routetable1.id
    #security_list_ids = "${var.subnet_security_list_ids}"
}

resource "oci_core_internet_gateway" "internetgateway1" {
  compartment_id = oci_identity_compartment.compartimentotrial.id
  display_name   = "internetgateway1"
  vcn_id         = oci_core_vcn.vcn_tform.id
}

resource "oci_core_route_table" "routetable1" {
  compartment_id = oci_identity_compartment.compartimentotrial.id
  vcn_id         = oci_core_vcn.vcn_tform.id
  display_name   = "routetable1"

  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internetgateway1.id
  }
}


#-----------------------------------------------------------------------------------------#

resource "oci_core_security_list" "SecurityListTForm" {
  compartment_id = oci_identity_compartment.compartimentotrial.id
  vcn_id         = oci_core_vcn.vcn_tform.id
  display_name   = "Security List com Regras TForm"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow outbound udp traffic on a port range
  /*egress_security_rules {
    #description = "RegraSaida"
    destination = "0.0.0.0/0"
    protocol    = "17"                                                     // udp
    stateless   = true

    udp_options {
      // These values correspond to the destination port range.
      min = 319
      max = 320
    }
  }*/

  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      #source_port_range {
      #  min = 100
      #  max = 100
      #}

      // These values correspond to the destination port range.
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    #description = "Regra02"
    protocol    = 1
    source      = "0.0.0.0/0"
    stateless   = true

    icmp_options {
      type = 3
      code = 4
    }
  }

ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      #source_port_range {
      #  min = 80
      #  max = 80
      #}

      // These values correspond to the destination port range.
      min = 80
      max = 80
    }
  }
}