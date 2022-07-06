# Add SSH Keys in Horizon

## Upload SSH Key

![](/img/horizon_keypair.webp){ align=right ; width=50% }

1. You will need to upload at least 1 ssh public key **BEFORE** deploying an instance in order to access the instances you create. This assumes you already have an SSH key pair that you use. If not, you can create a key pair via this screen.

    !!! warning ""
        Jetstream recommends and only supports using RSA-based SSH keys or ed25519-based keys.

* On the left side bar, click on `Compute` →  `Key Pairs`
* Click `Import Key Pair`

    * **Key Pair Name**: `<username>`_key
    * **Public Key**: Paste the contents of your public key file here – generally in your `~/.ssh/identity_rsa.pub` file
    * Click `Import Key Pair`

</br></br></br></br></br></br></br></br>

---
