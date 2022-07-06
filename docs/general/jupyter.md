# Jupyter on Jetstream2

### Jupyter in the web desktop

The easiest way to use a Jupyter notebook on Jetstream2 is to launch an instance using [Exosphere](../ui/exo/exo.md), making sure to [launch with the web desktop enabled](https://docs.jetstream-cloud.org/ui/exo/create_instance/#configure-instance).

Then you can open a web desktop session in Exosphere, open a terminal, and type the commands

    module load anaconda
    jupyter notebook

This should load the Anaconda package and then initialize a new jupyter notebook and open the default browser with the notebook.

### Jupyter from the web shell or ssh session

We have made a front end script for jupyter that fetches your virtual machine's IP address and substitutes it into the URL that Jupyter generates for you. Since the VM doesn't really ever know it's public IP address, it cannot be set directly in Jupyter.

To start Jupyter from the web shell or ssh session for remote access, type the commands

    module load Anaconda
    jupyter-ip.sh

This should yield some output that ends with something similar to this

    To access the notebook, open this file in a browser:
        file:///home/exouser/.local/share/jupyter/runtime/nbserver-100997-open.html
    Or copy and paste one of these URLs:
        http://neatly-trusting-chow-gui:8888/?token=723fa5a01f6dc27b0ec655846572513757e921aaf247cbb7
    or http://149.165.154.8:8888/?token=723fa5a01f6dc27b0ec655846572513757e921aaf247cbb7

where the last line with the 149.165.xxx.xxx IP address will be the one you want to cut and paste into your browser.
