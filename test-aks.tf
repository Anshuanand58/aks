module "test-aks" {
  source                = "location of your code"
  kubernetes_version    = "1.25.6"
  create_resource_group = false
  resource_group_name   = "test-rg"
  node_resource_group   = "test-managed-rg-01"
  cluster_name = "test-aks"
  dns_prefix   = "test-aks"
  akv_user_identity         = "test-aks-mi"
  vnet_name                 = "test-aks-vnet"
  subnet_name               = "test-aks-snt"
  vnet_rg_name              = "test-rg"
  create_container_registry = true
  pod_cidr = "10.245.0.0/16"
  acr = {
    "acr1" = {
      name = "test-acr"
      sku  = "Standard"
    }
  }
  attach_usernodepool               = true
  network_profile_load_balancer_sku = "standard" 
  network_profile_network_plugin    = "kubenet"  
  nodepool = {
    "pool1" = {
      name                = "nodepool1"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      vm_size             = "Standard_B4ms"
      os_disk_type        = "Managed"
      type                = "VirtualMachineScaleSets"

      ultra_ssd_enabled = false
    }
  }
  usernodepull = {
    "node1" = {
      name                = "castpool"
      vm_size             = "Standard_DS2_v2"
      enable_auto_scaling = false
      #max_count           = 0
      #min_count           = 0
      node_count   = 0
      os_disk_type = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_taints = [
        "scheduling.cast.ai/aks-init-data=true:NoSchedule"
      ]
    },
    "node2" = {
      name                = "castworkers"
      vm_size             = "Standard_DS2_v2"
      enable_auto_scaling = false
      #max_count           = 0
      #min_count           = 0
      node_count   = 0
      os_disk_type = "Managed"

      #   type            = "VirtualMachineScaleSets"
    },
    "node3" = {
      name                = "pooldev1"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev1"
      }
    },
    "node4" = {
      name                = "pooldev11"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev11"
      }
    },
    "node5" = {
      name                = "pooldev3"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev3"
      }
    },
    "node6" = {
      name                = "poolde4"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev4"
      }
    },
    "node7" = {
      name                = "pooldev5"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev5"
      }
    },
    "node8" = {
      name                = "pooldev7"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev7"
      }
    },
    "node9" = {
      name                = "pooldev8"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = true
      max_count           = 2
      min_count           = 1
      node_count          = 1
      os_disk_type        = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-Dev8"
      }
    },
    "node10" = {
      name                = "pooldev9"
      vm_size             = "Standard_B4ms"
      enable_auto_scaling = false
      #max_count           = 0
      #min_count           = 0
      node_count   = 0
      os_disk_type = "Managed"

      #   type            = "VirtualMachineScaleSets"
      node_labels = {
        "app-name" = "OrderService-QA5"
      }
    },
  }
  location = "centralindia" #default
  tags = {
    application        = "test"

}
