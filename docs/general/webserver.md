## Introduction

* Why HTTPS is important
* What is Caddy
* What will be covered

## Create a Ubuntu 22 Virtual Machine

First of all, login to [Exosphere](https://jetstream2.exosphere.app/exosphere/home) and create a Ubuntu 22.04 Instance, at least a `small` size.
In the "Advanced Options", confirm that "Install operating system updates?" is Yes and disable Guacamole.

Wait for the instance to be online, click on it in Exosphere to find the address, which should be of the form:

    `instancename.xxx0000000.projects.jetstream-cloud.org`

where `instancename` is the name you gave to the instance and `xxx000000` is the allocation id.

Now you should be able to SSH to the instance from your local machine using:

    ssh ubuntu@instancename.xxx0000000.projects.jetstream-cloud.org

## Install the web server

Follow the instructions to install Caddy on Ubuntu, (you can copy-paste all the lines at once):

   https://caddyserver.com/docs/install#debian-ubuntu-raspbian

At this point, the web server should already be running, point your browser to:

    http://instancename.xxx0000000.projects.jetstream-cloud.org

Notice this is not `https` yet, you should see the Caddy welcome page.

## Configure a custom domain

If you have a custom domain for your website, you first need to go in the DNS configuration and create a `CNAME` record that points to `instancename.xxx0000000.projects.jetstream-cloud.org`.
If your domain is `yourdomain.com`, you can create a `CNAME` named `www` that points to `instancename.xxx0000000.projects.jetstream-cloud.org`.

Once the CNAME is setup, it could take a few hours to propagate. After a while you should be able to connect to:

    http://www.yourdomain.com

and see the Caddy welcome page.

## Enable HTTPS

Next we would like to secure the connection using the "Automatic HTTPS" capability of Caddy. We need to edit the Caddy configuration file:

    /etc/caddy/Caddyfile

and replace `:80` with your domain name, i.e. `instancename.xxx0000000.projects.jetstream-cloud.org` or `www.yourdomain.com`.

Then reload the configuration with:

   sudo systemctl reload caddy

Caddy takes care automatically of handling the certificates, now connect again with your browser and you should be redirected to the HTTPS version of the Caddy welcome page.

## Serve static files

Let's create a folder to serve files from, this can be anywhere in the filesystem, as long as it is readable by the `caddy` user:

sudo mkdir -p /var/www/html
sudo chown ubuntu:ubuntu /var/www/html

Check permissions:

```
> ls -ld /var/www/html
drwxr-xr-x 2 ubuntu ubuntu 4096 Feb 22 05:44 /var/www/html
```
This is owned by `ubuntu` so we can modify it without `sudo` and is globally readable and executable so the `caddy` user can access it.

Next let's add an `index.html` file:

    echo "<h1>Works</h1>" > /var/www/html/index.html

Reload the configuration:

    sudo systemctl reload caddy

Finally check via browser we now only see `Works` instead of the Caddy welcome page.

## Deploy a Django App

[Django](https://www.djangoproject.com/) is the most popular Python web framework, we can deploy it in production using Caddy and Gunicorn.

First of all let's use the Django version included in Ubuntu (otherwise we could create a `virtualenv` or a `conda` environment:

    sudo apt install python-is-python3 python3-django 

Next we create the base folder for this application:

    sudo mkdir /var/www/djangoapp
    sudo chown ubuntu:ubuntu /var/www/djangoapp

I have created a very simple Django Hello World app suitable for testing, but any Django app should work, notice that for a production instance, we will also want to install PostgreSQL as backend for Django, but that is not covered here.

    cd /var/www/djangoapp
    git clone https://github.com/zonca/django-hello-world mysite

This app only has a single view in the root URL that prints Hello World and a static file.

Next we should collect all the static files (mostly images and css from Django Admin) so that they can be handled by the webserver directly:
    
    cd mysite
    python manage.py collectstatic

Edit `settings.py`, set your domain in `ALLOWED_HOSTS`, and create a long random string in `SECRET_KEY`.

The most complex part of the setup is to configure GUnicorn, which is a pure Python HTTP server that can serve our Django website securely and efficiently.

    sudo apt install gunicorn

The GUnicorn setup comes from the [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-22-04#creating-systemd-socket-and-service-files-for-gunicorn), check there for more details.

In summary we create 2 files related to `systemd` so that it can manage the GUnicorn process.

`/etc/systemd/system/gunicorn.socket` contains:

```
[Unit]
Description=gunicorn socket

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target
```

While `/etc/systemd/system/gunicorn.service`:

```
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/var/www/djangoapp/mysite
ExecStart=gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          mysite.wsgi:application

[Install]
WantedBy=multi-user.target
```

Finally we enable the service and check that it works properly, see the Digital Ocean post for troubleshooting:

```
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket
sudo systemctl status gunicorn.socket
```

The last step is to configure Caddy (editing `/etc/caddy/Caddyfile`) to serve both static files and reverse-proxy GUnicorn:

```
instancename.xxx000000.projects.jetstream-cloud.org {
        root * /var/www/djangoapp/mysite/

        route {
                file_server /static/*
                reverse_proxy unix//run/gunicorn.sock
        }
}
```
