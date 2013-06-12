example:
  path: /var/www/example_project
  virtualenv: /var/www/venv/example
  django_settings: demo_project.settings
  py_reload: True
  wheel_root: /var/www/wheel
  wheel_zip: example-requirements.tar.gz
  wheel_md5: 935712c098e7cb93e80fb8278dcdb4b6
  wheel_source: https://s3.amazonaws.com/gibbon-deployment/example-requirements.tar.gz
  uwsgi_user: vagrant
  uwsgi_group: vagrant
  uwsgi_processes: 3