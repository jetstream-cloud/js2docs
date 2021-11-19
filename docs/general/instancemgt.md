# Instance Management Actions

Please orient yourself to the following instance management actions. These will help you use Jetstream2 effectively and conserve your allocation.

Each user interface for Jetstream2 has instance actions in a slightly different place -- see guidance for [Exosphere](../ui/exo/manage.md), [Atmosphere2](../ui/atmo/manage.md), [Horizon](../ui/horizon/manage.md), and the [OpenStack CLI](../ui/cli/manage.md).

## Basic Actions

### Shelve and Unshelve

**When your instance is not performing work or otherwise in active use, please _shelve_ it.** Shelving an instance shuts it down and frees up resources on the cloud for other users. It also conserves the SUs (service units) on your allocation.

Shelving an instance shuts down its operating system. The instance's disk contents are preserved, but any running programs will exit, so please save any unfinished work before shelving.

Shelving and unshelving each take a few minutes, so shelving doesn't make sense for very short periods of inactivity. In other words, shelve your instance when you're done for the day or the week, not merely for your lunch break.

A shelved instance will not accept shell, SSH, or any other connections.  So, if your instance runs a server that you want to provide others the ability to connect to at any time, you must leave it active. If this describes your instance, consider re-sizing it to the smallest size that will work for your server needs. This will conserve SUs on your allocation.

### Lock and Unlock

Locking an instance helps prevent anyone from accidentally deleting or performing other actions on it, from Exosphere and all other Jetstream2 interfaces. If your instance is running an important job or used in 'production' capacity, consider keeping it locked. You must unlock your instance again before performing other actions (such as shelving it). Locking and unlocking are non-disruptive actions -- they do not affect a running instance.

Be aware that locking an instance does not prevent:

- another user on your allocation from unlocking it.
- modifications to the instance's filesystem(s) or running software. For example, someone with access to the instance could still log in and delete files. Locking only prevents instance actions at the cloud (OpenStack) level.
- the instance from shutting off when your allocation expires or is exhausted.

### Reboot

Rebooting an instance is just like restarting a computer. The cloud will first attempt a graceful or "soft" reboot, where all of your programs are allowed to exit. If that fails then will perform a "hard" reboot, which will lose any work that is not yet written to disk. If you cannot connect to your instance, rebooting is a good troubleshooting step before creating a support ticket.

## Advanced Actions

The following actions are for more sophisticated use cases. If you're a new cloud user, it's okay to skip reading about these for now.

### Resize

**Note: this feature is not implemented in Exosphere yet -- coming soon. Until then, you can resize using Horizon.**

Resizing allows you to choose a different flavor (a.k.a. size) for your instance. When you resize, your instance will shut down and then restart with the new flavor (so please save any work in progress first).

Consider resizing if you find yourself in one of these situations:
- Your instance exhausts its compute resources, e.g. you run out of working memory (RAM) or you want it to process work faster.
- Your instance's CPU is sitting idle most of the time, in which case a smaller flavor would burn your allocation more slowly.
    - Exosphere's instance resource usage graphs are a useful guide here.
- You launched a GPU flavor, then later find that you no longer need the GPU, but want to keep using the instance.
    - Note that the reverse does not apply, because an instance launched from an image without GPU drivers will not be able to use the GPU if it is resized to a GPU flavor.)

If your software stack sometimes needs a large flavor to run a compute-intensive job, but you can develop and tune it on a smaller flavor, consider resizing _down_ to a small flavor for development work, and back _up_ when you're ready to run it at a larger scale. This get you best performance when you need it, while conserving your allocation when you don't.

Resizing is generally **not** appropriate in these situations:

- The speed of your workload is limited by a process that is single-threaded (not parallelized). If this process cannot be parallelized then resizing is unlikely to speed it up.
- The speed of your workload is limited by disk or network transfer speed. Larger instances do not have faster storage or network connectivity.
- Your instance is running out of storage. Instead, create a volume, attach it, and move your data to the volume. If you're installing a lot of software that is not easily moved to a volume, resizing _may_ be appropriate -- open a ticket and ask for advice. (TODO: does OpenStack allow users to resize to a volume-backed instance or not?)

When resizing, you must select your desired new flavor. After the resize is complete, the instance will be in status "Resize verify". At that time, log into the instance (e.g. using Web Shell) and confirm that it is working, then choose the "Confirm resize" action. If the resize process broke something and you need to return to the previous flavor, choose the "Revert resize" action.

### Image

When you create an image, you capture the entire state of your instance's root disk. New instances can be launched from that image, which means that images let you 'snapshot' and 'clone' an instance.

After you specify the image name, it will take several minutes for the image to finish creating and become active.

Consider creating an image in the following situations:
- You want to create a new instance that is a _clone_ of your existing instance. In this case, create an image of the existing instance and launch your clones from that image.
- You are about to perform a possibly destructive action on your instance (like installing, upgrading, or removing software), and you need the ability to go back and get to the prior disk state of the instance if something goes wrong.
- You are building a software stack that other people will consume (e.g. you are teaching a class). Providing an image can be an easy way for other people to get a new instance just like yours.

Be aware that system images quickly fall behind on operating system updates. As more time passes since an image was created, the more software will need to be updated when a new instance is created for it. This can lead to excessively long instance lanuch times and other problems. For this reason, custom images are not usually the best tool for sharing software or workflows more than a few months into the future. If this describes your situation, please open a support ticket and ask for advice.

### Suspend and Resume

Suspending an instance is like placing a computer on standby (a.k.a. sleep). When you resume the instance, all running programs will be in the state they were in prior to entering standby. (Still, it is wise to save any work in progress before suspending.)

Please consider suspending instead of shelving _only_ if you are running software that was complex or labor-intensive to _start_ (not install), and you only need to leave it suspended for a relatively short time (e.g. a few days). Suspended instances still occupy resources on the cloud, and they continue to consume your allocation at a reduced rate.