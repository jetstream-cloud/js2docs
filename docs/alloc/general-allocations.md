# Jetstream2 Allocations

Under ACCESS, there are no longer allocations dedicated solely to research (including research startups) or education. Instead, there are categories of allocations based on the request size. We discuss those in the [Allocations Overview](overview.md) and ACCESS covers that on their [Prepare Requests: Overview](https://allocations.access-ci.org/prepare-requests-overview){target=_blank} page.

Startup allocations generally represented researchers getting started with the national cyberinfrastructure or research groups that needed modest amounts of resources generally equal to startup values. This allowed researchers that needed more modest awards to renew yearly without submitting to the allocations committee.

ACCESS has embraced this methodology and all allocations under 3,000,000 SUs may be awarded outside of the allocations committee. The allocation types and sizes are covered in the [Allocations Overview](overview.md).

Researchers have opportunities to request ACCESS allocations at four levels.

|  Allocation | Credit Threshold |
|---|---|
| Explore ACCESS | 400,000  |
|  Discover ACCESS | 1,500,000  |
| Accelerate ACCESS | 3,000,000  |
| Maximize ACCESS | Not awarded in credits |

We would suggest reviewing:

* [Jetstream2 VM Sizes](../general/vmsizes.md)
* [ACCESS Credits and Jetstream2](../general/access.md)
* [Allocations Overview](overview.md)

You can estimate your needs after reviewing the VM sizes using this example:

- m3.medium instance size (8 vCPU) for task 1 (8 SUs/hr)
- m3.large instance (16 vCPU) for task 2 (16 SUs/hr)
- g3.large instance (16 vCPU + 4 GPU slices) for task 3 (64 SUs/hr)
- Planning for 24 hour/day usage

```
(8 + 16 + 64) x 24 hours/day x 365 days = 770,880 SUs
```

It would be standard practice to round that to 800,000 SUs for development time and incidentals. This would qualify you for a Discover ACCESS	allocation (up to 1.5M SUs) so you could request more ACCESS credits if you so desired.

---

The process is that you as the PI will:

> 1. [Create your user account](https://identity.access-ci.org/new-user){target=_blank}
> 2. [Request an allocation/ACCESS credits](https://allocations.access-ci.org/opportunities){target=_blank}
> 3. [Then you will "spend" those credits on Jetstream2 resources](https://allocations.access-ci.org/requests){target=_blank}
> 4. [Have any colleagues or student researchers get their ACCESS accounts](https://identity.access-ci.org/new-user){target=_blank}
> 5. [Add them to your allocation](https://allocations.access-ci.org/user_management){target=_blank}

Resource managers, students, or other necessary users for your allocation may be added via [ACCESS User Management](https://allocations.access-ci.org/user_management){target=_blank}

!!! Note
    **It can take up to four hours for allocations or users to become active AFTER your receive the email notification.**

---

[ACCESS Allocations home page](https://allocations.access-ci.org/){target=_blank} has complete information on these topics:

* [Create your user account](https://identity.access-ci.org/new-user){target=_blank}
* [Select an opportunity (choose the size of your allocation)](https://allocations.access-ci.org/prepare-requests-overview){target=_blank}
* [Request an allocation/ACCESS credits](https://allocations.access-ci.org/opportunities){target=_blank}
* [Receive credits](https://allocations.access-ci.org/use-credits-overview){target=_blank}
* [Exchange/spend those credits](https://allocations.access-ci.org/resources){target=_blank}

---

You'll need a copy of your CV as the PI and the CVs of any co-PIs. We recommend providing a detailed abstract regardless of allocation size. Intermediate allocation sizes, Discover and Accelerate, will require 1 page and 3 page project descriptions respectively. This is covered on the [Prepare Requests: Overview](https://allocations.access-ci.org/prepare-requests-overview){target=_blank} page.

**Allow 1-2 business days for your application to go through the approval process.**

If you have questions about the the allocations process please open a ticket via either the [ACCESS Help Form](https://support.access-ci.org/user/login?destination=/open-a-ticket){target=_blank} or the [Jetstream Help Form](https://jetstream-cloud.org/contact/index.html){target=_blank}
