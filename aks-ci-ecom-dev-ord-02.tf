module "aks-ci-ecom-dev-ord-02" {
  source                = "git::https://xkmjl6xcuanap5betn3m43lagh5y6llpn6lq5bqfpaxep7cynvca@dev.azure.com/IRL-INFRA-DEVOPS/IRL-MODULES/_git/IRL-MODULES//azurerm_kubernetes_services"
  kubernetes_version    = "1.25.6"
  create_resource_group = false
  resource_group_name   = "rsg-ci-ecom-dev-ord-02"
  node_resource_group   = "aks-ci-ecom-dev-ord-inf-mgrg-01"
  #nodepool_enable_auto_scaling = true
  cluster_name = "aks-ci-ecom-dev-ord-02"
  dns_prefix   = "aks-ci-ecom-dev-ord-02"
  #os_disk_type                = "Managed"
  akv_user_identity         = "mi-ci-ecom-dev-crt-01"
  vnet_name                 = "vnt-ci-ecom-dev-spk-01"
  subnet_name               = "snt-ci-ecom-dev-crt-aks-01"
  vnet_rg_name              = "rsg-ci-ecom-dev-net-01"
  create_container_registry = true
  pod_cidr = "10.245.0.0/16"
  # service_cidr              = "192.168.0.0/16"
  # dns_service_ip            = "192.168.0.10"
  # docker_bridge_cidr        = "192.168.1.1/16"
  acr = {
    "acr1" = {
      name = "acrciecomdevord02"
      sku  = "Standard"
    }
  }
  attach_usernodepool               = true
  network_profile_load_balancer_sku = "standard" #default
  network_profile_network_plugin    = "kubenet"  #default
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
    application        = "Order Service"
    Application_Name   = ""
    Application_Owner  = ""
    Env                = ""
    environment        = "dev"
    IRL-business-owner = "Abhiraj Anand"
    Resource_Owner     = ""
    tower              = "Ecom"
  }
}
