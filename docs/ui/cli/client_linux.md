# Installing OpenStack Clients on Linux

This will help you get the Openstack clients working on Linux using Python.

| Task 	| Command 	|
|---	|---	|
| Optional Virtualenv creation 	| +Though not strictly necessary, we recommend using virtualenv to increase the stability of the openstack cli tools. 	|
| Create a directory for the project (cd to your preferred directory first)+ 	| ```mkdir <project_name>``` 	|
| Change to the project directory 	| ```cd <project_name>``` 	|
| Install the VirtualEnvironment packages 	| ```sudo easy_install virtualenv``` 	|
| Start the VirtualEnvironment software  	| ```virtualenv <project_name>``` 	|
| Activate the VirtualEnvironment for the project 	| ```source <project_name>/bin/activate``` 	|
|  	|  	|
| Note: *Python3 is required*	| This should already be installed by your operating system. <br>Openstack CLI clients MUST be installed with Python3's pip/pip3!<br>check your default Python version with: python --version 	|
| Install the OpenStack clients 	| ```pip install python-openstackclient```<br><br>Additional clients that may also be useful depending on your custom needs are:<br>&nbsp;<br>```python-swiftclient, python-heatclient, python-magnumclient, python-manilaclient```<br><br>For current users, clients that you likely no longer need to install are:<br>```python-keystoneclient```, ```python-novaclient```, ```python-neutronclient```, ```python-cinderclient```, ```python-glanceclient``` 	|
| Set up your OpenStack credentials<br>[See Setting up openrc.sh for details.](openrc.md){target=_blank} 	| ```source openrc.sh``` 	|
| Test an Open Stack command 	| ```openstack flavor list``` 	|
| Following future OpenStack updates, all installed pip modules can be updated with this command: 	| ```pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U ``` 	|
|  	|  	|
