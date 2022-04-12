# Being root on your virtual machines

By default, the user that creates a virtual machine on Jetstream2 has the ability to be the privileged (root) user. This user or superuser has full ability to control all aspects of the operating system. Because of this, it's recommended that you use this privelege with extreme caution and only be the root user when you absolutely have to.

It's generally a best practice to only invoke single commands as root whenever possible. An example of this might be to look at restricted log files:

    sudo less /var/log/syslog

or installing software (on an Ubuntu system in this example):

    sudo apt-get install nginx

If you need to become the root user, there are a number of ways to do so using the su command. One generally recommended method is to use sudo on the su (superuser) command:

   sudo su -

In the above example, you are switching to the root user. The (-) switch provides you with root's environment (path and shell variables) rather than simply giving you root user power for a single command while keeping your own environment. This ensures any of your personal settings or configurations do not have any unexpected effects while becoming the root user.

If you're using a [Jetstream2 Featured Image](featured.md) you will get a prompt that now identifies you as the root user:

    root@u20-test:~#

Once you have completed the tasks you need to do as root, you should exit the root shell session by doing either ***control-d*** or typing ***exit*** at the prompt. This should return you to your normal user account.

**Keep in mind that some actions you take as root are non-recoverable. Always use caution when using sudo or su to perform tasks as root. It's a best practice to not be root unless you absolutely need to.**
{: .note}
