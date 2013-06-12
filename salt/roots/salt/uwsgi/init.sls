uwsgi-packages:
  pkg.installed:
    - names:
      - python-dev
      - python-pip

uwsgi:
  pip.installed:
    - pkgs:
        uwsgi
    - require:
      - pkg: python-dev
      - pkg: python-pip

/etc/uwsgi/apps-enabled:
  file.directory:
    - user: www-data
    - group: www-data
    - makedirs: true
    - require:
      - pip: uwsgi
      - pkg: nginx
    
/etc/init/uwsgi.conf:
  file.managed:
    - source: salt://uwsgi/uwsgi.conf
    - template: jinja
    - require:
      - pip: uwsgi
        
uwsgi-service:
  service.running:
    - enable: True
    - name: uwsgi
    - watch:
      - file: /etc/uwsgi/apps-enabled/*
    - require:
      - file: /etc/init/uwsgi.conf

/var/log/uwsgi:
  file.directory:
    - user: www-data
    - group: www-data
    - makedirs: true
    - require:
      - pip: uwsgi
      - pkg: nginx
        
/var/log/uwsgi/emperor.log:
  file.managed:
    - user: www-data
    - group: www-data
    - require:
      - pip: uwsgi
      - pkg: nginx
