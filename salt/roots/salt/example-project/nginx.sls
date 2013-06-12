include:
  - nginx

example-nginx-conf:
  file.managed:
    - name: /etc/nginx/sites-available/example.conf
    - source: salt://example-project/nginx.conf
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 755
    - require:
      - pkg: nginx

# Symlink and thus enable the virtual host
example-enable-nginx:
  file.symlink:
    - name: /etc/nginx/sites-enabled/example.conf
    - target: /etc/nginx/sites-available/example.conf
    - force: false
    - require:
      - file: example-nginx-conf