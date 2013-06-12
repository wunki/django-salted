/var/www/wheel:
  file.directory:
    - user: www-data
    - group: www-data
    - require:
      - file: /var/www
      - user: www-data

# Manage the tar file containing all the requirements
{{ pillar['example']['wheel_path'] }}/{{ pillar['example']['wheel_zip'] }}:
  file.managed:
    - source: {{ pillar['example']['wheel_source'] }}
    - source_hash: md5={{ pillar['example']['wheel_md5'] }}
    - user: www-data
    - group: www-data
    - require:
      - file: {{ pillar['example']['wheel_path'] }}
      - user: www-data

# Extract the archive when it changes
extract-wheel:
  cmd.wait:
    - user: www-data
    - cwd: {{ pillar['example']['wheel_path'] }}
    - name: tar -zxf {{ pillar['example']['wheel_path'] }}/{{ pillar['example']['wheel_zip'] }}
    - watch:
      - file: {{ pillar['example']['wheel_path'] }}/{{ pillar['example']['wheel_zip'] }}
    - require:
      - file: {{ pillar['example']['wheel_path'] }}


# Install all the requirements
example-wheel:
  cmd.wait:
    - name: {{ pillar['example']['virtualenv'] }}/bin/pip install --use-wheel --no-index --find-links={{ pillar['example']['wheel_path'] }}/gibbon-web -r {{ pillar['example']['path'] }}/requirements.txt
    - require:
      - cmd: pip-wheel
      - virtualenv: {{ pillar['example']['virtualenv'] }}
    - watch:
      - file: {{ pillar['example']['wheel_path'] }}/{{ pillar['example']['wheel_zip'] }}
    - require:
        - cmd: pip-dev
        - cmd: pip-distribute
        - cmd: extract-wheel
        - virtualenv: {{ pillar['example']['virtualenv'] }}
