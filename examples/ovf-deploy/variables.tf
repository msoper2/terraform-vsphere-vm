###########################################
variable "vsphere_username" {
  description = "vSphere username."
  type        = string
  default     = null
}

variable "vsphere_password" {
  description = "vSphere password."
  type        = string
}

variable "vsphere_server" {
  description = "vSphere hostname (or IP)."
  type        = string
  default     = null
}

variable "unverified_ssl" {
  description = "Allow unverified SSL if true."
  type        = bool
  default     = true
}

# Virtual Machine Section
variable "vsphere_vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = null
}

variable "wait_for_guest_ip_timeout" {
  description = "The amount of time, in minutes, to wait for an available guest IP address on this virtual machine. This should only be used if your version of VMware Tools does not allow the wait_for_guest_net_timeout waiter to be used. A value less than 1 disables the waiter."
  type        = number
  default     = 0
}

variable "wait_for_guest_net_timeout" {
  description = "The amount of time, in minutes, to wait for an available IP address on this virtual machine's NICs. Older versions of VMware Tools do not populate this property. In those cases, this waiter can be disabled and the wait_for_guest_ip_timeout waiter can be used instead. A value less than 1 disables the waiter."
  type        = number
  default     = 0
}

variable "remote_ovf_url" {
  description = "HTTP(S) URL of the OVA/OVF."
  type        = string
  default     = null
}

variable "disk_provisioning" {
  description = "Disk provisioning configuration for the VM."
  type        = string
  default     = "thin"
}

variable "ip_protocol" {
  description = "IP protocol for the VM."
  type        = string
  default     = "IPV4"
}

variable "ip_allocation_policy" {
  description = "IP allocation policy for the VM."
  type        = string
  default     = "STATIC_MANUAL"
}

# Datacenter and other VM location settings
variable "dc" {
  description = "Name of the datacenter you want to deploy the VM to."
  type        = string
  default     = "SJC07"
}

variable "cluster" {
  description = "Name of the cluster you want to deploy the VM to."
  type        = string
  default     = "Atlanta"
}

variable "host" {
  description = "Name (or IP) of the host you want to deploy the VM to."
  type        = string
  # demo users - you can change the below to any of the following:
  # 172.28.224.158
  # 172.28.224.159
  # 172.28.224.160
  default     = "172.28.224.159"
}

# Network Section
variable "network" {
  description = "Define network for each VM"
  type        = string
  default     = "VM Network"
}

# Data Disk section
variable "datastore" {
  description = "Datastore to deploy the VM."
  type        = string
  default     = "ATLData"
}
