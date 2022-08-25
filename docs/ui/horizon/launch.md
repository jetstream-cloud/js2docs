# Launching an instance

![](/images/horizon_instance_launch.webp){ align=right ; width=50% }

1. **Open `Launch instance` menu**

* With the `network`, `security group`, and `ssh keys` setup, you should be ready to launch an instance.
* On the left side bar, click on `Project` → `Compute` →  `Instances`
* Click `Launch Instance`
* Give your instance a descriptive name. You can take the defaults for the rest of the items.
* Click `Next`.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_source.webp){ align=right ; width=50% }

2. **Instance Source**

* On the `Source` screen, make sure the `Select Boot Source` option is `Image`

    !!! warning ""

        Please note that it may take several seconds for all the image options to appear and to fully populate that list as horizon pulls the entire image catalog listing over again each time!

* Type `Featured` in the `Available` box to find the Jetstream Featured images. You can also boot any of `community` or `public` visibility images shown in the list if you'd rather do that, but Jetstream staff have only tested or will support the featured images.
* Find the image you want to use and click the arrow to the right of its name. You'll see it show up under `Allocated` towards the top of the dialog box.
* Click `Next`.</br></br></br></br>

    !!! note "Image Visbility"

        If you are deploying a non-public image that has been shared to your project from another project, you will need to choose the correct VISIBILITY filter option in the dropdown menu as the list defaults to only public or your own private images.

</br></br></br></br>

---
![](/images/horizon_launch_volume_backed.png){ align=right ; width=50% }

### ALTERNATIVE: Volume-backed Instance

* Some users may find the pre-defined default ephemeral-storage-based root disks do not provide sufficient flexibility.
* For these cases, users may create a custom-sized volume from which to boot.
    * **ADVANTAGES**: volume-backed instances allow users to create any size root disk for an instance that they need (limited only by _ext4_ or _xfs_ filesystem limits). Additionally, actions such as shelving and unshelving happen VERY quickly relative to fixed ephemeral root disks.
    * **DISADVANTAGES**: --> ***Volume-backed instances count against the project's storage quota.*** <--
* As above:
    * On the `Source` screen, make sure the `Select Boot Source` option is `Image`
    * Type `Featured` in the `Available` box to find the Jetstream Featured images.
    * Find the image you want to use and click the arrow to the right of its name. You'll see it show up under `Allocated` towards the top of the dialog box.
* **NEW**: Change `Create New Volume` to **Yes**
    * The setting for `Delete Volume on Instance Delete` can be set to **Yes** or **No**. We recommend **Yes**.

* Click `Next`.

</br></br></br>

---

![](/images/horizon_instance_flavor.webp){ align=right ; width=50% }

3. **Flavor**

* On the `Flavor` screen, select the size VM you want to use and click the arrow to the right of its description.</br>Like the previous screen, you'll see it move up into the `Allocated` area towards the top of the box.
* Click `Next`.

    !!! note "Flavor Compatibility"

        Please choose a `flavor` compatible with the selected image size and resource requirements.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_network.webp){ align=right ; width=50% }

4. **Networks**

* On the `Networks` screen, find the network you created earlier and click the arrow to the right of its description. Like the previous screen, you'll see it move up into the `Allocated` area towards the top of the box.
* Click `Next`.
* Click `Next` again to skip the `Network Ports` screen and proceed to `Security Groups`

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_secgrp.webp){ align=right ; width=50% }

5. **Security Groups**

* On the `Security Groups` screen, select the one or more of the security groups you created earlier and click the arrow to the right of its description. Like the previous screen, you'll see it move up into the `Allocated` area towards the top of the box.
* Click `Next`.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_keypair.webp){ align=right ; width=50% }

6. **Keypair**

* On the `Key Pair` screen, if the key pair you created earlier is NOT in the `Allocated` section, click the arrow to the right of its description. Like the previous screen, you'll see it move up into the `Allocated` area towards the top of the box.
* At this point you can click `Launch Instance` to deploy your instance.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_float_IP.webp){ align=right ; width=50% }

7. **Associate Floating IP**

* Your instance should now show up in your instances list.
* Once it has entered the running state, click the `Action` dropdown at the far right and select `Associate Floating IP`

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_select_IP.webp){ align=right ; width=50% }

8. **Assign IP**

* If you have previously allocated an IP address, you'll see it in the IP Address list.
* If you do not, click the `+` sign to allocate a new IP address from the `Public` pool

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_pool_IP.webp){ align=right ; width=50% }

9. **Assign Pool**

* Make sure `Public` is selected under `Pool`
* Click `Allocate IP`

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_instance_assoc_IP.webp){ align=right ; width=50% }

10. **Choose IP**

* Note your new IP address and make sure it's the one you want to associate with the instance
* Note that the correct instance is selected under `Port to be associated`
* If all is well, click `Associate`

</br></br></br></br>

---

![](/images/horizon_instance_test_IP.webp){ align=right ; width=50% }

11. **Test the connection**

* Please note that sometimes it takes a few seconds for the association to become active, depending on system load.
* Though this is normally quick, you can try pinging your new host from a remote machine: `ping -c 5 ip_address`

</br></br>

---

![](/images/horizon_instance_ssh_IP.webp){ align=right ; width=50% }

12. **Try to `ssh` to your instance**

* If you chose a CentOS-based instance, your default user is `centos`
* If you chose an Ubuntu-based instance, your default user is `ubuntu`
* Access your new host with `ssh` from a remote machine
    * Example from a terminal-based ssh-client as on Linux or a Mac:</br>
    `ssh centos@your_ip_number` or </br>
    `ssh ubuntu@your_ip_number`
* Note that the first time you connect you'll get a request to verify that you're getting a new host key and making sure you want to connect

</br></br>

---
