include:
  - uwsgi

example-uwsgi:
  file.managed:
    - name: /etc/uwsgi/apps-available/example.ini
    - source: salt://example-project/uwsgi.ini
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 755
    - require:
      - pip: uwsgi

enable-uwsgi-app:
  file.symlink:
    - name: /etc/uwsgi/apps-enabled/example.ini
    - target: /etc/uwsgi/apps-available/example.ini
    - force: false
    - require:
      - file: example-uwsgi
      - file: /etc/uwsgi/apps-enabled