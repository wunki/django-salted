# Django Salted

**One-command Django and PostgreSQL development environment on Vagrant.**

![Shake it, shake it, shake it like a salt shaker...](https://raw.github.com/wunki/django-salted/master/files/salt-shaker.png "Shake it!")

This is a complete [SaltStack] configuration for a Django centric stack. It
enables you setup a solid Django development environment with a single
command. Some of the great things which are included:

- *Local development*, but the code is run within Ubuntu with the help of a
  share.
- Server running on *[uWSGI]* and *[Nginx]*. uWSGI *reloads* your python code
  automagically.
- *[PostgreSQL]* is installed and setup for you. No more explaining to your
  designer how to get the project running.
- Some helpfull *[Fabric]* functions, e.g., running `syncdb` on Vagrant.

**Table of Contents**

- [Django Salted](#django-salted)
	- [Requirements](#requirements)
	- [Getting started (quick)](#getting-started-quick)
	- [Modify for your own project](#modify-for-your-own-project)
	- [FAQ](#faq)
		- [How do I get the get the latest state/version?](#how-do-i-get-the-get-the-latest-stateversion)
		- [Which Operating Systems are supported?](#which-operating-systems-are-supported)
		- [I'm getting "502 Bad Gateway" from Nginx](#i'm-getting-502-bad-gateway-from-nginx)
		- [OMG, you also put the private key on Github?](#omg-you-also-put-the-private-key-on-github)
	- [Want to help?](#want-to-help)
	- [License](#license)

**The repository is accomponied with a blog post we put on [Gibbon]. Go read
[Salting your Django Stack] if you want to know how this came to be.**

## Requirements

Django salted requires the following software to be installed on your machine:

- [Virtualbox]
- [Vagrant]
- [Salty Vagrant]

You also need [Fabric] and [Fabtools] if you want to run the Fabric
commands. You can find these requirements in the [requirements.txt] file in
the root directory.

All of the above are open-source and free to use.

## Getting started (quick)

If you want to quickly try out what this is all about. Your installation will
adhere to the default configuration and use the example Django project. If you
have the requirements installed, it's just a single command:

    vagrant up

After running this command, you should see the Django example website on:
[http://127.0.0.1:8080/](http://127.0.0.1:8080). However, your database tables
still need to be created. There is a fabric command to help you with that:

    fab vagrant syncdb

You will also need to collect the static files to use the demo project. This can be done with fabric also:

    fab vagrant collectstatic

The demo_project is a very simple project with the Djagno Admin [http://127.0.0.1:8080/admin](http://127.0.0.1:8080/admin)

The vagrant machine uses a virtual venvironment located at `/home/vagrant/env`

After getting familiar with it, using Django Salted on your own project is
simple done with changing a few settings.

- You will run and develop on the Django (1.5.1) `demo_project` inside the VM.
- Ubuntu 12.04 will be used as OS.
- Domain is: vagrant.django-salted.org

## Modify for your own project

TODO: Write how to modify this repository for your own project.

## FAQ

### How do I get the get the latest state/version?

The fastest way is to run `vagrant provision`. The downfall is that you don't
see what's happening in colors. Or SSH to the box (my favourite) by doing the
following:

    vagrant ssh
    # On the box...
    sudo salt-call state.highstate

### Which Operating Systems are supported?

Currently I have only tested it on Ubuntu 12.04 box. In the future there will
be support for Debian and FreeBSD.

### I'm getting "502 Bad Gateway" from Nginx

Ajj! This means uWSGI is down. It takes 15 seconds for uWSGI to spin up from a
cold boot (because we have to wait on the Vagrant share). However, if after 15
seconds it's still not working, check out what went wrong by looking at the logs:

    vagrant ssh
    sudo cat /var/log/uwsgi/example.log
    # or check the boss (emperor)
    sudo cat /var/log/uwsgi/emperor.log

Let me know in an issue if this is something I need to fix.

### OMG, you also put the private key on Github?

Yes, this private key is used for the Vagrant example project. It's supposed
to be there so you can spin up a box with a single command. Don't put your own
private keys there.

## Want to help?

That would be great! Check out the [TODO.org] or the [Issues] on things to do.

## License

Django-salted was created by Petar Radosevic. You can reach out to me on
twitter at [@wunki].

It's BSD Licensed. Use it however you want, just don't try to sell it back to
me.

[SaltStack]: http://saltstack.com/community.html
[Gibbon]: http://blog.gibbon.co
[PostgreSQL]: http://www.postgresql.org/
[Salting your Django Stack]: http://blog.gibbon.co/posts/2013-06-12-salting-your-django-stack.html
[Virtualbox]: https://www.virtualbox.org/
[Vagrant]: http://www.vagrantup.com/
[Salty Vagrant]: https://github.com/saltstack/salty-vagrant
[uWSGI]: http://uwsgi-docs.readthedocs.org/
[Nginx]: http://nginx.org/
[Fabric]: http://fabfile.org/
[Fabtools]: https://github.com/ronnix/fabtools
[requirements.txt]: https://github.com/wunki/django-salted/blob/master/requirements.txt
[Vagrantfile]: https://github.com/wunki/django-salted/blob/master/Vagrantfile
[TODO.org]: https://github.com/wunki/django-salted/blob/master/TODO.org
[Issues]: https://github.com/wunki/django-salted/issues
[@wunki]: https://twitter.com/wunki
