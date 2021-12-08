vsphere_datacenter                  = "My Datacenter"
vsphere_datastore                   = "My Datastore"
vsphere_resource_pool               = "My Cluster/"
network_cards                       = ["VM Network"]
vsphere_folder                      = "Arc Servers"
vsphere_vm_template_name            = "VM Templates/WINSRV2K19-TMP"
vsphere_virtual_machine_name        = "Arc-Win-Demo"
vsphere_virtual_machine_count       = 1
vsphere_virtual_machine_cpu_count   = "2"
vsphere_virtual_machine_memory_size = "8192" //Megabytes
cpu_hot_add_enabled                 = true
cpu_hot_remove_enabled              = true
memory_hot_add_enabled              = true
domain                              = "something.local"
vm_gateway                          = "10.0.0.1"
vm_dns = [
  "10.0.0.1",
]