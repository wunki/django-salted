# Install pip (dev), wheel and distribute
pip-dev:
  cmd.run:
    - name: {{ pillar['django']['virtualenv'] }}/bin/pip install pip==dev
    - user: {{ pillar['django']['user'] }}
    - unless: {{ pillar['django']['virtualenv'] }}/bin/pip wheel
    - require:
      - pkg: git
      - virtualenv: {{ pillar['django']['virtualenv'] }}

# Wheel is not required in the bootstrap, so run it whenever
pip-wheel:
  cmd.wait:
    - name: {{ pillar['django']['virtualenv'] }}/bin/pip install wheel
    - watch:
      - cmd: pip-dev  

pip-distribute:
  cmd.run:
    - name: "{{ pillar['django']['virtualenv'] }}/bin/pip install distribute==0.6.45"
    - unless: "{{ pillar['django']['virtualenv'] }}/bin/pip show distribute | grep -q 'Version: 0.6.45'"
    - require:
      - pkg: git
      - cmd: pip-dev
      - virtualenv: {{ pillar['django']['virtualenv'] }}