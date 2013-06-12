include:
  - postgresql

example-postgres-user:
  postgres_user.present:
    - name: {{ pillar['example']['postgres_user'] }}
    - createdb: {{ pillar['example']['postgres_createdb'] }}
    - password: {{ pillar['example']['postgres_password'] }}
    - runas: postgres
    - require:
      - service: postgresql

example-postgres-db:
  postgres_database.present:
    - name: {{ pillar['example']['postgres_db'] }}
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - owner: {{ pillar['example']['postgres_user'] }}
    - runas: postgres
    - require:
        - postgres_user: example-postgres-user