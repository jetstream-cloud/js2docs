# Add SSH Keys in Horizon

![](../../images/horizon_keypair.webp){ align=right ; width=50% }

1. **Upload SSH Key**

* You will need to upload at least 1 SSH public key **BEFORE** deploying an instance in order to access the instances you create.</br></br>This assumes you already have an SSH key pair that you use. If not, you can import a key pair via this screen.

    !!! warning ""
        Jetstream recommends and only supports using RSA-based SSH keys or ed25519-based keys.

* On the left side bar, click on `Compute` →  `Key Pairs`
* Click `Import Key Pair`

    * **Key Pair Name**: `<username>`_key
    * **Public Key**: Paste the contents of your public key file from your remote host here
        * On unix/linux/macOS systems, this is often found in the `~/.ssh/identity_rsa.pub` file
    * Click `Import Key Pair`

</br></br>

---
