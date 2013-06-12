include:
  - nginx

# Setup directory
/var/www/venv:
  file.directory:
    - user: www-data
    - group: www-data
    - require:
      - file: /var/www
      - user: www-data

# Create the Python Virtual environment
{{ pillar['example']['virtualenv'] }}:
  virtualenv.managed:
    - no_site_packages: True
    - distribute: True
    - runas: www-data
    - require:
      - file: /var/www/venv
      - user: www-data
      - pkg: python-virtualenv
      - pkg: python-dev
      - pkg: postgresql-server-dev-9.1
      - pkg: libxml2-dev
      - pkg: libxslt1-dev
      - pkg: libjpeg62-dev