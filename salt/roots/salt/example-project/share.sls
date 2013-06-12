include:
  - nginx
  - example-project.venv

/vagrant:
  file.directory:
    - user: vagrant

gibbon-web-dir:
  file.symlink:
    - name: {{ pillar['example']['path'] }}
    - target: /vagrant/demo_project
    - force: True  
    - require:
      - file: /vagrant
    - require_in:
      - virtualenv: {{ pillar['example']['virtualenv'] }}