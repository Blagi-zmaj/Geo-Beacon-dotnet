CREATE EXTENSION IF NOT EXISTS postgis CASCADE;
CREATE EXTENSION IF NOT EXISTS h3 CASCADE;
CREATE EXTENSION IF NOT EXISTS h3_postgis CASCADE;

SELECT current_database() || '_test' AS test_database \gset

SELECT format('CREATE DATABASE %I TEMPLATE template_postgis', :'test_database')
WHERE NOT EXISTS (
  SELECT 1
  FROM pg_database
  WHERE datname = :'test_database'
) \gexec

\connect :test_database

CREATE EXTENSION IF NOT EXISTS h3 CASCADE;
CREATE EXTENSION IF NOT EXISTS h3_postgis CASCADE;
