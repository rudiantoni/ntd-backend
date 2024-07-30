-- -------------------------------
-- Table public.users
-- -------------------------------
CREATE TABLE IF NOT EXISTS public.users (
    id           INT8 NOT NULL,
    username     VARCHAR(255) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    status       BOOL NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE SEQUENCE IF NOT EXISTS public.users_seq
    AS INT8
    INCREMENT 1
    MINVALUE 1
    NO MAXVALUE
    NO CYCLE
    START WITH 1
    OWNED BY public.users.id;

ALTER TABLE public.users
    ALTER COLUMN id SET DEFAULT nextval('public.users_seq'::regclass);

-- -------------------------------
-- Table public.operation
-- -------------------------------
CREATE TABLE IF NOT EXISTS public.operation (
    id           INT8 NOT NULL,
    type         VARCHAR(255) NOT NULL,
    cost         FLOAT8 NOT NULL,
    CONSTRAINT pk_operation PRIMARY KEY (id)
);

CREATE SEQUENCE IF NOT EXISTS public.operation_seq
    AS INT8
    INCREMENT 1
    MINVALUE 1
    NO MAXVALUE
    NO CYCLE
    START WITH 1
    OWNED BY public.operation.id;

ALTER TABLE public.operation
    ALTER COLUMN id SET DEFAULT nextval('public.operation_seq'::regclass);

-- -------------------------------
-- Table public.record
-- -------------------------------
CREATE TABLE IF NOT EXISTS public.record (
    id                    INT8 NOT NULL,
    operation_id          INT8 NOT NULL,
    user_id               INT8 NOT NULL,
    amount                FLOAT8 NOT NULL,
    user_balance          FLOAT8 NOT NULL,
    operation_response    FLOAT8 NOT NULL,
    CONSTRAINT pk_record PRIMARY KEY (id),
    CONSTRAINT fk_record_on_operation FOREIGN KEY (operation_id) REFERENCES public.operation(id),
    CONSTRAINT fk_record_on_users FOREIGN KEY (user_id) REFERENCES public.users(id)
);

CREATE SEQUENCE IF NOT EXISTS public.record_seq
    AS INT8
    INCREMENT 1
    MINVALUE 1
    NO MAXVALUE
    NO CYCLE
    START WITH 1
    OWNED BY public.record.id;

ALTER TABLE public.record
    ALTER COLUMN id SET DEFAULT nextval('public.record_seq'::regclass);
