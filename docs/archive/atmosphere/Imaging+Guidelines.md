# Imaging Guidelines

Here are some tips to help ensure a viable importable image:

* **Operating system**: Base the image on
    * _CentOS 7_ and later
    * _Ubuntu 16.04_ and later, _Ubuntu 18.04 or 20.04_ recommended
* **File system**: _Ext4_, or _XFS_.
* **Image format**: _RAW_ or _QCOW2_ (images must be in RAW format for upload)
* **Software**: Image must contain no licensed software that would prohibit use within a cloud or virtualized environment.  It is recommended that software be installed in `/opt` or `/usr/local/`.
* **New Image Name**:
    * **DO NOT** use the name of an existing featured image. Please be mindful of re-using the name of one of your own existing images.
    * **DO NOT** use a period (``"."``) as any character of the name.
* **Description of the Image**: **DO** add an informative description of your image and make note of how it varies from any base images.
* **Instance status**: The instance **MUST** be **ACTIVE** or **STOPPED** in order to image.
    * **Suspended** or **Shelved** images cannot be imaged at this time.
* **DO NOT** delete Instances until **AFTER** the IMAGING process has completed.
* **Volumes**: All Volumes MUST be **DETACHED** from the instance.
    * Failure to detach Volumes will result in a image whose child instances **fail to boot**.
* **Owner**: At this time, only the creator of an image may update an image. Developer teams wishing to update a shared image should contact [Jetstream support](mailto:help@jetstream-cloud.org).

!!! note "BEST PRACTICE"

    * Users are recommended to upgrade the operating system before imaging.
        * For CentOS based systems: `sudo yum update`
        * For Ubuntu based systems: do `sudo apt-get update` and then `sudo apt-get upgrade`


Before submitting a request for an image of your instance, **remove** the following software from the instance:

* **Licensed software**: including software not purchased by Jetstream or otherwise not in the public domain.
* **Not cloud suitable**: Software in which the licensing, features, or activity of the software otherwise precludes its use or inhibits the activity of other software within a cloud or virtualized environment.

Volumes and iRODS FUSE mounts are **not copied** as part of the image.

!!! warning "CAUTION!"

    The following directories are deleted as part of the imaging process:

    ```
    /home/
    /mnt/
    /tmp/
    /root/
    ```

The following system files are typically overwritten by the Jetstream imaging process for security and operational reasons:

```
/etc/fstab
/etc/group
/etc/host.allow
/etc/host.conf
/etc/host.deny
/etc/hosts
/etc/ldap.conf
/etc/passwd
/etc/resolve.conf
/etc/shadow
/etc/sshd/
/etc/sysconfig/iptables
/root/
/var/log
```

!!! note "VERY IMPORTANT NOTE: CHOOSE SMALLEST SIZE"

    Users are encouraged to test launch any image created to validate that it behaves as expected before suspending or removing their current active instance.

    Creating an image on the SMALLEST possible size VM on which it will run will allow the image to be launched on VMs of the same size and larger.

    For example, an image created on a Tiny size VM can be launched on a VM of any size; an image created on a Medium VM can only be launched on a Medium or larger size VM.

!!! note "About your `/home/ directory`"

    All files, directories, and icons located under `/home/<username>/Desktop` will be deleted. To preserve them, email [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org).
    Any files installed in `/home` must be saved to your volume, to iRODS, or to another storage device or system external to your VM.

!!! note "Can an image be exported?"

    Yes...and no.  Currently an automated method for exporting images to run on other systems is not available but if you find that you do need to export an image to something other than IU Scholarworks contact [help@xsede.org](mailto:help@xsede.org).
