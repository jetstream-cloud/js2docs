# Microsoft Windows on Jetstream2

!!! warning "Microsoft Windows is not officially supported on Jetstream2."
    We will be making a limited number of images available for experimental use.

    While these images will be created by one of the Jetstream2 parters in conjunction with Jetstream2 staff, it is NOT supported nor guaranteed to work. It is unlikely that the Jetstream2 staff will be able to do more than general VM troubleshooting as we do not have Windows expertise on staff. No license will be installed so you will need to bring your own license.

    It is not known at this time whether GPUs will work on Microsoft-based instances. We will test this as time permits.

## Creating an Instance

As noted above, Jetstream2 staff makes a limited number of Microsoft Windows images publically available. Instances can be spawned from these images with some considerations:

- In order to be able to access your instance later, you will need to provide a **brand-new** SSH keypair in PEM format. One can be generated with `ssh-keygen -m pem` in an OpenSSH-enabled terminal. Be sure to set a strong passphrase for now.

- Be sure that your root disk is large enough to deploy the image; Windows tends to be larger than most Unix/Linux images. The default 20 GB size of some flavors is too small. To get around this, either select a different flavor or use a [volume-backed instance](../../faq/general-faq/#i-need-a-root-disk-larger-than-the-maximum-size-for-jetstream2-instances-can-you-create-a-custom-flavor-for-me).
- Creating a Windows instance through Exosphere will cause the resulting instance to appear to be stuck in the "Building" status indefinitely, and many of the platform's creature comforts like [exouser](../../ui/exo/access-instance/#the-exouser-profile-passphrase) and resource monitoring will not function properly, if at all. 

## Retrieving the Admin Password

In order to retrieve the password for a Windows Server instance, an SSH keypair is **required** at setup. If you did not provide your instance with a keypair, you will be locked out, since recovering the Windows password without one is impossible.
{: .note}

You can find the password for your Windows instance via Horizon. Navigate to your [instance's management actions dropdown](../../ui/horizon/manage/#instance-management-actions) and select "Retrieve Password." To decrypt the password, you will need to provide your SSH keypair's private key file or contents. In order for Horizon to recognize the private key, it must have no passphrase and be in PEM format. It is, however, bad practice to leave your SSH keys unprotected, so we recommend ***temporarily*** removing the passphrase, retrieving your instance's password, then re-setting a passphrase on the key:

!!! warning "SSH Private Keys are Secret."
    Horizon processes your private key locally only, and does not transmit it across the internet. Just like a password or passphrase, your private key should **never** be shared, even with good intentions. Jetstream2 support personnel will **never** ask you for your private key.

1. Remove the passphrase on your key and ensure it is in PEM format (when prompted for a passphrase, simply hit `enter`/`return`):

    ```
    ssh-keygen -p -f <PATH_TO_PRIVATE_KEY> -m pem
    ```

2. Select your key file in Horizon or paste its contents directly into the text box, then click "Decrypt Password."
3. Take note of the resulting password.
4. Reset the passphrase on your private key to something strong:

    ```
    ssh-keygen -p -f <PATH_TO_PRIVATE_KEY>
    ```