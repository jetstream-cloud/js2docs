# Jetstream2 Research Allocations (Maximize ACCESS)

Under XSEDE, Research allocations were generally the larger allocations, greater than startup values, up to millions of SUs intended for scientific research. With the advent of ACCESS and the new allocation convention, the closest category to this would be ***Maximize ACCESS*** where the allocation sizes exceed 3 million SUs.

All allocation types now may be used for research or education and the requirements vary based on the number of SUs requested. We discuss this in the [Allocations Overview](overview.md) and ACCESS covers that on their [Prepare Requests: Overview](https://allocations.access-ci.org/prepare-requests-overview){target=_blank} page.

Most researchers will fall in the 3 categories of allocations that require a minimum of preparation and that can be submitted at any time. For those that will need 3 million SUs or more, you may start with a smaller allocation size (anything up to 3 million SUs) and then submit during the limited windows (twice a year) for a Maximize ACCESS allocation. It's highly suggested that you read [Preparing Your Maximize ACCESS Request
](https://allocations.access-ci.org/preparing-your-maximize-access-request){target=_blank} to see the requirements for submissions.

We highly encourage all potential applicants to view:

  * [Webinar on writing a successful research (Maximize ACCESS) allocation request](https://youtu.be/W-tdqZiIM_A){target=_blank} and also the [webinar for code and scaling documentation](https://youtu.be/1rHqH1SUD-o){target=_blank}.
  * *Example Research Requests - coming soon*
  * [Required Components](https://allocations.access-ci.org/preparing-your-maximize-access-request#required-components){target=_blank} section of the ACCESS documentation. *If your research allocation request does not have all of the required components, it may be rejected without review.*

[Science Gateway research requests](https://allocations.access-ci.org/preparing-your-maximize-access-request#guidance-for-gateway-requests){target=_blank} may have some different criteria. We recommend reviewing this section of the document if you will be submitting a science gateway oriented research request.

*Please do not forget to review the [formatting guidelines](https://allocations.access-ci.org/preparing-your-maximize-access-request#appendix-formatting-guidelines){target=_blank} - failure to adhere to the guidelines may also result in a submission being rejected without review*
{: .note}

---

We would also suggest reviewing:

* [Jetstream2 VM Sizes](../general/vmsizes.md)
* [ACCESS Credits and Jetstream2](../general/access.md)
* [Allocations Overview](overview.md)

You can estimate your needs after reviewing the VM sizes using this example:

- m3.medium instance size (8 vCPU) for task 1 (8 SUs/hr) x 2
- m3.large instance (16 vCPU) for task 2 (16 SUs/hr) x 2
- m3.xl instance (32 vCPU) for task 3 (32 SUs/hr) x 2
- g3.xl instance (32 vCPU + 5 GPU slices) for task 4 (128 SUs/hr) x 2
- Planning for 24 hour/day usage

```
(16 + 32 + 64 + 256) x 24 hours/day x 365 days = 3,223,680 SUs
```

It would be standard practice to round that to 3,300,000 SUs for development time and incidentals.

---

As this process is more involved and are reviewed by a panel twice a year, the turn around time to receive the award will be weeks or months after submission. Please plan accordingly.

---

[ACCESS Allocations home page](https://allocations.access-ci.org/){target=_blank} has complete information on these topics:

* [Create your user account](https://identity.access-ci.org/new-user){target=_blank}
* [Select an opportunity (choose the size of your allocation)](https://allocations.access-ci.org/prepare-requests-overview){target=_blank}
* [Request an allocation/ACCESS credits](https://allocations.access-ci.org/opportunities){target=_blank}
* [Receive credits](https://allocations.access-ci.org/use-credits-overview){target=_blank}
* [Exchange/spend those credits](https://allocations.access-ci.org/resources){target=_blank}

---

If you have questions about the the allocations process please open a ticket via either the [ACCESS Help Form](https://support.access-ci.org/user/login?destination=/open-a-ticket){target=_blank} or the [Jetstream Help Form](https://jetstream-cloud.org/contact/index.html){target=_blank}
