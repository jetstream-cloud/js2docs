# Installing Openstack Clients

* [Mac specific steps](#mac-specific-steps)
* [Windows specific steps](#windows-specific-steps)
* [Common/Linux specific steps](#commonlinux-steps)

### Mac specific steps

This will help you get the Openstack clients working on Mac OS X 10.11.x and higher. It may work on recent older versions of Mac OS X but it has not been tested.

*At this time, Python 3 is still not shipping on OS X. The latest Openstack clients require it.*

***Follow the instructions below at your own risk.***

Task 	| Command 	|
|---	|---	|
| If you haven’t installed Homebrew on your system yet (this might take a few minutes):  | ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```  |
| Using brew we’re going to install Python 3: | ```brew install python```|
| Now Python 3 is installed we can install the OpenStack command line tools: | ```sudo pip3 install python-openstackclient``` |

### Windows specific steps

We recommend that Windows users install Windows Subsystem for Linux and install Ubuntu within it. Microsoft has a learning module for this. The page [Enable Windows Subsystem for Linux and install a distribution](https://docs.microsoft.com/en-us/learn/modules/get-started-with-windows-subsystem-for-linux/2-enable-and-install){target=_blank} can walk you through that.

Once installed, you can verify python3 is installed by doing:

> *which python3*

If you get an error, you may need to install Python3 by doing:

> *sudo apt install python3 python3-pip*

Then you should be able to proceed to the Linux/common steps below

### Common/Linux steps

| Task 	| Command 	|
|---	|---	|
| Note: *Python3 is required*	| This should already be installed by your operating system. <br>Openstack CLI clients MUST be installed with Python3's pip/pip3! |
| Install the OpenStack clients 	| ```pip install python-openstackclient```<br><br>Additional clients that may also be useful depending on your custom needs are:<br>&nbsp;<br>```python-swiftclient, python-heatclient, python-magnumclient, python-manilaclient```<br><br>For current users, clients that you likely no longer need to install are:<br>```python-keystoneclient```, ```python-novaclient```, ```python-neutronclient```, ```python-cinderclient```, ```python-glanceclient``` 	|
| Set up your OpenStack credentials<br> [See Setting up openrc.sh for details.](openrc.md){target=_blank} 	| ```source openrc.sh``` 	|
| Test an Open Stack command 	| ```openstack flavor list``` 	|
| Following future OpenStack updates, all installed pip modules can be updated with this command: 	| ```pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U ``` 	|
|  	|  	|

### Optional steps

Though not strictly necessary, we recommend using virtualenv to increase the stability of the openstack cli tools.
{: .note}

| Task 	| Command 	|
|---	|---	|
| Optional Virtual environment creation 	| **Though not strictly necessary, we recommend using venv to increase the stability of the openstack cli tools.** 	|
| Create a directory for the project (cd to your preferred directory first) 	| ```mkdir <project_name>``` 	|
| Change to the project directory 	| ```cd <project_name>``` 	|
| Install the venv packages 	| ```sudo python3 -m pip install --user virtualenv``` 	|
| Start the VirtualEnvironment software  	| ```python3 -m venv env <project_name>``` 	|
| Activate the VirtualEnvironment for the project 	| ```source <project_name>/bin/activate``` 	|
