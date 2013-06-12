include:
  - postgresql

example-postgres-user:
  postgres_user.present:
    - name: {{ pillar['postgresql']['user'] }}
    - createdb: {{ pillar['postgresql']['createdb'] }}
    - password: {{ pillar['postgresql']['password'] }}
    - runas: postgres
    - require:
      - service: postgresql

example-postgres-db:
  postgres_database.present:
    - name: {{ pillar['postgresql']['db'] }}
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - owner: {{ pillar['postgresql']['user'] }}
    - runas: postgres
    - require:
        - postgres_user: example-postgres-user