#Jetstream2 Allocations FAQ

####I was added to an allocation but I get an error like this trying to log in

>    ````{"error":{"code":401,"message":"The request you have made requires authentication.","title":"Unauthorized"}}````

>The allocation updates and user additions are created by ACCESS and synced to Jetstream2 (and other ACCESS resources). It can take up to four hours for users added to an allocation to become active. This is outside of our control. If you are still unable to log into [Exosphere](../ui/exo/login.md) or [Horizon](../ui/horizon/intro.md) after four hours from being added, please open a ticket via either the [ACCESS Help Form](https://support.access-ci.org/user/login?destination=/open-a-ticket){target=_blank} or the [Jetstream Help Form](https://jetstream-cloud.org/contact/index.html){target=_blank}.

!!! Note "Use ACCESS CI credentials if you're having trouble authenticating"

     We know ACCESS-CI credentials work correctly and recommend using those unless you are 100% sure you have linked credentials PREVIOUSLY in CILogon.<p>Please note that other CILogon credentials (i.e. for your home institution or Google) must be set up outside of this process. Follow these [Linking instructions](https://identity.access-ci.org/id-linking){target=_blank} to link your home institution or other organization (e.g. Google, ORCID, etc) credentials.

####Is there an overview of the types of allocations available as well as any restrictions those allocations have?

> The [Getting Started guide](https://allocations.access-ci.org/get-started-overview){target=_blank} describes the the overall allocations process and using ACCESS resources. To review the types of allocations ACCESS and the process to get an allocation, here are some links you might find useful:

>  *  [Allocations overview](../alloc/overview.md){target=_blank}
  *   [Types of allocations, eligibility, details](https://allocations.access-ci.org/prepare-requests-overview){target=_blank}
  *   [Allocation policies](https://allocations.access-ci.org/access-allocations-policies){target=_blank}
  *   [Managing allocations overview](https://allocations.access-ci.org/manage-allocations-overview){target=_blank}
  *   [Managing users](https://allocations.access-ci.org/user_management){target=_blank} - *requires ACCESS login*
  *   [ACCESS Allocation FAQs](https://allocations.access-ci.org/ramps-policies-faqs){target=_blank}
---

####Is there a example or demonstration of how to get an allocation that I could follow?

> The requirements for allocations has changed considerably with ACCESS.

> * [Explore ACCESS](https://allocations.access-ci.org/preparing-your-explore-access-request){target=_blank} - up to 400,000 credits, basically requires an abstract and other standard items listed on the Explore ACCESS page.
  * [Discover ACCESS](https://allocations.access-ci.org/preparing-your-discover-access-request){target=_blank} - up to 1,500,000 credits, requires an abstract, one page description, and other standard items listed on the Discover ACCESS page.
  * [Accelerate ACCESS](https://allocations.access-ci.org/preparing-your-discover-access-request){target=_blank} - up to 3,000,000 credits, requires an abstract, three page description, and other standard items listed on the Discover ACCESS page.
  * [Maximize ACCESS](https://allocations.access-ci.org/preparing-your-maximize-access-request){target=_blank} - most closely resembles XSEDE research allocations. Submission periods are twice a year and have requirements of up to 10 page main document, additional code and scaling performance documents, and the other standard materials like CVs required by all requests.

>
> Presently there are no sample documents though we expect those will materialize in time. That said, with the requirements for documentation for all but the largest allocations being up to three pages, following the ACCESS pages linked above for submissions should yield all of the information you need.

---

####How do I let other ACCESS accounts use my allocation?

You can add users to (or remove them from) your ACCESS allocation via the ACCESS Allocations Portal. Users must have already created their ACCESS accounts before they can be added to an allocation.

> To add users to, or remove them from, an active Advanced Cyberinfrastructure Coordination Ecosystem: Services & Support ([ACCESS](https://access-ci.org/about/){target=_blank}) allocation, the principal investigator, co-principal investigator, or can use the ACCESS tools here (*requires ACCESS login*):

>  * [User Management](https://allocations.access-ci.org/user_management){target=_blank}

!!! Note
    **It can take up to four hours for users added to an allocation to become active.**

---

#### Can I keep renewing my allocation(s)?

> Unlike XSEDE, ACCESS does not differentiate between most allocation types. You can renew all allocation types now, though ***Maximize ACCCESS*** allocations are only renewable during the enrollment periods noted at the top of the [Preparing Your Maximize ACCESS Request](https://allocations.access-ci.org/preparing-your-maximize-access-request){target=_blank} page.

---

####I'm running out of Service Units (SUs) or storage. How do I request more?

> If you already have an ACCESS allocation and need to request additional service units (SUs), the PI, co-PI, or delegate may submit a request via the ACCESS Portal. For instructions on how to submit the request, see [Requesting additional SUs, other Jetstream resources, or storage for Jetstream -- Supplemental Allocations](../alloc/supplement.md){target=_blank}.

!!! Note

    Supplements only add SUs/storage. If you need more time on your allocation, you need to pursue a renewal or extension.

---

####I am at or exceeding the quota limits for my allocation.

> How do I request additional resources such as CPUs and memory?

> You may contact *help@jetstream-cloud.org* or open a ticket via either the [ACCESS Help Form](https://support.access-ci.org/user/login?destination=/open-a-ticket){target=_blank} or the [Jetstream Help Form](https://jetstream-cloud.org/contact/index.html){target=_blank} with those requests.

> It's important to note that Jetstream Trial Allocation quotas are fixed and will **NOT** be increased under any circumstances.

> For other allocation types, justification will be required and will be granted at the discretion of the Jetstream2 staff based on the justification and available resources. Please note that large memory and GPU resources are limited so requests for those will require strong justification for success or partial success. We strive to make resources available to all researchers that require them, so striking a balance between the needs of one versus many is often necessary.

---

####Can you extend my allocation for me or give me access to my allocation for just a few days/weeks/months more?

> If your allocation is expired or out of SUs, you may request an extension, renewal, or supplement. Please see one of the following links:
>
> * [Requesting additional SUs, other Jetstream resources, or storage for Jetstream -- Supplemental Allocations](../alloc/supplement.md){target=_blank}
>
> * [Jetstream2 Allocation Extensions and Renewals](../alloc/renew-extend.md){target=_blank}
>
> Jetstream2 staff are unable to take these actions on your behalf.

!!! Note

    For allocations that are about to expire or have expired, ***renewals are ALWAYS preferred over extensions***


!!! Note

    Extensions only add time. If you need more or different resources, you need to pursue a supplement.

---

####My PI got a Jetstream2 supplement added to our existing allocation but we cannot access Exosphere or Horizon

> When you get a supplement for a resource that you have not previously had, users on your allocation are not automatically enabled for it. To enable users for a new resource like Jetstream2, your PI, Co-PI, or resource managers may need to go to your [User Management page](https://allocations.access-ci.org/user_management){target=_blank} and select the appropriate allocation to manage.
