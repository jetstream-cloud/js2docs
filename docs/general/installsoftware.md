# Installing Software on your VM

On Jetstream2 virtual machines, you have the ability to install whatever software you need. There are a number of different ways to do this. We will address some of the most common ones.

For software available from the distribution (e.g. Ubuntu, Rocky, Alma, CentOS) you can either search via the web or from the command line. Below are some examples. Please keep in mind that there are other methods not covered here like Anaconda/Conda/MiniConda. Covering all possibilities can be difficult.

To install software packages from the Linux distribution or to install Python packages systemwide, you'll need to have priveleged access. Please refer to [Being root on your virtual machines](sudo.md) if you are not familiar with sudo or su.

---

### Using Ubuntu

Check to see if a packages is installed:

    apt list some_package_name

Search for a package if it's not installed:

    apt search some_package_name

Install the package:

    apt install some_package_name

### Using Rocky8 or AlmaLinux

Check to see if a packages is installed:

    dnf list packagename

Search for a package if it's not installed:

    dnf search some_package_name

Install the package:

    dnf install some_package_name

### Using CentOS 7

Check to see if a packages is installed:

    yum list packagename

Search for a package if it's not installed:

    yum search some_package_name

Install the package:

    yum install some_package_name

### Using pip or pip3

Depending on your python installation, your pip may be called pip3 to denote Python3. You can do

   pip --version

to see what version of Python it's tied to. Please note that Python 2.x is deprecated and should not be used.

To install something for your user only

    pip install module_name

To install something for the entire VM

   sudo pip install module_name
