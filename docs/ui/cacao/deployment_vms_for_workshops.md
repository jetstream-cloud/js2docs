# Deploying Multiple VMs for workshops

From the deployment screen, select **launch instances for a workshop**

![vm4w 0](images/deployments/2_depl/2_5_vm4w.png)

After selecting your region, the next step is to set parameters: give a descriptive name, select the deployment image and size, number of learners and instructors, and spare VMs (optional).

![vm4w 2](images/deployments/3_5_vm4w/3_5_2_depl_param.png)

The next step is to set the usernames. This can be done manually through the left hand writable field (add with commas and spaces) or by uploading a CSV file. Clicking **ADD** (or **UPLOAD** if using a CSV) will show the added usernames on the right hand field. The "Added Usernames" field can be used to remove unwanted usernames.

![vm4w 3](images/deployments/3_5_vm4w/3_5_3_names.png)

![vm4w 3_1](images/deployments/3_5_vm4w/3_5_3_1_names_added.png)

After adding usernames, instructors are able to add their SSH key. You can only use ssh keys that have already been added to the Credentials -- read how to [here](https://docs.jetstream-cloud.org/ui/cacao/credentials/#adding-an-ssh-public-key), or how to create an ssh key [here](https://www.ssh.com/academy/ssh/keygen).

![vm4w 4](images/deployments/3_5_vm4w/3_5_4_ssh.png)

You can set a shared storage space as well. This shared storage will be visible and accessible through all the VMs that have been deployed through this method. Lastly, review your deployment and click submit to launch.

![vm4w 5](images/deployments/3_5_vm4w/3_5_5_summary.png)

The launched screen looks like the following screenshot:

![vm4w 6](images/deployments/3_5_vm4w/3_5_6_launched.png)

Upon launch, the instructor will receive a list of passwords and IP addresses that the users can use in order to connect via `ssh` from their own computers.
