# Jetstream2 Education Allocations

!!! Notice "XSEDE to ACCESS transition"

     Please note that as XSEDE concludes operation and transitions to ACCESS, all of the allocations documentation will need to be updated. We will get it updated to reflect ACCESS as soon as possible. Thank you for your patience.</br>
     
Jetstream2 education allocations are meant to be used for teaching courses, workshops, or tutorials. They are not intended for research.

You'll need a copy of your CV, the course syllabus, and a resource justification in PDF format. The latter is basically figuring the size of the VM your students will need, the number of weeks they'll need it, and the number of students. An example of the resource selection is below.

You'll first need to create an XSEDE Portal Account if you do not already have one:

### To create an XSEDE portal account if you do not have one:
1. Go to [https://portal.xsede.org/](https://portal.xsede.org/){target=_blank}
2. Click "Create Account" on the left side of your screen.
3. Fill out the form and click Submit.
4. Upon receipt of the email notification click the link in the email to verify your account and set your username and password. If the link doesn't work, go to [https://portal.xsede.org/](https://portal.xsede.org/){target=_blank}, click "Sign In" and then select "Verify Account" under the "Other Sign In Options".
5. Following account verification, if not already logged in, go to [https://portal.xsede.org/](https://portal.xsede.org/){target=_blank}, click "Sign In" and sign in with the username and password set in the verification step.
6. You will be asked to read and accept the User Responsibilities form. This form outlines acceptable use to protect shared resources and intellectual property.

### Apply for an XSEDE Education Allocation
1. Read the [Education Allocations Overview](https://portal.xsede.org/allocations/education){target=_blank}. There are sample allocation requests in the overview that you may find helpful.
2. Go to the [XSEDE Resource Allocation System](https://portal.xsede.org/submit-request){target=_blank} page. On the Available Opportunities page, click "Start a New Submission" under "Educational". If you are not familiar with the process, select "Begin Guided Submission" for step-by-step instructions.

````
    Before submitting an allocation request have the following information available:

    * XSEDE usersnams for PI (required), Co-PIs (optional), and Allocation Managers (optional)
    * Additional XSEDE user names to add so they may use your allocation time and resources (optional)
    * Title
    * Abstract (typically a paragraph or two for an Educational request will suffice)
    * Keywords
    * Field of science (secondary areas of science may be also be added)
````

3. Select your [resources](../general/resources.md) - you can have any combination of Jetstream2 CPU, Jetstream2 Large Memory, and Jetstream2 GPU - but you must justify Large Memory or GPU requests specifically

* Select the appropriate resources(s) from the list.
    * Enter the number of SUs you'll need. The [Virtual Machine Sizes and Configurations page](../general/vmsizes.md) can help you figure VM sizes needed. See the section below for a walkthrough of creating your resource justification.
    * Fill in number of Virtual Machines needed (this is an estimate for planning purposes – there's no wrong answer – try to best guess at how many instances you'll run at one time)
    * Fill in number of public IP addresses needed (same as above)
* If you need additional storage beyond the VM's root disks, select "Jetstream2 Storage".
    * All allocations by default will receive 1TB of storage so if that covers your needs, you do **NOT** need to select Jetstream2 Storage
* Upload your supporting documents - PDF format required
    * PI CV (2 page limit)
    * CoPI CV required for every CoPI added to request (2 page limit) -- *optional*
    * Syllabus
    * Resource Justification (see below)
    * Supporting Grants -- *optional*
    * Publications of previous/supporting work -- *optional*
4. Submit allocation request. At this point, all entered information is validated, errors or omissions are flagged.

**Allow 3-5 business days for your application to go through the approval process.**

Detailed information about the allocation request process, with screenshots, is available in the [XRAS Submit Allocation Request Step-by-Step Guide](https://portal.xsede.org/allocation-request-steps){target=_blank}.

### Writing your resource justification

A resource justification is required for an Educational allocation. You'll need to explain how the resources will be used and for how long. A sample calculation for your SU request might be:

```
16 week course
20 students
m1.medium instance size (8 vCPU)
Planning for 24 hour/day usage -
```

```
8 vCPU (SUs) x 24 hours/day x 7 days x 16 weeks = 21,504 SUs/student x 20 students = 430,080 SUs
```

It would be standard practice to round that to 450,000 SUs for development time for the instructors plus instructor VMs during the duration of the course.

You'll also need to briefly explain why you chose the VM sizes that you did – what you expect each student to be running on those VMs. The Virtual Machine Sizes and Configurations page can help you figure VM sizes needed. A paragraph or two should suffice to cover this.

If you have questions about the resource justification please do contact Jetstream Help via *help@xsede.org* and we can assist you.
