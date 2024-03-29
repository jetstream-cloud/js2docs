# Exosphere Troubleshooting

## How to Break and Fix Your Instance

In order to provide you with easy remote connectivity, Exosphere configures certain things when setting up a new instance.
If you modify these configurations, you may break various functionality in Exosphere.

* **PASSPHRASE**: If you change the passphrase for the `exouser` local user, you will break Web Shell and Web Desktop.
Also, the passphrase shown on the instance details page will cease to work for SSH connections or the console.
    * Fix this by changing the `exouser` passphrase back to what is displayed on the instance details page. [\[more details\]](#ExospherePassphrase)

* **FIREWALLS**: If you modify your instance's firewall (iptables, ufw, or firewalld) or OpenStack security group(s), you may break Web Shell, Web Desktop, and SSH connectivity.
    * Fix this by allowing TCP ports 22 (for SSH) and 49528 (for Guacamole-based shell and desktop) through your firewall(s).

* **CONTAINERS**: If you stop or modify the Docker containers named `exo-guac-guacamole` or `exo-guac-guacd`, you will break Web Shell and Web Desktop.
    * Fix this by connecting via native SSH, then running `cd /opt/guacamole` and `sudo docker-compose up` inside the SSH session.

* **GUACAMOLE**: If you modify files or file permissions in `/opt/guacamole/`, you may break Web Shell and Web Desktop the next time your instance restarts.
    * Fix this by connecting with native SSH, reverting your changes, and then running `cd /opt/guacamole` and `sudo docker-compose up`.

* **VNC**: If you modify the TigerVNC package, its configuration in `/home/exouser/.vnc`, or the `vncserver@1` systemd service, you may break Web Desktop.
    * Fix this by connecting via Web Shell or SSH, reverting your changes, and running `sudo systemctl restart vncserver@1`.

* **SSH**: If you modify the SSH server configuration in `/etc/sshd_config`, you may break Web Shell and native SSH connectivity.
 You may also break the file upload/download tool inside of Web Shell and Web Desktop.
    * Fix this by reverting your changes (if you can) and running `sudo systemctl restart ssh`.

* **FSTAB**: If you modify `/etc/fstab`, you may break automatic mounting of volumes and/or the Jetstream2 Software Catalog.
    * Fix this by reverting your changes.

* **LIVEUPDATES**: If you modify `/opt/system_load_json.py` or the root user's crontab entry that runs it, you will break the live-updating instance resource usage graphs in the Exosphere UI.
    * Fix this by reverting your changes.

!!! warning "If all else fails"

       **If you cannot un-break your instance using the steps above, it is often best to create a new instance** and use that instead.
    There are an infinite number of creative ways to break an instance.
    It may not be fast or straightforward for Jetstream2 support staff to recover a broken instance.

    Fortunately, it is fast and easy to make another.
    This highlights the importance of backing up any data or configurations that are important to your work.
    If you can't afford to lose something, keep a copy somewhere else.

---

## Other Troubleshooting

### I changed the exouser passphrase on my instance and now the web shell and web desktop in Exosphere don't work. <a name="ExospherePassphrase"></a>

The way Jetstream2 is currently architected, all users on an allocation have access to all resources on the allocation. By default, Exosphere hides some resources created by other users, but this is only a convenience and it cannot assure separation of access.

It is possible to make it less straightforward for another user on the same allocation to access your running instance. You can do this by changing the passphrase for the default exouser account. Changing the passphrase does not prevent any access, but makes it more difficult.

Currently, changing the exouser account passphrase will break Web Shell, Web Desktop, and some other Exosphere-powered instance interactions. This may change in the future.
{: .warning}

We HIGHLY suggest utilizing ssh keys for your instances to ensure you have access. That's covered here:

[https://docs.jetstream-cloud.org/ui/exo/create_instance/](https://docs.jetstream-cloud.org/ui/exo/create_instance/)

under the advanced options. You can also manually add your key to an already running instance.

We generally recommend using only ssh keys for external access and not changing the exouser passphrase.

### I can't copy and paste to/from the Web Shell or Web Desktop (Guacamole)

Copying and pasting to and from Guacamole interfaces (i.e. the web shell or web desktop) can be a tricky endeavor. If you are a Firefox user, this article presents a fix: [https://sudoedit.com/firefox-async-clipboard/](https://sudoedit.com/firefox-async-clipboard/){target=_blank}

Otherwise, you can generally paste text *into* Guacamole by following these steps:

1. Copy the text into the clipboard on your workstation
2. Right-click in the Guacamole window (might be middle-click on some systems)

To copy *out* of Guacamole, simply highlight the text, and it will be placed into your clipboard.

If all else fails, try accessing the clipboard information in the `Ctrl`+`Alt`+`Shift` menu.
