# Managing SSH keys from the CLI

Secure shell (SSH) keys are crucial to securely accessing your virtual machines. Jetstream2 only supports ssh key access to CLI and Horizon virtual machines.

You can only add a key pair to an instance at the time of its creation, not afterwards, so it is important not to overlook this step. You'll want to have a key pair created before hand and uploaded to the Jetstream2 cloud.

While several formats are supported, we recommend using RSA or ED25519 format keys.

### Uploading an existing key

If you have an existing SSH key, you can upload it to the Jetstream2 cloud *(note: key filenames may vary - this example assumes id_rsa.pub)*:

    cd ~/.ssh

Source your openrc if you haven't already! Refer to [creating an openrc](openrc.md){target=_blank} if you still need to create an openrc file for Jetstream2. We're assuming it is *openrc.sh* for this example.

    source openrc.sh

    openstack keypair create --public-key id_rsa.pub my-api-key

Make sure to ONLY upload the public key! You can change the *my-api-key* to something more descriptive.

### Create a new key and upload it

If you don't have an SSH key, you'll want to create a new key and upload it.

If you don't have the .ssh dir, you can create it:

    mkdir .ssh ; chmod 700 .ssh

Then you can create your key

    ssh-keygen -b 2048 -t rsa -C "Identifying comment for this ssh key" -f ~/.ssh/id_rsa

    or

    ssh-keygen -o -a 100 -t ed25519 -C "Identifying comment for this ssh key" -f ~/.ssh/id_ed25519

The first will create a 2048 bit RSA cryptography key with the comment you specify and the filename id_rsa (which is the default). The second will create an Ed25519 elliptical cryptography key. The comment is optional but we do recommend it to keep track of keys. *You only need to do one of these, though you can create both.*

You may also leave off the -f file option and ssh-keygen will prompt you for the filename.

Source your openrc if you haven't already! Refer to [creating an openrc](openrc.md){target=_blank} if you still need to create an openrc file for Jetstream2. We're assuming it is *openrc.sh* for this example and assuming *id_rsa.pub* is your public key's filename.

    source openrc.sh

    openstack keypair create --public-key id_rsa.pub my-api-key

    or

    openstack keypair create --public-key id_ed25519.pub my-api-key

Make sure to ONLY upload the public key! You should change the *my-api-key* to something more descriptive.
