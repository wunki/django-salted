nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-enabled/*
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf
    - user: root
    - mode: 400
    - template: jinja
    - require:
      - pkg: nginx
        
default-nginx:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx

www-data:
  user.present:
    - home: /var/www
    - require:
      - pkg: bash
      - pkg: nginx

/var/www:
  file.directory:
    - user: www-data
    - group: www-data
    - require:
      - user: www-data
      - pkg: nginx
        
/etc/nginx/sites-available:
  file.directory:
    - user: root
    - mode: 755
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled:
  file.directory:
    - user: root
    - mode: 755
    - require:
      - pkg: nginx