base:
  '*':
    - requirements.essential
    - ssh
  'vagrant.django-salted.org':
    - example-project.requirements
    - example-project.nginx
    - example-project.share
    - example-project.venv
    - example-project.uwsgi
    - example-project.postgresql

