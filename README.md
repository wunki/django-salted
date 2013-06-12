# Django Salted

This is a complete [SaltStack] configuration for a Django centric stack. It
enables you setup a solid Django development environment within minutes. Some
of the great things which are included:

- Local development, but the code is run within Ubuntu with the help of a
  share.
- Server running on uWSGI and Nginx. uWSGI reloads your python code
  automagically.
- Django requirements are installed with Wheel. Faster installation because no
  more need for compilation per box. Also removes the dependency on PyPi.
- Some helpfull Fabric functions.

The repository is accomponied with a blog post we put on [Gibbon]. Go read
[Salting your Django Stack] if you want to know how this came to be.

## Requirements

Django salted requires the following software to be installed on your machine:

- [Virtualbox]
- [Vagrant]
- [Salty Vagrant]

All of the above are open-source and free to use.


## Getting started (quick)

If you want to quickly try out what this is all about. Your installation will
adhere to the default configuration. I would suggest to run with the defaults
to get a feeling how this all works. After getting familiar with it, using
Django Salted on your own project is simple done with changing a few
settings.

The default configuration runs with the following settings:

- You will run and develop on the Django (1.5.1) `demo_project` inside the VM.
- Ubuntu 12.04 will be used as OS.
- Domain is: vagrant.django-salted.org

Make sure you have all the requirements installed. If so, you only need to run
a single command in the root directory to get the example project running:

    vagrant up

After running this command, you should see the Django example website on:
[http://localhost:8080/](http://localhost:8080)

[SaltStack]: http://saltstack.com/community.html
[Gibbon]: http://blog.gibbon.co
[Salting your Django Stack]: http://blog.gibbon.co
[Virtualbox]: https://www.virtualbox.org/
[Vagrant]: http://www.vagrantup.com/
[Salty Vagrant]: https://github.com/saltstack/salty-vagrant
