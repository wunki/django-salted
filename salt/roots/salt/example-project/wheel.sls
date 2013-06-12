{{ pillar['wheel']['path'] }}:
  file.directory:
    - user: {{ pillar['django']['user'] }}

# Manage the tar file containing all the requirements
{{ pillar['wheel']['path'] }}/{{ pillar['wheel']['zip'] }}:
  file.managed:
    - source: {{ pillar['wheel']['source'] }}
    - source_hash: md5={{ pillar['wheel']['md5'] }}
    - user: {{ pillar['django']['user'] }}
    - require:
      - file: {{ pillar['wheel']['path'] }}

# Extract the archive when it changes
extract-wheel:
  cmd.wait:
    - user: {{ pillar['django']['user'] }}
    - cwd: {{ pillar['wheel']['path'] }}
    - name: tar -zxf {{ pillar['wheel']['path'] }}/{{ pillar['wheel']['zip'] }}
    - watch:
      - file: {{ pillar['wheel']['path'] }}/{{ pillar['wheel']['zip'] }}
    - require:
      - file: {{ pillar['wheel']['path'] }}

# Install all the requirements
example-wheel:
  cmd.wait:
    - name: {{ pillar['django']['virtualenv'] }}/bin/pip install --use-wheel --no-index --find-links={{ pillar['wheel']['path'] }}/example -r {{ pillar['django']['path'] }}/requirements.txt
    - require:
      - cmd: pip-wheel
      - virtualenv: {{ pillar['django']['virtualenv'] }}
    - watch:
      - file: {{ pillar['wheel']['path'] }}/{{ pillar['wheel']['zip'] }}
    - require:
        - cmd: pip-dev
        - cmd: pip-distribute
        - cmd: extract-wheel
        - virtualenv: {{ pillar['django']['virtualenv'] }}
