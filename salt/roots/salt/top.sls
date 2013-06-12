base:
  '*':
    - requirements.essential
    - ssh
  'vagrant.django-salted.org':
    - example-project.requirements
    - example-project.ssh
    - example-project.postgresql
    - example-project.local
    - example-project.rabbitmq
    - example-project.venv
    - example-project.uwsgi
    - example-project.nginx
