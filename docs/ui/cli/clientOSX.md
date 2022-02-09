# Installing Clients on MacOS

This will help you get the Openstack clients working on Mac OS X 10.11.x and higher. It may work on recent older versions of Mac OS X but it has not been tested.

*At this time, Python 3 is still not shipping on OS X. The latest Openstack clients require it.*

***Follow the instructions below at your own risk.***

If you haven’t installed Homebrew on your system yet (this might take a few minutes):

> */usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"*

Using brew we’re going to install Python 3:

> *brew install python*

Now Python 3 is installed we can finally install the OpenStack command line tools:

> *sudo pip3 install python-openstackclient*

Though not strictly necessary, we recommend using virtualenv to increase the stability of the openstack cli tools.
{: .note}

| Task  | Command   |
|---    |---    |
|Create a directory for the project (cd to your preferred directory first)  | ```mkdir <project_name>```|
|Change to the project directory    | ```cd <project_name>``` |
|Install the VirtualEnvironment packages    | ```sudo easy_install virtualenv```|
|Start the VirtualEnvironment software  | ```virtualenv <project_name>``` |
|Activate the VirtualEnvironment for the project    | ```source <project_name>/bin/activate``` |
| Install the OpenStack clients 	| ```pip install python-openstackclient```<br><br>Please note: Openstack client now requires Python 3<br><br>```pip3 install python-openstackclient```<br><br>Additional clients that may also be useful depending on your custom needs are:<br><br>```python-swiftclient```, ```python-heatclient```, ```python-magnumclient```<br><br>For current users, clients that you likely no longer need to install are:<br>```python-keystoneclient```, ```python-novaclient```, ```python-neutronclient```, ```python-cinderclient```, ```python-glanceclient``` 	|
| Set up your OpenStack credentials<br>[See Setting up openrc.sh for details.](openrc.md){target=_blank} 	| ```source openrc.sh``` 	|
| Test an Open Stack command 	| ```openstack flavor list``` 	|
| If you get python errors try these commands: 	| ```pip uninstall six```<br>```pip install six``` 	|
| Following future OpenStack updates, all installed pip modules <br>can be updated with this command: 	| ```pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U ``` 	|
