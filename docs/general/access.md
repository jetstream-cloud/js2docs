#ACCESS Credits and Jetstream2

ACCESS allocations are measured in ACCESS credits. Those credits then may be [converted](https://allocations.access-ci.org/exchange_calculator){target=_blank} to resource-defined service units.

Jetstream2 allocations Jetstream core hours or service units (SUs).

!!! Note "ACCESS to Jetstream2 SUs"

     For simplicity, we've aligned our SU value such that ***1 ACCESS Credit = 1 Jetstream2 SU***.</br>

SUs are consumed at a rate of:

*   Jetstream2 (CPU) - 1 SU per vCPU_core-hour (use of one virtual core of a CPU per hour).
*   Jetstream2-LM (Large Memory) - 2 SUs per vCPU_core-hour
*   Jetstream2-GPU - 4 SUs per vCPU_core-hour

Please refer to [VM Sizes and configurations](../general/vmsizes.md){target=_blank} to see available VM flavors and per hour cost on Jetstream2.

---

* **SUSPENDED** instances will be charged .75 of their normal SU value. (75%)
* **STOPPED** instances will be charge 0.50 of their normal SU value. (50%)
* **SHELVED** instances will not be charged SUs. (0%)

For Large Memory and GPU allocations, the vCPU core hour cost is 2x and 4x respectively as noted above.

The reason for continuing to charge for VMs that are not in a usable state is that they still consume resorces if they are suspended or stopped. In those states, they still occupy allocable/usable space on the hypervisor, preventing other users from using those resources.
{: .note}

For instructions on managing instances, please see:

* [Cacao instance management actions](../ui/cacao/deployments.md){target=_blank}
* [Exosphere instance management actions](../ui/exo/manage.md){target=_blank}
* [Horizon instance management actions](../ui/horizon/manage.md){target=_blank}
* [Command line instance management actions](../ui/cli/manage.md){target=_blank}
