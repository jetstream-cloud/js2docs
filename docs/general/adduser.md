# Adding Users to your VM

These steps will let the user that you create ssh to a running instance using a password you set.  The user can reset the password once they login and/or add their ssh keys.

### Step-by-step guide

All steps to be run as root or using sudo. <USERNAME> should be replaced with an actual username

* Sudo or otherwise become root: sudo su -
* Create the user: adduser <username>
* Assign a temporary password: passwd <username>

As an optional step, you can add the user to any other groups as needed. We'll use the *docker* group as an example.

* Add the user to group "docker" : usermod -a -G docker <username>
