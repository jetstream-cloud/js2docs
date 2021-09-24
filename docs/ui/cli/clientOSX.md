# Installing Clients on MacOS

This will help you get the Openstack clients working on Mac OS X 10.11.x. It may work on recent older versions of Mac OS X but it has not been tested. 

***Follow the instructions below at your own risk.***

| Task 	| Command 	|
|---	|---	|
| If it’s not already installed, install Xcode from the App Store. 	|  	|
| Add these lines to .bash_profile 	|*# Set architecture flags*<br> <br>```export ARCHFLAGS="-arch x86_64"```<br><br> *# Ensure user-installed binaries take precedence*<br><br>```export PATH=/usr/local/bin:$PATH``` 	|
| Run this command 	| ```source .bash_profile``` 	|
| Verify that the Xcode required tools are installed and functional<br>(This command may require root access to run.) 	| ```xcode-select --install``` 	|
| Set the permissions that Brew expects 	| ```sudo chflags norestricted /usr/local && sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local``` 	|
| Install Brew if not already installed 	| ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"``` 	|
| If Brew is installed, update as needed. 	| ```brew update``` 	|
| If prompted to agree to the Xcode license run: 	| ```xcodebuild -license``` 	|
| Check the Brew install with this command.<br> If errors found doctor will provide instructions to fix them. 	| ```brew doctor``` 	|
| Verify that Brew is up to date 	| ```brew update``` 	|
| Install python 	| ```brew install python``` 	|
| Fix the links 	| ```brew linkapps python``` 	|



Though not strictly necessary, we recommend using virtualenv to increase the stability of the openstack cli tools.
{: .note}


| Task  | Command   |
|---    |---    |
|Create a directory for the project (cd to your preferred directory first)  | ```mkdir <project_name>```|
|Change to the project directory    | ```cd <project_name>``` | 
|Install the VirtualEnvironment packages    | ```sudo easy_install virtualenv```|
|Start the VirtualEnvironment software  | ```virtualenv <project_name>``` | 
|Activate the VirtualEnvironment for the project    | ```source <project_name>/bin/activate``` |
| Install the OpenStack clients 	| ```pip install python-openstackclient```<br><br>Please note: Openstack client >= 4.0 require Python 3, so the command will be:<br><br>```pip3 install python-openstackclient```<br><br>for the newer versions.<br>Additional clients that may also be useful depending on your custom needs are:<br><br>```python-swiftclient```, ```python-heatclient```, ```python-senlinclient```<br>For current users, clients that you likely no longer need to install are:<br>```python-keystoneclient```, ```python-novaclient```, ```python-neutronclient```, ```python-cinderclient```, ```python-glanceclient``` 	|
| Set up your OpenStack credentials<br>See Setting up openrc.sh for details. 	| ```source .openrc``` 	|
| Test an Open Stack command 	| ```openstack flavor list``` 	|
| If you get python errors try these commands: 	| ```pip uninstall six```<br>```pip install six``` 	|
| Following future OpenStack updates, all installed pip modules <br>can be updated with this command: 	| ```pip freeze --local \| grep -v '^-e' \| cut -d = -f 1 \| xargs -n1 pip install -U``` 	|
