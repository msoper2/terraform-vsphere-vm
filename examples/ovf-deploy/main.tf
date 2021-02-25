terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 1.24.3"
    }
  }
}

provider "vsphere" {
  # Configuration options
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = var.unverified_ssl
}

data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = var.host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vmFromRemoteOvf" {
  name             = var.vsphere_vm_name
  datacenter_id    = data.vsphere_datacenter.dc.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  host_system_id   = data.vsphere_host.host.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  wait_for_guest_net_timeout = var.wait_for_guest_net_timeout
  // wait for IP assignment (IP assign may be done external to this config)
  wait_for_guest_ip_timeout = var.wait_for_guest_ip_timeout
  ovf_deploy {
    // Url to remote ovf/ova file
    remote_ovf_url       = var.remote_ovf_url
    disk_provisioning    = var.disk_provisioning
    ip_protocol          = var.ip_protocol
    ip_allocation_policy = var.ip_allocation_policy
  }
}
