# Django Salted

This is a complete [SaltStack] configuration for a Django centric stack. It
enables you setup a solid Django development environment within minutes. Some
of the great things which are included:

- Local development, but the code is run within Ubuntu with the help of a
  share.
- Server running on uWSGI and Nginx. uWSGI reloads your python code
  automagically.
- Django requirements are installed with Wheel. No more compilation needed per
  box and dependency on PyPi.
- Great Fabric helper functions.

The repository is accomponied with a blog post we put on [Gibbon]. Go read
[Salting your Django Stack] if you want to know how this came to be.

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

[SaltStack]: http://saltstack.com/community.html
[Gibbon]: http://blog.gibbon.co
[Salting your Django Stack]: http://blog.gibbon.co
