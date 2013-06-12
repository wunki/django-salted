example:
  path: /var/www/example_project
  virtualenv: /var/www/venv/example
  django_settings: demo_project.settings
  py_reload: True
  wheel_root: /var/www/wheel
  wheel_zip: example-requirements.tar.gz
  wheel_md5: 932669db31cc05684786e4a8bf771a3c
  wheel_source: https://s3.amazonaws.com/gibbon-deployment/example-requirements.tar.gz
  postgres_db: example_db
  postgres_user: example_user
  postgres_password: example_password
  postgres_createdb: True
  uwsgi_user: vagrant
  uwsgi_group: vagrant
  uwsgi_processes: 3