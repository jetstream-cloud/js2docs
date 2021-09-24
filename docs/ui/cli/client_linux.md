# Installing OpenStack Clients on Mac OSX

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
| DEPRECATED – This step is only necessary for Openstack clients < v4.0. The current production version is 4.x which uses Python 3.<br>Make sure you have Python 2 installed 	| → This should already be installed by your operating system. Openstack CLI clients MUST be installed with Python2's pip!<br>check your default Python version with: python --version 	|
| Install the OpenStack clients 	| For modern clients:<br>```pip3 install python-openstackclient```<br><br>For Openstack clients < v4.0:<br>```pip install python-openstackclient```<br><br>Additional clients that may also be useful depending on your custom needs are:<br>```python-swiftclient, python-heatclient, python-magnumclient, python-manilaclient```<br><br>For current users, clients that you likely no longer need to install are:<br>```python-keystoneclient```, ```python-novaclient```, ```python-neutronclient```, ```python-cinderclient```, ```python-glanceclient``` 	|
| Set up your OpenStack credentials<br>See Setting up openrc.sh for details. 	| ```source .openrc``` 	|
| Test an Open Stack command 	| ```openstack flavor list``` 	|
| Following future OpenStack updates, all installed pip modules can be updated with this command: 	| ```pip freeze --local \| grep -v '^-e' \| cut -d = -f 1 \| xargs -n1 pip install -U``` 	|
|  	|  	|
