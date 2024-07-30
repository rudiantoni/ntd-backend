-- --------------------------------------------
-- WARNING: THIS IS A DATABASE ROLLBACK SCRIPT!
-- --------------------------------------------
ALTER SEQUENCE IF EXISTS public.record_seq RESTART WITH 1;

DROP TABLE IF EXISTS public.record;

ALTER SEQUENCE IF EXISTS public.users_seq RESTART WITH 1;

DROP TABLE IF EXISTS public.users;

ALTER SEQUENCE IF EXISTS public.operation_seq RESTART WITH 1;

DROP TABLE IF EXISTS public.operation;

