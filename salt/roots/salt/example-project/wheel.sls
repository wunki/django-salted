/var/www/wheel:
  file.directory:
    - user: {{ pillar['www']['user'] }}
    - group: {{ pillar['www']['group'] }}
    - require:
      - file: {{ pillar['www']['path'] }}
      - user: {{ pillar['www']['group'] }}

# Manage the tar file containing all the requirements
{{ pillar['gibbon-web']['wheel_path'] }}/gibbon-web-wheel.tar.gz:
  file.managed:
    - source: {{ pillar['gibbon-web']['wheel_source'] }}
    - source_hash: md5={{ pillar['gibbon-web']['wheel_md5'] }}
    - user: {{ pillar['www']['user'] }}
    - group: {{ pillar['www']['group'] }}
    - require:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}
      - user: {{ pillar['www']['user'] }}

# Extract the archive when it changes
extract-wheel:
  cmd.wait:
    - user: {{ pillar['www']['user'] }}
    - cwd: {{ pillar['gibbon-web']['wheel_path'] }}
    - name: tar -zxf {{ pillar['gibbon-web']['wheel_path'] }}/{{ pillar['gibbon-web']['wheel_tar'] }}
    - watch:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}/{{ pillar['gibbon-web']['wheel_tar'] }}
    - require:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}

/var/www/wheel:
  file.directory:
    - user: {{ pillar['www']['user'] }}
    - group: {{ pillar['www']['group'] }}
    - require:
      - file: {{ pillar['www']['path'] }}
      - user: {{ pillar['www']['group'] }}

# Manage the tar file containing all the requirements
{{ pillar['gibbon-web']['wheel_path'] }}/gibbon-web-wheel.tar.gz:
  file.managed:
    - source: {{ pillar['gibbon-web']['wheel_source'] }}
    - source_hash: md5={{ pillar['gibbon-web']['wheel_md5'] }}
    - user: {{ pillar['www']['user'] }}
    - group: {{ pillar['www']['group'] }}
    - require:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}
      - user: {{ pillar['www']['user'] }}

# Extract the archive when it changes
extract-wheel:
  cmd.wait:
    - user: {{ pillar['www']['user'] }}
    - cwd: {{ pillar['gibbon-web']['wheel_path'] }}
    - name: tar -zxf {{ pillar['gibbon-web']['wheel_path'] }}/{{ pillar['gibbon-web']['wheel_tar'] }}
    - watch:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}/{{ pillar['gibbon-web']['wheel_tar'] }}
    - require:
      - file: {{ pillar['gibbon-web']['wheel_path'] }}
