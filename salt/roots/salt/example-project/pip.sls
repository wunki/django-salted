# Install pip (dev), wheel and distribute
pip-dev:
  cmd.run:
    - name: {{ pillar['gibbon-web']['virtualenv'] }}/bin/pip install pip==dev
    - user: www-data
    - unless: {{ pillar['gibbon-web']['virtualenv'] }}/bin/pip wheel
    - require:
      - pkg: git
      - virtualenv: /var/www/venv/gibbon-web

# Wheel is not required in the bootstrap, so run it whenever
pip-wheel:
  cmd.wait:
    - name: {{ pillar['gibbon-web']['virtualenv'] }}/bin/pip install wheel
    - watch:
      - cmd: pip-dev  

pip-distribute:
  cmd.run:
    - name: "{{ pillar['gibbon-web']['virtualenv'] }}/bin/pip install distribute==0.6.45"
    - unless: "{{ pillar['gibbon-web']['virtualenv'] }}/bin/pip show distribute | grep -q 'Version: 0.6.45'"
    - require:
      - pkg: git
      - cmd: pip-dev
      - virtualenv: {{ pillar['gibbon-web']['virtualenv'] }}