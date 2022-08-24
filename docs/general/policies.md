#Acceptable Use Policies and Research and Export Control Guidance

### Acceptable Use of Jetstream2

Jetstream2 requires compliance with all XSEDE and Indiana University policies, including but not limited to:

*   [XSEDE Usage Policy](https://www.xsede.org/ecosystem/operations/usagepolicy){target=_blank}
*   Indiana University 
    *   [IT-02 Misuse and Abuse of Information Technology Resources](http://policies.iu.edu/policies/categories/information-it/it/IT-02.shtml){target=_blank}
    *   [IT-12 Security of Information Technology Resources](http://policies.iu.edu/policies/categories/information-it/it/IT-12.shtml){target=_blank}

> Regional clouds may have additional usage and security policies. If
> you are using one of the regional clouds, please check with your support
> team there for more information.
---

### Protected Data and Jetstream2

**Jetstream2 researchers agree to:**

*   Ensure that data that must be protected by Federal security or privacy laws (e.g., HIPAA, FERPA, ITAR, classified information, export control, etc.) are not stored on this system unless such storage and usage is specifically authorized by the responsible University administrator and complies with any processes for management of access to such information. For export controlled information, including ITAR information, approval of the University Export Compliance Office is required prior to use of the Jetstream2 systems for storage/processing of export controlled data. The Jetstream2 system is not intended, by default, to meet the security requirements of these laws or regulations and specific usage related controls or restrictions may be required prior to authorization of the use of the Jetstream2 system for such purposes.

*   Ensure that the project does not violate any export control end use restrictions contained in [Part 744 of the EAR](https://www.bis.doc.gov/index.php/documents/regulations-docs/2343-part-744-control-policy-end-user-and-end-use-based-2/file){target=_blank}.
*   Follow all US government guidance on export controls for research and research data. Please see [Jetstream2 Export Control Guidance](export.md) for more information.

* * *

### Jetstream2 and General Research Policies

In general, fundamental, publishable research is permitted on Jetstream2 from any non-EAR sanctioned countries. Fundamental research is defined as:

> “Fundamental research means basic and applied research in science and
> engineering, the results of which ordinarily are published and shared
> broadly within the scientific community, as distinguished from proprietary
> research and from Industrial development, design, production, and product
> utilization, the results of which ordinarily are restricted for proprietary
> or national security reason.” <i>[National Security Decision Directive
> (NSDD) 189, National Policy on the Transfer of Scientific, Technical,
> and Engineering Information]</i>


For anything other than fundamental, publishable research, you may wish to
consult with your institution’s export control office for any export/sharing
restrictions.

* * *

### Specialty System (GPU & Large Memory) Specific Policies

* Only g3.* flavors should be run on the Jetstream2-GPU resource
* Only r3.* flavors should be run on the Jetstream2-LargeMemory resource
* Running standard compute (m3.*) flavors on the specialty resources may result in those instances being deleted without warning
* At some future point, if GPU or large memory resources are scarce, we may limit runtime to two weeks spans or institute some form VM scheduling service to ensure equitable access to all. We do not anticipate doing this at this time.

### Allocation Related Policies

Jetstream2 requires an active XSEDE allocation for access. If your allocation expires you will no longer be able to access Jetstream2 or your resources. Presently, XSEDE warns PIs monthly, starting at 3 months until allocation expiration, and at the time of expiration.

Jetstream2 policy is that we will do the following when allocations expire:

* At **expiration + 1 day** - the allocation will be disabled on Jetstream2 and access is no longer possible to allocation users
* If the allocation has not been renewed *(preferred)* or extended in **10 days**, all VMs on the allocation will be shelved and thus no longer accessible
* If the allocation has not been renewed *(preferred)* or extended in **30 days**, all resources (VMs, volumes, shares, images, etc) on the allocation will be destroyed and *will not be recoverable*

### IP (IPv4 floating ip) Policies

Unlike Atmosphere on Jetstream1, floating ip numbers (also called public IPs) can be retained by an allocation for a virtual machine as long as needed under all Jetstream2 interfaces. As long as the IP number is in use by a virtual machine, whether active or not, it may be retained.

As IP addresses are a scarce resource, any IP numbers that are not in use may be reclaimed by the system without warning based on need.

### Router Quota Policies

By default, every project on Jetstream2 is started with a **router quota = 1**, in part to maximize available IP addresses as well as decrease the time needed for periodic maintenance. Each project can submit a help request to increase this quota along with justification for the increase.
