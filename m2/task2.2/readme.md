# Task 2.1
## Part I. Hypervisors:
### 1. The most popular hypervisors for infrastructure virtualization:
  - VMware ESX Server
  - Microsoft Hyper-V
  - Red Hat KVM
  - Citrix Xen

### 2. The main differences of the most popular hypervisors:
#### VMware:
  - Type 1 hypervisor (bare-metal, native).
  - Fault Tolerance - unnecessary VM reboot when the host crashes, switching to another host is instantaneous and invisible to the user.
  - Distributed Resource Scheduler (DRS) and Storage DRS (SDRS) - load balancing on CPU and RAM in automatic mode, including predictive (unlike System Scheduler from Red Hat).
  - AppDefense - learning the normal behavior of the OS and in case of deviation, certain measures are taken to protect the VM.

#### Hyper-V:
  - Type 1+ hypervisor (hybrid).
  - Free.
  - Does not support hardware USB-ports pass-through.
  - Can not add CPU on the fly.
  - Not all OS are supported.
  - Allows not only to increase, but also to reduce disk volume.
  - VM-GenerationID - useful for complex Active Directory schemes with many CDs - easier to roll out.

#### RedHat KVM:
  - Type 2 hypervisor (hosted).
  - Usually Default under Linux VM.
  - Requires little hardware resources.
  - Lack of management tools.
  - Less stable operation for tasks with powerful and intensive I/O.

#### Citrix Xen:
  - Type 1+ hypervisor (hybrid).
  - Powerful in virtualization of workstations for Computer-Aided Design (CAD) and Computer-Aided Manufacture (CAM) due to the capabilities of:
    - GPU Pass-through - top videocards pass-through to the guest OS.
    - GPU Virtualization.
    - vGPU Live Migration - allows VMs to move between hosts without losing access to the GPU.

## Part II. Working with VirtualBox:
