CREATE SCHEMA IF NOT EXISTS pgexporter;
GRANT USAGE ON SCHEMA pgexporter TO pgexporter;

CREATE OR REPLACE FUNCTION get_pg_stat_activity() RETURNS SETOF pg_stat_activity AS
$$ SELECT * FROM pg_catalog.pg_stat_activity; $$
LANGUAGE sql
VOLATILE
SECURITY DEFINER;

CREATE OR REPLACE VIEW pgexporter.pg_stat_activity
AS
  SELECT * from get_pg_stat_activity();

GRANT SELECT ON pgexporter.pg_stat_activity TO pgexporter;

CREATE OR REPLACE FUNCTION get_pg_stat_replication() RETURNS SETOF pg_stat_replication AS
$$ SELECT * FROM pg_catalog.pg_stat_replication; $$
LANGUAGE sql
VOLATILE
SECURITY DEFINER;

CREATE OR REPLACE VIEW pgexporter.pg_stat_replication
AS
  SELECT * FROM get_pg_stat_replication();

GRANT SELECT ON pgexporter.pg_stat_replication TO pgexporter;

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
CREATE OR REPLACE FUNCTION get_pg_stat_statements() RETURNS SETOF pg_stat_statements AS
$$ SELECT * FROM public.pg_stat_statements; $$
LANGUAGE sql
VOLATILE
SECURITY DEFINER;

CREATE OR REPLACE VIEW pgexporter.pg_stat_statements
AS
  SELECT * FROM get_pg_stat_statements();

GRANT SELECT ON pgexporter.pg_stat_statements TO pgexporter;