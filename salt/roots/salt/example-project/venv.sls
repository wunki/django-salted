include:
  - nginx

# Create the Python Virtual environment
{{ pillar['django']['virtualenv'] }}:
  virtualenv.managed:
    - system_site_packages: False
    - distribute: True
    - runas: {{ pillar['django']['user'] }}
    - requirements: {{ pillar['django']['path'] }}/requirements.txt  
    - no_chown: True
    - require:
      - pkg: python-virtualenv
      - pkg: python-dev
      - pkg: postgresql-server-dev-9.1
      - pkg: libxml2-dev
      - pkg: libxslt1-dev
      - pkg: libjpeg62-dev
