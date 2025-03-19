--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: poc; Type: SCHEMA; Schema: -; Owner: rnd_eagle
--

CREATE SCHEMA poc;


ALTER SCHEMA poc OWNER TO rnd_eagle;

--
-- Name: poc_location; Type: SCHEMA; Schema: -; Owner: rnd_eagle
--

CREATE SCHEMA poc_location;


ALTER SCHEMA poc_location OWNER TO rnd_eagle;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA poc_location;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.access (
    id integer NOT NULL,
    role_id integer NOT NULL,
    menu_id integer NOT NULL,
    permission character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE poc.access OWNER TO rnd_eagle;

--
-- Name: access_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.access_id_seq OWNER TO rnd_eagle;

--
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.access_id_seq OWNED BY poc.access.id;


--
-- Name: access_menu; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.access_menu (
    id integer NOT NULL,
    code character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    terminated_at timestamp with time zone
);


ALTER TABLE poc.access_menu OWNER TO rnd_eagle;

--
-- Name: access_menu_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.access_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.access_menu_id_seq OWNER TO rnd_eagle;

--
-- Name: access_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.access_menu_id_seq OWNED BY poc.access_menu.id;


--
-- Name: access_role; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.access_role (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    terminated_at timestamp with time zone
);


ALTER TABLE poc.access_role OWNER TO rnd_eagle;

--
-- Name: access_role_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.access_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.access_role_id_seq OWNER TO rnd_eagle;

--
-- Name: access_role_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.access_role_id_seq OWNED BY poc.access_role.id;


--
-- Name: case; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc."case" (
    id integer NOT NULL,
    object_id integer NOT NULL,
    status_id integer NOT NULL,
    description character varying NOT NULL,
    lat numeric NOT NULL,
    long numeric NOT NULL,
    assign_to integer,
    source character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE poc."case" OWNER TO rnd_eagle;

--
-- Name: case_detail; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.case_detail (
    id integer NOT NULL,
    case_id integer NOT NULL,
    status character varying,
    assigned character varying,
    description character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE poc.case_detail OWNER TO rnd_eagle;

--
-- Name: case_detail_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.case_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.case_detail_id_seq OWNER TO rnd_eagle;

--
-- Name: case_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.case_detail_id_seq OWNED BY poc.case_detail.id;


--
-- Name: case_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.case_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.case_id_seq OWNER TO rnd_eagle;

--
-- Name: case_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.case_id_seq OWNED BY poc."case".id;


--
-- Name: case_status; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.case_status (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    terminated_at timestamp with time zone
);


ALTER TABLE poc.case_status OWNER TO rnd_eagle;

--
-- Name: case_status_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.case_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.case_status_id_seq OWNER TO rnd_eagle;

--
-- Name: case_status_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.case_status_id_seq OWNED BY poc.case_status.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(155),
    status character varying(50),
    result bytea,
    date_done timestamp without time zone,
    traceback text,
    name character varying(155),
    args bytea,
    kwargs bytea,
    worker character varying(155),
    retries integer,
    queue character varying(155)
);


ALTER TABLE poc.celery_taskmeta OWNER TO rnd_eagle;

--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(155),
    result bytea,
    date_done timestamp without time zone
);


ALTER TABLE poc.celery_tasksetmeta OWNER TO rnd_eagle;

--
-- Name: detection_results; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.detection_results (
    id integer NOT NULL,
    image_name character varying,
    output_name character varying,
    data json
);


ALTER TABLE poc.detection_results OWNER TO rnd_eagle;

--
-- Name: detection_results_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.detection_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.detection_results_id_seq OWNER TO rnd_eagle;

--
-- Name: detection_results_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.detection_results_id_seq OWNED BY poc.detection_results.id;


--
-- Name: object; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.object (
    id integer NOT NULL,
    detected_id character varying NOT NULL,
    detected_confidence double precision NOT NULL,
    first_img character varying NOT NULL,
    first_xmin double precision NOT NULL,
    first_ymin double precision NOT NULL,
    first_xmax double precision NOT NULL,
    first_ymax double precision NOT NULL,
    last_img character varying,
    last_xmin double precision,
    last_ymin double precision,
    last_xmax double precision,
    last_ymax double precision,
    lat numeric NOT NULL,
    long numeric NOT NULL,
    location poc_location.geometry(Point,4326),
    container character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE poc.object OWNER TO rnd_eagle;

--
-- Name: object_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.object_id_seq OWNER TO rnd_eagle;

--
-- Name: object_id_seq1; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.object_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.object_id_seq1 OWNER TO rnd_eagle;

--
-- Name: object_id_seq1; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.object_id_seq1 OWNED BY poc.object.id;


--
-- Name: task_id_sequence; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.task_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.task_id_sequence OWNER TO rnd_eagle;

--
-- Name: taskset_id_sequence; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.taskset_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.taskset_id_sequence OWNER TO rnd_eagle;

--
-- Name: user_status; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.user_status (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    terminated_at timestamp with time zone
);


ALTER TABLE poc.user_status OWNER TO rnd_eagle;

--
-- Name: user_status_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.user_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.user_status_id_seq OWNER TO rnd_eagle;

--
-- Name: user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.user_status_id_seq OWNED BY poc.user_status.id;


--
-- Name: users; Type: TABLE; Schema: poc; Owner: rnd_eagle
--

CREATE TABLE poc.users (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    email character varying(128) NOT NULL,
    password character varying,
    fullname character varying,
    status_id smallint,
    role_id smallint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE poc.users OWNER TO rnd_eagle;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: poc; Owner: rnd_eagle
--

CREATE SEQUENCE poc.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc.users_id_seq OWNER TO rnd_eagle;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: poc; Owner: rnd_eagle
--

ALTER SEQUENCE poc.users_id_seq OWNED BY poc.users.id;


--
-- Name: area; Type: TABLE; Schema: poc_location; Owner: rnd_eagle
--

CREATE TABLE poc_location.area (
    id integer NOT NULL,
    description character varying(255),
    geom poc_location.geometry(Polygon,4326)
);


ALTER TABLE poc_location.area OWNER TO rnd_eagle;

--
-- Name: area_detail; Type: TABLE; Schema: poc_location; Owner: rnd_eagle
--

CREATE TABLE poc_location.area_detail (
    id integer NOT NULL,
    area_id integer,
    description character varying(255),
    geom poc_location.geometry(Polygon,4326)
);


ALTER TABLE poc_location.area_detail OWNER TO rnd_eagle;

--
-- Name: area_detail2; Type: TABLE; Schema: poc_location; Owner: rnd_eagle
--

CREATE TABLE poc_location.area_detail2 (
    id integer NOT NULL,
    area_id integer,
    description character varying(255),
    geom poc_location.geometry(Polygon,4326)
);


ALTER TABLE poc_location.area_detail2 OWNER TO rnd_eagle;

--
-- Name: area_detail2_id_seq; Type: SEQUENCE; Schema: poc_location; Owner: rnd_eagle
--

CREATE SEQUENCE poc_location.area_detail2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc_location.area_detail2_id_seq OWNER TO rnd_eagle;

--
-- Name: area_detail2_id_seq; Type: SEQUENCE OWNED BY; Schema: poc_location; Owner: rnd_eagle
--

ALTER SEQUENCE poc_location.area_detail2_id_seq OWNED BY poc_location.area_detail2.id;


--
-- Name: area_detail_id_seq; Type: SEQUENCE; Schema: poc_location; Owner: rnd_eagle
--

CREATE SEQUENCE poc_location.area_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc_location.area_detail_id_seq OWNER TO rnd_eagle;

--
-- Name: area_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: poc_location; Owner: rnd_eagle
--

ALTER SEQUENCE poc_location.area_detail_id_seq OWNED BY poc_location.area_detail.id;


--
-- Name: area_id_seq; Type: SEQUENCE; Schema: poc_location; Owner: rnd_eagle
--

CREATE SEQUENCE poc_location.area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc_location.area_id_seq OWNER TO rnd_eagle;

--
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: poc_location; Owner: rnd_eagle
--

ALTER SEQUENCE poc_location.area_id_seq OWNED BY poc_location.area.id;


--
-- Name: line_points; Type: TABLE; Schema: poc_location; Owner: rnd_eagle
--

CREATE TABLE poc_location.line_points (
    id integer NOT NULL,
    name character varying(50),
    geom poc_location.geometry(Point,4326),
    longitude double precision,
    latitude double precision
);


ALTER TABLE poc_location.line_points OWNER TO rnd_eagle;

--
-- Name: line_points_id_seq; Type: SEQUENCE; Schema: poc_location; Owner: rnd_eagle
--

CREATE SEQUENCE poc_location.line_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc_location.line_points_id_seq OWNER TO rnd_eagle;

--
-- Name: line_points_id_seq; Type: SEQUENCE OWNED BY; Schema: poc_location; Owner: rnd_eagle
--

ALTER SEQUENCE poc_location.line_points_id_seq OWNED BY poc_location.line_points.id;


--
-- Name: line_points_temp; Type: TABLE; Schema: poc_location; Owner: rnd_eagle
--

CREATE TABLE poc_location.line_points_temp (
    id integer NOT NULL,
    name character varying(50),
    geom poc_location.geometry(Point,4326),
    longitude double precision,
    latitude double precision
);


ALTER TABLE poc_location.line_points_temp OWNER TO rnd_eagle;

--
-- Name: line_points_temp_id_seq; Type: SEQUENCE; Schema: poc_location; Owner: rnd_eagle
--

CREATE SEQUENCE poc_location.line_points_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE poc_location.line_points_temp_id_seq OWNER TO rnd_eagle;

--
-- Name: line_points_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: poc_location; Owner: rnd_eagle
--

ALTER SEQUENCE poc_location.line_points_temp_id_seq OWNED BY poc_location.line_points_temp.id;


--
-- Name: access id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access ALTER COLUMN id SET DEFAULT nextval('poc.access_id_seq'::regclass);


--
-- Name: access_menu id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access_menu ALTER COLUMN id SET DEFAULT nextval('poc.access_menu_id_seq'::regclass);


--
-- Name: access_role id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access_role ALTER COLUMN id SET DEFAULT nextval('poc.access_role_id_seq'::regclass);


--
-- Name: case id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc."case" ALTER COLUMN id SET DEFAULT nextval('poc.case_id_seq'::regclass);


--
-- Name: case_detail id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.case_detail ALTER COLUMN id SET DEFAULT nextval('poc.case_detail_id_seq'::regclass);


--
-- Name: case_status id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.case_status ALTER COLUMN id SET DEFAULT nextval('poc.case_status_id_seq'::regclass);


--
-- Name: detection_results id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.detection_results ALTER COLUMN id SET DEFAULT nextval('poc.detection_results_id_seq'::regclass);


--
-- Name: object id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.object ALTER COLUMN id SET DEFAULT nextval('poc.object_id_seq1'::regclass);


--
-- Name: user_status id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.user_status ALTER COLUMN id SET DEFAULT nextval('poc.user_status_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.users ALTER COLUMN id SET DEFAULT nextval('poc.users_id_seq'::regclass);


--
-- Name: area id; Type: DEFAULT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area ALTER COLUMN id SET DEFAULT nextval('poc_location.area_id_seq'::regclass);


--
-- Name: area_detail id; Type: DEFAULT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area_detail ALTER COLUMN id SET DEFAULT nextval('poc_location.area_detail_id_seq'::regclass);


--
-- Name: area_detail2 id; Type: DEFAULT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area_detail2 ALTER COLUMN id SET DEFAULT nextval('poc_location.area_detail2_id_seq'::regclass);


--
-- Name: line_points id; Type: DEFAULT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.line_points ALTER COLUMN id SET DEFAULT nextval('poc_location.line_points_id_seq'::regclass);


--
-- Name: line_points_temp id; Type: DEFAULT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.line_points_temp ALTER COLUMN id SET DEFAULT nextval('poc_location.line_points_temp_id_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.access (id, role_id, menu_id, permission, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: access_menu; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.access_menu (id, code, created_at, terminated_at) FROM stdin;
\.


--
-- Data for Name: access_role; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.access_role (id, name, created_at, terminated_at) FROM stdin;
1	Admin	2024-08-05 20:35:19.242728+00	\N
2	Worker Bird Dropping	2024-08-05 20:35:19.242728+00	\N
\.


--
-- Data for Name: case; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc."case" (id, object_id, status_id, description, lat, long, assign_to, source, created_at, updated_at) FROM stdin;
1	1	1	detected for the first time	-6.382732	107.214179	\N	worker	2024-10-31 03:55:16.888456+00	\N
2	4	1	detected for the first time	-6.382824	107.214036	\N	worker	2024-10-31 03:55:33.691094+00	\N
3	5	1	detected for the first time	-6.38287	107.213964	\N	worker	2024-10-31 03:55:40.726198+00	\N
4	6	1	detected for the first time	-6.38286	107.213978	\N	worker	2024-10-31 03:55:40.858902+00	\N
5	11	1	detected for the first time	-6.382848	107.213989	\N	worker	2024-10-31 03:56:02.113391+00	\N
6	13	1	detected for the first time	-6.38281	107.214045	\N	worker	2024-10-31 03:56:08.057214+00	\N
7	15	1	detected for the first time	-6.382577	107.214422	\N	worker	2024-10-31 04:00:10.772118+00	\N
8	17	1	detected for the first time	-6.382585	107.214408	\N	worker	2024-10-31 04:00:10.805743+00	\N
9	19	1	detected for the first time	-6.382613	107.214366	\N	worker	2024-10-31 04:00:19.339468+00	\N
10	21	1	detected for the first time	-6.382658	107.214296	\N	worker	2024-10-31 04:00:26.721461+00	\N
11	23	1	detected for the first time	-6.382642	107.214308	\N	worker	2024-10-31 04:00:42.0193+00	\N
\.


--
-- Data for Name: case_detail; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.case_detail (id, case_id, status, assigned, description, created_at) FROM stdin;
\.


--
-- Data for Name: case_status; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.case_status (id, name, created_at, terminated_at) FROM stdin;
1	Not Started	2024-08-12 00:00:00+00	2024-08-12 00:00:00+00
2	Progress	2024-08-12 00:00:00+00	2024-08-12 00:00:00+00
3	Selesai	2024-08-12 00:00:00+00	2024-08-12 00:00:00+00
\.


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.celery_taskmeta (id, task_id, status, result, date_done, traceback, name, args, kwargs, worker, retries, queue) FROM stdin;
1	9a651eed-1b91-4491-96d5-9a06ef13bcf9	FAILURE	\\x8005959c000000000000007d94288c086578635f74797065948c104f7065726174696f6e616c4572726f72948c0b6578635f6d657373616765948c4828707379636f7067322e4f7065726174696f6e616c4572726f72292053534c20636f6e6e656374696f6e20686173206265656e20636c6f73656420756e65787065637465646c790a9485948c0a6578635f6d6f64756c65948c0e73716c616c6368656d792e65786394752e	2024-09-22 11:50:16.18171	Traceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\npsycopg2.OperationalError: SSL connection has been closed unexpectedly\n\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/app/workers/file_processor.py", line 101, in process_file_task\n    session.commit()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 2028, in commit\n    trans.commit(_to_root=True)\n  File "<string>", line 2, in commit\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1313, in commit\n    self._prepare_impl()\n  File "<string>", line 2, in _prepare_impl\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1288, in _prepare_impl\n    self.session.flush()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4352, in flush\n    self._flush(objects)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4487, in _flush\n    with util.safe_reraise():\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/util/langhelpers.py", line 146, in __exit__\n    raise exc_value.with_traceback(exc_tb)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4448, in _flush\n    flush_context.execute()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 466, in execute\n    rec.execute(self)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 642, in execute\n    util.preloaded.orm_persistence.save_obj(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 93, in save_obj\n    _emit_insert_statements(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 1233, in _emit_insert_statements\n    result = connection.execute(\n             ^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1418, in execute\n    return meth(\n           ^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/sql/elements.py", line 515, in _execute_on_connection\n    return connection._execute_clauseelement(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1640, in _execute_clauseelement\n    ret = self._execute_context(\n          ^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1846, in _execute_context\n    return self._exec_single_context(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1986, in _exec_single_context\n    self._handle_dbapi_exception(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 2355, in _handle_dbapi_exception\n    raise sqlalchemy_exception.with_traceback(exc_info[2]) from e\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\nsqlalchemy.exc.OperationalError: (psycopg2.OperationalError) SSL connection has been closed unexpectedly\n\n[SQL: INSERT INTO poc.detection_results (image_name, output_name, data) VALUES (%(image_name)s, %(output_name)s, %(data)s) RETURNING poc.detection_results.id]\n[parameters: {'image_name': 'queued/DJI_0599.JPG', 'output_name': 'processed/DJI_0599.JPG', 'data': '{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", " ... (256 characters truncated) ... : "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:08:30 10:11:02", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}'}]\n(Background on this error at: https://sqlalche.me/e/20/e3q8)\n	\N	\N	\N	\N	\N	\N
2	52968a44-f10a-4891-a8e5-2e736e9bb500	FAILURE	\\x80059590000000000000007d94288c086578635f74797065948c104f7065726174696f6e616c4572726f72948c0b6578635f6d657373616765948c3c28707379636f7067322e4f7065726174696f6e616c4572726f72292053534c2053595343414c4c206572726f723a20454f462064657465637465640a9485948c0a6578635f6d6f64756c65948c0e73716c616c6368656d792e65786394752e	2024-09-22 11:50:16.325734	Traceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\npsycopg2.OperationalError: SSL SYSCALL error: EOF detected\n\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/app/workers/file_processor.py", line 101, in process_file_task\n    session.commit()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 2028, in commit\n    trans.commit(_to_root=True)\n  File "<string>", line 2, in commit\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1313, in commit\n    self._prepare_impl()\n  File "<string>", line 2, in _prepare_impl\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1288, in _prepare_impl\n    self.session.flush()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4352, in flush\n    self._flush(objects)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4487, in _flush\n    with util.safe_reraise():\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/util/langhelpers.py", line 146, in __exit__\n    raise exc_value.with_traceback(exc_tb)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4448, in _flush\n    flush_context.execute()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 466, in execute\n    rec.execute(self)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 642, in execute\n    util.preloaded.orm_persistence.save_obj(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 93, in save_obj\n    _emit_insert_statements(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 1233, in _emit_insert_statements\n    result = connection.execute(\n             ^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1418, in execute\n    return meth(\n           ^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/sql/elements.py", line 515, in _execute_on_connection\n    return connection._execute_clauseelement(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1640, in _execute_clauseelement\n    ret = self._execute_context(\n          ^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1846, in _execute_context\n    return self._exec_single_context(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1986, in _exec_single_context\n    self._handle_dbapi_exception(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 2355, in _handle_dbapi_exception\n    raise sqlalchemy_exception.with_traceback(exc_info[2]) from e\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\nsqlalchemy.exc.OperationalError: (psycopg2.OperationalError) SSL SYSCALL error: EOF detected\n\n[SQL: INSERT INTO poc.detection_results (image_name, output_name, data) VALUES (%(image_name)s, %(output_name)s, %(data)s) RETURNING poc.detection_results.id]\n[parameters: {'image_name': 'queued/DJI_0598.JPG', 'output_name': 'processed/DJI_0598.JPG', 'data': '{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", " ... (256 characters truncated) ... : "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:08:30 10:11:00", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}'}]\n(Background on this error at: https://sqlalche.me/e/20/e3q8)\n	\N	\N	\N	\N	\N	\N
3	5b621c17-3374-4a0f-ab88-ce327fa49329	FAILURE	\\x80059590000000000000007d94288c086578635f74797065948c104f7065726174696f6e616c4572726f72948c0b6578635f6d657373616765948c3c28707379636f7067322e4f7065726174696f6e616c4572726f72292053534c2053595343414c4c206572726f723a20454f462064657465637465640a9485948c0a6578635f6d6f64756c65948c0e73716c616c6368656d792e65786394752e	2024-09-22 11:50:16.399202	Traceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\npsycopg2.OperationalError: SSL SYSCALL error: EOF detected\n\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/app/workers/file_processor.py", line 101, in process_file_task\n    session.commit()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 2028, in commit\n    trans.commit(_to_root=True)\n  File "<string>", line 2, in commit\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1313, in commit\n    self._prepare_impl()\n  File "<string>", line 2, in _prepare_impl\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1288, in _prepare_impl\n    self.session.flush()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4352, in flush\n    self._flush(objects)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4487, in _flush\n    with util.safe_reraise():\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/util/langhelpers.py", line 146, in __exit__\n    raise exc_value.with_traceback(exc_tb)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4448, in _flush\n    flush_context.execute()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 466, in execute\n    rec.execute(self)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 642, in execute\n    util.preloaded.orm_persistence.save_obj(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 93, in save_obj\n    _emit_insert_statements(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 1233, in _emit_insert_statements\n    result = connection.execute(\n             ^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1418, in execute\n    return meth(\n           ^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/sql/elements.py", line 515, in _execute_on_connection\n    return connection._execute_clauseelement(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1640, in _execute_clauseelement\n    ret = self._execute_context(\n          ^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1846, in _execute_context\n    return self._exec_single_context(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1986, in _exec_single_context\n    self._handle_dbapi_exception(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 2355, in _handle_dbapi_exception\n    raise sqlalchemy_exception.with_traceback(exc_info[2]) from e\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\nsqlalchemy.exc.OperationalError: (psycopg2.OperationalError) SSL SYSCALL error: EOF detected\n\n[SQL: INSERT INTO poc.detection_results (image_name, output_name, data) VALUES (%(image_name)s, %(output_name)s, %(data)s) RETURNING poc.detection_results.id]\n[parameters: {'image_name': 'queued/DJI_0600.JPG', 'output_name': 'processed/DJI_0600.JPG', 'data': '{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", " ... (256 characters truncated) ... : "17/10", "EXIF ISOSpeedRatings": "150", "EXIF DateTimeOriginal": "2024:08:30 10:11:04", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}'}]\n(Background on this error at: https://sqlalche.me/e/20/e3q8)\n	\N	\N	\N	\N	\N	\N
5	5d97ea26-181e-4ea9-b3e3-1ba5b1a7b492	SUCCESS	\N	2024-09-22 11:50:23.293247	\N	\N	\N	\N	\N	\N	\N
7	a7233700-09a8-4042-abf8-4074b541c595	SUCCESS	\N	2024-09-22 11:50:24.291623	\N	\N	\N	\N	\N	\N	\N
8	0c2302b9-81a7-42f9-ac72-70b3c1c4e8a4	SUCCESS	\N	2024-09-22 11:50:24.333813	\N	\N	\N	\N	\N	\N	\N
9	db5da647-e1c2-4ab8-9070-8391345fa4d4	SUCCESS	\N	2024-09-22 11:50:24.357241	\N	\N	\N	\N	\N	\N	\N
11	efb1f206-984d-4291-be6e-cff9c903f78d	SUCCESS	\N	2024-09-22 11:50:30.041131	\N	\N	\N	\N	\N	\N	\N
12	7f493062-7bea-4f3b-9b57-2cefcef74785	SUCCESS	\N	2024-09-22 11:50:30.138312	\N	\N	\N	\N	\N	\N	\N
13	17965809-5dce-4585-b609-45dbfcfe8350	SUCCESS	\N	2024-09-22 11:50:31.073348	\N	\N	\N	\N	\N	\N	\N
15	75266a7b-5167-4b4b-8026-6c360cf62a32	SUCCESS	\N	2024-09-22 11:50:37.191702	\N	\N	\N	\N	\N	\N	\N
16	96a1645e-8be4-4a2f-8e7d-c6442ed90826	SUCCESS	\N	2024-09-22 11:50:38.294769	\N	\N	\N	\N	\N	\N	\N
17	6c7ead32-9411-4b47-a325-94aa23cfa3c0	SUCCESS	\N	2024-09-22 11:50:38.368517	\N	\N	\N	\N	\N	\N	\N
19	aa73651d-4a4c-4a2f-8054-f14b3e223737	SUCCESS	\N	2024-09-22 11:50:43.526872	\N	\N	\N	\N	\N	\N	\N
20	496a1882-1c9a-4489-bfe1-4915960a2150	SUCCESS	\N	2024-09-22 11:50:45.051311	\N	\N	\N	\N	\N	\N	\N
21	2630c36d-ae38-458d-8313-c41a9e3e44d1	SUCCESS	\N	2024-09-22 11:50:46.155384	\N	\N	\N	\N	\N	\N	\N
23	5aee0a9c-e118-4852-8093-bddbf72295ae	SUCCESS	\N	2024-09-22 11:50:48.799253	\N	\N	\N	\N	\N	\N	\N
24	2bda80f2-0179-4444-aefc-c4ecc25ff0ad	SUCCESS	\N	2024-09-22 11:50:50.877235	\N	\N	\N	\N	\N	\N	\N
25	de4e71ae-1aff-46c4-80b5-44cfa41a2558	SUCCESS	\N	2024-09-22 11:50:53.094825	\N	\N	\N	\N	\N	\N	\N
27	48f5ec55-5ec0-4c42-9134-9822502d2b76	SUCCESS	\N	2024-09-22 11:50:55.223514	\N	\N	\N	\N	\N	\N	\N
28	8bfa0918-55e1-4e57-90df-a1c9fcad76af	SUCCESS	\N	2024-09-22 11:50:56.205228	\N	\N	\N	\N	\N	\N	\N
29	35e9c8f5-0889-4f70-81c3-dfedec3f8f6f	SUCCESS	\N	2024-09-22 11:50:59.417738	\N	\N	\N	\N	\N	\N	\N
31	a6d9d452-4f57-4267-aa01-eff20eeeba07	SUCCESS	\N	2024-09-22 11:51:03.830067	\N	\N	\N	\N	\N	\N	\N
4	f95c8fd1-2ac9-441f-bd41-166e1cd7f21c	FAILURE	\\x80059590000000000000007d94288c086578635f74797065948c104f7065726174696f6e616c4572726f72948c0b6578635f6d657373616765948c3c28707379636f7067322e4f7065726174696f6e616c4572726f72292053534c2053595343414c4c206572726f723a20454f462064657465637465640a9485948c0a6578635f6d6f64756c65948c0e73716c616c6368656d792e65786394752e	2024-09-22 11:50:16.399463	Traceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\npsycopg2.OperationalError: SSL SYSCALL error: EOF detected\n\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/app/workers/file_processor.py", line 101, in process_file_task\n    session.commit()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 2028, in commit\n    trans.commit(_to_root=True)\n  File "<string>", line 2, in commit\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1313, in commit\n    self._prepare_impl()\n  File "<string>", line 2, in _prepare_impl\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1288, in _prepare_impl\n    self.session.flush()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4352, in flush\n    self._flush(objects)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4487, in _flush\n    with util.safe_reraise():\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/util/langhelpers.py", line 146, in __exit__\n    raise exc_value.with_traceback(exc_tb)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4448, in _flush\n    flush_context.execute()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 466, in execute\n    rec.execute(self)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 642, in execute\n    util.preloaded.orm_persistence.save_obj(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 93, in save_obj\n    _emit_insert_statements(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 1233, in _emit_insert_statements\n    result = connection.execute(\n             ^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1418, in execute\n    return meth(\n           ^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/sql/elements.py", line 515, in _execute_on_connection\n    return connection._execute_clauseelement(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1640, in _execute_clauseelement\n    ret = self._execute_context(\n          ^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1846, in _execute_context\n    return self._exec_single_context(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1986, in _exec_single_context\n    self._handle_dbapi_exception(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 2355, in _handle_dbapi_exception\n    raise sqlalchemy_exception.with_traceback(exc_info[2]) from e\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\nsqlalchemy.exc.OperationalError: (psycopg2.OperationalError) SSL SYSCALL error: EOF detected\n\n[SQL: INSERT INTO poc.detection_results (image_name, output_name, data) VALUES (%(image_name)s, %(output_name)s, %(data)s) RETURNING poc.detection_results.id]\n[parameters: {'image_name': 'queued/DJI_0601.JPG', 'output_name': 'processed/DJI_0601.JPG', 'data': '{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", " ... (255 characters truncated) ... : "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:08:30 10:11:06", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}'}]\n(Background on this error at: https://sqlalche.me/e/20/e3q8)\n	\N	\N	\N	\N	\N	\N
6	68159cc6-d8a5-4174-9010-88b92ad1779c	SUCCESS	\N	2024-09-22 11:50:23.911173	\N	\N	\N	\N	\N	\N	\N
10	24e48bde-9abc-4149-876b-fb72ed5f79df	SUCCESS	\N	2024-09-22 11:50:27.315524	\N	\N	\N	\N	\N	\N	\N
14	50918f0e-ab60-4c3b-be5d-569abd3da196	SUCCESS	\N	2024-09-22 11:50:33.036764	\N	\N	\N	\N	\N	\N	\N
18	17a8f738-151b-4fb2-95fb-e00462e0117d	SUCCESS	\N	2024-09-22 11:50:39.362499	\N	\N	\N	\N	\N	\N	\N
22	255a5d5a-c456-447f-8561-63ab7a12b553	SUCCESS	\N	2024-09-22 11:50:47.992414	\N	\N	\N	\N	\N	\N	\N
26	dc20d31f-6908-495f-89c9-c09631b4daa7	SUCCESS	\N	2024-09-22 11:50:53.849319	\N	\N	\N	\N	\N	\N	\N
30	a3eff928-a031-40e0-b9e2-1ca7441959b7	SUCCESS	\N	2024-09-22 11:51:02.099538	\N	\N	\N	\N	\N	\N	\N
34	f06d12d5-e124-41f0-91d3-c8a8b8eb01d5	SUCCESS	\N	2024-09-22 11:51:07.054319	\N	\N	\N	\N	\N	\N	\N
38	b8ef90cb-875f-4d50-8b9a-189c008d8582	SUCCESS	\N	2024-09-22 11:51:13.824782	\N	\N	\N	\N	\N	\N	\N
42	98579924-f538-453e-8786-8edad6d6d12c	SUCCESS	\N	2024-09-22 11:51:19.701038	\N	\N	\N	\N	\N	\N	\N
46	164423b0-d964-497d-8039-bf577fad411d	SUCCESS	\N	2024-09-22 11:51:25.638936	\N	\N	\N	\N	\N	\N	\N
50	5b279939-bc5b-4101-9545-5c8def99516f	SUCCESS	\N	2024-09-22 11:51:31.584192	\N	\N	\N	\N	\N	\N	\N
433	ef6997f4-c820-47f4-855d-62444747b940	SUCCESS	\N	2024-10-28 03:06:20.639072	\N	\N	\N	\N	\N	\N	\N
439	ffda9d42-fe63-4d09-8a69-997433c1679e	SUCCESS	\N	2024-10-28 08:20:11.908513	\N	\N	\N	\N	\N	\N	\N
444	35506c7d-0672-4348-bb92-b2db0c863e93	SUCCESS	\N	2024-10-28 08:20:18.479698	\N	\N	\N	\N	\N	\N	\N
448	86f40230-179a-41b0-9977-651491bb750d	SUCCESS	\N	2024-10-28 08:20:24.653325	\N	\N	\N	\N	\N	\N	\N
451	190ec65d-19bc-44f3-a17a-e3d58f12590c	SUCCESS	\N	2024-10-28 08:20:29.692558	\N	\N	\N	\N	\N	\N	\N
455	3ba05dc6-d8bf-4a16-b100-f668154b5369	SUCCESS	\N	2024-10-28 08:20:36.762511	\N	\N	\N	\N	\N	\N	\N
460	92f06dbd-9cec-40e7-8f47-b3f1f96b5b8f	SUCCESS	\N	2024-10-28 08:20:44.877304	\N	\N	\N	\N	\N	\N	\N
464	809b54fd-af1b-4864-9a6c-d0276cdfc4bc	SUCCESS	\N	2024-10-28 08:20:52.459252	\N	\N	\N	\N	\N	\N	\N
468	b62018b8-0589-41e6-a6a9-9acd6bf39802	SUCCESS	\N	2024-10-28 08:20:58.00133	\N	\N	\N	\N	\N	\N	\N
471	d76bf510-c002-4f06-a678-8c4619cc3cee	SUCCESS	\N	2024-10-28 08:21:04.830551	\N	\N	\N	\N	\N	\N	\N
476	2b4cd7b7-a770-4c7c-a9bc-d6c5c5a578de	SUCCESS	\N	2024-10-28 08:21:11.395953	\N	\N	\N	\N	\N	\N	\N
481	7a983f09-3859-4be9-b50f-2b675d6aa271	SUCCESS	\N	2024-10-28 08:21:18.475691	\N	\N	\N	\N	\N	\N	\N
485	b21abe63-717f-4bd7-8570-c01a63093769	SUCCESS	\N	2024-10-28 08:21:25.958347	\N	\N	\N	\N	\N	\N	\N
629	1bbcf45f-1276-4e2b-95b5-ee347836486f	SUCCESS	\N	2024-10-28 08:31:30.111165	\N	\N	\N	\N	\N	\N	\N
633	7c709145-045a-4e89-9e95-c6d47ffca848	SUCCESS	\N	2024-10-28 08:31:35.770144	\N	\N	\N	\N	\N	\N	\N
637	485e19d4-759a-4795-ab9d-5681b83fa83c	SUCCESS	\N	2024-10-28 08:31:42.401198	\N	\N	\N	\N	\N	\N	\N
641	3d30e654-8387-4758-a51c-3996538f427a	SUCCESS	\N	2024-10-28 08:31:48.18569	\N	\N	\N	\N	\N	\N	\N
644	650cef2d-604e-42ff-aec1-73c9fe3d4275	SUCCESS	\N	2024-10-28 08:31:53.721279	\N	\N	\N	\N	\N	\N	\N
649	a34730d8-4a97-43c6-ad0e-640918305c6b	SUCCESS	\N	2024-10-30 03:30:10.443102	\N	\N	\N	\N	\N	\N	\N
652	0b1cf346-67e6-4b6b-87a9-3ca697414767	SUCCESS	\N	2024-10-30 03:30:15.953554	\N	\N	\N	\N	\N	\N	\N
656	4678baf7-8671-4010-ae44-5395a5f46b76	SUCCESS	\N	2024-10-30 03:30:20.830319	\N	\N	\N	\N	\N	\N	\N
659	09cbfd2f-e0ca-4c54-a92c-602a25dc69a0	SUCCESS	\N	2024-10-30 03:30:26.954739	\N	\N	\N	\N	\N	\N	\N
662	efdaf47c-bd2a-469b-a10c-42bb8e33d7b6	SUCCESS	\N	2024-10-30 03:35:09.739002	\N	\N	\N	\N	\N	\N	\N
666	2eb6cf26-b56a-45b0-beba-76ba42ceb01b	SUCCESS	\N	2024-10-30 03:35:11.213803	\N	\N	\N	\N	\N	\N	\N
668	8d520a35-7069-4fc2-aafc-26142eb79ebc	SUCCESS	\N	2024-10-30 03:35:18.369321	\N	\N	\N	\N	\N	\N	\N
672	240b6617-6df3-450d-8018-70277436794f	SUCCESS	\N	2024-10-30 03:35:26.119329	\N	\N	\N	\N	\N	\N	\N
677	8494cba7-b615-43a0-8f24-6446edb769e7	SUCCESS	\N	2024-10-30 03:35:31.208192	\N	\N	\N	\N	\N	\N	\N
681	628f85ff-bcac-4728-a509-8eb590cc0d24	SUCCESS	\N	2024-10-30 03:35:38.76756	\N	\N	\N	\N	\N	\N	\N
684	4b6598f6-4d1e-4c52-ad24-ba014d911f8b	SUCCESS	\N	2024-10-30 03:35:42.656729	\N	\N	\N	\N	\N	\N	\N
688	6245f9f9-d741-4d9d-84ec-a8c962c4ed11	SUCCESS	\N	2024-10-30 03:35:45.983143	\N	\N	\N	\N	\N	\N	\N
691	8905cac2-fea9-4d56-89e7-b9111e5dd88c	SUCCESS	\N	2024-10-30 03:35:53.459062	\N	\N	\N	\N	\N	\N	\N
695	86c7a6fb-04d3-49df-9265-aef3c43a1f5e	SUCCESS	\N	2024-10-30 03:36:02.619251	\N	\N	\N	\N	\N	\N	\N
699	4222a9db-7450-482a-9007-755642139604	SUCCESS	\N	2024-10-30 03:36:03.957548	\N	\N	\N	\N	\N	\N	\N
702	e979f39a-bd12-4baa-817c-315bd7e8c0bc	SUCCESS	\N	2024-10-30 03:36:10.268264	\N	\N	\N	\N	\N	\N	\N
706	7d179c68-aeb3-4197-a865-f6a7d2afdeaf	SUCCESS	\N	2024-10-30 03:36:17.176083	\N	\N	\N	\N	\N	\N	\N
859	e3ec89d6-e280-4bad-b1a5-81b1400c01fb	SUCCESS	\N	2024-10-30 03:50:45.47292	\N	\N	\N	\N	\N	\N	\N
863	112f14d5-107e-4971-8114-4137925b1657	SUCCESS	\N	2024-10-30 03:50:51.566214	\N	\N	\N	\N	\N	\N	\N
866	5766af6b-1d14-4004-87e2-cac5b10e0a7f	SUCCESS	\N	2024-10-30 03:50:54.423495	\N	\N	\N	\N	\N	\N	\N
869	04d9e98d-d8fd-42c9-80d3-460f124cbb5b	SUCCESS	\N	2024-10-30 03:50:57.365952	\N	\N	\N	\N	\N	\N	\N
872	98d563a8-9b0d-46ae-9eb8-7624a5fd980d	SUCCESS	\N	2024-10-30 03:50:59.024399	\N	\N	\N	\N	\N	\N	\N
875	61c4cef1-5d73-420a-b9f9-dfb88ec0d2c6	SUCCESS	\N	2024-10-30 03:51:00.7391	\N	\N	\N	\N	\N	\N	\N
880	c0f68a16-2429-4377-8ab4-fac777ae4795	SUCCESS	\N	2024-10-30 03:51:07.347223	\N	\N	\N	\N	\N	\N	\N
884	0b2ae048-9e74-4eec-98df-0d439a536b41	SUCCESS	\N	2024-10-30 03:51:15.711033	\N	\N	\N	\N	\N	\N	\N
889	7e1e34e6-ded8-4268-bf4b-79a2e2d7b8c6	SUCCESS	\N	2024-10-30 03:51:23.093417	\N	\N	\N	\N	\N	\N	\N
892	fe55b1ad-8acd-456b-b6aa-f4bd37ba43c0	SUCCESS	\N	2024-10-30 03:51:28.142606	\N	\N	\N	\N	\N	\N	\N
898	76580dfc-d583-4432-80db-8ecde8a6c4e8	SUCCESS	\N	2024-10-30 03:51:34.853605	\N	\N	\N	\N	\N	\N	\N
32	555424e5-2442-4822-a1e9-dbad80214ef3	SUCCESS	\N	2024-09-22 11:51:05.128288	\N	\N	\N	\N	\N	\N	\N
36	e64a8e99-1884-48ff-a984-ff8a34616fe2	SUCCESS	\N	2024-09-22 11:51:12.216335	\N	\N	\N	\N	\N	\N	\N
40	aaaaa3ec-8a00-42ab-bc77-d834b142def1	SUCCESS	\N	2024-09-22 11:51:15.187514	\N	\N	\N	\N	\N	\N	\N
43	d2736a5e-489e-4186-98f8-519f3ffcca39	SUCCESS	\N	2024-09-22 11:51:20.766241	\N	\N	\N	\N	\N	\N	\N
47	4d8a6431-3fb9-4789-bc28-224f7c174284	SUCCESS	\N	2024-09-22 11:51:27.316921	\N	\N	\N	\N	\N	\N	\N
434	0b69bb94-adf1-4aab-a5e8-c5777a3e4ac0	SUCCESS	\N	2024-10-28 03:06:21.906724	\N	\N	\N	\N	\N	\N	\N
438	b58ad08a-313b-41c9-a585-b9f2cd97d957	SUCCESS	\N	2024-10-28 08:20:11.046762	\N	\N	\N	\N	\N	\N	\N
442	445fb780-845a-41b1-a4ed-1d9a23c178c2	SUCCESS	\N	2024-10-28 08:20:16.082512	\N	\N	\N	\N	\N	\N	\N
446	03aa087f-4e1f-41cd-86d4-155757b5c4dd	SUCCESS	\N	2024-10-28 08:20:21.957897	\N	\N	\N	\N	\N	\N	\N
450	6d270938-4ee2-467e-8946-49d8f938a7a5	SUCCESS	\N	2024-10-28 08:20:28.805671	\N	\N	\N	\N	\N	\N	\N
453	b40b13bf-4268-40fa-9737-a7a0c371144b	SUCCESS	\N	2024-10-28 08:20:33.443177	\N	\N	\N	\N	\N	\N	\N
457	106bc8f9-b695-4ff9-a9b5-ea78d8a5bf56	SUCCESS	\N	2024-10-28 08:20:37.294612	\N	\N	\N	\N	\N	\N	\N
461	fbe06dc2-eb55-433b-b671-eb71573a74da	SUCCESS	\N	2024-10-28 08:20:45.560691	\N	\N	\N	\N	\N	\N	\N
465	132abc0c-0d0d-4fbf-8a7b-64b6e8b89019	SUCCESS	\N	2024-10-28 08:20:53.193831	\N	\N	\N	\N	\N	\N	\N
469	be0b31a9-f123-4244-a5a4-3db96c4b53fa	SUCCESS	\N	2024-10-28 08:20:58.411777	\N	\N	\N	\N	\N	\N	\N
473	a2deee0c-6639-47db-99d1-abafd8615eb3	SUCCESS	\N	2024-10-28 08:21:05.669804	\N	\N	\N	\N	\N	\N	\N
477	a692a9fa-1d86-47fa-b84b-2645095bf6fe	SUCCESS	\N	2024-10-28 08:21:11.416708	\N	\N	\N	\N	\N	\N	\N
482	672af837-eb70-4321-a585-d7072a3e6430	SUCCESS	\N	2024-10-28 08:21:18.663922	\N	\N	\N	\N	\N	\N	\N
486	a6aeaa3c-89eb-4e48-a971-24a16dca6b4e	SUCCESS	\N	2024-10-28 08:21:26.045178	\N	\N	\N	\N	\N	\N	\N
630	d37ac724-4dfa-4ec7-b82b-fafe174b898e	SUCCESS	\N	2024-10-28 08:31:30.891297	\N	\N	\N	\N	\N	\N	\N
634	aae308ea-8639-4130-b933-253b7c041cfd	SUCCESS	\N	2024-10-28 08:31:36.843273	\N	\N	\N	\N	\N	\N	\N
638	ae13ade2-8e72-413b-ad19-20436e06e3f0	SUCCESS	\N	2024-10-28 08:31:43.233542	\N	\N	\N	\N	\N	\N	\N
643	2224e190-f7ed-4505-be8a-a433cc5c548e	SUCCESS	\N	2024-10-28 08:31:51.164671	\N	\N	\N	\N	\N	\N	\N
647	79269840-b140-4fa5-9454-1d9083c385b7	SUCCESS	\N	2024-10-30 03:30:09.459256	\N	\N	\N	\N	\N	\N	\N
651	0257004a-de18-4b78-b4cc-bab285bf61a3	SUCCESS	\N	2024-10-30 03:30:15.575745	\N	\N	\N	\N	\N	\N	\N
655	0a3adfcf-fc67-4bd7-aeba-a2d8143e1111	SUCCESS	\N	2024-10-30 03:30:19.997762	\N	\N	\N	\N	\N	\N	\N
661	bfbe3c1a-6697-451c-a5ac-143c8b309081	SUCCESS	\N	2024-10-30 03:30:27.245051	\N	\N	\N	\N	\N	\N	\N
663	b5db8c4e-efa7-4eb8-9bf2-8420bcc3c010	SUCCESS	\N	2024-10-30 03:35:10.678374	\N	\N	\N	\N	\N	\N	\N
667	04539521-6f6c-4edf-83b3-ddec1c262007	SUCCESS	\N	2024-10-30 03:35:16.135185	\N	\N	\N	\N	\N	\N	\N
671	0c13dae5-5cfd-4972-b522-213fe2d499e4	SUCCESS	\N	2024-10-30 03:35:18.744987	\N	\N	\N	\N	\N	\N	\N
675	1baa12a6-9810-425b-8ca9-f123f244937f	SUCCESS	\N	2024-10-30 03:35:26.520183	\N	\N	\N	\N	\N	\N	\N
679	76494a02-25d6-4cba-b2e0-90a8ecd0ea67	SUCCESS	\N	2024-10-30 03:35:33.675393	\N	\N	\N	\N	\N	\N	\N
683	dd23bb52-8154-49c7-a271-83dc6b01823a	SUCCESS	\N	2024-10-30 03:35:39.838078	\N	\N	\N	\N	\N	\N	\N
687	4fbc0cc9-e7b6-4325-b283-767261eedf7e	SUCCESS	\N	2024-10-30 03:35:45.719994	\N	\N	\N	\N	\N	\N	\N
692	55ce2d40-9c47-4b82-b475-73563a78c1e8	SUCCESS	\N	2024-10-30 03:35:53.563405	\N	\N	\N	\N	\N	\N	\N
697	b20b5ee4-ed12-4f19-acc7-01ffbfd6f815	SUCCESS	\N	2024-10-30 03:36:02.979351	\N	\N	\N	\N	\N	\N	\N
703	3b1fe71a-c43b-4e6e-8a21-00060ec90215	SUCCESS	\N	2024-10-30 03:36:10.280079	\N	\N	\N	\N	\N	\N	\N
707	f61ccea4-59b7-4d9f-bc63-fe0f1f347a49	SUCCESS	\N	2024-10-30 03:36:17.598726	\N	\N	\N	\N	\N	\N	\N
860	d9d8f948-790f-42ba-b594-9f026d566d35	SUCCESS	\N	2024-10-30 03:50:45.509782	\N	\N	\N	\N	\N	\N	\N
876	2fab7492-9db5-4d45-87a9-c9c46a5b8146	SUCCESS	\N	2024-10-30 03:51:00.951956	\N	\N	\N	\N	\N	\N	\N
878	f37b0a4b-7fc3-4bb1-872d-e6b14b069b39	SUCCESS	\N	2024-10-30 03:51:07.029141	\N	\N	\N	\N	\N	\N	\N
882	d7330d95-a8f2-46bb-981a-8ea644d44036	SUCCESS	\N	2024-10-30 03:51:13.35901	\N	\N	\N	\N	\N	\N	\N
886	2bccf56f-728a-4adc-848e-5044f24b0b04	SUCCESS	\N	2024-10-30 03:51:16.114799	\N	\N	\N	\N	\N	\N	\N
888	b2ff0814-5bad-49a3-8698-d3ef955e688e	SUCCESS	\N	2024-10-30 03:51:23.017277	\N	\N	\N	\N	\N	\N	\N
891	b261797d-e79b-4fc6-80ec-9012a3d765e2	SUCCESS	\N	2024-10-30 03:51:27.697482	\N	\N	\N	\N	\N	\N	\N
895	abdb0a25-5a4d-4cb0-abb5-7319916b5e04	SUCCESS	\N	2024-10-30 03:51:28.652672	\N	\N	\N	\N	\N	\N	\N
899	f1734f38-9db3-4763-b7a2-4830005a32fd	SUCCESS	\N	2024-10-30 03:51:35.153049	\N	\N	\N	\N	\N	\N	\N
901	79303dc5-c460-402a-9d59-50fa41019818	SUCCESS	\N	2024-10-30 03:51:42.733258	\N	\N	\N	\N	\N	\N	\N
905	0dc79e00-9b14-4d24-a84e-d515351912b6	SUCCESS	\N	2024-10-30 03:51:48.526043	\N	\N	\N	\N	\N	\N	\N
909	2ce9fe90-82da-47bf-ab8e-aecf9a919146	SUCCESS	\N	2024-10-30 03:51:50.928688	\N	\N	\N	\N	\N	\N	\N
913	8330e8c0-16e2-4b73-b7ff-e17d4bb9a5a0	SUCCESS	\N	2024-10-30 03:51:59.121452	\N	\N	\N	\N	\N	\N	\N
918	b6ca4495-b9d9-4327-ae4a-f361fac6358a	SUCCESS	\N	2024-10-31 00:17:28.963695	\N	\N	\N	\N	\N	\N	\N
920	ca24490b-08b3-4d92-ac68-eb05b2526224	SUCCESS	\N	2024-10-31 00:21:15.465712	\N	\N	\N	\N	\N	\N	\N
924	0d544a14-5b81-4c18-9379-0ee8ec26d4eb	SUCCESS	\N	2024-10-31 03:55:10.365908	\N	\N	\N	\N	\N	\N	\N
33	17c55603-c91c-4e92-9447-602666d9c769	SUCCESS	\N	2024-09-22 11:51:06.274125	\N	\N	\N	\N	\N	\N	\N
37	aaf5c707-8058-49b0-ad14-fb5e51b4dd72	SUCCESS	\N	2024-09-22 11:51:13.594361	\N	\N	\N	\N	\N	\N	\N
41	d46dccb8-4e70-4177-8079-1d6841827561	SUCCESS	\N	2024-09-22 11:51:19.259451	\N	\N	\N	\N	\N	\N	\N
45	6dfb9d26-983f-4640-ae9d-7f3eaf80075f	SUCCESS	\N	2024-09-22 11:51:25.587825	\N	\N	\N	\N	\N	\N	\N
49	3bde7378-261c-4125-8175-8710749aa844	SUCCESS	\N	2024-09-22 11:51:31.370503	\N	\N	\N	\N	\N	\N	\N
435	4f651b36-ebaa-4d2d-8d95-67f369f120fa	SUCCESS	\N	2024-10-28 03:06:21.98224	\N	\N	\N	\N	\N	\N	\N
437	1ac57689-f5fb-42b8-9b10-85496eabb15c	SUCCESS	\N	2024-10-28 08:20:10.251713	\N	\N	\N	\N	\N	\N	\N
441	df4cb6f1-fbd3-4bc2-8c86-7c53fd9125cd	SUCCESS	\N	2024-10-28 08:20:15.100761	\N	\N	\N	\N	\N	\N	\N
445	ef865ab5-d076-4a0b-8160-10da6e07d0bb	SUCCESS	\N	2024-10-28 08:20:20.733826	\N	\N	\N	\N	\N	\N	\N
449	be7f0412-7fbd-4d4a-b266-7a9619bb0d54	SUCCESS	\N	2024-10-28 08:20:28.658543	\N	\N	\N	\N	\N	\N	\N
454	e2bcbc66-bfbe-4021-acae-c32b7ab5da01	SUCCESS	\N	2024-10-28 08:20:36.387062	\N	\N	\N	\N	\N	\N	\N
458	76ee3fce-9605-40c3-b1e2-27ecc0111d8e	SUCCESS	\N	2024-10-28 08:20:41.319694	\N	\N	\N	\N	\N	\N	\N
462	76bff6ac-2c67-4e3b-93cb-d5b25ea715c9	SUCCESS	\N	2024-10-28 08:20:49.359611	\N	\N	\N	\N	\N	\N	\N
466	73ed5493-be05-4902-a303-02d0571d72cb	SUCCESS	\N	2024-10-28 08:20:55.838611	\N	\N	\N	\N	\N	\N	\N
470	dd044ac7-79ae-4137-9e96-9b51bf3919a2	SUCCESS	\N	2024-10-28 08:21:00.903605	\N	\N	\N	\N	\N	\N	\N
474	16284720-c73c-43fe-aaf5-7e3312f91127	SUCCESS	\N	2024-10-28 08:21:08.245232	\N	\N	\N	\N	\N	\N	\N
478	080d1368-1220-4f70-b871-59be81d4e992	SUCCESS	\N	2024-10-28 08:21:12.22282	\N	\N	\N	\N	\N	\N	\N
480	1869004d-49f6-4a0d-a8f4-cc2f42c717e2	SUCCESS	\N	2024-10-28 08:21:18.38474	\N	\N	\N	\N	\N	\N	\N
484	cd000ae2-21c8-428f-bcaf-265e1811494f	SUCCESS	\N	2024-10-28 08:21:25.726192	\N	\N	\N	\N	\N	\N	\N
631	8158b74b-b71b-4b08-9b56-2e511b210b37	SUCCESS	\N	2024-10-28 08:31:32.132306	\N	\N	\N	\N	\N	\N	\N
635	5a85924c-5fa5-44ba-a125-662f3711ff49	SUCCESS	\N	2024-10-28 08:31:37.546213	\N	\N	\N	\N	\N	\N	\N
639	18593e7b-8b05-49ad-b1aa-3f21ac529bb9	SUCCESS	\N	2024-10-28 08:31:43.320227	\N	\N	\N	\N	\N	\N	\N
642	ce00159a-c9da-40d1-a0bd-d053b659cbbe	SUCCESS	\N	2024-10-28 08:31:50.829667	\N	\N	\N	\N	\N	\N	\N
646	87d66034-865f-4327-b62a-96b3ab98b885	SUCCESS	\N	2024-10-28 08:31:53.793384	\N	\N	\N	\N	\N	\N	\N
650	e4fa9ddc-bd6f-4e20-b249-9b4ba70a947b	SUCCESS	\N	2024-10-30 03:30:11.374081	\N	\N	\N	\N	\N	\N	\N
654	579adff8-0217-43c3-9572-bcf81d86835a	SUCCESS	\N	2024-10-30 03:30:18.627021	\N	\N	\N	\N	\N	\N	\N
657	effb4627-2252-4b42-a3dd-f2ee4cec2fa3	SUCCESS	\N	2024-10-30 03:30:25.188282	\N	\N	\N	\N	\N	\N	\N
660	fd2c48e1-bc56-4d02-97cd-51e76e01ac8b	SUCCESS	\N	2024-10-30 03:30:27.235246	\N	\N	\N	\N	\N	\N	\N
665	dcdebb9f-d4ef-4db3-a34c-4b79afea01af	SUCCESS	\N	2024-10-30 03:35:11.169556	\N	\N	\N	\N	\N	\N	\N
670	f493973b-d61e-463c-a14d-43d0b09562c8	SUCCESS	\N	2024-10-30 03:35:18.566994	\N	\N	\N	\N	\N	\N	\N
673	39f3c7ec-0258-4478-a02b-be5f79fa0993	SUCCESS	\N	2024-10-30 03:35:26.205831	\N	\N	\N	\N	\N	\N	\N
676	356e8ddd-6c88-47a0-bb96-d7effe8a2cc3	SUCCESS	\N	2024-10-30 03:35:31.096928	\N	\N	\N	\N	\N	\N	\N
680	0de2f065-3bb4-4f56-803b-1c5d052d3248	SUCCESS	\N	2024-10-30 03:35:38.747305	\N	\N	\N	\N	\N	\N	\N
685	5d4ab397-d4ae-469f-86d9-32f73e0cb7b2	SUCCESS	\N	2024-10-30 03:35:45.467773	\N	\N	\N	\N	\N	\N	\N
690	e98d4f1d-3df3-4d26-95f6-3eb34d9b823f	SUCCESS	\N	2024-10-30 03:35:53.098968	\N	\N	\N	\N	\N	\N	\N
694	3ef51658-e9d2-4a94-b827-d7b5541f52c0	SUCCESS	\N	2024-10-30 03:35:54.84789	\N	\N	\N	\N	\N	\N	\N
696	adb7001f-edfa-4ed2-a1aa-14ced8f51570	SUCCESS	\N	2024-10-30 03:36:02.885726	\N	\N	\N	\N	\N	\N	\N
701	ff5af6a3-96c2-4c59-adf8-068a9f2d4deb	SUCCESS	\N	2024-10-30 03:36:09.83294	\N	\N	\N	\N	\N	\N	\N
704	d7b9abfb-f2fc-43b1-b934-7b9a1a624f16	SUCCESS	\N	2024-10-30 03:36:15.007851	\N	\N	\N	\N	\N	\N	\N
708	4bd65137-6c93-449f-927f-09eedaa5fbec	SUCCESS	\N	2024-10-30 03:36:17.621337	\N	\N	\N	\N	\N	\N	\N
903	41b06282-fc58-45cf-a944-713e4bf15e20	SUCCESS	\N	2024-10-30 03:51:43.093984	\N	\N	\N	\N	\N	\N	\N
907	266e5efd-c214-46f7-80ff-31c280b5b682	SUCCESS	\N	2024-10-30 03:51:48.993613	\N	\N	\N	\N	\N	\N	\N
911	b5488ba5-f890-4d86-9db5-196b66bf156c	SUCCESS	\N	2024-10-30 03:51:55.852926	\N	\N	\N	\N	\N	\N	\N
914	6cb09566-10da-4938-9b6d-a4825dc0715d	SUCCESS	\N	2024-10-30 03:52:00.853188	\N	\N	\N	\N	\N	\N	\N
921	68cd3125-7e28-4238-a7c5-339d525b6e28	SUCCESS	\N	2024-10-31 03:55:09.770731	\N	\N	\N	\N	\N	\N	\N
35	9edea3e3-ac2c-406d-879e-866064a2d23b	SUCCESS	\N	2024-09-22 11:51:09.611676	\N	\N	\N	\N	\N	\N	\N
39	b76f9c6a-83a1-4f0c-86ef-862e39f95466	SUCCESS	\N	2024-09-22 11:51:14.440683	\N	\N	\N	\N	\N	\N	\N
44	bd322d37-df25-48a5-95e1-c236c2cb64a6	SUCCESS	\N	2024-09-22 11:51:21.892458	\N	\N	\N	\N	\N	\N	\N
48	34f061dd-9113-42fb-9559-20b7651a7a68	SUCCESS	\N	2024-09-22 11:51:28.427878	\N	\N	\N	\N	\N	\N	\N
51	1b7ee1da-3c53-487b-b559-4645bdd32d0f	SUCCESS	\N	2024-09-22 11:51:33.698452	\N	\N	\N	\N	\N	\N	\N
52	43e3304e-412d-41ee-8d35-4edd800fd760	SUCCESS	\N	2024-09-22 11:51:35.734801	\N	\N	\N	\N	\N	\N	\N
53	5e0cb413-b62d-49b1-9b7e-fde5fae099a4	SUCCESS	\N	2024-09-22 11:51:37.162007	\N	\N	\N	\N	\N	\N	\N
54	88496c26-70a3-480f-82bf-9b0ebc07a77a	SUCCESS	\N	2024-09-22 11:51:38.243668	\N	\N	\N	\N	\N	\N	\N
55	43c78bd6-48d0-452c-b0cc-e191425e1205	SUCCESS	\N	2024-09-22 11:51:38.489878	\N	\N	\N	\N	\N	\N	\N
56	f8fd0fac-c656-48a7-9137-4ec1d5918f88	SUCCESS	\N	2024-09-22 11:51:41.191175	\N	\N	\N	\N	\N	\N	\N
57	e1928d02-4a47-48eb-b6c5-39fa2001d218	SUCCESS	\N	2024-09-22 11:51:41.33562	\N	\N	\N	\N	\N	\N	\N
58	929580f5-44fb-4f2e-9149-7f6689239e1a	SUCCESS	\N	2024-09-22 11:51:46.06249	\N	\N	\N	\N	\N	\N	\N
59	6d58523e-6ede-477a-80fb-7775b2a4734b	SUCCESS	\N	2024-09-22 11:51:46.730897	\N	\N	\N	\N	\N	\N	\N
60	e3cf4294-b498-4c12-b613-d068b5b7b4f0	SUCCESS	\N	2024-09-22 11:51:48.984232	\N	\N	\N	\N	\N	\N	\N
61	3aa2edc0-b864-42b1-b65c-648fa6a3ed92	SUCCESS	\N	2024-09-22 11:51:49.648458	\N	\N	\N	\N	\N	\N	\N
62	2fb4543d-54fd-4b78-847f-5f5b2e1b5e87	SUCCESS	\N	2024-09-22 11:51:53.684733	\N	\N	\N	\N	\N	\N	\N
63	6cab20de-f7df-4fea-b77f-0dbb4b0b15dc	SUCCESS	\N	2024-09-22 11:51:54.273546	\N	\N	\N	\N	\N	\N	\N
64	0bcc0d20-177d-4d9e-9c8b-b638210b7d2d	SUCCESS	\N	2024-09-22 11:51:56.03283	\N	\N	\N	\N	\N	\N	\N
65	924c01b0-9fed-43a3-85ed-c9c1a1227955	SUCCESS	\N	2024-09-22 11:51:56.399857	\N	\N	\N	\N	\N	\N	\N
66	e7af1c0b-1866-41d3-b37b-3b2178de561d	SUCCESS	\N	2024-09-22 11:51:59.982539	\N	\N	\N	\N	\N	\N	\N
67	a86ca168-175d-488b-85ea-8e087736aab3	SUCCESS	\N	2024-09-22 11:52:00.273294	\N	\N	\N	\N	\N	\N	\N
68	47e45c6c-4b8e-4308-82d8-0afa21dc27fe	SUCCESS	\N	2024-09-22 11:52:02.121098	\N	\N	\N	\N	\N	\N	\N
69	e85dec3b-3172-4c80-ac0c-019c0ad21a6c	SUCCESS	\N	2024-09-22 11:52:05.404231	\N	\N	\N	\N	\N	\N	\N
70	63d731a0-9ed6-47cd-baba-9a86625e31a9	SUCCESS	\N	2024-09-22 11:52:07.268142	\N	\N	\N	\N	\N	\N	\N
71	fb1da266-05d2-4790-b2af-7b05b175e0ef	SUCCESS	\N	2024-09-22 11:52:08.233084	\N	\N	\N	\N	\N	\N	\N
72	05ec9f42-27bb-474e-a3a0-14caa5497242	SUCCESS	\N	2024-09-22 11:52:08.616933	\N	\N	\N	\N	\N	\N	\N
73	51fd556d-c091-4356-a377-26c5355b3033	SUCCESS	\N	2024-09-22 11:52:09.567257	\N	\N	\N	\N	\N	\N	\N
74	b9d86566-78ae-4290-a8c3-285fa766ca07	SUCCESS	\N	2024-09-22 11:52:13.102814	\N	\N	\N	\N	\N	\N	\N
75	0add76f3-65d7-46a1-a367-c0e7c9c44d6a	SUCCESS	\N	2024-09-22 11:52:14.255413	\N	\N	\N	\N	\N	\N	\N
76	c8e94a0d-7ce8-409a-b714-75284364f052	SUCCESS	\N	2024-09-22 11:52:14.414691	\N	\N	\N	\N	\N	\N	\N
77	99f8e951-a189-4301-a84e-da9738c82cb9	SUCCESS	\N	2024-09-22 11:52:14.421434	\N	\N	\N	\N	\N	\N	\N
78	5786534e-7dea-4070-a5cc-9c8defa32856	SUCCESS	\N	2024-09-22 11:55:09.129047	\N	\N	\N	\N	\N	\N	\N
79	c5b11cb4-42f8-43d2-bd75-ccc0bbd4e3d6	SUCCESS	\N	2024-09-22 11:55:10.177256	\N	\N	\N	\N	\N	\N	\N
80	7f7b9838-c45b-4a9d-8aa8-27efa3d27ae3	SUCCESS	\N	2024-09-22 11:55:10.757059	\N	\N	\N	\N	\N	\N	\N
81	8acea092-83ff-4c2c-806b-f31527edf45f	SUCCESS	\N	2024-09-22 11:55:11.997697	\N	\N	\N	\N	\N	\N	\N
82	95020cc8-753c-4f25-9d5c-cf70f324e924	SUCCESS	\N	2024-09-22 11:55:13.96141	\N	\N	\N	\N	\N	\N	\N
83	6b063ec4-6b64-4380-9db7-ab1cf4cb1e1c	SUCCESS	\N	2024-09-22 11:55:15.950811	\N	\N	\N	\N	\N	\N	\N
84	94cf3866-1cb9-4a96-807d-8295dcb62cc9	SUCCESS	\N	2024-09-22 11:55:16.002824	\N	\N	\N	\N	\N	\N	\N
85	683a41d0-093b-4238-a654-7166b1c2ca9d	SUCCESS	\N	2024-09-22 11:55:18.708299	\N	\N	\N	\N	\N	\N	\N
86	48202cc9-33b2-4a27-8e15-6b13bb85c7f3	SUCCESS	\N	2024-09-22 11:55:19.013879	\N	\N	\N	\N	\N	\N	\N
87	bda3ff46-85e5-45e6-9341-4ea6e1229aa0	SUCCESS	\N	2024-09-22 11:55:21.277678	\N	\N	\N	\N	\N	\N	\N
88	554164f7-e0b9-43f4-8980-fe2c47029387	SUCCESS	\N	2024-09-22 11:55:21.89723	\N	\N	\N	\N	\N	\N	\N
89	bd08632c-8fc2-4a76-9cb6-13fcc00b9945	SUCCESS	\N	2024-09-22 11:55:23.484165	\N	\N	\N	\N	\N	\N	\N
90	cccd058f-74b7-4cc3-88e5-89242754493c	SUCCESS	\N	2024-09-22 11:55:26.618155	\N	\N	\N	\N	\N	\N	\N
91	c1af9d10-102c-4e8e-ae44-e862be42602b	SUCCESS	\N	2024-09-22 11:55:29.204918	\N	\N	\N	\N	\N	\N	\N
92	1b5549ae-e2ea-4c02-be8c-c0632bd660bc	SUCCESS	\N	2024-09-22 11:55:29.959748	\N	\N	\N	\N	\N	\N	\N
93	e5ffb235-c255-443f-a81f-c839f7a4df63	SUCCESS	\N	2024-09-22 11:55:30.50017	\N	\N	\N	\N	\N	\N	\N
94	c7f4e9c1-4753-40c5-8594-a27a086029e9	SUCCESS	\N	2024-09-22 11:55:30.534449	\N	\N	\N	\N	\N	\N	\N
95	3c93a824-dd56-482e-92fe-ab321fc2158e	SUCCESS	\N	2024-09-22 11:55:31.409695	\N	\N	\N	\N	\N	\N	\N
96	81d0031f-7001-4d4f-b6f9-b7bba7f49c22	SUCCESS	\N	2024-09-22 11:55:36.292822	\N	\N	\N	\N	\N	\N	\N
97	f413f2d3-52fc-47a7-ba96-e4dad852ac3e	SUCCESS	\N	2024-09-22 11:55:37.216054	\N	\N	\N	\N	\N	\N	\N
98	3524a143-baed-4c5d-af03-e092bf2feaba	SUCCESS	\N	2024-09-22 11:55:38.711136	\N	\N	\N	\N	\N	\N	\N
99	0702df0f-87cb-43d4-b638-0261e7aba1a0	SUCCESS	\N	2024-09-22 11:55:38.984686	\N	\N	\N	\N	\N	\N	\N
100	ac8f952f-e876-463e-9333-85e0641cd9a4	SUCCESS	\N	2024-09-22 11:55:43.143238	\N	\N	\N	\N	\N	\N	\N
101	1c4d05b8-7fbf-43c7-a7c6-f9c6e553a236	SUCCESS	\N	2024-09-22 11:55:44.7432	\N	\N	\N	\N	\N	\N	\N
102	ef4f22c6-ed4c-435c-b79d-a0ef529dfb13	SUCCESS	\N	2024-09-22 11:55:46.60132	\N	\N	\N	\N	\N	\N	\N
103	0d6db481-1b5a-4ce4-ba20-08fcdde02e33	SUCCESS	\N	2024-09-22 11:55:46.968752	\N	\N	\N	\N	\N	\N	\N
104	1c562714-902f-43be-9b56-3b1cd7307692	SUCCESS	\N	2024-09-22 11:55:51.410505	\N	\N	\N	\N	\N	\N	\N
105	d9394389-c9dd-432f-a0b0-91fa51bef78b	SUCCESS	\N	2024-09-22 11:55:51.74411	\N	\N	\N	\N	\N	\N	\N
106	8bc18bb3-bd0b-47b2-9f07-11140d4476a6	SUCCESS	\N	2024-09-22 11:55:53.494363	\N	\N	\N	\N	\N	\N	\N
107	c2efe655-2f70-4443-a1cd-9b5c19fe72b5	SUCCESS	\N	2024-09-22 11:55:53.792105	\N	\N	\N	\N	\N	\N	\N
108	dbb02aa2-ef9e-40ea-abd3-bfae40b1516f	SUCCESS	\N	2024-09-22 11:55:59.804842	\N	\N	\N	\N	\N	\N	\N
109	a8edea77-fbb8-4907-8365-4fe031c77092	SUCCESS	\N	2024-09-22 11:55:59.871874	\N	\N	\N	\N	\N	\N	\N
110	86a05b3b-d856-496a-b6fb-f2774e9e17d4	SUCCESS	\N	2024-09-22 11:56:01.292039	\N	\N	\N	\N	\N	\N	\N
111	bf735fca-1338-49bf-84e5-e3b9a0e01900	SUCCESS	\N	2024-09-22 11:56:01.985856	\N	\N	\N	\N	\N	\N	\N
112	eeb23ab1-e964-435a-a4be-d1832a509491	SUCCESS	\N	2024-09-22 11:56:06.859119	\N	\N	\N	\N	\N	\N	\N
113	97d85eef-b817-4196-811a-a344c657febf	SUCCESS	\N	2024-09-22 11:56:06.961715	\N	\N	\N	\N	\N	\N	\N
114	e12c23dd-d054-40ce-93b8-d099a02a685e	SUCCESS	\N	2024-09-22 11:56:07.535274	\N	\N	\N	\N	\N	\N	\N
115	15154433-94f6-4834-becc-2f7b3cd06d08	SUCCESS	\N	2024-09-22 11:56:07.558321	\N	\N	\N	\N	\N	\N	\N
116	616ebf32-f2d8-430d-a858-3a78000f242a	SUCCESS	\N	2024-09-22 11:56:13.406223	\N	\N	\N	\N	\N	\N	\N
117	e99881bb-9a44-4b6c-9b72-51ac2f918bab	SUCCESS	\N	2024-09-22 11:56:14.90832	\N	\N	\N	\N	\N	\N	\N
118	c6d109b5-8dcf-4e50-b850-5fc0ed1a1bf5	SUCCESS	\N	2024-09-22 11:56:14.992369	\N	\N	\N	\N	\N	\N	\N
119	ac323bfd-93ac-4e67-a2f7-0985645a4815	SUCCESS	\N	2024-09-22 11:56:15.028412	\N	\N	\N	\N	\N	\N	\N
120	24a2b398-1f66-4a80-8500-7e2227814eb3	SUCCESS	\N	2024-09-22 11:56:15.229122	\N	\N	\N	\N	\N	\N	\N
121	51198071-1638-4aa3-b236-2ac43e03159a	SUCCESS	\N	2024-09-22 11:56:21.918567	\N	\N	\N	\N	\N	\N	\N
122	0ec2dcd4-2ff5-4ed1-a0a8-61505fddbdf2	SUCCESS	\N	2024-09-22 11:56:22.175457	\N	\N	\N	\N	\N	\N	\N
123	9f86dbc6-5329-4ba0-9731-4937e60104dc	SUCCESS	\N	2024-09-22 11:56:22.824889	\N	\N	\N	\N	\N	\N	\N
124	63a7eb14-2e1f-4cbb-aa3f-cad0769f9ee0	SUCCESS	\N	2024-09-22 11:56:23.354426	\N	\N	\N	\N	\N	\N	\N
128	bda77cda-f3a2-473b-ae26-98e6172bc38f	SUCCESS	\N	2024-09-22 11:56:30.170296	\N	\N	\N	\N	\N	\N	\N
436	f8ade83d-0be9-4462-99fc-a036944ad855	SUCCESS	\N	2024-10-28 03:06:21.988726	\N	\N	\N	\N	\N	\N	\N
440	7f7878e3-1f39-45b5-9b0f-4b93a6bdbf97	SUCCESS	\N	2024-10-28 08:20:11.969598	\N	\N	\N	\N	\N	\N	\N
443	8bce8a39-d505-4edc-a75c-8039fad28996	SUCCESS	\N	2024-10-28 08:20:18.345899	\N	\N	\N	\N	\N	\N	\N
447	ec6ab1de-1eb5-49cf-a1f2-d691d62761c9	SUCCESS	\N	2024-10-28 08:20:23.764739	\N	\N	\N	\N	\N	\N	\N
452	61736028-ecc0-480f-bc70-90572e517a9b	SUCCESS	\N	2024-10-28 08:20:29.843084	\N	\N	\N	\N	\N	\N	\N
456	8aca404f-e526-4a76-bf0d-0af34cf01289	SUCCESS	\N	2024-10-28 08:20:36.857962	\N	\N	\N	\N	\N	\N	\N
459	c26e8861-c6c4-4e23-acfd-d77528fce10b	SUCCESS	\N	2024-10-28 08:20:44.00012	\N	\N	\N	\N	\N	\N	\N
463	5acd404f-7a56-4978-b11a-6fa28e7cfcaf	SUCCESS	\N	2024-10-28 08:20:49.964439	\N	\N	\N	\N	\N	\N	\N
467	a2ab4246-e03b-482c-b82e-df10e0dff207	SUCCESS	\N	2024-10-28 08:20:57.570816	\N	\N	\N	\N	\N	\N	\N
472	c76c971f-095c-4ce2-bf95-d063846843c8	SUCCESS	\N	2024-10-28 08:21:05.229525	\N	\N	\N	\N	\N	\N	\N
475	c60e0b68-75a7-430a-bf10-503a79a2bced	SUCCESS	\N	2024-10-28 08:21:10.748744	\N	\N	\N	\N	\N	\N	\N
479	2dccc97a-6b13-46b3-b63d-62298a973454	SUCCESS	\N	2024-10-28 08:21:18.131784	\N	\N	\N	\N	\N	\N	\N
483	7bf677b0-45ee-4934-83fd-d2b219dc11fc	SUCCESS	\N	2024-10-28 08:21:20.937353	\N	\N	\N	\N	\N	\N	\N
487	1ac4258d-a4e6-4af1-8e67-1fcb3954b554	SUCCESS	\N	2024-10-28 08:21:26.143598	\N	\N	\N	\N	\N	\N	\N
632	d07b9c0c-87c1-4484-8a6a-4415282ce49b	SUCCESS	\N	2024-10-28 08:31:34.186806	\N	\N	\N	\N	\N	\N	\N
636	cd00785c-1319-414d-9e1b-e189acc1e7b5	SUCCESS	\N	2024-10-28 08:31:41.31111	\N	\N	\N	\N	\N	\N	\N
640	2ef735f2-b67b-4822-b97f-b6edba562c38	SUCCESS	\N	2024-10-28 08:31:47.847823	\N	\N	\N	\N	\N	\N	\N
645	bc860bfe-97cd-4edf-9743-bdb81ee03bb0	SUCCESS	\N	2024-10-28 08:31:53.736389	\N	\N	\N	\N	\N	\N	\N
648	87893e26-81bd-4c9c-b427-97c750fd3193	SUCCESS	\N	2024-10-30 03:30:09.92064	\N	\N	\N	\N	\N	\N	\N
653	f0343fa2-dc6a-42f1-8325-3e88e6217ff2	SUCCESS	\N	2024-10-30 03:30:18.122372	\N	\N	\N	\N	\N	\N	\N
658	33b33020-6c48-46bb-83bf-8d405f3b5845	SUCCESS	\N	2024-10-30 03:30:26.670229	\N	\N	\N	\N	\N	\N	\N
664	82ac28e2-ad6e-4b2f-8307-a448b3331a51	SUCCESS	\N	2024-10-30 03:35:10.895049	\N	\N	\N	\N	\N	\N	\N
669	1b5ee7cf-fb27-4211-a9c9-af0b6a5c2eb4	SUCCESS	\N	2024-10-30 03:35:18.548656	\N	\N	\N	\N	\N	\N	\N
674	17332262-cbe5-4431-8106-fcc03629d8a1	SUCCESS	\N	2024-10-30 03:35:26.475503	\N	\N	\N	\N	\N	\N	\N
678	739e188d-0ff0-48bb-acba-a1f5d65b4cb8	SUCCESS	\N	2024-10-30 03:35:33.198104	\N	\N	\N	\N	\N	\N	\N
682	c8bb6373-c269-45f3-b599-e4212274f6bb	SUCCESS	\N	2024-10-30 03:35:39.626988	\N	\N	\N	\N	\N	\N	\N
686	3bbe798f-71dc-402a-99e8-db55d1d8cd32	SUCCESS	\N	2024-10-30 03:35:45.540966	\N	\N	\N	\N	\N	\N	\N
689	aefd14be-9e59-4773-ab32-c254bb7478d5	SUCCESS	\N	2024-10-30 03:35:52.456869	\N	\N	\N	\N	\N	\N	\N
693	8e9ffe3f-ad4e-4510-8186-fb588b06cc98	SUCCESS	\N	2024-10-30 03:35:53.837506	\N	\N	\N	\N	\N	\N	\N
698	ba4f1efe-2eca-419a-ae08-1d518b463a36	SUCCESS	\N	2024-10-30 03:36:02.983945	\N	\N	\N	\N	\N	\N	\N
700	77effa53-c3fd-4bb3-b327-dfa2e9df10d8	SUCCESS	\N	2024-10-30 03:36:09.792123	\N	\N	\N	\N	\N	\N	\N
705	545367ec-ded6-47a3-ab6b-7b920fdf2d40	SUCCESS	\N	2024-10-30 03:36:16.701465	\N	\N	\N	\N	\N	\N	\N
925	6bb77ed6-253c-41bd-9770-8f76c00af361	SUCCESS	\N	2024-10-31 03:55:14.56448	\N	\N	\N	\N	\N	\N	\N
929	84a44dc6-fbe8-4bc8-afcf-a0e1729e6797	SUCCESS	\N	2024-10-31 03:55:20.763486	\N	\N	\N	\N	\N	\N	\N
933	50de0ad6-5ea9-46eb-b277-de8fe58777de	SUCCESS	\N	2024-10-31 03:55:27.804567	\N	\N	\N	\N	\N	\N	\N
937	97d767fe-4b8c-4de3-802f-9fe8d82c6cd3	SUCCESS	\N	2024-10-31 03:55:33.783694	\N	\N	\N	\N	\N	\N	\N
942	4258c111-1fc4-4198-bb1a-97d1842aa2ac	SUCCESS	\N	2024-10-31 03:55:40.936977	\N	\N	\N	\N	\N	\N	\N
946	eb624b36-b2ef-49d5-8790-739f201dd615	SUCCESS	\N	2024-10-31 03:55:47.376907	\N	\N	\N	\N	\N	\N	\N
950	b9cc885c-e3d3-4e86-a214-b2e0a694cc56	SUCCESS	\N	2024-10-31 03:55:53.693026	\N	\N	\N	\N	\N	\N	\N
954	a07aae8c-698e-49aa-a4ff-addb1bfe5cc5	SUCCESS	\N	2024-10-31 03:55:59.180099	\N	\N	\N	\N	\N	\N	\N
958	2fa83396-f1bc-49eb-9d36-eca7d25d419d	SUCCESS	\N	2024-10-31 03:56:06.430515	\N	\N	\N	\N	\N	\N	\N
962	83b63b3f-7443-4653-9069-7ef68b42a8d8	SUCCESS	\N	2024-10-31 03:56:13.650335	\N	\N	\N	\N	\N	\N	\N
966	f3c37a2e-5ff1-422e-a0d5-dd21f600667f	SUCCESS	\N	2024-10-31 03:56:21.119261	\N	\N	\N	\N	\N	\N	\N
969	8e72ce87-2ebf-4704-af18-3e583647be11	SUCCESS	\N	2024-10-31 03:56:23.654659	\N	\N	\N	\N	\N	\N	\N
972	9ffbbc8c-58a1-4e7e-acc9-877e342d3a41	SUCCESS	\N	2024-10-31 04:00:10.843605	\N	\N	\N	\N	\N	\N	\N
977	2f9ecf28-e974-40c2-8f4e-b82c55afd269	SUCCESS	\N	2024-10-31 04:00:19.411352	\N	\N	\N	\N	\N	\N	\N
983	7d8dd5b7-7ae2-4bd6-be17-d002a2fdced1	SUCCESS	\N	2024-10-31 04:00:26.845965	\N	\N	\N	\N	\N	\N	\N
986	8205aec5-64b8-4323-9533-310bfeef7353	SUCCESS	\N	2024-10-31 04:00:34.160739	\N	\N	\N	\N	\N	\N	\N
991	ca90d76b-88b8-4171-a88e-45664552c8c3	SUCCESS	\N	2024-10-31 04:00:42.102601	\N	\N	\N	\N	\N	\N	\N
994	6661a734-fe0b-4a2c-8aeb-fad71154c940	SUCCESS	\N	2024-10-31 04:00:47.17175	\N	\N	\N	\N	\N	\N	\N
999	2ba6388a-619b-43bd-bc23-778b904646c7	SUCCESS	\N	2024-10-31 04:00:54.151749	\N	\N	\N	\N	\N	\N	\N
1003	a53e11ef-a981-470d-8977-30b3c3914335	SUCCESS	\N	2024-10-31 04:01:00.873144	\N	\N	\N	\N	\N	\N	\N
1007	e979b4e8-b91c-4f7c-a9c3-0288c21d9b38	SUCCESS	\N	2024-10-31 04:01:07.707376	\N	\N	\N	\N	\N	\N	\N
1010	d60de3af-20c6-4e08-998b-e012f9315206	SUCCESS	\N	2024-10-31 04:01:12.448502	\N	\N	\N	\N	\N	\N	\N
125	24e7a226-d317-488e-b12b-f9991748113a	SUCCESS	\N	2024-09-22 11:56:27.019583	\N	\N	\N	\N	\N	\N	\N
129	808d5ceb-fa28-4cfa-951f-bf046a4abb18	SUCCESS	\N	2024-09-22 11:56:31.556316	\N	\N	\N	\N	\N	\N	\N
488	4257bf2b-15b2-4856-9174-222c905c4546	SUCCESS	\N	2024-10-28 08:21:30.536507	\N	\N	\N	\N	\N	\N	\N
492	0ffde273-9e1f-4eeb-88c5-d37f8cf1f84a	SUCCESS	\N	2024-10-28 08:21:34.941909	\N	\N	\N	\N	\N	\N	\N
496	55f72178-0fbd-408d-b692-88d6f5bb28b5	SUCCESS	\N	2024-10-28 08:21:41.175336	\N	\N	\N	\N	\N	\N	\N
501	d3315923-76d6-4c0f-b7e3-ddb6188189e3	SUCCESS	\N	2024-10-28 08:21:49.943272	\N	\N	\N	\N	\N	\N	\N
505	05780853-76cc-40c0-afc2-a1116c610071	SUCCESS	\N	2024-10-28 08:21:56.216149	\N	\N	\N	\N	\N	\N	\N
510	3574f665-8a5b-4393-9698-a4c067480fd3	SUCCESS	\N	2024-10-28 08:25:10.8956	\N	\N	\N	\N	\N	\N	\N
514	ac1e8a9a-2ab6-42b3-8a13-f3514a975a1c	SUCCESS	\N	2024-10-28 08:25:17.873133	\N	\N	\N	\N	\N	\N	\N
519	e2f93e52-f90b-4514-ab52-e61ee7d55fe0	SUCCESS	\N	2024-10-28 08:25:26.001431	\N	\N	\N	\N	\N	\N	\N
523	ddc44e0c-013d-42db-99ef-f67342fbf812	SUCCESS	\N	2024-10-28 08:25:30.684874	\N	\N	\N	\N	\N	\N	\N
526	1e5d65e1-30ef-429c-a80d-c6d91cd82d68	SUCCESS	\N	2024-10-28 08:25:35.67748	\N	\N	\N	\N	\N	\N	\N
530	7d63af51-f9c0-4e03-a03a-605f6c861b9a	SUCCESS	\N	2024-10-28 08:25:43.760102	\N	\N	\N	\N	\N	\N	\N
534	ebd36be4-9b3a-4242-830e-4e165da4518c	SUCCESS	\N	2024-10-28 08:25:49.103108	\N	\N	\N	\N	\N	\N	\N
536	4c2cc320-334a-497c-b269-c637157036be	SUCCESS	\N	2024-10-28 08:25:54.793253	\N	\N	\N	\N	\N	\N	\N
540	bdca0e14-efb5-401d-96d8-b358acf1bdb6	SUCCESS	\N	2024-10-28 08:26:01.886579	\N	\N	\N	\N	\N	\N	\N
545	cdfcb0f3-fadf-4235-9916-09560878b78e	SUCCESS	\N	2024-10-28 08:26:09.126358	\N	\N	\N	\N	\N	\N	\N
549	cb131410-727f-4b4a-9327-bc4434370bac	SUCCESS	\N	2024-10-28 08:26:16.791268	\N	\N	\N	\N	\N	\N	\N
554	78b5a982-626e-4a37-85d8-f553b28cfc1f	SUCCESS	\N	2024-10-28 08:26:24.804007	\N	\N	\N	\N	\N	\N	\N
557	7e60bc89-dbc6-4c73-84f7-ae0947bb64f5	SUCCESS	\N	2024-10-28 08:26:28.563789	\N	\N	\N	\N	\N	\N	\N
709	9a9ea607-df13-4ae0-a81a-d44bce1f5d2e	SUCCESS	\N	2024-10-30 03:40:07.950309	\N	\N	\N	\N	\N	\N	\N
713	e375f10c-8d0f-4b81-830e-f29d612a6869	SUCCESS	\N	2024-10-30 03:40:13.692738	\N	\N	\N	\N	\N	\N	\N
717	173da8e8-87f0-46fb-9b1b-75a1717d9349	SUCCESS	\N	2024-10-30 03:40:21.509948	\N	\N	\N	\N	\N	\N	\N
721	50a83407-2fd0-4e22-b47b-9852bc1a213f	SUCCESS	\N	2024-10-30 03:40:26.471338	\N	\N	\N	\N	\N	\N	\N
724	143b25d1-a3ea-4da4-a33f-0b3cba17c808	SUCCESS	\N	2024-10-30 03:40:32.066622	\N	\N	\N	\N	\N	\N	\N
729	6e7bf642-0183-40e9-b86a-8d0968b3c756	SUCCESS	\N	2024-10-30 03:40:39.146684	\N	\N	\N	\N	\N	\N	\N
734	6d5e41c2-ed08-4585-ac74-c6d145ca441d	SUCCESS	\N	2024-10-30 03:40:45.691067	\N	\N	\N	\N	\N	\N	\N
736	bd6e57df-1c53-4eed-9ffa-c4f171b486d6	SUCCESS	\N	2024-10-30 03:40:50.949283	\N	\N	\N	\N	\N	\N	\N
740	44bdb05c-5b1d-4237-b358-bb7b8dfe9ec0	SUCCESS	\N	2024-10-30 03:40:53.628753	\N	\N	\N	\N	\N	\N	\N
744	d44c5f57-a60a-4216-93ca-f7cf4b568c92	SUCCESS	\N	2024-10-30 03:40:59.711665	\N	\N	\N	\N	\N	\N	\N
745	582434c5-95ab-4ed2-a593-780d3dbcb4d0	SUCCESS	\N	2024-10-30 03:41:05.537198	\N	\N	\N	\N	\N	\N	\N
749	b94cc24d-70f9-4f8d-875b-f19599b88d48	SUCCESS	\N	2024-10-30 03:41:08.913353	\N	\N	\N	\N	\N	\N	\N
753	88770187-ba58-44b7-bf06-136f49df9652	SUCCESS	\N	2024-10-30 03:41:15.265173	\N	\N	\N	\N	\N	\N	\N
757	7e481422-a962-49fd-a7df-310d7f46e21f	SUCCESS	\N	2024-10-30 03:41:20.585956	\N	\N	\N	\N	\N	\N	\N
761	fa8e9227-2b8d-44c9-a927-f1ebc05df366	SUCCESS	\N	2024-10-30 03:41:26.754439	\N	\N	\N	\N	\N	\N	\N
766	d8aed205-29e6-49d1-b82c-a9c8083ad03c	SUCCESS	\N	2024-10-30 03:45:07.103961	\N	\N	\N	\N	\N	\N	\N
770	db43e5b6-1802-4b5b-9160-4105abb61e9d	SUCCESS	\N	2024-10-30 03:45:14.878589	\N	\N	\N	\N	\N	\N	\N
775	4652c9b0-ff57-44b2-8ec4-a363c6608b5d	SUCCESS	\N	2024-10-30 03:45:21.809454	\N	\N	\N	\N	\N	\N	\N
779	b5d477f7-25bb-4d82-976e-8b2c84f67015	SUCCESS	\N	2024-10-30 03:45:29.723222	\N	\N	\N	\N	\N	\N	\N
783	2e74cc83-a27d-48dc-aef4-4353ac183444	SUCCESS	\N	2024-10-30 03:45:35.030101	\N	\N	\N	\N	\N	\N	\N
787	db2d84c7-f468-467b-b391-7a9e8de19614	SUCCESS	\N	2024-10-30 03:45:42.792453	\N	\N	\N	\N	\N	\N	\N
926	41d996c6-2c2b-4b09-ba10-f32bb815e39c	SUCCESS	\N	2024-10-31 03:55:15.250723	\N	\N	\N	\N	\N	\N	\N
930	cd971ce3-9caa-4b32-b1ed-4cd56e8d0461	SUCCESS	\N	2024-10-31 03:55:21.858505	\N	\N	\N	\N	\N	\N	\N
934	624155b9-7b99-4fc0-81ec-3dd642af9ff9	SUCCESS	\N	2024-10-31 03:55:29.262051	\N	\N	\N	\N	\N	\N	\N
938	a1251895-f374-4af1-a567-be1a2becf88a	SUCCESS	\N	2024-10-31 03:55:34.032832	\N	\N	\N	\N	\N	\N	\N
941	eca5dd54-e99d-4933-a570-0d28459707f1	SUCCESS	\N	2024-10-31 03:55:40.775056	\N	\N	\N	\N	\N	\N	\N
945	136320e9-2a91-4a45-8f3c-a20932acdbfd	SUCCESS	\N	2024-10-31 03:55:45.228361	\N	\N	\N	\N	\N	\N	\N
949	684924f9-5c4f-42d5-8468-354aeb885939	SUCCESS	\N	2024-10-31 03:55:51.609513	\N	\N	\N	\N	\N	\N	\N
953	86b10aa8-baec-4dcc-8cab-872b079ab123	SUCCESS	\N	2024-10-31 03:55:57.087393	\N	\N	\N	\N	\N	\N	\N
957	d12ba4af-114f-46bc-afdb-40a152bfa1a2	SUCCESS	\N	2024-10-31 03:56:03.844311	\N	\N	\N	\N	\N	\N	\N
961	2c61dc56-80e5-45a4-97e0-8ee6aba5ee0f	SUCCESS	\N	2024-10-31 03:56:09.676097	\N	\N	\N	\N	\N	\N	\N
965	df405b62-cdab-4fe9-bcc7-c43f8d31d0d9	SUCCESS	\N	2024-10-31 03:56:17.759228	\N	\N	\N	\N	\N	\N	\N
970	7f7096ca-3ab3-4d9b-b2d0-fc600188cf11	SUCCESS	\N	2024-10-31 03:56:23.690406	\N	\N	\N	\N	\N	\N	\N
973	43a8c848-b103-4a55-bde0-3fb12f9e8799	SUCCESS	\N	2024-10-31 04:00:10.844375	\N	\N	\N	\N	\N	\N	\N
976	1a1442b9-96fe-43a6-b716-9af8339e66e7	SUCCESS	\N	2024-10-31 04:00:18.948302	\N	\N	\N	\N	\N	\N	\N
980	c058f2d5-97bd-4846-98c4-8bc0c3e4dfce	SUCCESS	\N	2024-10-31 04:00:19.956806	\N	\N	\N	\N	\N	\N	\N
981	dcbb3b46-ae1a-4a23-8f3d-d0088763833c	SUCCESS	\N	2024-10-31 04:00:26.232995	\N	\N	\N	\N	\N	\N	\N
985	2fb3182d-c485-414f-867e-fe60169b0500	SUCCESS	\N	2024-10-31 04:00:27.938658	\N	\N	\N	\N	\N	\N	\N
989	6c71b54c-df75-43dd-aa18-84f99f65044a	SUCCESS	\N	2024-10-31 04:00:34.68933	\N	\N	\N	\N	\N	\N	\N
992	d3113f12-86bf-43b0-adec-5cc59b9ba2f0	SUCCESS	\N	2024-10-31 04:00:42.937585	\N	\N	\N	\N	\N	\N	\N
996	06c394dc-d072-491f-9355-a4252db00232	SUCCESS	\N	2024-10-31 04:00:50.580811	\N	\N	\N	\N	\N	\N	\N
1000	32cbed91-7618-45d6-a4a6-bf6a74102085	SUCCESS	\N	2024-10-31 04:00:57.894698	\N	\N	\N	\N	\N	\N	\N
1005	927e3bb4-168e-413d-89b8-fd737711c639	SUCCESS	\N	2024-10-31 04:01:05.846146	\N	\N	\N	\N	\N	\N	\N
1008	7a0966df-3892-4321-bed3-ea6e6fda44f7	SUCCESS	\N	2024-10-31 04:01:10.741449	\N	\N	\N	\N	\N	\N	\N
126	633bc733-1001-4b96-882d-89d15b7ff9b8	SUCCESS	\N	2024-09-22 11:56:27.616868	\N	\N	\N	\N	\N	\N	\N
489	aa2715e0-f00e-4c4b-b545-def9e8391c61	SUCCESS	\N	2024-10-28 08:21:30.843368	\N	\N	\N	\N	\N	\N	\N
493	29112445-8d53-4d3d-a2fd-df5953fa606c	SUCCESS	\N	2024-10-28 08:21:37.413464	\N	\N	\N	\N	\N	\N	\N
497	982c5db7-580b-4453-87c6-a9535f9083c3	SUCCESS	\N	2024-10-28 08:21:43.004246	\N	\N	\N	\N	\N	\N	\N
500	1a2b964b-c008-4d58-872b-51d51026a3cc	SUCCESS	\N	2024-10-28 08:21:49.100188	\N	\N	\N	\N	\N	\N	\N
504	b850657f-4c82-483a-afbe-d31c69e011d6	SUCCESS	\N	2024-10-28 08:21:55.402898	\N	\N	\N	\N	\N	\N	\N
508	7e27a158-52a6-4ad2-aef5-19e06ab4fe8c	SUCCESS	\N	2024-10-28 08:25:08.820154	\N	\N	\N	\N	\N	\N	\N
512	3c037ce9-0af6-4536-aeb0-23dec7c7ac9a	SUCCESS	\N	2024-10-28 08:25:15.913339	\N	\N	\N	\N	\N	\N	\N
516	b8bcb155-fe6d-43f7-9932-c64bfb54bd21	SUCCESS	\N	2024-10-28 08:25:23.245881	\N	\N	\N	\N	\N	\N	\N
521	c10cda7b-fef0-4f14-b242-eac7fd85f9fd	SUCCESS	\N	2024-10-28 08:25:30.090433	\N	\N	\N	\N	\N	\N	\N
525	c1ceb11a-f61c-4b86-9644-74a2193b25c1	SUCCESS	\N	2024-10-28 08:25:35.232318	\N	\N	\N	\N	\N	\N	\N
529	c1b0252b-6bb5-4957-b6c8-75cc2e235aa8	SUCCESS	\N	2024-10-28 08:25:41.913215	\N	\N	\N	\N	\N	\N	\N
533	539b6d77-74b8-4e0c-a5fd-b87c61331772	SUCCESS	\N	2024-10-28 08:25:48.564098	\N	\N	\N	\N	\N	\N	\N
537	f5fe5623-749e-4cd5-af05-56c759ea0152	SUCCESS	\N	2024-10-28 08:25:54.94784	\N	\N	\N	\N	\N	\N	\N
541	9b0cc772-e213-4302-a381-026bb900b71c	SUCCESS	\N	2024-10-28 08:26:01.93243	\N	\N	\N	\N	\N	\N	\N
544	d055a38b-0d68-4a00-8355-24e1f8d7bd91	SUCCESS	\N	2024-10-28 08:26:08.973817	\N	\N	\N	\N	\N	\N	\N
548	aa1b3d84-f04a-4bef-9236-f972f994a0be	SUCCESS	\N	2024-10-28 08:26:14.89377	\N	\N	\N	\N	\N	\N	\N
552	4e1f43ab-d8eb-43ee-926f-c8006a850e55	SUCCESS	\N	2024-10-28 08:26:21.958296	\N	\N	\N	\N	\N	\N	\N
556	b562cce4-4eeb-494b-a92f-783ef19ebeb2	SUCCESS	\N	2024-10-28 08:26:25.017725	\N	\N	\N	\N	\N	\N	\N
710	b4e2f815-75e1-49d9-94bd-0e8b151946b5	SUCCESS	\N	2024-10-30 03:40:11.555306	\N	\N	\N	\N	\N	\N	\N
714	661da8cc-9a27-4449-9929-fde9b2f59324	SUCCESS	\N	2024-10-30 03:40:16.492253	\N	\N	\N	\N	\N	\N	\N
719	a0db7cb0-a0cd-44c4-9c89-2d5a8428b7f5	SUCCESS	\N	2024-10-30 03:40:24.101606	\N	\N	\N	\N	\N	\N	\N
722	4c7a9942-555a-45a0-a98e-8f9111d044a1	SUCCESS	\N	2024-10-30 03:40:27.402636	\N	\N	\N	\N	\N	\N	\N
726	cdd2bc6b-09ca-4b6b-a756-8d806e53e944	SUCCESS	\N	2024-10-30 03:40:32.228279	\N	\N	\N	\N	\N	\N	\N
728	7cc3d412-59dd-4ae0-b633-6a5999c747e1	SUCCESS	\N	2024-10-30 03:40:39.127807	\N	\N	\N	\N	\N	\N	\N
732	a72abd52-4f50-4a87-8e04-d1cf12c3df74	SUCCESS	\N	2024-10-30 03:40:45.448143	\N	\N	\N	\N	\N	\N	\N
737	16ca21f1-c96f-4123-b5fd-979ac2cfaffc	SUCCESS	\N	2024-10-30 03:40:51.824023	\N	\N	\N	\N	\N	\N	\N
741	d35ec699-96da-48a0-9376-f1967f01f4e7	SUCCESS	\N	2024-10-30 03:40:59.181471	\N	\N	\N	\N	\N	\N	\N
746	ee72fbf1-ddf0-4492-aa03-9fd5d1d67d47	SUCCESS	\N	2024-10-30 03:41:06.052917	\N	\N	\N	\N	\N	\N	\N
751	4d3f5b1e-faaa-437e-bb32-c519387167ce	SUCCESS	\N	2024-10-30 03:41:12.676901	\N	\N	\N	\N	\N	\N	\N
755	851ba77d-e951-4735-af68-c1d01e3783d2	SUCCESS	\N	2024-10-30 03:41:18.821027	\N	\N	\N	\N	\N	\N	\N
758	09f77449-f68b-4bc8-8ffd-894a0d5db267	SUCCESS	\N	2024-10-30 03:41:23.912346	\N	\N	\N	\N	\N	\N	\N
763	9357e8ab-44e1-4cb6-beca-cfcd3fe03a8c	SUCCESS	\N	2024-10-30 03:41:29.162046	\N	\N	\N	\N	\N	\N	\N
765	41b906f3-b4ae-4cf9-86c2-dab6e69bfa2d	SUCCESS	\N	2024-10-30 03:45:06.464794	\N	\N	\N	\N	\N	\N	\N
769	38d67bd6-2519-42e3-9743-e16e2f0b9093	SUCCESS	\N	2024-10-30 03:45:10.522098	\N	\N	\N	\N	\N	\N	\N
773	997025f1-dfd2-415e-a53a-4df9e39a2ce0	SUCCESS	\N	2024-10-30 03:45:15.237615	\N	\N	\N	\N	\N	\N	\N
777	82e80db5-2d0d-4383-8819-30c49fb768a1	SUCCESS	\N	2024-10-30 03:45:23.820409	\N	\N	\N	\N	\N	\N	\N
781	49cfeb63-6313-44ac-aaa4-9fa2a704cb70	SUCCESS	\N	2024-10-30 03:45:30.893693	\N	\N	\N	\N	\N	\N	\N
784	4d40ee18-22bf-40f3-aec0-f0d6a48e3bd8	SUCCESS	\N	2024-10-30 03:45:37.181183	\N	\N	\N	\N	\N	\N	\N
927	669e6676-8e3a-4321-b2e0-b14c9656d990	SUCCESS	\N	2024-10-31 03:55:16.858248	\N	\N	\N	\N	\N	\N	\N
932	2f015f66-6fc7-435a-a75d-272acc388e29	SUCCESS	\N	2024-10-31 03:55:24.692803	\N	\N	\N	\N	\N	\N	\N
936	7c889f4d-4904-40f8-9008-d70b296ac480	SUCCESS	\N	2024-10-31 03:55:33.719437	\N	\N	\N	\N	\N	\N	\N
940	7e20533d-0f42-4ac0-8248-5d886b44959d	SUCCESS	\N	2024-10-31 03:55:40.679789	\N	\N	\N	\N	\N	\N	\N
944	8e54d3e3-0b60-4e3e-a88e-5b2cc0097e0e	SUCCESS	\N	2024-10-31 03:55:44.948267	\N	\N	\N	\N	\N	\N	\N
948	6b999945-5df5-4865-b5b8-c8469be5c125	SUCCESS	\N	2024-10-31 03:55:48.930768	\N	\N	\N	\N	\N	\N	\N
951	803a84e1-66f8-406f-8a4d-b890f6499ab9	SUCCESS	\N	2024-10-31 03:55:54.850668	\N	\N	\N	\N	\N	\N	\N
956	a7265792-2334-438d-8f45-a99b481b24df	SUCCESS	\N	2024-10-31 03:56:02.251312	\N	\N	\N	\N	\N	\N	\N
959	2075af59-7354-4b65-820b-3e3d1647f5ba	SUCCESS	\N	2024-10-31 03:56:07.301235	\N	\N	\N	\N	\N	\N	\N
963	ef8c0d7a-54e5-4131-906d-4f933ce6c3cf	SUCCESS	\N	2024-10-31 03:56:14.333352	\N	\N	\N	\N	\N	\N	\N
967	a2bdca9e-589d-4ea0-87d1-eb97a25a1aea	SUCCESS	\N	2024-10-31 03:56:21.901942	\N	\N	\N	\N	\N	\N	\N
971	1be294f5-b9f6-4d13-8c8f-d7bb797eb355	SUCCESS	\N	2024-10-31 04:00:09.098659	\N	\N	\N	\N	\N	\N	\N
975	7d1d79fb-f667-4274-b5a0-39148ea6867b	SUCCESS	\N	2024-10-31 04:00:11.010901	\N	\N	\N	\N	\N	\N	\N
978	42d95067-db73-40fc-b8e2-5ea6ad362c85	SUCCESS	\N	2024-10-31 04:00:19.542055	\N	\N	\N	\N	\N	\N	\N
984	207f41e4-99d4-4682-aa0a-7ecb517f5348	SUCCESS	\N	2024-10-31 04:00:26.856215	\N	\N	\N	\N	\N	\N	\N
988	29450887-979b-4e57-9b85-1024b8f54bfd	SUCCESS	\N	2024-10-31 04:00:34.499307	\N	\N	\N	\N	\N	\N	\N
990	51b2bfd9-f3b0-4cf0-b00a-e9381ce46a93	SUCCESS	\N	2024-10-31 04:00:41.864734	\N	\N	\N	\N	\N	\N	\N
995	aa88fe3f-c439-4b33-8283-5b99a5704824	SUCCESS	\N	2024-10-31 04:00:47.837167	\N	\N	\N	\N	\N	\N	\N
998	cd6c4840-8c1a-42b1-9cd3-b4df8acefd0b	SUCCESS	\N	2024-10-31 04:00:51.927566	\N	\N	\N	\N	\N	\N	\N
1002	e1bab48e-5de4-4690-ba91-dd36297e02b8	SUCCESS	\N	2024-10-31 04:01:00.484792	\N	\N	\N	\N	\N	\N	\N
1006	e543aa03-0967-4a7c-962a-a62208ae4398	SUCCESS	\N	2024-10-31 04:01:07.411888	\N	\N	\N	\N	\N	\N	\N
1011	b7769e78-8061-46d6-b5c8-5892c9cfc797	SUCCESS	\N	2024-10-31 04:01:12.966694	\N	\N	\N	\N	\N	\N	\N
127	49d27aee-1a44-4177-ada5-b9ce653a63b8	SUCCESS	\N	2024-09-22 11:56:29.556147	\N	\N	\N	\N	\N	\N	\N
130	7d0d8ca6-f8b8-4dac-b328-d156aa1e149a	SUCCESS	\N	2024-09-22 11:56:35.531689	\N	\N	\N	\N	\N	\N	\N
131	906628a9-c4be-414f-83cd-5fa038052c99	SUCCESS	\N	2024-09-22 11:56:35.639882	\N	\N	\N	\N	\N	\N	\N
132	543adb10-cb1c-49c5-91f0-303c7d439adf	SUCCESS	\N	2024-09-22 11:56:37.703432	\N	\N	\N	\N	\N	\N	\N
133	a3bc5dac-28f7-4bc7-ab5e-ffb0ff010b77	SUCCESS	\N	2024-09-22 11:56:37.832017	\N	\N	\N	\N	\N	\N	\N
134	975150c7-4af8-4f80-bbd4-01a9f9fa4758	SUCCESS	\N	2024-09-22 11:56:42.256194	\N	\N	\N	\N	\N	\N	\N
135	0315a99b-bb46-4d0c-a09e-15c5a83444b7	SUCCESS	\N	2024-09-22 11:56:43.115262	\N	\N	\N	\N	\N	\N	\N
136	93063544-ae57-4567-a4de-249fc5349336	SUCCESS	\N	2024-09-22 11:56:43.260494	\N	\N	\N	\N	\N	\N	\N
137	61b56754-9424-4362-9d87-be5f55e9ff32	SUCCESS	\N	2024-09-22 11:56:44.358581	\N	\N	\N	\N	\N	\N	\N
138	3fee9b84-d4d7-4af6-915b-5f4c3c185036	SUCCESS	\N	2024-09-22 11:56:50.309216	\N	\N	\N	\N	\N	\N	\N
139	8ff4e2e6-a911-48e0-9c83-b303793df7d9	SUCCESS	\N	2024-09-22 11:56:50.558532	\N	\N	\N	\N	\N	\N	\N
140	c6f99853-2ecd-4391-8145-4d06fce556bf	SUCCESS	\N	2024-09-22 11:56:51.156915	\N	\N	\N	\N	\N	\N	\N
141	c80406e5-6047-46eb-aea4-79be2c04cf3a	SUCCESS	\N	2024-09-22 11:56:52.908589	\N	\N	\N	\N	\N	\N	\N
142	9459fb70-60ab-4246-9111-e54e1aa20b48	SUCCESS	\N	2024-09-22 11:56:54.730018	\N	\N	\N	\N	\N	\N	\N
143	ef888357-248c-4e47-bebe-c05b5651b11a	SUCCESS	\N	2024-09-22 11:56:59.333774	\N	\N	\N	\N	\N	\N	\N
144	78dc24bd-302d-4c35-aeac-738a3e5b5984	SUCCESS	\N	2024-09-22 11:56:59.622546	\N	\N	\N	\N	\N	\N	\N
145	d53a2505-e51e-410c-9107-c5c3a85ce0b5	SUCCESS	\N	2024-09-22 11:56:59.765832	\N	\N	\N	\N	\N	\N	\N
146	705ae308-fe01-494b-99b9-93d80b56ecc2	SUCCESS	\N	2024-09-22 11:56:59.962682	\N	\N	\N	\N	\N	\N	\N
147	2ba2e69f-47b8-4f26-afa9-aacc24a0d0cb	SUCCESS	\N	2024-09-22 11:57:02.263118	\N	\N	\N	\N	\N	\N	\N
148	ef6e30c3-f499-4ab0-8274-f2b018c78108	SUCCESS	\N	2024-09-22 11:57:02.541781	\N	\N	\N	\N	\N	\N	\N
149	df9bbed8-cfff-4611-8657-6ae7f20f894d	SUCCESS	\N	2024-09-22 11:57:02.617785	\N	\N	\N	\N	\N	\N	\N
150	9f65385a-16cd-4307-92f4-0caa1ce37d28	FAILURE	\\x8005959c000000000000007d94288c086578635f74797065948c104f7065726174696f6e616c4572726f72948c0b6578635f6d657373616765948c4828707379636f7067322e4f7065726174696f6e616c4572726f72292053534c20636f6e6e656374696f6e20686173206265656e20636c6f73656420756e65787065637465646c790a9485948c0a6578635f6d6f64756c65948c0e73716c616c6368656d792e65786394752e	2024-10-28 02:40:11.347884	Traceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\npsycopg2.OperationalError: SSL connection has been closed unexpectedly\n\n\nThe above exception was the direct cause of the following exception:\n\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/celery/app/trace.py", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/app/workers/file_processor.py", line 101, in process_file_task\n    session.commit()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 2028, in commit\n    trans.commit(_to_root=True)\n  File "<string>", line 2, in commit\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1313, in commit\n    self._prepare_impl()\n  File "<string>", line 2, in _prepare_impl\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/state_changes.py", line 139, in _go\n    ret_value = fn(self, *arg, **kw)\n                ^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 1288, in _prepare_impl\n    self.session.flush()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4352, in flush\n    self._flush(objects)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4487, in _flush\n    with util.safe_reraise():\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/util/langhelpers.py", line 146, in __exit__\n    raise exc_value.with_traceback(exc_tb)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/session.py", line 4448, in _flush\n    flush_context.execute()\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 466, in execute\n    rec.execute(self)\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/unitofwork.py", line 642, in execute\n    util.preloaded.orm_persistence.save_obj(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 93, in save_obj\n    _emit_insert_statements(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/orm/persistence.py", line 1233, in _emit_insert_statements\n    result = connection.execute(\n             ^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1418, in execute\n    return meth(\n           ^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/sql/elements.py", line 515, in _execute_on_connection\n    return connection._execute_clauseelement(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1640, in _execute_clauseelement\n    ret = self._execute_context(\n          ^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1846, in _execute_context\n    return self._exec_single_context(\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1986, in _exec_single_context\n    self._handle_dbapi_exception(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 2355, in _handle_dbapi_exception\n    raise sqlalchemy_exception.with_traceback(exc_info[2]) from e\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/base.py", line 1967, in _exec_single_context\n    self.dialect.do_execute(\n  File "/usr/local/lib/python3.11/dist-packages/sqlalchemy/engine/default.py", line 941, in do_execute\n    cursor.execute(statement, parameters)\nsqlalchemy.exc.OperationalError: (psycopg2.OperationalError) SSL connection has been closed unexpectedly\n\n[SQL: INSERT INTO poc.detection_results (image_name, output_name, data) VALUES (%(image_name)s, %(output_name)s, %(data)s) RETURNING poc.detection_results.id]\n[parameters: {'image_name': 'queued/Avita_70_DJI_0517.JPG', 'output_name': 'processed/Avita_70_DJI_0517.JPG', 'data': '{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", " ... (256 characters truncated) ... : "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:08:30 10:08:18", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}'}]\n(Background on this error at: https://sqlalche.me/e/20/e3q8)\n	\N	\N	\N	\N	\N	\N
151	fe6b6833-f36e-413a-85b9-af540bb73617	SUCCESS	\N	2024-10-28 02:40:11.403271	\N	\N	\N	\N	\N	\N	\N
152	5857606b-ecb2-443b-92ca-8a8496fc84df	SUCCESS	\N	2024-10-28 02:40:11.588848	\N	\N	\N	\N	\N	\N	\N
153	9d0629c6-7b54-4008-b316-00ba7abd0e9b	SUCCESS	\N	2024-10-28 02:40:11.627315	\N	\N	\N	\N	\N	\N	\N
154	fb8923af-0c7c-4e27-b360-52608f540d57	SUCCESS	\N	2024-10-28 02:40:18.271072	\N	\N	\N	\N	\N	\N	\N
155	927b6e24-3e58-4979-aef7-dc4e1b81b622	SUCCESS	\N	2024-10-28 02:40:18.468098	\N	\N	\N	\N	\N	\N	\N
156	70f05ab2-920e-4e89-88bb-35812f2161fc	SUCCESS	\N	2024-10-28 02:40:18.525138	\N	\N	\N	\N	\N	\N	\N
157	b5ab1bc5-6ea3-4927-8b60-8154ae08b12f	SUCCESS	\N	2024-10-28 02:40:18.645656	\N	\N	\N	\N	\N	\N	\N
158	20e3d95f-63fb-4095-a756-7cec058845f7	SUCCESS	\N	2024-10-28 02:40:24.407452	\N	\N	\N	\N	\N	\N	\N
159	da1a468a-f383-4d7c-8456-6c9debf31910	SUCCESS	\N	2024-10-28 02:40:25.474492	\N	\N	\N	\N	\N	\N	\N
160	b2083e8c-b06f-4457-9894-5654fe49c78d	SUCCESS	\N	2024-10-28 02:40:25.68236	\N	\N	\N	\N	\N	\N	\N
161	23c624b0-6a39-4211-8dab-b98e12898c1c	SUCCESS	\N	2024-10-28 02:40:25.88925	\N	\N	\N	\N	\N	\N	\N
162	1be10290-ae3a-47ea-9f40-dea9ee10911d	SUCCESS	\N	2024-10-28 02:40:26.034969	\N	\N	\N	\N	\N	\N	\N
163	ad9ac593-ca09-41e1-a362-a7df2a3a0e1c	SUCCESS	\N	2024-10-28 02:40:32.824686	\N	\N	\N	\N	\N	\N	\N
164	d9e6c486-6978-46c2-ad74-4f1e50c4669c	SUCCESS	\N	2024-10-28 02:40:33.192229	\N	\N	\N	\N	\N	\N	\N
165	b6d62ebf-2bc1-4506-9196-79e4b8c3a6f4	SUCCESS	\N	2024-10-28 02:40:33.404652	\N	\N	\N	\N	\N	\N	\N
166	0bb846b4-0ee9-4ced-ba77-4574ad76d9a2	SUCCESS	\N	2024-10-28 02:40:36.682775	\N	\N	\N	\N	\N	\N	\N
167	e5a542ad-5cf5-4453-9e2d-5adb439b5dd6	SUCCESS	\N	2024-10-28 02:40:36.698814	\N	\N	\N	\N	\N	\N	\N
168	066f08cb-d40a-48d0-9488-d4a0f07bfd71	SUCCESS	\N	2024-10-28 02:40:36.827596	\N	\N	\N	\N	\N	\N	\N
169	48e3fbb0-1927-400a-9045-9a58080368a5	SUCCESS	\N	2024-10-28 02:40:40.441385	\N	\N	\N	\N	\N	\N	\N
170	983d57a6-5e25-437f-b6b7-8374df0175b1	SUCCESS	\N	2024-10-28 02:40:40.599269	\N	\N	\N	\N	\N	\N	\N
171	81e104e9-026d-4814-b600-8c9108ce7fa7	SUCCESS	\N	2024-10-28 02:40:40.647867	\N	\N	\N	\N	\N	\N	\N
172	5bfa8485-461d-4748-a02c-bd51444e5798	SUCCESS	\N	2024-10-28 02:40:42.602979	\N	\N	\N	\N	\N	\N	\N
173	81333640-7aa0-4051-a6c4-b42efae0c2c2	SUCCESS	\N	2024-10-28 02:40:44.855209	\N	\N	\N	\N	\N	\N	\N
174	6718341a-1151-429f-b5ca-b2488872770a	SUCCESS	\N	2024-10-28 02:40:45.630782	\N	\N	\N	\N	\N	\N	\N
175	3315865f-2ade-4c65-8a4c-4956129faa85	SUCCESS	\N	2024-10-28 02:40:46.35236	\N	\N	\N	\N	\N	\N	\N
176	e0b9e207-66c9-496d-be0d-803a701a618a	SUCCESS	\N	2024-10-28 02:40:47.789669	\N	\N	\N	\N	\N	\N	\N
177	cf9bd5c5-737b-45e2-8611-953cbcf1e552	SUCCESS	\N	2024-10-28 02:40:52.150324	\N	\N	\N	\N	\N	\N	\N
178	59d8116d-add3-47ad-a9ce-a292ab732ad7	SUCCESS	\N	2024-10-28 02:40:53.010912	\N	\N	\N	\N	\N	\N	\N
179	8a80a2c4-8a11-426f-bb2f-665d2b187fd9	SUCCESS	\N	2024-10-28 02:40:53.022952	\N	\N	\N	\N	\N	\N	\N
180	00d68817-a185-46d3-beef-71928def7e09	SUCCESS	\N	2024-10-28 02:40:54.576404	\N	\N	\N	\N	\N	\N	\N
181	108b3289-c922-428b-830e-b17d7dd5bf1d	SUCCESS	\N	2024-10-28 02:40:54.654024	\N	\N	\N	\N	\N	\N	\N
182	883696c6-305d-4c26-b899-6b623f911290	SUCCESS	\N	2024-10-28 02:40:55.351163	\N	\N	\N	\N	\N	\N	\N
183	f7fe330d-fef0-49ce-81f3-b3527d215f8d	SUCCESS	\N	2024-10-28 02:40:56.899921	\N	\N	\N	\N	\N	\N	\N
184	33190ae6-49ee-401a-b94d-9cdbd336ed2b	SUCCESS	\N	2024-10-28 02:41:00.860239	\N	\N	\N	\N	\N	\N	\N
185	e67da6e3-9b84-4359-900a-26505a98a2fb	SUCCESS	\N	2024-10-28 02:41:01.134362	\N	\N	\N	\N	\N	\N	\N
186	385cf985-6559-45ff-b361-5b0dc020ef41	SUCCESS	\N	2024-10-28 02:41:01.285615	\N	\N	\N	\N	\N	\N	\N
187	5863cabc-ac12-4e34-8dd6-9983d673e7ca	SUCCESS	\N	2024-10-28 02:41:01.470627	\N	\N	\N	\N	\N	\N	\N
188	d8bc63b7-7310-4f2f-be9c-12085b7ede59	SUCCESS	\N	2024-10-28 02:41:02.187326	\N	\N	\N	\N	\N	\N	\N
490	07388d5b-d245-4e44-a8b5-1bfad29dfb4f	SUCCESS	\N	2024-10-28 08:21:32.966674	\N	\N	\N	\N	\N	\N	\N
495	877d5bbc-bb1b-489f-85f0-4bf84a5e440e	SUCCESS	\N	2024-10-28 08:21:38.675953	\N	\N	\N	\N	\N	\N	\N
499	adfa251b-2b16-40fb-bf7b-dec2de3bcfe7	SUCCESS	\N	2024-10-28 08:21:48.49158	\N	\N	\N	\N	\N	\N	\N
503	db97b207-0bef-4cd4-892a-89096b8eb611	SUCCESS	\N	2024-10-28 08:21:54.992626	\N	\N	\N	\N	\N	\N	\N
507	59ebda5b-5d18-4492-a0e0-61e52b7060b9	SUCCESS	\N	2024-10-28 08:21:57.099006	\N	\N	\N	\N	\N	\N	\N
509	d16e9a7b-9c10-4160-b43e-af253aca9a91	SUCCESS	\N	2024-10-28 08:25:10.009199	\N	\N	\N	\N	\N	\N	\N
513	bd1b073c-3ab5-4fdc-988e-716abef09cfa	SUCCESS	\N	2024-10-28 08:25:16.312338	\N	\N	\N	\N	\N	\N	\N
517	8b4a1dba-f86f-4f1c-9866-df076fdf6242	SUCCESS	\N	2024-10-28 08:25:23.70476	\N	\N	\N	\N	\N	\N	\N
520	34ccc638-bcf5-41a1-ac10-bf369c4b67a1	SUCCESS	\N	2024-10-28 08:25:29.994308	\N	\N	\N	\N	\N	\N	\N
524	ca2e77dd-c443-42ed-8851-ba218718832d	SUCCESS	\N	2024-10-28 08:25:34.292639	\N	\N	\N	\N	\N	\N	\N
528	8ea59262-d314-457d-8a5a-502538696f79	SUCCESS	\N	2024-10-28 08:25:39.130335	\N	\N	\N	\N	\N	\N	\N
532	f59df4df-2f93-4ed9-b75b-fa0fa8895dd0	SUCCESS	\N	2024-10-28 08:25:46.120214	\N	\N	\N	\N	\N	\N	\N
535	d2f9b18b-7024-4609-9131-488434fa4a6c	SUCCESS	\N	2024-10-28 08:25:54.488542	\N	\N	\N	\N	\N	\N	\N
539	9284ed13-1d25-46af-a8c9-4ee86ff96e80	SUCCESS	\N	2024-10-28 08:25:55.635697	\N	\N	\N	\N	\N	\N	\N
542	263d4ece-a3dc-47d9-97ee-438d1e982e32	SUCCESS	\N	2024-10-28 08:26:02.366953	\N	\N	\N	\N	\N	\N	\N
547	dee69929-1296-4b42-9a33-886a920e7852	SUCCESS	\N	2024-10-28 08:26:10.966336	\N	\N	\N	\N	\N	\N	\N
550	29126557-8b9b-4624-84ed-259f95046717	SUCCESS	\N	2024-10-28 08:26:17.257075	\N	\N	\N	\N	\N	\N	\N
553	b50a71c8-b50c-4e11-ac7c-da5493ec66ec	SUCCESS	\N	2024-10-28 08:26:24.648697	\N	\N	\N	\N	\N	\N	\N
711	7f25d20b-fb94-4c9a-bbe0-1a2dd336f7da	SUCCESS	\N	2024-10-30 03:40:11.853081	\N	\N	\N	\N	\N	\N	\N
716	0b1d4e6b-820c-4344-8d4f-67eefe1688a2	SUCCESS	\N	2024-10-30 03:40:18.453164	\N	\N	\N	\N	\N	\N	\N
720	27ae34d7-e47f-448a-aee6-4260b8d2a18d	SUCCESS	\N	2024-10-30 03:40:26.471238	\N	\N	\N	\N	\N	\N	\N
725	77480c95-ece6-4d19-b224-817cd4292806	SUCCESS	\N	2024-10-30 03:40:32.159442	\N	\N	\N	\N	\N	\N	\N
730	9af34260-65be-4416-bf67-b4cfb350a601	SUCCESS	\N	2024-10-30 03:40:39.312387	\N	\N	\N	\N	\N	\N	\N
733	3b51c6d2-07ce-4ec4-ae16-3f2c0aeefc49	SUCCESS	\N	2024-10-30 03:40:45.588391	\N	\N	\N	\N	\N	\N	\N
738	d20c95f8-8c25-4eaf-89ea-26753b58a7e5	SUCCESS	\N	2024-10-30 03:40:51.828474	\N	\N	\N	\N	\N	\N	\N
742	4a623700-20e7-4e5c-9e4a-9f6f93f944a1	SUCCESS	\N	2024-10-30 03:40:59.355427	\N	\N	\N	\N	\N	\N	\N
748	e55e4a79-dfd4-4be2-867b-c6d8e613c65d	SUCCESS	\N	2024-10-30 03:41:06.486382	\N	\N	\N	\N	\N	\N	\N
750	11bba993-87fb-4a58-9e9b-f06c953626a0	SUCCESS	\N	2024-10-30 03:41:12.597703	\N	\N	\N	\N	\N	\N	\N
754	f1436a4e-2a58-42c2-8816-abfc30a9b821	SUCCESS	\N	2024-10-30 03:41:18.677675	\N	\N	\N	\N	\N	\N	\N
759	e7ff988c-9ceb-4cdb-b633-db1e2e851265	SUCCESS	\N	2024-10-30 03:41:24.321053	\N	\N	\N	\N	\N	\N	\N
762	c377cc2a-cfe3-48c8-8940-eb72d934d1f1	SUCCESS	\N	2024-10-30 03:41:29.10823	\N	\N	\N	\N	\N	\N	\N
768	33ef659f-8d40-4983-b917-3b2a82ae3034	SUCCESS	\N	2024-10-30 03:45:07.516949	\N	\N	\N	\N	\N	\N	\N
772	dc4280df-8543-461a-ac63-8b4f7285bbb6	SUCCESS	\N	2024-10-30 03:45:15.17936	\N	\N	\N	\N	\N	\N	\N
776	4324a4cb-8c78-4b2c-81df-188aae02d7a3	SUCCESS	\N	2024-10-30 03:45:23.395255	\N	\N	\N	\N	\N	\N	\N
780	e7c45070-1f5d-4699-8eec-c831ec0ab78b	SUCCESS	\N	2024-10-30 03:45:30.284579	\N	\N	\N	\N	\N	\N	\N
785	2f3b37b9-b002-4627-89f7-c2b2b7b3631d	SUCCESS	\N	2024-10-30 03:45:38.354762	\N	\N	\N	\N	\N	\N	\N
928	899fb73d-af2b-4b7e-946d-00b978ba3db3	SUCCESS	\N	2024-10-31 03:55:16.957222	\N	\N	\N	\N	\N	\N	\N
931	2b654335-0058-4408-a251-ad431d2fa32d	SUCCESS	\N	2024-10-31 03:55:23.745695	\N	\N	\N	\N	\N	\N	\N
935	08fa7c51-6e56-4743-9449-7eebf122a190	SUCCESS	\N	2024-10-31 03:55:31.400155	\N	\N	\N	\N	\N	\N	\N
939	380c8c04-a960-41ac-89a6-a0651858a965	SUCCESS	\N	2024-10-31 03:55:36.818009	\N	\N	\N	\N	\N	\N	\N
943	acc3bb0e-681b-4ce3-af4a-e457056e87b7	SUCCESS	\N	2024-10-31 03:55:41.662244	\N	\N	\N	\N	\N	\N	\N
947	56deef58-9c29-4566-b82e-971c1c166449	SUCCESS	\N	2024-10-31 03:55:48.803277	\N	\N	\N	\N	\N	\N	\N
952	81eae1e4-4b95-433f-9154-47289f8587d4	SUCCESS	\N	2024-10-31 03:55:55.206503	\N	\N	\N	\N	\N	\N	\N
955	79d610e9-3d2f-4071-b42c-58d7004016ad	SUCCESS	\N	2024-10-31 03:56:01.494158	\N	\N	\N	\N	\N	\N	\N
960	12301ae1-2b6e-4f8b-a4e4-b75b09b19400	SUCCESS	\N	2024-10-31 03:56:08.124286	\N	\N	\N	\N	\N	\N	\N
964	7226e273-0855-438e-89f7-7160c867a155	SUCCESS	\N	2024-10-31 03:56:16.35026	\N	\N	\N	\N	\N	\N	\N
968	77d42e15-4a1a-4735-8c76-ac75682f12ce	SUCCESS	\N	2024-10-31 03:56:23.396208	\N	\N	\N	\N	\N	\N	\N
974	5663f790-4705-4872-b686-01aa5cb4059e	SUCCESS	\N	2024-10-31 04:00:10.878606	\N	\N	\N	\N	\N	\N	\N
979	6a1a368d-6a66-46a5-801b-7c922799b8a1	SUCCESS	\N	2024-10-31 04:00:19.70464	\N	\N	\N	\N	\N	\N	\N
982	f8d9e522-51fa-4b44-bdc6-9e11b3fff959	SUCCESS	\N	2024-10-31 04:00:26.738219	\N	\N	\N	\N	\N	\N	\N
987	ea7b1385-78f3-409c-9aee-a0bbe3bd3898	SUCCESS	\N	2024-10-31 04:00:34.416751	\N	\N	\N	\N	\N	\N	\N
993	7fa0a581-3aa5-4393-b405-bff95322f112	SUCCESS	\N	2024-10-31 04:00:43.148305	\N	\N	\N	\N	\N	\N	\N
997	db52680c-0898-4c8e-9b73-4f77aaefbaba	SUCCESS	\N	2024-10-31 04:00:50.683569	\N	\N	\N	\N	\N	\N	\N
1001	e58c79dc-f85c-40f1-89ae-27112cffd0f0	SUCCESS	\N	2024-10-31 04:00:58.075054	\N	\N	\N	\N	\N	\N	\N
1004	3b368d57-088a-4f51-bef8-cc0e9daa1183	SUCCESS	\N	2024-10-31 04:01:04.654953	\N	\N	\N	\N	\N	\N	\N
1009	b9135ca5-5a01-425a-b413-4a8902888460	SUCCESS	\N	2024-10-31 04:01:11.119801	\N	\N	\N	\N	\N	\N	\N
189	94071f0b-e0bf-416b-a040-75e8447d3fc7	SUCCESS	\N	2024-10-28 02:41:02.489742	\N	\N	\N	\N	\N	\N	\N
190	5c8d4d21-cbfd-4f32-a699-2747905878ea	SUCCESS	\N	2024-10-28 02:55:07.52217	\N	\N	\N	\N	\N	\N	\N
191	55fb97e0-1117-4d48-9ddb-8841e0651e42	SUCCESS	\N	2024-10-28 02:55:07.956091	\N	\N	\N	\N	\N	\N	\N
192	8251db64-4c77-48d9-88db-b81fa7309d9d	SUCCESS	\N	2024-10-28 02:55:12.04834	\N	\N	\N	\N	\N	\N	\N
193	9e9145b3-c7df-4129-891f-da26b59d828d	SUCCESS	\N	2024-10-28 02:55:12.421427	\N	\N	\N	\N	\N	\N	\N
194	febfed0a-4ba4-4da9-b698-66196d04e241	SUCCESS	\N	2024-10-28 02:55:15.356251	\N	\N	\N	\N	\N	\N	\N
195	b4f7180c-9a63-48d6-bc94-c682d682f7ca	SUCCESS	\N	2024-10-28 02:55:16.30424	\N	\N	\N	\N	\N	\N	\N
196	bed54b07-b5ba-4a46-bda8-c31c4391a667	SUCCESS	\N	2024-10-28 02:55:19.883404	\N	\N	\N	\N	\N	\N	\N
197	f4170c0b-7225-4125-8f1e-8817a1830f16	SUCCESS	\N	2024-10-28 02:55:20.501012	\N	\N	\N	\N	\N	\N	\N
198	5780516f-e995-403f-b354-96f19a66dd97	SUCCESS	\N	2024-10-28 02:55:22.392874	\N	\N	\N	\N	\N	\N	\N
199	32f55b6a-54ef-42d5-9338-b9635a97df95	SUCCESS	\N	2024-10-28 02:55:22.56258	\N	\N	\N	\N	\N	\N	\N
200	5f5595ba-ec76-438a-b476-835cdc38da59	SUCCESS	\N	2024-10-28 02:55:22.632907	\N	\N	\N	\N	\N	\N	\N
201	e4143039-4fa5-408f-a3a2-e89a7c310ec4	SUCCESS	\N	2024-10-28 03:00:09.738219	\N	\N	\N	\N	\N	\N	\N
202	17b1c569-6e98-4c0d-ac5f-9e7a81871292	SUCCESS	\N	2024-10-28 03:00:11.074576	\N	\N	\N	\N	\N	\N	\N
203	f875268f-87a4-4242-8c62-a4cc389b8dfe	SUCCESS	\N	2024-10-28 03:00:11.517723	\N	\N	\N	\N	\N	\N	\N
204	814da16e-3594-4d60-aead-6aac7f882efd	SUCCESS	\N	2024-10-28 03:00:11.9795	\N	\N	\N	\N	\N	\N	\N
205	f0b441e2-f24c-4ce4-a677-3ce6af2f5712	SUCCESS	\N	2024-10-28 03:00:17.2312	\N	\N	\N	\N	\N	\N	\N
206	543c8de2-20b1-4092-9748-e2b69868a456	SUCCESS	\N	2024-10-28 03:00:17.738622	\N	\N	\N	\N	\N	\N	\N
207	5954ecca-0b16-4879-971b-7d84e3a2b92e	SUCCESS	\N	2024-10-28 03:00:17.944038	\N	\N	\N	\N	\N	\N	\N
208	490ead81-63ec-428f-9441-f4ba77524a9d	SUCCESS	\N	2024-10-28 03:00:19.06216	\N	\N	\N	\N	\N	\N	\N
209	4b7026a8-0b26-43e9-afb5-0d266d1e3ff5	SUCCESS	\N	2024-10-28 03:00:24.631358	\N	\N	\N	\N	\N	\N	\N
210	b08ada0a-6823-46ae-afb9-2fbe4eda98c0	SUCCESS	\N	2024-10-28 03:00:25.027458	\N	\N	\N	\N	\N	\N	\N
211	34c00e81-b96e-4787-9f8b-1b7a13b43140	SUCCESS	\N	2024-10-28 03:00:25.660024	\N	\N	\N	\N	\N	\N	\N
212	3a543cf4-0fb8-41b4-8982-e5c33c18cbd0	SUCCESS	\N	2024-10-28 03:00:26.111588	\N	\N	\N	\N	\N	\N	\N
213	f4afdfb6-e437-4db7-8c88-11dd6b8e2885	SUCCESS	\N	2024-10-28 03:00:31.948605	\N	\N	\N	\N	\N	\N	\N
214	a5209ea1-ce22-49d0-a80c-f029123f0d6e	SUCCESS	\N	2024-10-28 03:00:32.733595	\N	\N	\N	\N	\N	\N	\N
215	053cf23a-ba44-447d-bd93-155812a5bc88	SUCCESS	\N	2024-10-28 03:00:32.752063	\N	\N	\N	\N	\N	\N	\N
216	636af39e-f455-4bb3-b609-b6b7ebfd07f4	SUCCESS	\N	2024-10-28 03:00:34.64587	\N	\N	\N	\N	\N	\N	\N
217	ce436e01-5da6-4d86-8f27-ebbbb273c780	SUCCESS	\N	2024-10-28 03:00:37.13206	\N	\N	\N	\N	\N	\N	\N
218	852e68e0-beb9-4757-a31e-0cd14b338126	SUCCESS	\N	2024-10-28 03:00:37.953933	\N	\N	\N	\N	\N	\N	\N
219	c70784ca-6492-4cf8-b1e9-d818af18e80f	SUCCESS	\N	2024-10-28 03:00:38.639997	\N	\N	\N	\N	\N	\N	\N
220	416fc9bd-4ef0-4388-8794-0ad2caca486a	SUCCESS	\N	2024-10-28 03:00:40.977253	\N	\N	\N	\N	\N	\N	\N
221	721d6df8-73a0-4b1b-9d47-a11ba4dd65c3	SUCCESS	\N	2024-10-28 03:00:42.264223	\N	\N	\N	\N	\N	\N	\N
222	39cc730f-c8b0-40b0-b870-ac43d27069fe	SUCCESS	\N	2024-10-28 03:00:44.750981	\N	\N	\N	\N	\N	\N	\N
223	abfc2596-005b-447a-a80f-467f4f7fbf08	SUCCESS	\N	2024-10-28 03:00:46.196012	\N	\N	\N	\N	\N	\N	\N
224	347716db-d3c3-43af-944a-fb6df59d4c33	SUCCESS	\N	2024-10-28 03:00:47.717707	\N	\N	\N	\N	\N	\N	\N
225	c51d2207-d645-4470-9e4a-b0925603f839	SUCCESS	\N	2024-10-28 03:00:49.91422	\N	\N	\N	\N	\N	\N	\N
226	48327ae3-b590-4957-94ef-fa24e57f2c5f	SUCCESS	\N	2024-10-28 03:00:51.147817	\N	\N	\N	\N	\N	\N	\N
227	6d3d8c6c-0e68-4c39-8243-0ee7065e00d7	SUCCESS	\N	2024-10-28 03:00:51.203918	\N	\N	\N	\N	\N	\N	\N
228	4073447b-7586-4295-bce6-c4166ba96743	SUCCESS	\N	2024-10-28 03:00:51.880914	\N	\N	\N	\N	\N	\N	\N
229	cfad5360-6fb7-426f-afdd-695cb2af98d8	SUCCESS	\N	2024-10-28 03:00:53.133002	\N	\N	\N	\N	\N	\N	\N
230	01fe62aa-b204-41ff-b71f-9c208bffb1bb	SUCCESS	\N	2024-10-28 03:00:57.66754	\N	\N	\N	\N	\N	\N	\N
231	3950dca8-2f6d-40fd-a2ed-663fea05c257	SUCCESS	\N	2024-10-28 03:00:59.645031	\N	\N	\N	\N	\N	\N	\N
232	43bd3ee3-d24b-4b7d-9e33-c065094e148c	SUCCESS	\N	2024-10-28 03:00:59.829085	\N	\N	\N	\N	\N	\N	\N
233	d044cb77-893e-48b3-b5af-1cfc5f6c327d	SUCCESS	\N	2024-10-28 03:01:00.468115	\N	\N	\N	\N	\N	\N	\N
234	60c24f44-1057-421f-b97e-37b6ec90ec21	SUCCESS	\N	2024-10-28 03:01:04.007296	\N	\N	\N	\N	\N	\N	\N
235	cb59350d-cc04-40fb-9233-3a9b11850c60	SUCCESS	\N	2024-10-28 03:01:07.480523	\N	\N	\N	\N	\N	\N	\N
236	585954ee-3abd-41ba-9b3d-67a964c13a00	SUCCESS	\N	2024-10-28 03:01:07.553736	\N	\N	\N	\N	\N	\N	\N
237	cd673f0f-0687-49eb-a60d-f9414a98f543	SUCCESS	\N	2024-10-28 03:01:07.651313	\N	\N	\N	\N	\N	\N	\N
238	a7cb22e5-95e4-4d3f-97eb-533e432981ec	SUCCESS	\N	2024-10-28 03:01:07.879812	\N	\N	\N	\N	\N	\N	\N
239	041969e9-fb70-4b93-87f7-89d788cdfdb0	SUCCESS	\N	2024-10-28 03:01:14.497516	\N	\N	\N	\N	\N	\N	\N
240	ad9261de-0bcd-4b4e-b248-e0024dfcb9e4	SUCCESS	\N	2024-10-28 03:01:14.993331	\N	\N	\N	\N	\N	\N	\N
241	6243ce0b-7d5a-4559-b6f6-2816a3b22ae1	SUCCESS	\N	2024-10-28 03:01:15.857411	\N	\N	\N	\N	\N	\N	\N
242	5fc428f6-f07b-4193-b5e5-ed64592cfe07	SUCCESS	\N	2024-10-28 03:01:16.082671	\N	\N	\N	\N	\N	\N	\N
243	8e8a3735-e7ef-4a0e-b8c0-25164a3a3684	SUCCESS	\N	2024-10-28 03:01:19.217343	\N	\N	\N	\N	\N	\N	\N
244	4e026d75-0bce-4da0-8178-9b9411e4bc7f	SUCCESS	\N	2024-10-28 03:01:20.107868	\N	\N	\N	\N	\N	\N	\N
245	b68bdb06-c207-4365-90f3-6a8ca1346316	SUCCESS	\N	2024-10-28 03:01:21.949561	\N	\N	\N	\N	\N	\N	\N
246	31d07e40-b63a-443c-9035-b3e452ccb47e	SUCCESS	\N	2024-10-28 03:01:22.349341	\N	\N	\N	\N	\N	\N	\N
247	9ba053b0-d5b4-4693-a75b-5b3793eee16c	SUCCESS	\N	2024-10-28 03:01:25.025651	\N	\N	\N	\N	\N	\N	\N
248	b4fffb50-21b4-4f92-a5b3-51defa9b0360	SUCCESS	\N	2024-10-28 03:01:25.979153	\N	\N	\N	\N	\N	\N	\N
249	0324ba30-4e0c-4bb8-af63-0d8a95e36a97	SUCCESS	\N	2024-10-28 03:01:29.16871	\N	\N	\N	\N	\N	\N	\N
250	220c8c79-b0c1-4235-ac35-9b436f7df7fc	SUCCESS	\N	2024-10-28 03:01:29.594403	\N	\N	\N	\N	\N	\N	\N
251	125d78c6-fb74-48b5-bfd4-c83f52c17368	SUCCESS	\N	2024-10-28 03:01:31.770352	\N	\N	\N	\N	\N	\N	\N
252	3e0e1198-37f1-48fe-97c2-20fc56bc2e05	SUCCESS	\N	2024-10-28 03:01:34.076336	\N	\N	\N	\N	\N	\N	\N
253	f96d32c1-01d2-4849-a20d-c50d81161dfc	SUCCESS	\N	2024-10-28 03:01:35.427908	\N	\N	\N	\N	\N	\N	\N
254	09371e7f-8b9d-47f4-a3f0-165ef4ff7874	SUCCESS	\N	2024-10-28 03:01:36.437896	\N	\N	\N	\N	\N	\N	\N
255	19e23362-15f4-4a16-86e8-5e78a802bb56	SUCCESS	\N	2024-10-28 03:01:36.785142	\N	\N	\N	\N	\N	\N	\N
256	dc7da279-cbea-45f5-a4f9-d8cbab0b380c	SUCCESS	\N	2024-10-28 03:01:40.15416	\N	\N	\N	\N	\N	\N	\N
257	200b7114-7bec-497c-907a-c6a104f842bc	SUCCESS	\N	2024-10-28 03:01:42.717227	\N	\N	\N	\N	\N	\N	\N
258	147a7161-66c5-4893-8278-a2a9e7337f60	SUCCESS	\N	2024-10-28 03:01:42.994409	\N	\N	\N	\N	\N	\N	\N
259	07ba9e8b-de30-4b87-8e56-d9b54383cc79	SUCCESS	\N	2024-10-28 03:01:43.243541	\N	\N	\N	\N	\N	\N	\N
260	534c5f5a-a118-4927-9cf2-e1849d3fc6e1	SUCCESS	\N	2024-10-28 03:01:44.318304	\N	\N	\N	\N	\N	\N	\N
261	5122f681-3989-4620-9848-c2be41580947	SUCCESS	\N	2024-10-28 03:01:48.974157	\N	\N	\N	\N	\N	\N	\N
262	8ee76ff5-deff-43a1-8f94-c1ef9fce2e85	SUCCESS	\N	2024-10-28 03:01:49.340637	\N	\N	\N	\N	\N	\N	\N
263	b55368be-3c5d-467e-94b3-874a55ef6b9c	SUCCESS	\N	2024-10-28 03:01:50.851299	\N	\N	\N	\N	\N	\N	\N
264	82e37d83-d701-4090-b520-3268eae821a4	SUCCESS	\N	2024-10-28 03:01:51.441094	\N	\N	\N	\N	\N	\N	\N
265	dd6b05af-ba27-48b7-a350-12f23fb23fc6	SUCCESS	\N	2024-10-28 03:01:55.920038	\N	\N	\N	\N	\N	\N	\N
266	3544abb2-f035-4b01-92eb-cb87738f50db	SUCCESS	\N	2024-10-28 03:01:56.709693	\N	\N	\N	\N	\N	\N	\N
270	20fee074-6f56-4438-8809-4f5a456f65aa	SUCCESS	\N	2024-10-28 03:02:00.287933	\N	\N	\N	\N	\N	\N	\N
274	38cda8e4-29fc-4029-91b2-ac2891314eaa	SUCCESS	\N	2024-10-28 03:02:04.980997	\N	\N	\N	\N	\N	\N	\N
276	3c844678-067e-41f2-833c-5e200c33a8c9	SUCCESS	\N	2024-10-28 03:02:11.671068	\N	\N	\N	\N	\N	\N	\N
281	9f32bec1-35e3-4a6a-b540-e451d7865585	SUCCESS	\N	2024-10-28 03:02:20.242975	\N	\N	\N	\N	\N	\N	\N
491	e94bc576-b0ac-47ff-924c-a8049b44e6ab	SUCCESS	\N	2024-10-28 08:21:33.047806	\N	\N	\N	\N	\N	\N	\N
494	d333cec2-1a6c-491b-82de-80cc5ffc7322	SUCCESS	\N	2024-10-28 08:21:38.538937	\N	\N	\N	\N	\N	\N	\N
498	852f067c-3746-48ce-94d5-4c1e414d7b4d	SUCCESS	\N	2024-10-28 08:21:46.151993	\N	\N	\N	\N	\N	\N	\N
502	aeaeb32f-c938-4a00-9e27-614c6ccd5107	SUCCESS	\N	2024-10-28 08:21:54.371171	\N	\N	\N	\N	\N	\N	\N
506	d7424f65-751b-415d-b14e-4dc1c63317cf	SUCCESS	\N	2024-10-28 08:21:57.096663	\N	\N	\N	\N	\N	\N	\N
511	56556052-30b4-4a56-9a5c-707465545c0f	SUCCESS	\N	2024-10-28 08:25:11.150104	\N	\N	\N	\N	\N	\N	\N
515	06fc2b6c-d51d-4663-95ad-253a82c35e35	SUCCESS	\N	2024-10-28 08:25:18.320805	\N	\N	\N	\N	\N	\N	\N
518	ccd77b8d-6247-4719-86ae-b7f111ffd5e8	SUCCESS	\N	2024-10-28 08:25:25.072837	\N	\N	\N	\N	\N	\N	\N
522	15416119-4d2e-41c6-b08c-9e33a1244f4c	SUCCESS	\N	2024-10-28 08:25:30.514263	\N	\N	\N	\N	\N	\N	\N
527	aad794c0-59f8-44b5-9a08-5d2fdd4d19aa	SUCCESS	\N	2024-10-28 08:25:37.863259	\N	\N	\N	\N	\N	\N	\N
531	e94c560d-ed69-4558-afb8-170c2602d7ce	SUCCESS	\N	2024-10-28 08:25:46.095459	\N	\N	\N	\N	\N	\N	\N
538	7a9152e0-3f29-4bf0-925c-a833b9ceaff9	SUCCESS	\N	2024-10-28 08:25:55.058625	\N	\N	\N	\N	\N	\N	\N
543	616737f0-8e05-4efb-91b0-cb434656b7ef	SUCCESS	\N	2024-10-28 08:26:02.505691	\N	\N	\N	\N	\N	\N	\N
546	451ce6e6-4ada-45c8-b28a-7e97c518bcd0	SUCCESS	\N	2024-10-28 08:26:10.465113	\N	\N	\N	\N	\N	\N	\N
551	df60ad35-0d39-4704-a262-5c99b0278c55	SUCCESS	\N	2024-10-28 08:26:17.853931	\N	\N	\N	\N	\N	\N	\N
555	f6399761-4687-4107-8c99-5bf02a6011f4	SUCCESS	\N	2024-10-28 08:26:24.820459	\N	\N	\N	\N	\N	\N	\N
712	1b8c8ba3-1486-4472-ace6-e73dbe27d6d0	SUCCESS	\N	2024-10-30 03:40:12.21189	\N	\N	\N	\N	\N	\N	\N
715	bf1ae240-cc48-4bdf-8a70-e445468cad2a	SUCCESS	\N	2024-10-30 03:40:16.792037	\N	\N	\N	\N	\N	\N	\N
718	dfad743d-d52f-439e-b8e4-8ef3d8d6df38	SUCCESS	\N	2024-10-30 03:40:23.452502	\N	\N	\N	\N	\N	\N	\N
723	abd2d995-d6c9-4a63-849b-f54ba623a3fa	SUCCESS	\N	2024-10-30 03:40:30.750914	\N	\N	\N	\N	\N	\N	\N
727	36388b24-575d-4326-8fa5-75731a64b256	SUCCESS	\N	2024-10-30 03:40:34.679684	\N	\N	\N	\N	\N	\N	\N
731	68d34fd4-1f60-4834-9b94-84fcf261a992	SUCCESS	\N	2024-10-30 03:40:39.451798	\N	\N	\N	\N	\N	\N	\N
735	31182d4c-68c6-4e15-befd-3e9e6536e190	SUCCESS	\N	2024-10-30 03:40:45.752149	\N	\N	\N	\N	\N	\N	\N
739	1dba8e0a-4fe8-4a71-b6aa-a0fc087feaba	SUCCESS	\N	2024-10-30 03:40:52.161824	\N	\N	\N	\N	\N	\N	\N
743	988043bc-9897-49ca-8798-b19415d7f6d0	SUCCESS	\N	2024-10-30 03:40:59.431624	\N	\N	\N	\N	\N	\N	\N
747	0d6c7e2b-ae43-42a5-a3b7-175e36c44cc2	SUCCESS	\N	2024-10-30 03:41:06.432179	\N	\N	\N	\N	\N	\N	\N
752	08796064-e12e-452e-84a9-b7488c6a05c2	SUCCESS	\N	2024-10-30 03:41:13.065595	\N	\N	\N	\N	\N	\N	\N
756	eb9fcf3f-c185-4cee-a619-9dece1c2d1d0	SUCCESS	\N	2024-10-30 03:41:19.255924	\N	\N	\N	\N	\N	\N	\N
760	318b1095-7090-4bd0-98c9-35593da8fa5f	SUCCESS	\N	2024-10-30 03:41:25.123001	\N	\N	\N	\N	\N	\N	\N
764	ec95f24b-6816-4940-81ca-f79868168f5f	SUCCESS	\N	2024-10-30 03:41:29.195183	\N	\N	\N	\N	\N	\N	\N
767	db49de3b-1d89-44c5-bf57-6a44004ae33e	SUCCESS	\N	2024-10-30 03:45:07.1194	\N	\N	\N	\N	\N	\N	\N
771	37e57dae-b12d-4603-9098-c3ce7cb4a7e2	SUCCESS	\N	2024-10-30 03:45:14.895064	\N	\N	\N	\N	\N	\N	\N
774	5b8784a9-d77f-4619-bf3a-2c34e0bcb639	SUCCESS	\N	2024-10-30 03:45:21.12991	\N	\N	\N	\N	\N	\N	\N
778	c824ec69-a9a1-40ae-bf2e-8925cc9203ca	SUCCESS	\N	2024-10-30 03:45:28.243478	\N	\N	\N	\N	\N	\N	\N
782	ec728192-7f97-45e2-ba6e-4133de4d44e7	SUCCESS	\N	2024-10-30 03:45:34.82291	\N	\N	\N	\N	\N	\N	\N
786	ea63c9a2-9e9a-46df-a4e3-d6b18580368e	SUCCESS	\N	2024-10-30 03:45:42.20267	\N	\N	\N	\N	\N	\N	\N
1012	0cf08a95-84e9-4390-85b8-4b1295f16875	SUCCESS	\N	2024-10-31 04:01:16.774447	\N	\N	\N	\N	\N	\N	\N
1017	7fe2e1a6-c02e-44f0-85b1-6e06f2b43508	SUCCESS	\N	2024-10-31 04:01:24.965072	\N	\N	\N	\N	\N	\N	\N
1020	7fb8322a-7a35-47e1-8fb5-4c7cd7f4b600	SUCCESS	\N	2024-10-31 04:01:30.63919	\N	\N	\N	\N	\N	\N	\N
1024	9407cfda-5293-474b-9075-b7eb43892ff1	SUCCESS	\N	2024-10-31 04:01:31.580529	\N	\N	\N	\N	\N	\N	\N
267	fc1904d7-427d-415b-8ea9-0b3bd264b6d9	SUCCESS	\N	2024-10-28 03:01:58.611552	\N	\N	\N	\N	\N	\N	\N
273	7dd5e6bc-1de3-4822-9260-32ebf79ada7f	SUCCESS	\N	2024-10-28 03:02:04.780075	\N	\N	\N	\N	\N	\N	\N
277	84421f10-ae27-4733-95f9-733e7de60295	SUCCESS	\N	2024-10-28 03:02:11.84833	\N	\N	\N	\N	\N	\N	\N
283	4e65c991-21e7-4490-ac56-8c8155172c84	SUCCESS	\N	2024-10-28 03:02:20.452459	\N	\N	\N	\N	\N	\N	\N
558	6d046860-f45c-4257-aac8-82a31e46a6dc	SUCCESS	\N	2024-10-28 08:26:29.579703	\N	\N	\N	\N	\N	\N	\N
562	9c5022ae-8830-4d3a-bcd9-684520fe762d	SUCCESS	\N	2024-10-28 08:26:38.151797	\N	\N	\N	\N	\N	\N	\N
567	37c35a43-d8f5-43ef-85ce-3cb3dbcabee6	SUCCESS	\N	2024-10-28 08:26:45.143547	\N	\N	\N	\N	\N	\N	\N
571	5fa22dd0-f291-4641-9140-3db79c70e9e4	SUCCESS	\N	2024-10-28 08:26:52.94823	\N	\N	\N	\N	\N	\N	\N
575	88220cca-b41f-4942-aef6-a5e2d2ec7250	SUCCESS	\N	2024-10-28 08:26:59.026654	\N	\N	\N	\N	\N	\N	\N
579	01c77b83-d58c-4cf9-b598-d6802ad4c170	SUCCESS	\N	2024-10-28 08:30:11.317653	\N	\N	\N	\N	\N	\N	\N
583	0c1eecfd-c57a-4fbb-a520-2f5bcd2314d2	SUCCESS	\N	2024-10-28 08:30:17.48235	\N	\N	\N	\N	\N	\N	\N
588	ec0bf50c-6068-4eb8-893e-54bfc7e8d2a5	SUCCESS	\N	2024-10-28 08:30:24.464082	\N	\N	\N	\N	\N	\N	\N
592	6bb4b799-85eb-450e-ad8e-fcc90f75942b	SUCCESS	\N	2024-10-28 08:30:31.890949	\N	\N	\N	\N	\N	\N	\N
596	55de8a4d-1f15-4f71-8a12-190c81da8bec	SUCCESS	\N	2024-10-28 08:30:38.42049	\N	\N	\N	\N	\N	\N	\N
602	8beda82a-98c2-4ecb-9d3d-c6c164ccc378	SUCCESS	\N	2024-10-28 08:30:45.947653	\N	\N	\N	\N	\N	\N	\N
605	b3d99d8c-2dc7-40c5-a888-ab98766312c2	SUCCESS	\N	2024-10-28 08:30:52.505908	\N	\N	\N	\N	\N	\N	\N
609	48acca9f-2aa8-4934-836a-6e357c5aafe4	SUCCESS	\N	2024-10-28 08:30:58.9732	\N	\N	\N	\N	\N	\N	\N
614	75bfe1aa-5d98-496a-96e0-b585ba39e775	SUCCESS	\N	2024-10-28 08:31:06.512196	\N	\N	\N	\N	\N	\N	\N
619	b24c2013-4d17-4162-8a52-1895059219e4	SUCCESS	\N	2024-10-28 08:31:13.776592	\N	\N	\N	\N	\N	\N	\N
624	af90d524-baa2-49f1-a14b-d34a913afa5e	SUCCESS	\N	2024-10-28 08:31:21.802506	\N	\N	\N	\N	\N	\N	\N
628	7bc7e306-56aa-4621-a601-b88606503e11	SUCCESS	\N	2024-10-28 08:31:29.23401	\N	\N	\N	\N	\N	\N	\N
788	609d2341-3894-48ea-8467-a099c7f38b46	SUCCESS	\N	2024-10-30 03:45:45.433145	\N	\N	\N	\N	\N	\N	\N
792	37d9f475-9785-4663-bc83-f409bb681bc8	SUCCESS	\N	2024-10-30 03:45:50.953858	\N	\N	\N	\N	\N	\N	\N
796	3113cab8-e9c1-42d1-9abf-c0b37f9c98af	SUCCESS	\N	2024-10-30 03:45:56.563343	\N	\N	\N	\N	\N	\N	\N
801	9a323a22-850a-4995-85ca-add3194815f3	SUCCESS	\N	2024-10-30 03:46:03.661836	\N	\N	\N	\N	\N	\N	\N
804	ae97d0b2-8578-4a5a-a3b0-7ec7e0e47094	SUCCESS	\N	2024-10-30 03:46:07.003438	\N	\N	\N	\N	\N	\N	\N
808	76f1378d-731d-428e-b074-5b7b58bab190	SUCCESS	\N	2024-10-30 03:46:12.966294	\N	\N	\N	\N	\N	\N	\N
812	c907fac0-4432-4cd9-8d0f-f535825d0017	SUCCESS	\N	2024-10-30 03:46:17.599497	\N	\N	\N	\N	\N	\N	\N
816	0af57c9b-e186-447c-92bc-1e5305e3a2b5	SUCCESS	\N	2024-10-30 03:46:23.270066	\N	\N	\N	\N	\N	\N	\N
820	ca16b2f3-17d9-429d-bee8-495e12748bcb	SUCCESS	\N	2024-10-30 03:46:29.125937	\N	\N	\N	\N	\N	\N	\N
823	e8b851e7-e73c-454c-a835-09eed128f36c	SUCCESS	\N	2024-10-30 03:46:34.300067	\N	\N	\N	\N	\N	\N	\N
829	aba240a6-cec5-4c2d-8b1b-ccd18f7e9f06	SUCCESS	\N	2024-10-30 03:46:42.828873	\N	\N	\N	\N	\N	\N	\N
833	b9df0967-9d19-4be4-b812-52dc130e58d2	SUCCESS	\N	2024-10-30 03:46:49.433678	\N	\N	\N	\N	\N	\N	\N
838	0d6490de-38ed-4e02-b8c9-973efe0917b4	SUCCESS	\N	2024-10-30 03:50:12.063703	\N	\N	\N	\N	\N	\N	\N
841	df565c43-0921-4964-bba3-449de8330b8c	SUCCESS	\N	2024-10-30 03:50:18.537013	\N	\N	\N	\N	\N	\N	\N
846	e4444767-bb16-4125-a846-411da78799cd	SUCCESS	\N	2024-10-30 03:50:25.666969	\N	\N	\N	\N	\N	\N	\N
849	e48c9ce1-f613-4d54-a413-fccf5dfdf208	SUCCESS	\N	2024-10-30 03:50:30.976495	\N	\N	\N	\N	\N	\N	\N
853	99e9a69e-0d4e-4b56-a09c-c6b30a0e7943	SUCCESS	\N	2024-10-30 03:50:37.288291	\N	\N	\N	\N	\N	\N	\N
1013	ace902ee-fd47-49e2-b08a-a4f76b98f732	SUCCESS	\N	2024-10-31 04:01:17.51919	\N	\N	\N	\N	\N	\N	\N
1016	8fbdd317-d1ba-4780-8ab6-f05e41540511	SUCCESS	\N	2024-10-31 04:01:24.953452	\N	\N	\N	\N	\N	\N	\N
1021	8ceb0a01-e5ed-4b1f-b053-14f7d8299886	SUCCESS	\N	2024-10-31 04:01:31.354902	\N	\N	\N	\N	\N	\N	\N
1026	fc7a4f95-ed69-4fea-ba26-41fda06a6fd7	SUCCESS	\N	2024-10-31 04:01:32.836618	\N	\N	\N	\N	\N	\N	\N
268	e0bf7825-987e-46cf-9918-fd33b22a3b79	SUCCESS	\N	2024-10-28 03:01:58.780933	\N	\N	\N	\N	\N	\N	\N
271	c6e53fbb-c3dc-4289-a86f-c7823b4a34de	SUCCESS	\N	2024-10-28 03:02:04.451953	\N	\N	\N	\N	\N	\N	\N
275	4495c819-a188-4b69-8385-e456df8d6868	SUCCESS	\N	2024-10-28 03:02:11.396896	\N	\N	\N	\N	\N	\N	\N
279	2e1048bc-f27c-4c64-9ddc-432be9f86799	SUCCESS	\N	2024-10-28 03:02:12.804446	\N	\N	\N	\N	\N	\N	\N
280	6fbbe9ef-2045-48f8-b523-36909a57f38d	SUCCESS	\N	2024-10-28 03:02:20.100475	\N	\N	\N	\N	\N	\N	\N
559	d75e8b0b-0731-49eb-a364-7d10a0ee9140	SUCCESS	\N	2024-10-28 08:26:29.614826	\N	\N	\N	\N	\N	\N	\N
563	47740646-93de-40f0-86b7-ee9e44021339	SUCCESS	\N	2024-10-28 08:26:38.220989	\N	\N	\N	\N	\N	\N	\N
566	d53026f9-3587-4949-83ca-8e5e0fd1b73d	SUCCESS	\N	2024-10-28 08:26:44.636328	\N	\N	\N	\N	\N	\N	\N
570	48d95d7d-434f-426a-bf49-c4131a24984e	SUCCESS	\N	2024-10-28 08:26:51.091959	\N	\N	\N	\N	\N	\N	\N
574	2e7cb872-88b2-4541-be4b-2a3f3a778b05	SUCCESS	\N	2024-10-28 08:26:58.760447	\N	\N	\N	\N	\N	\N	\N
580	a3053415-2773-49c8-97bf-870e3c3e81e6	SUCCESS	\N	2024-10-28 08:30:11.344148	\N	\N	\N	\N	\N	\N	\N
584	5baac588-2c27-4695-aa44-d52f64430d1f	SUCCESS	\N	2024-10-28 08:30:18.39725	\N	\N	\N	\N	\N	\N	\N
587	765e1c52-9245-4c39-9e5a-fa22ce384130	SUCCESS	\N	2024-10-28 08:30:24.319122	\N	\N	\N	\N	\N	\N	\N
591	e899a37c-2230-48f5-a510-2a0585c197b1	SUCCESS	\N	2024-10-28 08:30:31.774352	\N	\N	\N	\N	\N	\N	\N
595	fe764c9d-b0f6-49c3-b0a1-a193c6a28f41	SUCCESS	\N	2024-10-28 08:30:38.415922	\N	\N	\N	\N	\N	\N	\N
601	7372d5b0-d77d-4e48-9d1b-280345c82634	SUCCESS	\N	2024-10-28 08:30:45.808758	\N	\N	\N	\N	\N	\N	\N
606	5cd997f1-2a04-4c29-95de-40dff72e5d84	SUCCESS	\N	2024-10-28 08:30:52.837924	\N	\N	\N	\N	\N	\N	\N
610	d5778adb-e244-44e5-98fd-d8af0b03efaf	SUCCESS	\N	2024-10-28 08:30:59.002228	\N	\N	\N	\N	\N	\N	\N
612	d4fd8424-3c72-4da6-b73d-26d77eb4d344	SUCCESS	\N	2024-10-28 08:31:05.337971	\N	\N	\N	\N	\N	\N	\N
616	7ecb9386-32ae-4013-833f-ee1d97d9ee25	SUCCESS	\N	2024-10-28 08:31:07.015684	\N	\N	\N	\N	\N	\N	\N
620	fe79afee-3c3d-4fe0-acea-35e3aff64f80	SUCCESS	\N	2024-10-28 08:31:14.909528	\N	\N	\N	\N	\N	\N	\N
623	d4010855-1a86-4724-9a06-bd7faedc521b	SUCCESS	\N	2024-10-28 08:31:20.027283	\N	\N	\N	\N	\N	\N	\N
627	6d83c134-78ae-4d20-a83d-8124c71c18f0	SUCCESS	\N	2024-10-28 08:31:26.893129	\N	\N	\N	\N	\N	\N	\N
789	6cde9cce-351c-4962-8530-1716d8b59054	SUCCESS	\N	2024-10-30 03:45:45.602909	\N	\N	\N	\N	\N	\N	\N
793	f3a88737-2928-401a-a2e0-9e354f5e2add	SUCCESS	\N	2024-10-30 03:45:51.541953	\N	\N	\N	\N	\N	\N	\N
797	1574dfe8-673b-46bf-8733-40185b9df41c	SUCCESS	\N	2024-10-30 03:45:56.62721	\N	\N	\N	\N	\N	\N	\N
800	5daf7552-6cc4-44c8-9826-42f3fdafa108	SUCCESS	\N	2024-10-30 03:46:02.411252	\N	\N	\N	\N	\N	\N	\N
805	1485aa3f-14fd-48bf-9987-d815cae19402	SUCCESS	\N	2024-10-30 03:46:07.330481	\N	\N	\N	\N	\N	\N	\N
809	9a829277-02cc-4a51-a2aa-c1b98560b6ff	SUCCESS	\N	2024-10-30 03:46:15.501836	\N	\N	\N	\N	\N	\N	\N
813	cc468525-b26e-41f3-9444-32f5b93480df	SUCCESS	\N	2024-10-30 03:46:22.856817	\N	\N	\N	\N	\N	\N	\N
817	ba919445-9b77-4f2b-827a-38d96841bafe	SUCCESS	\N	2024-10-30 03:46:27.018496	\N	\N	\N	\N	\N	\N	\N
821	0ead8760-35e1-4de9-b9fe-668e0c1d18e8	SUCCESS	\N	2024-10-30 03:46:31.037911	\N	\N	\N	\N	\N	\N	\N
825	92e52257-e355-4bfa-865f-669d9493f26e	SUCCESS	\N	2024-10-30 03:46:34.652769	\N	\N	\N	\N	\N	\N	\N
828	cc7a5bc2-8dbf-4aab-8447-17a27c800573	SUCCESS	\N	2024-10-30 03:46:42.370661	\N	\N	\N	\N	\N	\N	\N
832	6ba29eb9-f2f5-4199-bf60-27ddce1e0ca4	SUCCESS	\N	2024-10-30 03:46:48.9442	\N	\N	\N	\N	\N	\N	\N
836	ec5bb3b5-c457-4fe1-aba0-ed04037c32d4	SUCCESS	\N	2024-10-30 03:50:12.021623	\N	\N	\N	\N	\N	\N	\N
842	baa29ca6-f806-4c8f-b660-ba1127847dfd	SUCCESS	\N	2024-10-30 03:50:18.63425	\N	\N	\N	\N	\N	\N	\N
848	cd108bae-35d8-406a-9ab4-39d7f06d1ee5	SUCCESS	\N	2024-10-30 03:50:25.942892	\N	\N	\N	\N	\N	\N	\N
850	383d2491-2236-4326-b6bb-4b7787a772b1	SUCCESS	\N	2024-10-30 03:50:31.247233	\N	\N	\N	\N	\N	\N	\N
854	d5108dac-c1d2-4315-8770-37d3ee8f0c89	SUCCESS	\N	2024-10-30 03:50:37.426559	\N	\N	\N	\N	\N	\N	\N
1014	c120418d-6720-475b-b49c-dd2c14145124	SUCCESS	\N	2024-10-31 04:01:19.542631	\N	\N	\N	\N	\N	\N	\N
1018	8ae3dac4-a59e-40a4-9e53-386110890181	SUCCESS	\N	2024-10-31 04:01:25.503118	\N	\N	\N	\N	\N	\N	\N
1023	02e687c5-11bc-4514-8330-98a29b11d28c	SUCCESS	\N	2024-10-31 04:01:31.489861	\N	\N	\N	\N	\N	\N	\N
269	77405aeb-85fc-4932-be3c-14424f087272	SUCCESS	\N	2024-10-28 03:02:00.052269	\N	\N	\N	\N	\N	\N	\N
272	fe0cdc60-e0df-4361-99ab-3fda54d4b4a2	SUCCESS	\N	2024-10-28 03:02:04.648949	\N	\N	\N	\N	\N	\N	\N
278	861c11d6-2559-435b-a5bd-e6b8a35f0c23	SUCCESS	\N	2024-10-28 03:02:12.01704	\N	\N	\N	\N	\N	\N	\N
282	b4b3309c-96b9-43e4-96d6-93670c22fdfa	SUCCESS	\N	2024-10-28 03:02:20.326719	\N	\N	\N	\N	\N	\N	\N
284	0eb3f6ed-0202-4461-a405-09cde04f3348	SUCCESS	\N	2024-10-28 03:02:26.575468	\N	\N	\N	\N	\N	\N	\N
285	f2082b2a-ad8c-47f8-b8e7-a3a4b39e4820	SUCCESS	\N	2024-10-28 03:02:27.112532	\N	\N	\N	\N	\N	\N	\N
286	d605d68f-706a-4b4c-9df2-8bf89081b368	SUCCESS	\N	2024-10-28 03:02:27.437531	\N	\N	\N	\N	\N	\N	\N
287	d25f2767-674c-4980-b4d8-9020553b2009	SUCCESS	\N	2024-10-28 03:02:28.626113	\N	\N	\N	\N	\N	\N	\N
288	dd330a6d-cee0-4ad3-a5c7-2049ead8a75e	SUCCESS	\N	2024-10-28 03:02:34.249372	\N	\N	\N	\N	\N	\N	\N
289	e42ef2ce-a6e6-4ce6-82eb-7b07d2ec6ab5	SUCCESS	\N	2024-10-28 03:02:35.115585	\N	\N	\N	\N	\N	\N	\N
290	5b850118-fd48-4852-b42e-e76d7908bdc9	SUCCESS	\N	2024-10-28 03:02:35.123235	\N	\N	\N	\N	\N	\N	\N
291	ab60fded-40ea-49c7-9cc1-e925ac88a954	SUCCESS	\N	2024-10-28 03:02:35.155816	\N	\N	\N	\N	\N	\N	\N
292	7c9a1ea4-573b-4300-8283-df653caa5c18	SUCCESS	\N	2024-10-28 03:02:35.521192	\N	\N	\N	\N	\N	\N	\N
293	9d9e0bed-edb6-45e9-9917-2736c95b4c56	SUCCESS	\N	2024-10-28 03:02:42.503751	\N	\N	\N	\N	\N	\N	\N
294	ad23ddf4-a199-4684-864a-4654bd6edf92	SUCCESS	\N	2024-10-28 03:02:43.149782	\N	\N	\N	\N	\N	\N	\N
295	7cdcb9e9-1ed2-4f03-bf06-66a5abd0aaa7	SUCCESS	\N	2024-10-28 03:02:43.36055	\N	\N	\N	\N	\N	\N	\N
296	2365ad6e-a66b-4335-a1b5-3207325537a4	SUCCESS	\N	2024-10-28 03:02:43.665263	\N	\N	\N	\N	\N	\N	\N
297	18f596ed-9153-46ef-89cb-21401b2a6c21	SUCCESS	\N	2024-10-28 03:02:44.196031	\N	\N	\N	\N	\N	\N	\N
298	f98493ce-c23c-45f4-842a-6e7dbd324bd5	SUCCESS	\N	2024-10-28 03:02:44.972914	\N	\N	\N	\N	\N	\N	\N
299	3dfca5a6-e31d-4f4f-8b48-ab88621d085c	SUCCESS	\N	2024-10-28 03:02:48.108449	\N	\N	\N	\N	\N	\N	\N
300	bb964742-6ffa-4f40-8011-6abe514428ff	SUCCESS	\N	2024-10-28 03:02:49.090151	\N	\N	\N	\N	\N	\N	\N
301	fe3fae50-99a7-4d4a-af5b-af8cee06d217	SUCCESS	\N	2024-10-28 03:02:49.833477	\N	\N	\N	\N	\N	\N	\N
302	a504ff6a-c27b-4e0a-a03a-f22e733a3199	SUCCESS	\N	2024-10-28 03:02:50.781781	\N	\N	\N	\N	\N	\N	\N
303	603d4e2a-f062-45b0-8201-b4729db98d79	SUCCESS	\N	2024-10-28 03:02:54.497097	\N	\N	\N	\N	\N	\N	\N
304	7c1e9721-97b6-4322-8667-e6f67edd1d20	SUCCESS	\N	2024-10-28 03:02:55.444342	\N	\N	\N	\N	\N	\N	\N
305	6c653d4d-c5a1-4558-bd98-14c2a4b93bd3	SUCCESS	\N	2024-10-28 03:02:56.184361	\N	\N	\N	\N	\N	\N	\N
306	9d120463-0666-43c8-8b34-23e426c46a82	SUCCESS	\N	2024-10-28 03:02:59.105465	\N	\N	\N	\N	\N	\N	\N
307	c89b8680-8f99-4ea2-86d5-b2a37e99b74e	SUCCESS	\N	2024-10-28 03:03:01.895163	\N	\N	\N	\N	\N	\N	\N
308	d7263ba5-f7e8-473e-9245-085bd4ca0646	SUCCESS	\N	2024-10-28 03:03:02.599278	\N	\N	\N	\N	\N	\N	\N
309	4f15e833-94b1-4b64-bd59-ac2714b3507e	SUCCESS	\N	2024-10-28 03:03:04.767404	\N	\N	\N	\N	\N	\N	\N
310	c5993523-0e8f-4760-88ea-37177c732028	SUCCESS	\N	2024-10-28 03:03:05.004235	\N	\N	\N	\N	\N	\N	\N
311	60ca9b0a-ef1c-4ff6-bf39-39d558030232	SUCCESS	\N	2024-10-28 03:03:07.366027	\N	\N	\N	\N	\N	\N	\N
312	345b5cb3-8210-4bb1-aaf1-231b50de774c	SUCCESS	\N	2024-10-28 03:03:08.178597	\N	\N	\N	\N	\N	\N	\N
313	466e5f52-569b-43b6-bfc7-d38d3376cce6	SUCCESS	\N	2024-10-28 03:03:10.808625	\N	\N	\N	\N	\N	\N	\N
314	570afa87-895c-45d6-a62b-6ef1dd0b5d45	SUCCESS	\N	2024-10-28 03:03:11.035103	\N	\N	\N	\N	\N	\N	\N
315	454f92fe-0c2b-480a-99f2-2256b664394a	SUCCESS	\N	2024-10-28 03:03:12.327313	\N	\N	\N	\N	\N	\N	\N
316	2fa46503-5778-4cf4-a161-0fd5a02be295	SUCCESS	\N	2024-10-28 03:03:13.836722	\N	\N	\N	\N	\N	\N	\N
317	34f278a3-a8cc-43ec-9e53-27d6aa39d027	SUCCESS	\N	2024-10-28 03:03:16.512548	\N	\N	\N	\N	\N	\N	\N
318	c100a7cb-e48f-4519-93f4-ec2f2f6f3749	SUCCESS	\N	2024-10-28 03:03:17.248079	\N	\N	\N	\N	\N	\N	\N
319	824efde3-ebf9-40a3-bc3d-f58c45220dee	SUCCESS	\N	2024-10-28 03:03:18.255131	\N	\N	\N	\N	\N	\N	\N
320	8603fe78-4fba-4feb-8017-7a40b111d7c8	SUCCESS	\N	2024-10-28 03:03:22.038632	\N	\N	\N	\N	\N	\N	\N
321	15969245-2b7c-4c3e-99b3-e613eb63962d	SUCCESS	\N	2024-10-28 03:03:23.029309	\N	\N	\N	\N	\N	\N	\N
322	92add29e-6c0b-4d47-a045-69a189ba91e1	SUCCESS	\N	2024-10-28 03:03:25.212302	\N	\N	\N	\N	\N	\N	\N
323	220241af-31b5-47c0-8a07-b8cac7ccf693	SUCCESS	\N	2024-10-28 03:03:27.550228	\N	\N	\N	\N	\N	\N	\N
324	66a518b0-761d-44cd-82ad-7c3abd176a13	SUCCESS	\N	2024-10-28 03:03:30.197759	\N	\N	\N	\N	\N	\N	\N
325	b9fbee0b-9d99-41cd-84a6-30ec221ae156	SUCCESS	\N	2024-10-28 03:03:30.606211	\N	\N	\N	\N	\N	\N	\N
326	0ca19d87-3c9e-44ca-bf59-f25551deeb66	SUCCESS	\N	2024-10-28 03:03:33.068019	\N	\N	\N	\N	\N	\N	\N
327	8f155bf9-d746-42c0-9014-7f4a3d8aa89d	SUCCESS	\N	2024-10-28 03:03:33.159919	\N	\N	\N	\N	\N	\N	\N
328	48bba9f7-ad22-4f6c-831d-1dc1827e98a4	SUCCESS	\N	2024-10-28 03:03:36.001099	\N	\N	\N	\N	\N	\N	\N
329	cb3fcd7a-945c-45af-b1d4-6bc226a7e514	SUCCESS	\N	2024-10-28 03:03:37.785005	\N	\N	\N	\N	\N	\N	\N
330	a46d479f-950f-469e-a3da-0f9a6fc9fc1a	SUCCESS	\N	2024-10-28 03:03:40.684546	\N	\N	\N	\N	\N	\N	\N
331	d1592adb-fe9a-4b76-ae37-d868f8e6a9a9	SUCCESS	\N	2024-10-28 03:03:40.881416	\N	\N	\N	\N	\N	\N	\N
332	385a3c3f-4afd-40e3-8160-5b3469fd7587	SUCCESS	\N	2024-10-28 03:03:42.577558	\N	\N	\N	\N	\N	\N	\N
333	242520f3-ace7-42f0-998e-9202ea081c0c	SUCCESS	\N	2024-10-28 03:03:45.01128	\N	\N	\N	\N	\N	\N	\N
334	c8f288fd-3c40-487b-aa76-1d20f91971d6	SUCCESS	\N	2024-10-28 03:03:47.589359	\N	\N	\N	\N	\N	\N	\N
335	be13d4c0-9193-4518-91f3-b140e761c270	SUCCESS	\N	2024-10-28 03:03:47.710891	\N	\N	\N	\N	\N	\N	\N
336	a651e3e2-f4d0-44bd-b287-ced308773b8f	SUCCESS	\N	2024-10-28 03:03:48.244972	\N	\N	\N	\N	\N	\N	\N
337	91c46f36-a604-4836-96dc-b43524dafc20	SUCCESS	\N	2024-10-28 03:03:52.19907	\N	\N	\N	\N	\N	\N	\N
338	98aa0c93-2b2b-497d-8eec-774a6824da6a	SUCCESS	\N	2024-10-28 03:03:53.816932	\N	\N	\N	\N	\N	\N	\N
339	a1a6cbed-d410-456f-bc7a-85ba8e516bc9	SUCCESS	\N	2024-10-28 03:03:54.824085	\N	\N	\N	\N	\N	\N	\N
340	5db8ddae-6823-41ff-84bb-d2d55f4ad7eb	SUCCESS	\N	2024-10-28 03:03:55.504748	\N	\N	\N	\N	\N	\N	\N
341	1cd6f66f-e555-4c73-aaa6-1d2b2d7fed23	SUCCESS	\N	2024-10-28 03:03:57.772859	\N	\N	\N	\N	\N	\N	\N
342	3d6a2ead-3f75-431e-a3fd-a51f72170751	SUCCESS	\N	2024-10-28 03:03:59.56167	\N	\N	\N	\N	\N	\N	\N
343	95c6ff4a-b93e-42ad-842f-44445ec25703	SUCCESS	\N	2024-10-28 03:04:02.961131	\N	\N	\N	\N	\N	\N	\N
344	bf28853b-1265-48e2-bc86-c75a8b4807c0	SUCCESS	\N	2024-10-28 03:04:04.69948	\N	\N	\N	\N	\N	\N	\N
345	94120f23-6947-4715-b3de-903b4786305b	SUCCESS	\N	2024-10-28 03:04:04.801407	\N	\N	\N	\N	\N	\N	\N
346	3d5ce929-fc66-4236-86f7-cdc03b57485c	SUCCESS	\N	2024-10-28 03:04:07.046426	\N	\N	\N	\N	\N	\N	\N
347	2f88916a-ba29-4dab-a58d-f5e0789d0db3	SUCCESS	\N	2024-10-28 03:04:08.006253	\N	\N	\N	\N	\N	\N	\N
348	f1034b9c-f630-4eab-9166-c31970274092	SUCCESS	\N	2024-10-28 03:04:10.584292	\N	\N	\N	\N	\N	\N	\N
349	0e9186d3-2d11-425d-85c0-9ea5fc32ae3c	SUCCESS	\N	2024-10-28 03:04:11.472933	\N	\N	\N	\N	\N	\N	\N
350	d90e1711-a6e7-4d4b-a169-0fea501d73d2	SUCCESS	\N	2024-10-28 03:04:14.622505	\N	\N	\N	\N	\N	\N	\N
351	42c1e2a7-43ab-42e1-b5f8-3ab693d2e1d2	SUCCESS	\N	2024-10-28 03:04:15.267444	\N	\N	\N	\N	\N	\N	\N
352	9be476c2-8e20-4f6b-b9c3-4e03a971a454	SUCCESS	\N	2024-10-28 03:04:18.08064	\N	\N	\N	\N	\N	\N	\N
353	0bc936ae-bd54-492e-b0fc-6b8a0d781de1	SUCCESS	\N	2024-10-28 03:04:18.499939	\N	\N	\N	\N	\N	\N	\N
354	146b83fc-2576-487c-8550-4976fe359b3a	SUCCESS	\N	2024-10-28 03:04:22.814129	\N	\N	\N	\N	\N	\N	\N
355	25437a21-4c29-4a2d-917e-a54ebb83d67a	SUCCESS	\N	2024-10-28 03:04:23.221193	\N	\N	\N	\N	\N	\N	\N
356	2f8f2cfd-d684-4933-95f3-0a345b8fe185	SUCCESS	\N	2024-10-28 03:04:23.948642	\N	\N	\N	\N	\N	\N	\N
357	b9ca548d-ba24-4e0c-8a8d-f16e51359355	SUCCESS	\N	2024-10-28 03:04:25.011215	\N	\N	\N	\N	\N	\N	\N
360	ce6cad1d-80ba-4208-bf56-bf15c2bfd9d1	SUCCESS	\N	2024-10-28 03:04:31.700803	\N	\N	\N	\N	\N	\N	\N
364	89a08265-df97-4b58-aa3e-ff7819258684	SUCCESS	\N	2024-10-28 03:04:39.345121	\N	\N	\N	\N	\N	\N	\N
367	cb1eb678-1d06-4477-8de1-1c553be46fda	SUCCESS	\N	2024-10-28 03:04:44.593569	\N	\N	\N	\N	\N	\N	\N
371	023d4b54-ba76-4e17-b1da-8d07b976dab6	SUCCESS	\N	2024-10-28 03:04:51.258563	\N	\N	\N	\N	\N	\N	\N
375	23660bdd-737e-4469-835c-1f7538277c3f	SUCCESS	\N	2024-10-28 03:04:56.544934	\N	\N	\N	\N	\N	\N	\N
379	d7000b4f-333e-4150-a55d-d6a2a40f27db	SUCCESS	\N	2024-10-28 03:04:59.915952	\N	\N	\N	\N	\N	\N	\N
382	a6745f15-f282-44db-8304-5c0774589749	SUCCESS	\N	2024-10-28 03:05:08.232405	\N	\N	\N	\N	\N	\N	\N
387	a1bfa1ad-0ffc-447b-bca9-8b322b4fe8da	SUCCESS	\N	2024-10-28 03:05:15.503989	\N	\N	\N	\N	\N	\N	\N
392	b0df0b41-294d-4f4d-b629-4ea72bd4f99c	SUCCESS	\N	2024-10-28 03:05:22.64325	\N	\N	\N	\N	\N	\N	\N
396	03c2cdf9-e800-431c-bd15-dc1c960a2fe7	SUCCESS	\N	2024-10-28 03:05:30.783267	\N	\N	\N	\N	\N	\N	\N
399	b3592daf-4b9f-4e5b-94c3-700c9450156b	SUCCESS	\N	2024-10-28 03:05:37.271818	\N	\N	\N	\N	\N	\N	\N
403	e8e54083-dadb-4bd8-b969-cbe16f67c97b	SUCCESS	\N	2024-10-28 03:05:40.497745	\N	\N	\N	\N	\N	\N	\N
406	410b0e47-c59b-4f13-89d8-f981be78a8d8	SUCCESS	\N	2024-10-28 03:05:43.129596	\N	\N	\N	\N	\N	\N	\N
409	338482b9-7673-4806-81ff-1d1822885557	SUCCESS	\N	2024-10-28 03:05:44.085566	\N	\N	\N	\N	\N	\N	\N
413	324162e9-8b40-47af-a7f0-c24bb0cdaffb	SUCCESS	\N	2024-10-28 03:05:46.317481	\N	\N	\N	\N	\N	\N	\N
416	3944af8f-848f-4c35-b02c-a29ad8a1e74b	SUCCESS	\N	2024-10-28 03:05:49.781594	\N	\N	\N	\N	\N	\N	\N
420	c06e399d-d01e-41c7-982e-7eeee4ad771c	SUCCESS	\N	2024-10-28 03:05:56.791442	\N	\N	\N	\N	\N	\N	\N
424	e33a671a-4912-429e-b4ce-843206c12e0c	SUCCESS	\N	2024-10-28 03:06:03.793494	\N	\N	\N	\N	\N	\N	\N
428	f770c57e-b197-4841-9683-93a0fed16a8e	SUCCESS	\N	2024-10-28 03:06:11.120576	\N	\N	\N	\N	\N	\N	\N
432	e6f1a03d-467b-4a67-82a0-75276d2b98a8	SUCCESS	\N	2024-10-28 03:06:19.074393	\N	\N	\N	\N	\N	\N	\N
560	03f9ea12-dbf2-4c55-bac1-f06d1192ea2c	SUCCESS	\N	2024-10-28 08:26:32.139548	\N	\N	\N	\N	\N	\N	\N
564	0c11c034-c1ae-479e-9575-777991b05277	SUCCESS	\N	2024-10-28 08:26:39.507678	\N	\N	\N	\N	\N	\N	\N
568	2207ac3b-bd95-4b56-bdbe-b7bf9b3b5ea8	SUCCESS	\N	2024-10-28 08:26:47.896123	\N	\N	\N	\N	\N	\N	\N
572	7ee85a66-b8d2-4ccc-bef7-037bb07b2c58	SUCCESS	\N	2024-10-28 08:26:54.764102	\N	\N	\N	\N	\N	\N	\N
576	122138ec-3ce4-4291-b51b-7651ea070f5c	SUCCESS	\N	2024-10-28 08:26:59.492548	\N	\N	\N	\N	\N	\N	\N
581	2151996e-1a06-4a98-aa4a-e21d298a2136	SUCCESS	\N	2024-10-28 08:30:11.64677	\N	\N	\N	\N	\N	\N	\N
585	6e037cf4-1428-464b-8fd4-25e4fe5dc68e	SUCCESS	\N	2024-10-28 08:30:20.522353	\N	\N	\N	\N	\N	\N	\N
590	5d0b38d2-e03f-43c8-9c62-6ec5649240b4	SUCCESS	\N	2024-10-28 08:30:27.355524	\N	\N	\N	\N	\N	\N	\N
594	d0469c02-9e13-4b8e-a8ca-e67bc9bbde09	SUCCESS	\N	2024-10-28 08:30:32.919171	\N	\N	\N	\N	\N	\N	\N
598	937bf4fe-d5fb-4b83-9c79-573c1ad3b37b	SUCCESS	\N	2024-10-28 08:30:38.580607	\N	\N	\N	\N	\N	\N	\N
600	4598b13e-5821-4c01-9def-2f9755a42206	SUCCESS	\N	2024-10-28 08:30:45.282671	\N	\N	\N	\N	\N	\N	\N
604	d4920d9c-7ca9-47f6-aecf-66339171a714	SUCCESS	\N	2024-10-28 08:30:51.53351	\N	\N	\N	\N	\N	\N	\N
608	afd94520-9a2d-4cfa-add9-719e14b97f3d	SUCCESS	\N	2024-10-28 08:30:58.717367	\N	\N	\N	\N	\N	\N	\N
613	06c0ca46-9a76-4fa3-ae2c-ae53097c03c7	SUCCESS	\N	2024-10-28 08:31:06.163689	\N	\N	\N	\N	\N	\N	\N
617	25e7534d-c448-4a9f-886b-41936bfd9083	SUCCESS	\N	2024-10-28 08:31:09.453661	\N	\N	\N	\N	\N	\N	\N
621	c3bd5d3c-405b-4352-b249-dab34c5029ef	SUCCESS	\N	2024-10-28 08:31:15.50708	\N	\N	\N	\N	\N	\N	\N
625	7ad9991c-2ed4-4d58-bfbf-a0aac22f418e	SUCCESS	\N	2024-10-28 08:31:23.348846	\N	\N	\N	\N	\N	\N	\N
790	2c39a53f-4d93-4aff-b0a2-8491ff355281	SUCCESS	\N	2024-10-30 03:45:47.710239	\N	\N	\N	\N	\N	\N	\N
795	2dd2024f-e5cd-4a9f-ac96-b361290dbc04	SUCCESS	\N	2024-10-30 03:45:54.227585	\N	\N	\N	\N	\N	\N	\N
799	761b437f-c490-43a5-b0be-d0811335df02	SUCCESS	\N	2024-10-30 03:45:59.311066	\N	\N	\N	\N	\N	\N	\N
803	a6cacb8b-48ca-4d98-b0cf-6d5c6e7c6ed5	SUCCESS	\N	2024-10-30 03:46:05.051901	\N	\N	\N	\N	\N	\N	\N
807	45d1e48b-ec65-4c18-90c6-729502049e99	SUCCESS	\N	2024-10-30 03:46:10.712427	\N	\N	\N	\N	\N	\N	\N
810	748b7ffd-fd61-4d86-a8cc-f7860bcedb03	SUCCESS	\N	2024-10-30 03:46:16.80193	\N	\N	\N	\N	\N	\N	\N
814	cd7ced28-0aa3-45e2-bab2-d475f7a5eeeb	SUCCESS	\N	2024-10-30 03:46:23.070557	\N	\N	\N	\N	\N	\N	\N
819	f34fee9c-02ea-4bd4-87c2-4b85c1318a30	SUCCESS	\N	2024-10-30 03:46:28.675615	\N	\N	\N	\N	\N	\N	\N
824	79106372-eb17-445f-b8af-ac640864277f	SUCCESS	\N	2024-10-30 03:46:34.435492	\N	\N	\N	\N	\N	\N	\N
827	14a1cc02-41ec-4766-bf4f-4517e4bfc539	SUCCESS	\N	2024-10-30 03:46:41.321967	\N	\N	\N	\N	\N	\N	\N
830	05cbd752-b94e-40e7-be41-5f76c78ac543	SUCCESS	\N	2024-10-30 03:46:45.633112	\N	\N	\N	\N	\N	\N	\N
835	3987abd2-3440-43ea-9a64-3020c858951a	SUCCESS	\N	2024-10-30 03:46:49.905398	\N	\N	\N	\N	\N	\N	\N
837	83611e28-182d-4bc6-a7d8-d755dbb892cb	SUCCESS	\N	2024-10-30 03:50:12.024062	\N	\N	\N	\N	\N	\N	\N
840	306d1e07-f747-4d2b-8e0e-ce06c56450a9	SUCCESS	\N	2024-10-30 03:50:18.092386	\N	\N	\N	\N	\N	\N	\N
844	c3e06232-594e-46ba-9572-8b3846896558	SUCCESS	\N	2024-10-30 03:50:18.956621	\N	\N	\N	\N	\N	\N	\N
845	be55d09d-73db-4438-a56e-c55a80eb98e0	SUCCESS	\N	2024-10-30 03:50:25.664926	\N	\N	\N	\N	\N	\N	\N
851	86acca8f-d85d-464a-84ad-6cf78e628ec8	SUCCESS	\N	2024-10-30 03:50:31.28774	\N	\N	\N	\N	\N	\N	\N
856	e91c7b3b-7af9-4012-ab0f-d785a578e78c	SUCCESS	\N	2024-10-30 03:50:38.062024	\N	\N	\N	\N	\N	\N	\N
1015	30064f41-97e4-4565-92f4-4869c752d76b	SUCCESS	\N	2024-10-31 04:01:21.168014	\N	\N	\N	\N	\N	\N	\N
1019	7f9db088-3d92-4361-94ca-023d1b8af1c5	SUCCESS	\N	2024-10-31 04:01:26.266553	\N	\N	\N	\N	\N	\N	\N
1022	f46c768a-924b-41d9-a23a-cf2b3227a67c	SUCCESS	\N	2024-10-31 04:01:31.432798	\N	\N	\N	\N	\N	\N	\N
1025	dac96da9-9c4f-49b4-ad04-6c6faededa73	SUCCESS	\N	2024-10-31 04:01:32.720291	\N	\N	\N	\N	\N	\N	\N
358	86efbbb8-928c-4d2f-bf9c-7ce3b4a7150a	SUCCESS	\N	2024-10-28 03:04:30.165432	\N	\N	\N	\N	\N	\N	\N
362	01d66295-d360-4f2a-b0c5-d4b60e0f834e	SUCCESS	\N	2024-10-28 03:04:32.12307	\N	\N	\N	\N	\N	\N	\N
366	cc6f5f73-2942-4c07-993d-7b6800abd4e1	SUCCESS	\N	2024-10-28 03:04:39.660433	\N	\N	\N	\N	\N	\N	\N
369	8e41be8d-a186-4c9f-b466-1f48bec2eb9e	SUCCESS	\N	2024-10-28 03:04:45.066327	\N	\N	\N	\N	\N	\N	\N
374	e2c3b31c-5f61-49cb-8848-11da7698f42c	SUCCESS	\N	2024-10-28 03:04:52.817852	\N	\N	\N	\N	\N	\N	\N
376	f97a9ac1-e643-471b-b7a3-e8f7ec77fc02	SUCCESS	\N	2024-10-28 03:04:59.35172	\N	\N	\N	\N	\N	\N	\N
380	ebecb759-bfe6-4c37-9b3c-235f1c6400b9	SUCCESS	\N	2024-10-28 03:05:02.991178	\N	\N	\N	\N	\N	\N	\N
384	fc3cb4f6-10ec-4361-8272-7c5f97ce86f5	SUCCESS	\N	2024-10-28 03:05:12.05201	\N	\N	\N	\N	\N	\N	\N
388	6d78a254-64fc-470b-aa5d-55b624dfe69c	SUCCESS	\N	2024-10-28 03:05:15.664327	\N	\N	\N	\N	\N	\N	\N
391	9355daf0-d6a8-430d-96b9-5a6ce311f5e4	SUCCESS	\N	2024-10-28 03:05:22.486757	\N	\N	\N	\N	\N	\N	\N
394	307fd97a-6c0f-433c-a640-58d1c89893bb	SUCCESS	\N	2024-10-28 03:05:30.115518	\N	\N	\N	\N	\N	\N	\N
398	2061eae8-a00b-4bad-8aae-48b26d0b0e2a	SUCCESS	\N	2024-10-28 03:05:31.691797	\N	\N	\N	\N	\N	\N	\N
401	76dffc8f-95b7-4d24-8bfd-384b091061fa	SUCCESS	\N	2024-10-28 03:05:39.972415	\N	\N	\N	\N	\N	\N	\N
404	6cba7457-abb8-45e2-89d8-01b062c8717d	SUCCESS	\N	2024-10-28 03:05:42.470702	\N	\N	\N	\N	\N	\N	\N
407	3184d03b-f2a2-44e8-a8b8-896d240e242b	SUCCESS	\N	2024-10-28 03:05:43.432812	\N	\N	\N	\N	\N	\N	\N
410	551989d7-18ea-4e44-8d3f-553238d197c3	SUCCESS	\N	2024-10-28 03:05:44.754774	\N	\N	\N	\N	\N	\N	\N
412	e4c34f0b-4f87-4a33-a39e-143dc548ad60	SUCCESS	\N	2024-10-28 03:05:46.125855	\N	\N	\N	\N	\N	\N	\N
417	33882ab1-369c-49bd-bca3-ba822f7b8457	SUCCESS	\N	2024-10-28 03:05:50.930091	\N	\N	\N	\N	\N	\N	\N
421	749ea1b6-1859-4064-8402-3bbb5f030e35	SUCCESS	\N	2024-10-28 03:05:58.952433	\N	\N	\N	\N	\N	\N	\N
425	7ac4fe35-a8c2-4102-ad5c-3e07095e2f46	SUCCESS	\N	2024-10-28 03:06:06.187193	\N	\N	\N	\N	\N	\N	\N
429	d0745ef5-e9ca-4ecd-b3fd-c404e69e2bce	SUCCESS	\N	2024-10-28 03:06:13.118756	\N	\N	\N	\N	\N	\N	\N
561	b772ec01-f371-49a6-8cf8-dcd555ae7f73	SUCCESS	\N	2024-10-28 08:26:36.415366	\N	\N	\N	\N	\N	\N	\N
565	8bcfc1d1-6e32-46de-bd45-64ff24f32e11	SUCCESS	\N	2024-10-28 08:26:41.561757	\N	\N	\N	\N	\N	\N	\N
569	66506a82-2423-4f14-8f98-e46d0e4abaa8	SUCCESS	\N	2024-10-28 08:26:49.575446	\N	\N	\N	\N	\N	\N	\N
573	e66b8e3c-eec4-41cc-93d9-3620f724ff31	SUCCESS	\N	2024-10-28 08:26:55.651381	\N	\N	\N	\N	\N	\N	\N
577	54197953-b704-48a2-8c01-88200d0f63c2	SUCCESS	\N	2024-10-28 08:26:59.524106	\N	\N	\N	\N	\N	\N	\N
578	cb725057-639d-450c-80a3-6c4b0e16f743	SUCCESS	\N	2024-10-28 08:30:10.313693	\N	\N	\N	\N	\N	\N	\N
582	062afc97-f695-401e-a7a3-09e16f786320	SUCCESS	\N	2024-10-28 08:30:13.946356	\N	\N	\N	\N	\N	\N	\N
586	3b7211ce-c504-4f4a-9313-c48e15550eee	SUCCESS	\N	2024-10-28 08:30:21.552531	\N	\N	\N	\N	\N	\N	\N
589	ee901689-a850-48bc-b75b-25634218f557	SUCCESS	\N	2024-10-28 08:30:27.120954	\N	\N	\N	\N	\N	\N	\N
593	4bd09b8c-a011-44eb-98b3-c30b4ace702d	SUCCESS	\N	2024-10-28 08:30:32.723873	\N	\N	\N	\N	\N	\N	\N
597	490306fb-7bb5-4b5b-8f91-97d9f640a211	SUCCESS	\N	2024-10-28 08:30:38.504389	\N	\N	\N	\N	\N	\N	\N
599	5b1926de-98f6-43f3-aa5f-25ceb8e1b402	SUCCESS	\N	2024-10-28 08:30:44.659876	\N	\N	\N	\N	\N	\N	\N
603	7722679e-06d3-4b71-a27b-70ff31fd6d87	SUCCESS	\N	2024-10-28 08:30:50.997883	\N	\N	\N	\N	\N	\N	\N
607	4d6ed894-9ff5-4e21-aa57-a8d5db9be847	SUCCESS	\N	2024-10-28 08:30:58.351342	\N	\N	\N	\N	\N	\N	\N
611	845229ab-8035-4b45-ba19-577432cf64c1	SUCCESS	\N	2024-10-28 08:31:02.239289	\N	\N	\N	\N	\N	\N	\N
615	8b127a16-f336-4023-9d82-d72c7ba2b572	SUCCESS	\N	2024-10-28 08:31:06.657552	\N	\N	\N	\N	\N	\N	\N
618	b48cebc0-65e8-4df8-aed6-50bb98c66036	SUCCESS	\N	2024-10-28 08:31:12.545326	\N	\N	\N	\N	\N	\N	\N
622	5fecc2e6-d2fe-4daf-b9e6-90c041895c30	SUCCESS	\N	2024-10-28 08:31:17.665194	\N	\N	\N	\N	\N	\N	\N
626	e1b27284-8c09-4f29-b830-18d981a3c62c	SUCCESS	\N	2024-10-28 08:31:24.568153	\N	\N	\N	\N	\N	\N	\N
791	b49d8817-e1f8-4569-bbc4-242503ead8d2	SUCCESS	\N	2024-10-30 03:45:47.82028	\N	\N	\N	\N	\N	\N	\N
794	146edc3f-cfe5-46ef-82e0-1f8a8209f0a2	SUCCESS	\N	2024-10-30 03:45:54.162002	\N	\N	\N	\N	\N	\N	\N
798	c9e69813-33c7-4e91-a103-52539754b5bf	SUCCESS	\N	2024-10-30 03:45:57.26129	\N	\N	\N	\N	\N	\N	\N
802	701a0228-4f2e-443c-b008-c9b99324406f	SUCCESS	\N	2024-10-30 03:46:04.835824	\N	\N	\N	\N	\N	\N	\N
806	608223ba-0ca2-4810-b396-f704b3a25d66	SUCCESS	\N	2024-10-30 03:46:10.003681	\N	\N	\N	\N	\N	\N	\N
811	cb937f61-3a50-44de-aba5-76162b79f220	SUCCESS	\N	2024-10-30 03:46:16.944928	\N	\N	\N	\N	\N	\N	\N
815	848b6c96-c7cd-44da-bc48-2a0c46ad1eae	SUCCESS	\N	2024-10-30 03:46:23.175355	\N	\N	\N	\N	\N	\N	\N
818	249e9d8d-66ac-4e70-902b-ec2247e014cd	SUCCESS	\N	2024-10-30 03:46:28.195527	\N	\N	\N	\N	\N	\N	\N
822	6411e76a-9714-4478-80e9-7d3ef2d844df	SUCCESS	\N	2024-10-30 03:46:34.001948	\N	\N	\N	\N	\N	\N	\N
826	6f78a8c0-60b8-4b3b-9748-9549b0e80c07	SUCCESS	\N	2024-10-30 03:46:40.751561	\N	\N	\N	\N	\N	\N	\N
831	0d45bee2-0713-488e-bbae-e41cd0dcbb21	SUCCESS	\N	2024-10-30 03:46:46.301109	\N	\N	\N	\N	\N	\N	\N
834	66aa3672-934b-4d7f-9559-5458dc6d5699	SUCCESS	\N	2024-10-30 03:46:49.897722	\N	\N	\N	\N	\N	\N	\N
839	f5a3a73f-3063-4b47-bd99-2af578ef060b	SUCCESS	\N	2024-10-30 03:50:12.125018	\N	\N	\N	\N	\N	\N	\N
843	08634a32-395d-4cf6-aea0-505be4bb76ae	SUCCESS	\N	2024-10-30 03:50:18.672184	\N	\N	\N	\N	\N	\N	\N
847	2b2e78ce-5537-4d6d-afea-9deb64d91bf3	SUCCESS	\N	2024-10-30 03:50:25.831881	\N	\N	\N	\N	\N	\N	\N
852	8801568a-9eee-4feb-973b-0d0f177ac1ee	SUCCESS	\N	2024-10-30 03:50:31.384864	\N	\N	\N	\N	\N	\N	\N
855	47fa02a2-1198-4990-ba34-ff4dbcbc9ddb	SUCCESS	\N	2024-10-30 03:50:37.58345	\N	\N	\N	\N	\N	\N	\N
359	6ae96bf6-a576-4388-85ca-aca96dddc803	SUCCESS	\N	2024-10-28 03:04:31.319219	\N	\N	\N	\N	\N	\N	\N
365	fb34b0d4-d15c-4641-a6e1-3612c97c3a01	SUCCESS	\N	2024-10-28 03:04:39.603504	\N	\N	\N	\N	\N	\N	\N
370	ba37050d-4d6e-482c-be5b-5734522aecf4	SUCCESS	\N	2024-10-28 03:04:45.529825	\N	\N	\N	\N	\N	\N	\N
373	24287859-41e7-4831-ba34-759b0120820a	SUCCESS	\N	2024-10-28 03:04:52.169859	\N	\N	\N	\N	\N	\N	\N
378	016b62fe-2d11-477e-8623-c6e08fe993f5	SUCCESS	\N	2024-10-28 03:04:59.90438	\N	\N	\N	\N	\N	\N	\N
383	aa9f3931-b5b1-4422-8a9b-f5baa7ff1f0b	SUCCESS	\N	2024-10-28 03:05:08.751852	\N	\N	\N	\N	\N	\N	\N
386	88b22dc2-26da-49ea-9379-96dd0d63405f	SUCCESS	\N	2024-10-28 03:05:15.271101	\N	\N	\N	\N	\N	\N	\N
390	ec9546e9-1e87-47f7-b621-f5561e0c1a09	SUCCESS	\N	2024-10-28 03:05:22.40764	\N	\N	\N	\N	\N	\N	\N
395	46674c12-feb8-4e04-8131-2918ae94437a	SUCCESS	\N	2024-10-28 03:05:30.593403	\N	\N	\N	\N	\N	\N	\N
400	c52c4801-c973-45e4-b84e-9e986f1a42eb	SUCCESS	\N	2024-10-28 03:05:37.645804	\N	\N	\N	\N	\N	\N	\N
402	2e7a3a12-5a9a-4d54-acf5-19d51b58d26f	SUCCESS	\N	2024-10-28 03:05:40.24774	\N	\N	\N	\N	\N	\N	\N
405	5cc98a36-1a0a-45d9-a0b5-ef26b62ed23b	SUCCESS	\N	2024-10-28 03:05:42.71654	\N	\N	\N	\N	\N	\N	\N
408	7fa4bf83-980c-4d33-b7aa-b866a141137f	SUCCESS	\N	2024-10-28 03:05:43.758617	\N	\N	\N	\N	\N	\N	\N
411	f1722c76-3fa9-480b-964b-85f1f44482dc	SUCCESS	\N	2024-10-28 03:05:45.713494	\N	\N	\N	\N	\N	\N	\N
414	64d60a5d-7066-4fd1-9380-a6601d187508	SUCCESS	\N	2024-10-28 03:05:46.591087	\N	\N	\N	\N	\N	\N	\N
418	a5a57065-031d-4534-a780-9ca62dba2d93	SUCCESS	\N	2024-10-28 03:05:53.695815	\N	\N	\N	\N	\N	\N	\N
422	511c3c31-c7f9-4ca6-8ffc-59eba6de584c	SUCCESS	\N	2024-10-28 03:06:02.057885	\N	\N	\N	\N	\N	\N	\N
426	9ccc775d-d827-43a5-a59b-fe59ce7ce23a	SUCCESS	\N	2024-10-28 03:06:08.106583	\N	\N	\N	\N	\N	\N	\N
431	43dcff51-3078-4b85-8286-ac1d110b6494	SUCCESS	\N	2024-10-28 03:06:15.649451	\N	\N	\N	\N	\N	\N	\N
857	0a32c3a9-e992-44b7-9c87-63114df808eb	SUCCESS	\N	2024-10-30 03:50:44.893985	\N	\N	\N	\N	\N	\N	\N
861	6f76f092-c57f-4faf-84d9-9a0ed0a0d740	SUCCESS	\N	2024-10-30 03:50:45.920548	\N	\N	\N	\N	\N	\N	\N
864	b8d36460-edc7-4947-83a7-8f05dfb6fca2	SUCCESS	\N	2024-10-30 03:50:51.786013	\N	\N	\N	\N	\N	\N	\N
867	59840ee7-389b-456f-890f-6321bb3f95fb	SUCCESS	\N	2024-10-30 03:50:54.449531	\N	\N	\N	\N	\N	\N	\N
870	85445179-2b34-41c5-8316-e4bdf3c6e985	SUCCESS	\N	2024-10-30 03:50:57.557258	\N	\N	\N	\N	\N	\N	\N
874	a600487f-1500-4489-9ef4-364f2f39d9d4	SUCCESS	\N	2024-10-30 03:51:00.603534	\N	\N	\N	\N	\N	\N	\N
879	351412bd-302c-4d00-83a4-83a0ae159b40	SUCCESS	\N	2024-10-30 03:51:07.213965	\N	\N	\N	\N	\N	\N	\N
883	be105128-b9bd-47de-9935-51c37acdf527	SUCCESS	\N	2024-10-30 03:51:15.370717	\N	\N	\N	\N	\N	\N	\N
887	cb4e0612-9968-4e6d-9d25-adaacebb576d	SUCCESS	\N	2024-10-30 03:51:19.716146	\N	\N	\N	\N	\N	\N	\N
894	4f890baf-dcd9-4e0f-95ad-72c99e31e1fc	SUCCESS	\N	2024-10-30 03:51:28.344088	\N	\N	\N	\N	\N	\N	\N
896	a7cb6e12-07a6-4e8f-8b3f-3965a859611c	SUCCESS	\N	2024-10-30 03:51:34.248354	\N	\N	\N	\N	\N	\N	\N
900	8796e6e6-d079-4815-87a5-94670a4ce079	SUCCESS	\N	2024-10-30 03:51:36.993994	\N	\N	\N	\N	\N	\N	\N
904	6996a323-b88e-4497-9d33-98dbf98a2057	SUCCESS	\N	2024-10-30 03:51:43.139924	\N	\N	\N	\N	\N	\N	\N
906	20e654c8-2948-4fad-8003-604c5c9f01bf	SUCCESS	\N	2024-10-30 03:51:48.865928	\N	\N	\N	\N	\N	\N	\N
910	e10474c6-e88b-458d-a21f-eb02cf0ad11f	SUCCESS	\N	2024-10-30 03:51:55.462194	\N	\N	\N	\N	\N	\N	\N
915	93992b15-107c-4f99-aeb9-b1e91aa1d405	SUCCESS	\N	2024-10-30 03:52:00.871082	\N	\N	\N	\N	\N	\N	\N
923	2de438f9-98e8-42f2-ab16-86e2c4d8494a	SUCCESS	\N	2024-10-31 03:55:10.105174	\N	\N	\N	\N	\N	\N	\N
361	ea602541-c8b7-447b-b9d9-0996b5fe93dc	SUCCESS	\N	2024-10-28 03:04:31.787394	\N	\N	\N	\N	\N	\N	\N
363	dd711324-76b0-4325-8990-ab43efbbcaa3	SUCCESS	\N	2024-10-28 03:04:39.333731	\N	\N	\N	\N	\N	\N	\N
368	a29996a2-9b79-4c0a-a269-6a04e5ffc5da	SUCCESS	\N	2024-10-28 03:04:44.692703	\N	\N	\N	\N	\N	\N	\N
372	3c423cde-d622-41df-83e1-7daf6ce2975d	SUCCESS	\N	2024-10-28 03:04:51.600835	\N	\N	\N	\N	\N	\N	\N
377	5b2698d2-4e25-44fc-95de-7097dc63708a	SUCCESS	\N	2024-10-28 03:04:59.744828	\N	\N	\N	\N	\N	\N	\N
381	7784a698-3ac0-45a0-bec7-fbc5d6b22d82	SUCCESS	\N	2024-10-28 03:05:07.478511	\N	\N	\N	\N	\N	\N	\N
385	adc6bf3e-e19e-43f8-89e2-f70bc51d8244	SUCCESS	\N	2024-10-28 03:05:15.199918	\N	\N	\N	\N	\N	\N	\N
389	fe341a50-0f89-4a50-a90f-241d12aa32f1	SUCCESS	\N	2024-10-28 03:05:21.058968	\N	\N	\N	\N	\N	\N	\N
393	80752d70-063d-4cb1-bb59-ebb49393c0be	SUCCESS	\N	2024-10-28 03:05:24.195799	\N	\N	\N	\N	\N	\N	\N
397	f4aba39d-2734-4b6f-9b24-07054ffcc120	SUCCESS	\N	2024-10-28 03:05:31.021224	\N	\N	\N	\N	\N	\N	\N
415	ac5bfb7b-0a52-4e09-a25a-a7cbe695bd95	SUCCESS	\N	2024-10-28 03:05:47.474025	\N	\N	\N	\N	\N	\N	\N
419	00bc65d9-ceae-40e9-87c9-4e5e56cd44a1	SUCCESS	\N	2024-10-28 03:05:54.21408	\N	\N	\N	\N	\N	\N	\N
423	a10f3e01-6c41-48bc-9a0e-cc67795e997b	SUCCESS	\N	2024-10-28 03:06:03.216583	\N	\N	\N	\N	\N	\N	\N
427	df09ca41-513a-497c-8aa9-9c21c7510596	SUCCESS	\N	2024-10-28 03:06:08.320902	\N	\N	\N	\N	\N	\N	\N
430	39908a01-69aa-441a-9357-e82d4f2970c4	SUCCESS	\N	2024-10-28 03:06:14.650018	\N	\N	\N	\N	\N	\N	\N
858	c1788a15-d3e4-4892-8a81-b427317281ec	SUCCESS	\N	2024-10-30 03:50:45.215811	\N	\N	\N	\N	\N	\N	\N
862	d29dd04b-85a9-4f45-839f-cbbb10a6e66e	SUCCESS	\N	2024-10-30 03:50:51.343117	\N	\N	\N	\N	\N	\N	\N
865	5462ea75-faed-4220-86d8-9699f8eec911	SUCCESS	\N	2024-10-30 03:50:53.275154	\N	\N	\N	\N	\N	\N	\N
868	fd45f60f-6f12-450c-913d-1935e946bad4	SUCCESS	\N	2024-10-30 03:50:54.631025	\N	\N	\N	\N	\N	\N	\N
871	634a8208-8a05-40d4-9ffc-3339ac855067	SUCCESS	\N	2024-10-30 03:50:57.626018	\N	\N	\N	\N	\N	\N	\N
873	e46a5c40-d488-4b12-ada9-76c5e7e2d237	SUCCESS	\N	2024-10-30 03:51:00.149118	\N	\N	\N	\N	\N	\N	\N
877	2443594d-2507-4d6e-94dd-beaf22f6be1d	SUCCESS	\N	2024-10-30 03:51:03.029033	\N	\N	\N	\N	\N	\N	\N
881	20ff9e88-cd70-4bd0-bbe2-5a247876f07c	SUCCESS	\N	2024-10-30 03:51:07.557063	\N	\N	\N	\N	\N	\N	\N
885	f76d5612-0af5-4fe5-9d89-c83b1650978d	SUCCESS	\N	2024-10-30 03:51:15.845064	\N	\N	\N	\N	\N	\N	\N
890	c80bd836-ea1f-4af0-82f8-298750cc2413	SUCCESS	\N	2024-10-30 03:51:23.412927	\N	\N	\N	\N	\N	\N	\N
893	c5229fb8-b930-481d-8ff8-5fa764274b60	SUCCESS	\N	2024-10-30 03:51:28.342111	\N	\N	\N	\N	\N	\N	\N
897	7d0c2eaf-8dd5-463c-9374-2fb9a4517aed	SUCCESS	\N	2024-10-30 03:51:34.80788	\N	\N	\N	\N	\N	\N	\N
902	6d7eae13-8b2e-4eac-9977-e8a54a11e3e2	SUCCESS	\N	2024-10-30 03:51:42.955304	\N	\N	\N	\N	\N	\N	\N
908	1b5098e1-36f8-40af-8525-3fa1a2a9c163	SUCCESS	\N	2024-10-30 03:51:49.013433	\N	\N	\N	\N	\N	\N	\N
912	6081169d-0353-4203-b9b6-36cc516b01d8	SUCCESS	\N	2024-10-30 03:51:56.652972	\N	\N	\N	\N	\N	\N	\N
916	311a9455-b325-483f-99a2-b26dea4cfb6a	SUCCESS	\N	2024-10-30 03:52:01.126552	\N	\N	\N	\N	\N	\N	\N
917	ba22ea26-b19b-4e01-b562-72ee421f40b6	SUCCESS	\N	2024-10-31 00:17:28.871294	\N	\N	\N	\N	\N	\N	\N
919	a4188c58-77ad-441e-8e07-c62f281802de	SUCCESS	\N	2024-10-31 00:21:15.465689	\N	\N	\N	\N	\N	\N	\N
922	eb7cc446-3d3c-4bfc-a6b3-1243bf8737de	SUCCESS	\N	2024-10-31 03:55:09.913223	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.celery_tasksetmeta (id, taskset_id, result, date_done) FROM stdin;
\.


--
-- Data for Name: detection_results; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.detection_results (id, image_name, output_name, data) FROM stdin;
1	queued/DJI_0016.JPG	processed/DJI_0016.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:57", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 144249/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 256303/5000]", "EXIF ExposureTime": "1/2500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:57", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
2	queued/DJI_0014.JPG	processed/DJI_0014.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:53", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 288167/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 32103/625]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:28:53", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
3	queued/DJI_0017.JPG	processed/DJI_0017.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:59", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 577323/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 512067/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:28:59", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
4	queued/DJI_0015.JPG	processed/DJI_0015.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:55", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 576647/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 513107/10000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:28:55", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
5	queued/DJI_0019.JPG	processed/DJI_0019.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:03", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 288999/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 255497/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:29:03", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
6	queued/DJI_0018.JPG	processed/DJI_0018.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:01", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 23107/400]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 127887/2500]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:01", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
7	queued/DJI_0021.JPG	processed/DJI_0021.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:07", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 578697/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 127489/2500]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:29:07", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
8	queued/DJI_0020.JPG	processed/DJI_0020.JPG	{"detection": [{"box": [3609.818359375, 336.4324035644531, 3658.515380859375, 384.5054931640625], "confidence": 0.6244020462036133, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:05", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 115667/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 25523/500]", "EXIF ExposureTime": "1/2500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:05", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
9	queued/DJI_0022.JPG	processed/DJI_0022.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:09", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 289493/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 509443/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:09", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
10	queued/DJI_0023.JPG	processed/DJI_0023.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:11", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 579339/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 50893/1000]", "EXIF ExposureTime": "1/1500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:29:11", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
11	queued/DJI_0025.JPG	processed/DJI_0025.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:15", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 289983/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 507907/10000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:29:15", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
12	queued/DJI_0024.JPG	processed/DJI_0024.JPG	{"detection": [{"box": [360.1535949707031, 1918.34814453125, 386.71148681640625, 1939.2987060546875], "confidence": 0.2603926658630371, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:13", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 579641/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 254223/5000]", "EXIF ExposureTime": "1/2000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:13", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
13	queued/DJI_0026.JPG	processed/DJI_0026.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:17", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 145081/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 507383/10000]", "EXIF ExposureTime": "1/3000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:17", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
22	queued/DJI_0034.JPG	processed/DJI_0034.JPG	{"detection": [{"box": [2345.362548828125, 2810.69873046875, 2433.0810546875, 2883.86279296875], "confidence": 0.5741974711418152, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:33", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 72871/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 100641/2000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:33", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
30	queued/DJI_0043.JPG	processed/DJI_0043.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:04", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 292013/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 62699/1250]", "EXIF ExposureTime": "1/2000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:04", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
38	queued/DJI_0051.JPG	processed/DJI_0051.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:20", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 72683/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 12627/250]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "160", "EXIF DateTimeOriginal": "2024:10:31 10:30:20", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
46	queued/DJI_0059.JPG	processed/DJI_0059.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:36", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 578783/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 101863/2000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:36", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
14	queued/DJI_0027.JPG	processed/DJI_0027.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:19", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 58069/1000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 506803/10000]", "EXIF ExposureTime": "1/350", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:19", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
21	queued/DJI_0035.JPG	processed/DJI_0035.JPG	{"detection": [{"box": [3449.8505859375, 1564.361572265625, 3514.1044921875, 1631.2520751953125], "confidence": 0.5762704610824585, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:35", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291653/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 5027/100]", "EXIF ExposureTime": "1/320", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:35", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
29	queued/DJI_0042.JPG	processed/DJI_0042.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:49", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291909/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 250507/5000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:49", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
37	queued/DJI_0050.JPG	processed/DJI_0050.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:18", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 290917/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 252269/5000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:30:18", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
45	queued/DJI_0058.JPG	processed/DJI_0058.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:34", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 144783/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 63599/1250]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:34", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
15	queued/DJI_0028.JPG	processed/DJI_0028.JPG	{"detection": [{"box": [3271.133544921875, 522.1452026367188, 3320.61376953125, 569.6569213867188], "confidence": 0.33404672145843506, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:21", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 290489/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 506327/10000]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:21", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
23	queued/DJI_0036.JPG	processed/DJI_0036.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:37", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 583619/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 50221/1000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:37", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
32	queued/DJI_0044.JPG	processed/DJI_0044.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:07", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 145973/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 501851/10000]", "EXIF ExposureTime": "1/2000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:07", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
40	queued/DJI_0052.JPG	processed/DJI_0052.JPG	{"detection": [{"box": [3626.414794921875, 1744.1690673828125, 3695.183349609375, 1795.520751953125], "confidence": 0.5715175867080688, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:22", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 116231/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 505637/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:22", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
48	queued/DJI_0061.JPG	processed/DJI_0061.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:40", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 14453/250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 255183/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:40", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
16	queued/DJI_0029.JPG	processed/DJI_0029.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:23", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 290679/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 505769/10000]", "EXIF ExposureTime": "1/2500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:23", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
24	queued/DJI_0037.JPG	processed/DJI_0037.JPG	{"detection": [{"box": [2215.0390625, 1902.433349609375, 2252.730224609375, 1933.32666015625], "confidence": 0.290744811296463, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:39", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 583947/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 250853/5000]", "EXIF ExposureTime": "1/3000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:39", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
31	queued/DJI_0045.JPG	processed/DJI_0045.JPG	{"detection": [{"box": [0.3167036175727844, 831.572998046875, 22.9274845123291, 866.335693359375], "confidence": 0.40315020084381104, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:08", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 583393/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 250991/5000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:30:08", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
39	queued/DJI_0053.JPG	processed/DJI_0053.JPG	{"detection": [{"box": [1456.10791015625, 1565.8800048828125, 1483.440185546875, 1589.432861328125], "confidence": 0.5069399476051331, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:24", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 72599/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 63269/1250]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:30:24", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
47	queued/DJI_0060.JPG	processed/DJI_0060.JPG	{"detection": [{"box": [3497.231689453125, 2875.297607421875, 3518.263671875, 2895.563232421875], "confidence": 0.41872668266296387, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:38", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 115691/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 509853/10000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "150", "EXIF DateTimeOriginal": "2024:10:31 10:30:38", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
17	queued/DJI_0030.JPG	processed/DJI_0030.JPG	{"detection": [{"box": [2549.335693359375, 2829.794189453125, 2627.64599609375, 2902.895751953125], "confidence": 0.5465286374092102, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:25", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 29083/500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 252641/5000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:25", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
26	queued/DJI_0039.JPG	processed/DJI_0039.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:43", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 292303/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 500663/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:43", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
34	queued/DJI_0047.JPG	processed/DJI_0047.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:12", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291393/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 50311/1000]", "EXIF ExposureTime": "1/320", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:30:12", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
42	queued/DJI_0055.JPG	processed/DJI_0055.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:28", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 36258/625]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 507199/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:28", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
49	queued/DJI_0065.JPG	processed/DJI_0065.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:48", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 576771/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 512503/10000]", "EXIF ExposureTime": "1/2000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:48", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
18	queued/DJI_0031.JPG	processed/DJI_0031.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:27", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 581989/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 504759/10000]", "EXIF ExposureTime": "1/350", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:27", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
25	queued/DJI_0038.JPG	processed/DJI_0038.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:41", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 584279/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 501157/10000]", "EXIF ExposureTime": "1/3200", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:41", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
33	queued/DJI_0046.JPG	processed/DJI_0046.JPG	{"detection": [{"box": [154.3721923828125, 552.8497924804688, 210.34742736816406, 613.0121459960938], "confidence": 0.5380078554153442, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:10", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291559/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 251223/5000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:30:10", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
41	queued/DJI_0054.JPG	processed/DJI_0054.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:26", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 290243/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 253347/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:26", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
50	queued/DJI_0062.JPG	processed/DJI_0062.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:42", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 288893/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 127727/2500]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:42", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
19	queued/DJI_0032.JPG	processed/DJI_0032.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:29", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291161/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 504249/10000]", "EXIF ExposureTime": "1/350", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:29", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
27	queued/DJI_0040.JPG	processed/DJI_0040.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:45", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 292417/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 500233/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:29:45", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
35	queued/DJI_0049.JPG	processed/DJI_0049.JPG	{"detection": [{"box": [2122.36181640625, 289.4231872558594, 2168.343994140625, 327.13616943359375], "confidence": 0.35074281692504883, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:16", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 582149/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 63003/1250]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:30:16", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
44	queued/DJI_0057.JPG	processed/DJI_0057.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:32", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 579459/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 508247/10000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:32", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
20	queued/DJI_0033.JPG	processed/DJI_0033.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:31", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 582639/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 125939/2500]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:29:31", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
28	queued/DJI_0041.JPG	processed/DJI_0041.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:29:47", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 29217/500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 500487/10000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:29:47", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
36	queued/DJI_0048.JPG	processed/DJI_0048.JPG	{"detection": [{"box": [3229.930908203125, 844.2821044921875, 3291.51416015625, 884.5783081054688], "confidence": 0.8687026500701904, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:14", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 291267/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 503591/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:14", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
43	queued/DJI_0056.JPG	processed/DJI_0056.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:30", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 579809/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 31734/625]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:30:30", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
51	queued/DJI_0002.JPG	processed/DJI_0002.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:29", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 114481/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 259843/5000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:29", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
52	queued/DJI_0001.JPG	processed/DJI_0001.JPG	{"detection": [{"box": [114.36519622802734, 1060.52197265625, 142.7002410888672, 1085.9727783203125], "confidence": 0.5000683069229126, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:27", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 572093/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 520223/10000]", "EXIF ExposureTime": "1/725", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:27", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
53	queued/DJI_0003.JPG	processed/DJI_0003.JPG	{"detection": [{"box": [2992.94873046875, 912.2537231445312, 3047.15380859375, 962.247314453125], "confidence": 0.5891066789627075, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:31", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 572783/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 519191/10000]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:31", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
54	queued/DJI_0004.JPG	processed/DJI_0004.JPG	{"detection": [{"box": [3195.58154296875, 160.2128143310547, 3237.518798828125, 200.5543212890625], "confidence": 0.6532723903656006, "class_id": 0, "class_name": "birddrop"}, {"box": [3129.606689453125, 2499.868896484375, 3150.5888671875, 2520.428466796875], "confidence": 0.2778455317020416, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:33", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 22923/400]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 518701/10000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:28:33", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
55	queued/DJI_0005.JPG	processed/DJI_0005.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:35", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 573419/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 103639/2000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:28:35", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
56	queued/DJI_0006.JPG	processed/DJI_0006.JPG	{"detection": [{"box": [2656.12646484375, 1839.7255859375, 2707.61669921875, 1888.7059326171875], "confidence": 0.4601419270038605, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:37", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 286871/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 258849/5000]", "EXIF ExposureTime": "1/1600", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:37", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
57	queued/DJI_0007.JPG	processed/DJI_0007.JPG	{"detection": [{"box": [3075.978759765625, 748.7177124023438, 3122.287353515625, 794.1897583007812], "confidence": 0.6380417943000793, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:39", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 143513/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 64647/1250]", "EXIF ExposureTime": "1/1600", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:39", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
58	queued/DJI_0009.JPG	processed/DJI_0009.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:43", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 143669/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 516199/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:28:43", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
59	queued/DJI_0008.JPG	processed/DJI_0008.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:41", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 919/16]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 258351/5000]", "EXIF ExposureTime": "1/4000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:41", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
67	queued/DJI_0066.JPG	processed/DJI_0066.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:50", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 576421/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 513039/10000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:30:50", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
68	queued/DJI_0068.JPG	processed/DJI_0068.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:54", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 71969/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 514043/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:54", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
75	queued/DJI_0074.JPG	processed/DJI_0074.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:06", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 143441/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 258601/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:06", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
77	queued/DJI_0077.JPG	processed/DJI_0077.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:12", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 71591/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 259403/5000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:12", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
82	queued/DJI_0082.JPG	processed/DJI_0082.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:22", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 571121/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 260653/5000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:22", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
84	queued/DJI_0085.JPG	processed/DJI_0085.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:28", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 14253/250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 522889/10000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:28", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
91	queued/DJI_0090.JPG	processed/DJI_0090.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:38", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 28423/500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 262713/5000]", "EXIF ExposureTime": "1/320", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:31:38", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
93	queued/DJI_0093.JPG	processed/DJI_0093.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:44", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 113489/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 263503/5000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:31:44", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
99	queued/DJI_0099.JPG	processed/DJI_0099.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:56", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 282687/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 265107/5000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:31:56", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
101	queued/DJI_0100.JPG	processed/DJI_0100.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:58", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 565079/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 5307/100]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "150", "EXIF DateTimeOriginal": "2024:10:31 10:31:58", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
60	queued/DJI_0010.JPG	processed/DJI_0010.JPG	{"detection": [{"box": [2335.72265625, 129.00132751464844, 2362.457275390625, 151.8560333251953], "confidence": 0.4596894383430481, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:45", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 35938/625]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 515677/10000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:45", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
65	queued/DJI_0064.JPG	processed/DJI_0064.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:46", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 577079/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 255983/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:46", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
72	queued/DJI_0073.JPG	processed/DJI_0073.JPG	{"detection": [{"box": [610.7626342773438, 2515.195556640625, 654.2199096679688, 2564.16552734375], "confidence": 0.33308976888656616, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:04", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 143523/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 20669/400]", "EXIF ExposureTime": "1/1600", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:04", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
80	queued/DJI_0080.JPG	processed/DJI_0080.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:18", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 285897/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 260133/5000]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:18", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
88	queued/DJI_0089.JPG	processed/DJI_0089.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:36", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 568779/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 20997/400]", "EXIF ExposureTime": "1/320", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:36", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
97	queued/DJI_0096.JPG	processed/DJI_0096.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:50", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 113279/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 132151/2500]", "EXIF ExposureTime": "1/1250", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:50", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
104	queued/DJI_0104.JPG	processed/DJI_0104.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:06", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 70463/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 532849/10000]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:32:06", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
61	queued/DJI_0063.JPG	processed/DJI_0063.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:44", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 577449/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 255703/5000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:44", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
69	queued/DJI_0069.JPG	processed/DJI_0069.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:56", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 71929/1250]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 514619/10000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:30:56", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
76	queued/DJI_0076.JPG	processed/DJI_0076.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:10", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 573097/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 129563/2500]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:10", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
85	queued/DJI_0084.JPG	processed/DJI_0084.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:26", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 285221/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 261177/5000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:31:26", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
92	queued/DJI_0092.JPG	processed/DJI_0092.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:42", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 567773/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 526503/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "160", "EXIF DateTimeOriginal": "2024:10:31 10:31:42", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
100	queued/DJI_0101.JPG	processed/DJI_0101.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:00", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 141177/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 425/8]", "EXIF ExposureTime": "1/350", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:32:00", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
62	queued/DJI_0013.JPG	processed/DJI_0013.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:51", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 575991/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 514153/10000]", "EXIF ExposureTime": "1/4000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:28:51", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
73	queued/DJI_0071.JPG	processed/DJI_0071.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:00", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 574741/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 32228/625]", "EXIF ExposureTime": "1/725", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:31:00", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
81	queued/DJI_0081.JPG	processed/DJI_0081.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:20", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 114291/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 130201/2500]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:20", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
89	queued/DJI_0088.JPG	processed/DJI_0088.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:34", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 569121/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 20977/400]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:34", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
96	queued/DJI_0097.JPG	processed/DJI_0097.JPG	{"detection": [{"box": [2061.472900390625, 552.4676513671875, 2184.968505859375, 632.1448364257812], "confidence": 0.2603950500488281, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:52", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 566117/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 132279/2500]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:52", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
106	queued/DJI_0105.JPG	processed/DJI_0105.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:08", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 563359/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 106669/2000]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:32:08", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
63	queued/DJI_0011.JPG	processed/DJI_0011.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:47", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 287687/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 103031/2000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:28:47", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
71	queued/DJI_0070.JPG	processed/DJI_0070.JPG	{"detection": [{"box": [2335.30615234375, 1334.0511474609375, 2365.9375, 1372.49365234375], "confidence": 0.6415098309516907, "class_id": 0, "class_name": "birddrop"}, {"box": [2116.344482421875, 1802.835205078125, 2140.860595703125, 1825.7821044921875], "confidence": 0.3363628089427948, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:58", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 287549/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 32194/625]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:30:58", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
79	queued/DJI_0078.JPG	processed/DJI_0078.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:14", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 572457/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 103859/2000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:31:14", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
87	queued/DJI_0087.JPG	processed/DJI_0087.JPG	{"detection": [{"box": [3814.593505859375, 2253.328857421875, 3856.867431640625, 2281.062255859375], "confidence": 0.2672816216945648, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:32", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 28473/500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 104779/2000]", "EXIF ExposureTime": "1/400", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:32", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
94	queued/DJI_0094.JPG	processed/DJI_0094.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:46", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 567079/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 527581/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:46", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
103	queued/DJI_0102.JPG	processed/DJI_0102.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:02", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 564397/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 265877/5000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:32:02", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
64	queued/DJI_0012.JPG	processed/DJI_0012.JPG	{"detection": [{"box": [3239.20556640625, 177.56991577148438, 3279.403564453125, 218.74407958984375], "confidence": 0.6089181303977966, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:28:49", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 575689/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 514639/10000]", "EXIF ExposureTime": "1/1500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:28:49", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
70	queued/DJI_0072.JPG	processed/DJI_0072.JPG	{"detection": [{"box": [3803.441162109375, 129.97947692871094, 3859.508056640625, 168.3439178466797], "confidence": 0.5324761867523193, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:02", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 35902/625]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 516209/10000]", "EXIF ExposureTime": "1/2000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:02", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
78	queued/DJI_0079.JPG	processed/DJI_0079.JPG	{"detection": [{"box": [2437.0576171875, 2043.607666015625, 2464.40673828125, 2066.5478515625], "confidence": 0.5048202872276306, "class_id": 0, "class_name": "birddrop"}], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:16", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 572119/10000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 259887/5000]", "EXIF ExposureTime": "1/725", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "150", "EXIF DateTimeOriginal": "2024:10:31 10:31:16", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
86	queued/DJI_0086.JPG	processed/DJI_0086.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:30", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 284887/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 523371/10000]", "EXIF ExposureTime": "1/320", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:31:30", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
95	queued/DJI_0095.JPG	processed/DJI_0095.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:48", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 22671/400]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 528063/10000]", "EXIF ExposureTime": "1/800", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:31:48", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
102	queued/DJI_0103.JPG	processed/DJI_0103.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:04", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 35251/625]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 532307/10000]", "EXIF ExposureTime": "1/1000", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:32:04", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
66	queued/DJI_0067.JPG	processed/DJI_0067.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:30:52", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 115223/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 256767/5000]", "EXIF ExposureTime": "1/1600", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:30:52", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
74	queued/DJI_0075.JPG	processed/DJI_0075.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:08", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 114689/2000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 103541/2000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "120", "EXIF DateTimeOriginal": "2024:10:31 10:31:08", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
83	queued/DJI_0083.JPG	processed/DJI_0083.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:24", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 285413/5000]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 260911/5000]", "EXIF ExposureTime": "1/1500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "100", "EXIF DateTimeOriginal": "2024:10:31 10:31:24", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
90	queued/DJI_0091.JPG	processed/DJI_0091.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:40", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 142027/2500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 105193/2000]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "140", "EXIF DateTimeOriginal": "2024:10:31 10:31:40", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
98	queued/DJI_0098.JPG	processed/DJI_0098.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:31:54", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 35358/625]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 132407/2500]", "EXIF ExposureTime": "1/500", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "130", "EXIF DateTimeOriginal": "2024:10:31 10:31:54", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
105	queued/DJI_0106.JPG	processed/DJI_0106.JPG	{"detection": [], "exifdata": {"Image Make": "DJI", "Image Model": "FC3582", "Image Orientation": "Horizontal (normal)", "Image XResolution": "72", "Image YResolution": "72", "Image DateTime": "2024:10:31 10:32:10", "GPS GPSLatitudeRef": "S", "GPS GPSLatitude": "[6, 22, 28151/500]", "GPS GPSLongitudeRef": "E", "GPS GPSLongitude": "[107, 12, 106771/2000]", "EXIF ExposureTime": "1/640", "EXIF FNumber": "17/10", "EXIF ISOSpeedRatings": "110", "EXIF DateTimeOriginal": "2024:10:31 10:32:10", "EXIF FocalLength": "168/25", "EXIF WhiteBalance": "Auto"}}
\.


--
-- Data for Name: object; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.object (id, detected_id, detected_confidence, first_img, first_xmin, first_ymin, first_xmax, first_ymax, last_img, last_xmin, last_ymin, last_xmax, last_ymax, lat, long, location, container, created_at, updated_at) FROM stdin;
1	38fad533-380d-452a-aecd-c5a8246787e9	0.6244020462036133	output/detected/20241031/DJI_0020.JPG	3609.818359375	336.4324035644531	3658.515380859375	384.5054931640625	\N	\N	\N	\N	\N	-6.382732	107.214179	0101000020E6100000DB87BCE5EA8719C05C1FD61BB5CD5A40	input	2024-10-31 03:55:16.875856+00	\N
2	9de54c86-278b-444a-87d4-c6119c47e999	0.2603926658630371	output/undetected/20241031/DJI_0024.JPG	360.1535949707031	1918.34814453125	386.71148681640625	1939.2987060546875	\N	\N	\N	\N	\N	-6.382768	107.214123	0101000020E610000042D2A755F48719C09294F430B4CD5A40	input	2024-10-31 03:55:24.631314+00	\N
3	eaf3f342-90e9-40b1-8c9e-6d456e22106a	0.33404672145843506	output/undetected/20241031/DJI_0028.JPG	3271.133544921875	522.1452026367188	3320.61376953125	569.6569213867188	\N	\N	\N	\N	\N	-6.382805	107.214065	0101000020E61000002BFBAE08FE8719C0F88DAF3DB3CD5A40	input	2024-10-31 03:55:31.283882+00	\N
4	59077877-9561-4477-af8c-8ed1255b8c06	0.5465286374092102	output/detected/20241031/DJI_0030.JPG	2549.335693359375	2829.794189453125	2627.64599609375	2902.895751953125	\N	\N	\N	\N	\N	-6.382824	107.214036	0101000020E6100000E17EC003038819C0AA0A0DC4B2CD5A40	input	2024-10-31 03:55:33.683886+00	\N
5	899fc4c9-5fd4-427d-8ac7-5d313f3ad931	0.5762704610824585	output/detected/20241031/DJI_0035.JPG	3449.8505859375	1564.361572265625	3514.1044921875	1631.2520751953125	\N	\N	\N	\N	\N	-6.38287	107.213964	0101000020E6100000637AC2120F8819C05EA10F96B1CD5A40	input	2024-10-31 03:55:40.714069+00	\N
6	6072653b-3960-4703-8e44-0597d71fbe4d	0.5741974711418152	output/detected/20241031/DJI_0034.JPG	2345.362548828125	2810.69873046875	2433.0810546875	2883.86279296875	\N	\N	\N	\N	\N	-6.38286	107.213978	0101000020E610000047C9AB730C8819C01004C8D0B1CD5A40	input	2024-10-31 03:55:40.851901+00	\N
7	561b3638-8619-44d6-866e-b90a89219ee3	0.290744811296463	output/undetected/20241031/DJI_0037.JPG	2215.0390625	1902.433349609375	2252.730224609375	1933.32666015625	\N	\N	\N	\N	\N	-6.382887	107.213936	0101000020E610000014419C87138819C0F9DB9E20B1CD5A40	input	2024-10-31 03:55:44.877735+00	\N
8	b8e5e966-9423-4142-86ad-426741d1e23f	0.40315020084381104	output/undetected/20241031/DJI_0045.JPG	0.3167036175727844	831.572998046875	22.9274845123291	866.335693359375	\N	\N	\N	\N	\N	-6.382872	107.213944	0101000020E61000006937FA980F8819C03ACB2C42B1CD5A40	input	2024-10-31 03:55:54.775488+00	\N
9	377a09f2-d055-4995-852c-06e59e280099	0.5380078554153442	output/undetected/20241031/DJI_0046.JPG	154.3721923828125	552.8497924804688	210.34742736816406	613.0121459960938	\N	\N	\N	\N	\N	-6.382864	107.213957	0101000020E610000052431B800D8819C00470B378B1CD5A40	input	2024-10-31 03:55:57.027423+00	\N
10	18cb90c1-7d5d-4f85-8918-d845a70a2e54	0.35074281692504883	output/undetected/20241031/DJI_0049.JPG	2122.36181640625	289.4231872558594	2168.343994140625	327.13616943359375	\N	\N	\N	\N	\N	-6.382837	107.214001	0101000020E610000086CB2A6C068819C0EC134031B2CD5A40	input	2024-10-31 03:56:01.346353+00	\N
11	10003d80-41a0-441b-9202-59f89c2257e4	0.8687026500701904	output/detected/20241031/DJI_0048.JPG	3229.930908203125	844.2821044921875	3291.51416015625	884.5783081054688	\N	\N	\N	\N	\N	-6.382848	107.213989	0101000020E6100000255B5D4E098819C00A2DEBFEB1CD5A40	input	2024-10-31 03:56:02.105952+00	\N
12	a008c3f4-ba0a-45b6-bb68-9a732eac95af	0.5069399476051331	output/undetected/20241031/DJI_0053.JPG	1456.10791015625	1565.8800048828125	1483.440185546875	1589.432861328125	\N	\N	\N	\N	\N	-6.3828	107.21406	0101000020E61000009CA223B9FC8719C06FD8B628B3CD5A40	input	2024-10-31 03:56:07.230932+00	\N
13	993f1fdf-3609-462a-a892-84a4142d78cd	0.5715175867080688	output/detected/20241031/DJI_0052.JPG	3626.414794921875	1744.1690673828125	3695.183349609375	1795.520751953125	\N	\N	\N	\N	\N	-6.38281	107.214045	0101000020E6100000B9533A58FF8719C0D4B7CCE9B2CD5A40	input	2024-10-31 03:56:08.046654+00	\N
14	f2d2b16c-da5a-43c7-9fee-e9a57ba5d6e9	0.41872668266296387	output/undetected/20241031/DJI_0060.JPG	3497.231689453125	2875.297607421875	3518.263671875	2895.563232421875	\N	\N	\N	\N	\N	-6.382735	107.214163	0101000020E6100000642310AFEB8719C0D940BAD8B4CD5A40	input	2024-10-31 03:56:21.820734+00	\N
15	13cce350-98e1-4dca-a476-8d3b2b250c8a	0.5891066789627075	output/detected/20241031/DJI_0003.JPG	2992.94873046875	912.2537231445312	3047.15380859375	962.247314453125	\N	\N	\N	\N	\N	-6.382577	107.214422	0101000020E6100000A3CEDC43C28719C0BF620D17B9CD5A40	input	2024-10-31 04:00:10.763482+00	\N
16	6f44b848-89c5-41eb-940d-45b3836a1b8b	0.5000683069229126	output/undetected/20241031/DJI_0001.JPG	114.36519622802734	1060.52197265625	142.7002410888672	1085.9727783203125	\N	\N	\N	\N	\N	-6.382558	107.214451	0101000020E6100000ED4ACB48BD8719C00CE6AF90B9CD5A40	input	2024-10-31 04:00:10.770921+00	\N
17	9f1fff6a-2692-4493-bb4b-bdc2a13f5785	0.6532723903656006	output/detected/20241031/DJI_0004.JPG	3195.58154296875	160.2128143310547	3237.518798828125	200.5543212890625	\N	\N	\N	\N	\N	-6.382585	107.214408	0101000020E6100000B9C2BB5CC48719C00D0055DCB8CD5A40	input	2024-10-31 04:00:10.797388+00	\N
18	3776ebfc-00e5-4d01-b8e6-7168232c1942	0.4601419270038605	output/undetected/20241031/DJI_0006.JPG	2656.12646484375	1839.7255859375	2707.61669921875	1888.7059326171875	\N	\N	\N	\N	\N	-6.382604	107.214381	0101000020E61000006F46CD57C98719C090F8156BB8CD5A40	input	2024-10-31 04:00:18.879337+00	\N
19	7439a3e0-b873-4136-a7ca-40dee62a9125	0.6380417943000793	output/detected/20241031/DJI_0007.JPG	3075.978759765625	748.7177124023438	3122.287353515625	794.1897583007812	\N	\N	\N	\N	\N	-6.382613	107.214366	0101000020E61000000919C8B3CB8719C0F5D72B2CB8CD5A40	input	2024-10-31 04:00:19.33245+00	\N
20	d53380b6-83da-4ff9-bf75-4286fc2aada8	0.4596894383430481	output/undetected/20241031/DJI_0010.JPG	2335.72265625	129.00132751464844	2362.457275390625	151.8560333251953	\N	\N	\N	\N	\N	-6.382639	107.214324	0101000020E610000053B29C84D28719C0DEAF027CB7CD5A40	input	2024-10-31 04:00:19.890765+00	\N
21	bd2c24d0-5990-4202-a345-97e1a16ac94d	0.6089181303977966	output/detected/20241031/DJI_0012.JPG	3239.20556640625	177.56991577148438	3279.403564453125	218.74407958984375	\N	\N	\N	\N	\N	-6.382658	107.214296	0101000020E61000000936AE7FD78719C079EA9106B7CD5A40	input	2024-10-31 04:00:26.714481+00	\N
22	c8a1171d-a956-4dc6-a00d-f6454bf5ef8e	0.5324761867523193	output/undetected/20241031/DJI_0072.JPG	3803.441162109375	129.97947692871094	3859.508056640625	168.3439178466797	\N	\N	\N	\N	\N	-6.382623	107.214339	0101000020E610000025CADE52CE8719C078D0ECBAB7CD5A40	input	2024-10-31 04:00:41.803428+00	\N
23	975e4788-756f-49d7-8856-dc12770c0b7a	0.6415098309516907	output/detected/20241031/DJI_0070.JPG	2335.30615234375	1334.0511474609375	2365.9375	1372.49365234375	\N	\N	\N	\N	\N	-6.382642	107.214308	0101000020E6100000DB4DF04DD38719C05BD1E638B7CD5A40	input	2024-10-31 04:00:42.010289+00	\N
24	f53a5129-07a1-424a-a2a5-c23e0ab4b229	0.33308976888656616	output/undetected/20241031/DJI_0073.JPG	610.7626342773438	2515.195556640625	654.2199096679688	2564.16552734375	\N	\N	\N	\N	\N	-6.382614	107.214353	0101000020E61000008CF7E3F6CB8719C02B33A5F5B7CD5A40	input	2024-10-31 04:00:42.835033+00	\N
25	4a6733a2-8caa-4b80-bfe6-06b78617c1a3	0.5048202872276306	output/undetected/20241031/DJI_0079.JPG	2437.0576171875	2043.607666015625	2464.40673828125	2066.5478515625	\N	\N	\N	\N	\N	-6.382559	107.214438	0101000020E61000006F29E78BBD8719C04241295AB9CD5A40	input	2024-10-31 04:00:51.846817+00	\N
26	a9368912-16d7-490a-92d4-4e56528694d1	0.2672816216945648	output/undetected/20241031/DJI_0087.JPG	3814.593505859375	2253.328857421875	3856.867431640625	2281.062255859375	\N	\N	\N	\N	\N	-6.382485	107.214553	0101000020E61000009DD7D825AA8719C08E90813CBBCD5A40	input	2024-10-31 04:01:07.616808+00	\N
27	7832e67d-1e30-4500-a3c3-daf9f969bb46	0.2603950500488281	output/undetected/20241031/DJI_0097.JPG	2061.472900390625	552.4676513671875	2184.968505859375	632.1448364257812	\N	\N	\N	\N	\N	-6.382392	107.214698	0101000020E61000001502B9C4918719C01021AE9CBDCD5A40	input	2024-10-31 04:01:24.890295+00	\N
\.


--
-- Data for Name: user_status; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.user_status (id, name, created_at, terminated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: poc; Owner: rnd_eagle
--

COPY poc.users (id, username, email, password, fullname, status_id, role_id, created_at, updated_at) FROM stdin;
1	testingjoo	steingate47@gmail.com	KW61UAlAzacpgTP2Cq7OPvUtZ+xBEtdlWQ6aksW5s6Q=	testingjooo	1	2	2024-08-06 05:04:48.598172+00	\N
2	tovan.ferdinan@bsi.co.id	tovan.ferdinan@bsi.co.id	KW61UAlAzacpgTP2Cq7OPvUtZ+xBEtdlWQ6aksW5s6Q=	tovan.ferdinan@bsi.co.id	1	2	2024-08-13 13:43:41.92078+00	\N
4	Tovan Octa Ferdinan	tovan1388@gmail.com  	KW61UAlAzacpgTP2Cq7OPvUtZ+xBEtdlWQ6aksW5s6Q=	Tovan Octa Ferdinan	1	2	2024-08-21 06:42:16.127631+00	\N
3	bayu	bayu.nugroho@bsi.co.id	ZfgINRiWpuZFivYody5QO8xjJzH3x1nDYimmiRHrsnQ=	Bayu Dian N	1	2	2024-08-19 20:53:41.664222+00	\N
5	test	test@test.com	2YgjOmf8G2lBoy0BeeE47J6KOxuUhiNKu+Mscr8WWdo=	test	1	2	2024-09-17 13:06:50.81406+00	\N
\.


--
-- Data for Name: area; Type: TABLE DATA; Schema: poc_location; Owner: rnd_eagle
--

COPY poc_location.area (id, description, geom) FROM stdin;
3	Area S0	0103000020E6100000010000000500000026C79DD2C1CD5A405A828C800A8719C01021AE9CBDCD5A4087C1FC15328719C06500A8E2C6CD5A40FD69A33A1D8819C0DAAED007CBCD5A40A2427573F18719C026C79DD2C1CD5A405A828C800A8719C0
2	Area S1	0103000020E61000000100000005000000D09CF529C7CD5A40BB7EC16ED88619C008AEF204C2CD5A403DD175E1078719C0D4D7F335CBCD5A408B4E965AEF8719C0F511F8C3CFCD5A40033FAA61BF8719C0D09CF529C7CD5A40BB7EC16ED88619C0
4	Area A	0103000020E61000000100000005000000D40B3ECDC9CD5A406EDC627E6E8819C06BD44334BACD5A4078CF81E5088919C00A647616BDCD5A4089B48D3F518919C0749B70AFCCCD5A40DA740470B38819C0D40B3ECDC9CD5A406EDC627E6E8819C0
12	Area E	0103000020E61000000100000005000000F64201DBC1CD5A4059FB3BDBA38719C0C826F911BFCD5A40ED629AE95E8719C065C6DB4AAFCD5A40098D60E3FA8719C08177F2E9B1CD5A40E6CC76853E8819C0F64201DBC1CD5A4059FB3BDBA38719C0
\.


--
-- Data for Name: area_detail; Type: TABLE DATA; Schema: poc_location; Owner: rnd_eagle
--

COPY poc_location.area_detail (id, area_id, description, geom) FROM stdin;
189	2	S1.1.39	0103000020E61000000100000005000000D09CF529C7CD5A40BB7EC16ED88619C054D46B62C7CD5A40B655BA5ADE8619C0FFE1221AC6CD5A408DAB4338EA8619C01EE1B4E0C5CD5A405C936E4BE48619C0D09CF529C7CD5A40BB7EC16ED88619C0
1032	12	E.6.1	0103000020E61000000100000005000000F64201DBC1CD5A4059FB3BDBA38719C018D1B787C1CD5A4095A14703A78719C052A70511C1CD5A408EDFD0869B8719C099932A64C1CD5A409C0CA15D988719C0F64201DBC1CD5A4059FB3BDBA38719C0
191	2	S1.1.37	0103000020E61000000100000005000000D80BE29AC7CD5A40B22CB346E48619C05D4358D3C7CD5A40AD03AC32EA8619C0C2E3FE8CC6CD5A40F0DBED11F68619C0E0E29053C6CD5A40BFC31825F08619C0D80BE29AC7CD5A40B22CB346E48619C0
1033	12	E.6.2	0103000020E6100000010000000500000018D1B787C1CD5A4095A14703A78719C03A5F6E34C1CD5A40D247532BAA8719C00BBBE0BDC0CD5A4080B200B09E8719C052A70511C1CD5A408EDFD0869B8719C018D1B787C1CD5A4095A14703A78719C0
1034	12	E.6.3	0103000020E610000001000000050000003A5F6E34C1CD5A40D247532BAA8719C05DED24E1C0CD5A400EEE5E53AD8719C0C4CEBB6AC0CD5A40728530D9A18719C00BBBE0BDC0CD5A4080B200B09E8719C03A5F6E34C1CD5A40D247532BAA8719C0
192	2	S1.1.36	0103000020E610000001000000050000005D4358D3C7CD5A40AD03AC32EA8619C0E17ACE0BC8CD5A40A8DAA41EF08619C0A3E46CC6C6CD5A4022F4C2FEFB8619C0C2E3FE8CC6CD5A40F0DBED11F68619C05D4358D3C7CD5A40AD03AC32EA8619C0
193	2	S1.1.35	0103000020E61000000100000005000000E17ACE0BC8CD5A40A8DAA41EF08619C065B24444C8CD5A40A3B19D0AF68619C084E5DAFFC6CD5A40530C98EB018719C0A3E46CC6C6CD5A4022F4C2FEFB8619C0E17ACE0BC8CD5A40A8DAA41EF08619C0
194	2	S1.1.34	0103000020E6100000010000000500000065B24444C8CD5A40A3B19D0AF68619C0E9E9BA7CC8CD5A409F8896F6FB8619C065E64839C7CD5A4085246DD8078719C084E5DAFFC6CD5A40530C98EB018719C065B24444C8CD5A40A3B19D0AF68619C0
195	2	S1.1.33	0103000020E61000000100000005000000E9E9BA7CC8CD5A409F8896F6FB8619C06E2131B5C8CD5A409A5F8FE2018719C046E7B672C7CD5A40B63C42C50D8719C065E64839C7CD5A4085246DD8078719C0E9E9BA7CC8CD5A409F8896F6FB8619C0
196	2	S1.1.32	0103000020E610000001000000050000006E2131B5C8CD5A409A5F8FE2018719C0F258A7EDC8CD5A40953688CE078719C028E824ACC7CD5A40E85417B2138719C046E7B672C7CD5A40B63C42C50D8719C06E2131B5C8CD5A409A5F8FE2018719C0
197	2	S1.1.31	0103000020E61000000100000005000000F258A7EDC8CD5A40953688CE078719C076901D26C9CD5A40910D81BA0D8719C009E992E5C7CD5A40196DEC9E198719C028E824ACC7CD5A40E85417B2138719C0F258A7EDC8CD5A40953688CE078719C0
198	2	S1.1.30	0103000020E6100000010000000500000076901D26C9CD5A40910D81BA0D8719C0FAC7935EC9CD5A408CE479A6138719C0EAE9001FC8CD5A404B85C18B1F8719C009E992E5C7CD5A40196DEC9E198719C076901D26C9CD5A40910D81BA0D8719C0
199	2	S1.1.29	0103000020E61000000100000005000000FAC7935EC9CD5A408CE479A6138719C07FFF0997C9CD5A4087BB7292198719C0CBEA6E58C8CD5A407C9D9678258719C0EAE9001FC8CD5A404B85C18B1F8719C0FAC7935EC9CD5A408CE479A6138719C0
200	2	S1.1.28	0103000020E610000001000000050000007FFF0997C9CD5A4087BB7292198719C0033780CFC9CD5A4082926B7E1F8719C0ACEBDC91C8CD5A40AEB56B652B8719C0CBEA6E58C8CD5A407C9D9678258719C07FFF0997C9CD5A4087BB7292198719C0
201	2	S1.1.27	0103000020E61000000100000005000000033780CFC9CD5A4082926B7E1F8719C0876EF607CACD5A407E69646A258719C08EEC4ACBC8CD5A40DFCD4052318719C0ACEBDC91C8CD5A40AEB56B652B8719C0033780CFC9CD5A4082926B7E1F8719C0
202	2	S1.1.26	0103000020E61000000100000005000000876EF607CACD5A407E69646A258719C00BA66C40CACD5A4079405D562B8719C06FEDB804C9CD5A4010E6153F378719C08EEC4ACBC8CD5A40DFCD4052318719C0876EF607CACD5A407E69646A258719C0
203	2	S1.1.25	0103000020E610000001000000050000000BA66C40CACD5A4079405D562B8719C08FDDE278CACD5A4074175642318719C050EE263EC9CD5A4042FEEA2B3D8719C06FEDB804C9CD5A4010E6153F378719C00BA66C40CACD5A4079405D562B8719C0
204	2	S1.1.24	0103000020E610000001000000050000008FDDE278CACD5A4074175642318719C0141559B1CACD5A4070EE4E2E378719C031EF9477C9CD5A407316C018438719C050EE263EC9CD5A4042FEEA2B3D8719C08FDDE278CACD5A4074175642318719C0
205	2	S1.1.23	0103000020E61000000100000005000000141559B1CACD5A4070EE4E2E378719C0984CCFE9CACD5A406BC5471A3D8719C012F002B1C9CD5A40A52E9505498719C031EF9477C9CD5A407316C018438719C0141559B1CACD5A4070EE4E2E378719C0
206	2	S1.1.22	0103000020E61000000100000005000000984CCFE9CACD5A406BC5471A3D8719C01C844522CBCD5A40669C4006438719C0F4F070EAC9CD5A40D6466AF24E8719C012F002B1C9CD5A40A52E9505498719C0984CCFE9CACD5A406BC5471A3D8719C0
207	2	S1.1.21	0103000020E610000001000000050000001C844522CBCD5A40669C4006438719C0A0BBBB5ACBCD5A40617339F2488719C0D5F1DE23CACD5A40085F3FDF548719C0F4F070EAC9CD5A40D6466AF24E8719C01C844522CBCD5A40669C4006438719C0
208	2	S1.1.20	0103000020E61000000100000005000000A0BBBB5ACBCD5A40617339F2488719C025F33193CBCD5A405D4A32DE4E8719C0B6F24C5DCACD5A40397714CC5A8719C0D5F1DE23CACD5A40085F3FDF548719C0A0BBBB5ACBCD5A40617339F2488719C0
209	2	S1.1.19	0103000020E6100000010000000500000025F33193CBCD5A405D4A32DE4E8719C0A92AA8CBCBCD5A4058212BCA548719C097F3BA96CACD5A406B8FE9B8608719C0B6F24C5DCACD5A40397714CC5A8719C025F33193CBCD5A405D4A32DE4E8719C0
210	2	S1.1.18	0103000020E61000000100000005000000A92AA8CBCBCD5A4058212BCA548719C02D621E04CCCD5A4053F823B65A8719C079F428D0CACD5A409CA7BEA5668719C097F3BA96CACD5A406B8FE9B8608719C0A92AA8CBCBCD5A4058212BCA548719C0
211	2	S1.1.17	0103000020E610000001000000050000002D621E04CCCD5A4053F823B65A8719C0B199943CCCCD5A404ECF1CA2608719C05AF59609CBCD5A40CEBF93926C8719C079F428D0CACD5A409CA7BEA5668719C02D621E04CCCD5A4053F823B65A8719C0
212	2	S1.1.16	0103000020E61000000100000005000000B199943CCCCD5A404ECF1CA2608719C036D10A75CCCD5A404AA6158E668719C03BF60443CBCD5A40FFD7687F728719C05AF59609CBCD5A40CEBF93926C8719C0B199943CCCCD5A404ECF1CA2608719C0
213	2	S1.1.15	0103000020E6100000010000000500000036D10A75CCCD5A404AA6158E668719C0BA0881ADCCCD5A40457D0E7A6C8719C01CF7727CCBCD5A4031F03D6C788719C03BF60443CBCD5A40FFD7687F728719C036D10A75CCCD5A404AA6158E668719C0
214	2	S1.1.14	0103000020E61000000100000005000000BA0881ADCCCD5A40457D0E7A6C8719C03E40F7E5CCCD5A4040540766728719C0FDF7E0B5CBCD5A40620813597E8719C01CF7727CCBCD5A4031F03D6C788719C0BA0881ADCCCD5A40457D0E7A6C8719C0
215	2	S1.1.13	0103000020E610000001000000050000003E40F7E5CCCD5A4040540766728719C0C2776D1ECDCD5A403C2B0052788719C0DFF84EEFCBCD5A409320E845848719C0FDF7E0B5CBCD5A40620813597E8719C03E40F7E5CCCD5A4040540766728719C0
216	2	S1.1.12	0103000020E61000000100000005000000C2776D1ECDCD5A403C2B0052788719C046AFE356CDCD5A403702F93D7E8719C0C0F9BC28CCCD5A40C538BD328A8719C0DFF84EEFCBCD5A409320E845848719C0C2776D1ECDCD5A403C2B0052788719C0
217	2	S1.1.11	0103000020E6100000010000000500000046AFE356CDCD5A403702F93D7E8719C0CBE6598FCDCD5A4032D9F129848719C0A1FA2A62CCCD5A40F650921F908719C0C0F9BC28CCCD5A40C538BD328A8719C046AFE356CDCD5A403702F93D7E8719C0
218	2	S1.1.10	0103000020E61000000100000005000000CBE6598FCDCD5A4032D9F129848719C04F1ED0C7CDCD5A402DB0EA158A8719C082FB989BCCCD5A402869670C968719C0A1FA2A62CCCD5A40F650921F908719C0CBE6598FCDCD5A4032D9F129848719C0
219	2	S1.1.9	0103000020E610000001000000050000004F1ED0C7CDCD5A402DB0EA158A8719C0D3554600CECD5A402987E301908719C063FC06D5CCCD5A4059813CF99B8719C082FB989BCCCD5A402869670C968719C04F1ED0C7CDCD5A402DB0EA158A8719C0
220	2	S1.1.8	0103000020E61000000100000005000000D3554600CECD5A402987E301908719C0578DBC38CECD5A40245EDCED958719C045FD740ECDCD5A408B9911E6A18719C063FC06D5CCCD5A4059813CF99B8719C0D3554600CECD5A402987E301908719C0
221	2	S1.1.7	0103000020E61000000100000005000000578DBC38CECD5A40245EDCED958719C0DCC43271CECD5A401F35D5D99B8719C026FEE247CDCD5A40BCB1E6D2A78719C045FD740ECDCD5A408B9911E6A18719C0578DBC38CECD5A40245EDCED958719C0
222	2	S1.1.6	0103000020E61000000100000005000000DCC43271CECD5A401F35D5D99B8719C060FCA8A9CECD5A401B0CCEC5A18719C007FF5081CDCD5A40EEC9BBBFAD8719C026FEE247CDCD5A40BCB1E6D2A78719C0DCC43271CECD5A401F35D5D99B8719C0
223	2	S1.1.5	0103000020E6100000010000000500000060FCA8A9CECD5A401B0CCEC5A18719C0E4331FE2CECD5A4016E3C6B1A78719C0E8FFBEBACDCD5A401FE290ACB38719C007FF5081CDCD5A40EEC9BBBFAD8719C060FCA8A9CECD5A401B0CCEC5A18719C0
224	2	S1.1.4	0103000020E61000000100000005000000E4331FE2CECD5A4016E3C6B1A78719C0686B951ACFCD5A4011BABF9DAD8719C0C9002DF4CDCD5A4051FA6599B98719C0E8FFBEBACDCD5A401FE290ACB38719C0E4331FE2CECD5A4016E3C6B1A78719C0
225	2	S1.1.3	0103000020E61000000100000005000000686B951ACFCD5A4011BABF9DAD8719C0EDA20B53CFCD5A400C91B889B38719C0AB019B2DCECD5A4082123B86BF8719C0C9002DF4CDCD5A4051FA6599B98719C0686B951ACFCD5A4011BABF9DAD8719C0
226	2	S1.1.2	0103000020E61000000100000005000000EDA20B53CFCD5A400C91B889B38719C071DA818BCFCD5A400868B175B98719C08C020967CECD5A40B42A1073C58719C0AB019B2DCECD5A4082123B86BF8719C0EDA20B53CFCD5A400C91B889B38719C0
227	2	S1.1.1	0103000020E6100000010000000500000071DA818BCFCD5A400868B175B98719C0F511F8C3CFCD5A40033FAA61BF8719C06D0377A0CECD5A40E542E55FCB8719C08C020967CECD5A40B42A1073C58719C071DA818BCFCD5A400868B175B98719C0
228	2	S1.2.39	0103000020E610000001000000050000001EE1B4E0C5CD5A405C936E4BE48619C0FFE1221AC6CD5A408DAB4338EA8619C0AAEFD9D1C4CD5A406401CD15F68619C06C257497C4CD5A40FCA71B28F08619C01EE1B4E0C5CD5A405C936E4BE48619C0
229	2	S1.2.38	0103000020E61000000100000005000000FFE1221AC6CD5A408DAB4338EA8619C0E0E29053C6CD5A40BFC31825F08619C0E8B93F0CC5CD5A40CB5A7E03FC8619C0AAEFD9D1C4CD5A406401CD15F68619C0FFE1221AC6CD5A408DAB4338EA8619C0
230	2	S1.2.37	0103000020E61000000100000005000000E0E29053C6CD5A40BFC31825F08619C0C2E3FE8CC6CD5A40F0DBED11F68619C02684A546C5CD5A4033B42FF1018719C0E8B93F0CC5CD5A40CB5A7E03FC8619C0E0E29053C6CD5A40BFC31825F08619C0
231	2	S1.2.36	0103000020E61000000100000005000000C2E3FE8CC6CD5A40F0DBED11F68619C0A3E46CC6C6CD5A4022F4C2FEFB8619C0654E0B81C5CD5A409B0DE1DE078719C02684A546C5CD5A4033B42FF1018719C0C2E3FE8CC6CD5A40F0DBED11F68619C0
232	2	S1.2.35	0103000020E61000000100000005000000A3E46CC6C6CD5A4022F4C2FEFB8619C084E5DAFFC6CD5A40530C98EB018719C0A31871BBC5CD5A40026792CC0D8719C0654E0B81C5CD5A409B0DE1DE078719C0A3E46CC6C6CD5A4022F4C2FEFB8619C0
233	2	S1.2.34	0103000020E6100000010000000500000084E5DAFFC6CD5A40530C98EB018719C065E64839C7CD5A4085246DD8078719C0E1E2D6F5C5CD5A406AC043BA138719C0A31871BBC5CD5A40026792CC0D8719C084E5DAFFC6CD5A40530C98EB018719C0
234	2	S1.2.33	0103000020E6100000010000000500000065E64839C7CD5A4085246DD8078719C046E7B672C7CD5A40B63C42C50D8719C01FAD3C30C6CD5A40D219F5A7198719C0E1E2D6F5C5CD5A406AC043BA138719C065E64839C7CD5A4085246DD8078719C0
235	2	S1.2.32	0103000020E6100000010000000500000046E7B672C7CD5A40B63C42C50D8719C028E824ACC7CD5A40E85417B2138719C05D77A26AC6CD5A403973A6951F8719C01FAD3C30C6CD5A40D219F5A7198719C046E7B672C7CD5A40B63C42C50D8719C0
236	2	S1.2.31	0103000020E6100000010000000500000028E824ACC7CD5A40E85417B2138719C009E992E5C7CD5A40196DEC9E198719C09B4108A5C6CD5A40A1CC5783258719C05D77A26AC6CD5A403973A6951F8719C028E824ACC7CD5A40E85417B2138719C0
237	2	S1.2.30	0103000020E6100000010000000500000009E992E5C7CD5A40196DEC9E198719C0EAE9001FC8CD5A404B85C18B1F8719C0DA0B6EDFC6CD5A40092609712B8719C09B4108A5C6CD5A40A1CC5783258719C009E992E5C7CD5A40196DEC9E198719C0
238	2	S1.2.29	0103000020E61000000100000005000000EAE9001FC8CD5A404B85C18B1F8719C0CBEA6E58C8CD5A407C9D9678258719C018D6D319C7CD5A40707FBA5E318719C0DA0B6EDFC6CD5A40092609712B8719C0EAE9001FC8CD5A404B85C18B1F8719C0
239	2	S1.2.28	0103000020E61000000100000005000000CBEA6E58C8CD5A407C9D9678258719C0ACEBDC91C8CD5A40AEB56B652B8719C056A03954C7CD5A40D8D86B4C378719C018D6D319C7CD5A40707FBA5E318719C0CBEA6E58C8CD5A407C9D9678258719C0
240	2	S1.2.27	0103000020E61000000100000005000000ACEBDC91C8CD5A40AEB56B652B8719C08EEC4ACBC8CD5A40DFCD4052318719C0946A9F8EC7CD5A4040321D3A3D8719C056A03954C7CD5A40D8D86B4C378719C0ACEBDC91C8CD5A40AEB56B652B8719C0
241	2	S1.2.26	0103000020E610000001000000050000008EEC4ACBC8CD5A40DFCD4052318719C06FEDB804C9CD5A4010E6153F378719C0D23405C9C7CD5A40A78BCE27438719C0946A9F8EC7CD5A4040321D3A3D8719C08EEC4ACBC8CD5A40DFCD4052318719C0
242	2	S1.2.25	0103000020E610000001000000050000006FEDB804C9CD5A4010E6153F378719C050EE263EC9CD5A4042FEEA2B3D8719C010FF6A03C8CD5A400FE57F15498719C0D23405C9C7CD5A40A78BCE27438719C06FEDB804C9CD5A4010E6153F378719C0
243	2	S1.2.24	0103000020E6100000010000000500000050EE263EC9CD5A4042FEEA2B3D8719C031EF9477C9CD5A407316C018438719C04EC9D03DC8CD5A40773E31034F8719C010FF6A03C8CD5A400FE57F15498719C050EE263EC9CD5A4042FEEA2B3D8719C0
244	2	S1.2.23	0103000020E6100000010000000500000031EF9477C9CD5A407316C018438719C012F002B1C9CD5A40A52E9505498719C08D933678C8CD5A40DE97E2F0548719C04EC9D03DC8CD5A40773E31034F8719C031EF9477C9CD5A407316C018438719C0
245	2	S1.2.22	0103000020E6100000010000000500000012F002B1C9CD5A40A52E9505498719C0F4F070EAC9CD5A40D6466AF24E8719C0CB5D9CB2C8CD5A4046F193DE5A8719C08D933678C8CD5A40DE97E2F0548719C012F002B1C9CD5A40A52E9505498719C0
246	2	S1.2.21	0103000020E61000000100000005000000F4F070EAC9CD5A40D6466AF24E8719C0D5F1DE23CACD5A40085F3FDF548719C0092802EDC8CD5A40AE4A45CC608719C0CB5D9CB2C8CD5A4046F193DE5A8719C0F4F070EAC9CD5A40D6466AF24E8719C0
247	2	S1.2.20	0103000020E61000000100000005000000D5F1DE23CACD5A40085F3FDF548719C0B6F24C5DCACD5A40397714CC5A8719C047F26727C9CD5A4015A4F6B9668719C0092802EDC8CD5A40AE4A45CC608719C0D5F1DE23CACD5A40085F3FDF548719C0
248	2	S1.2.19	0103000020E61000000100000005000000B6F24C5DCACD5A40397714CC5A8719C097F3BA96CACD5A406B8FE9B8608719C085BCCD61C9CD5A407DFDA7A76C8719C047F26727C9CD5A4015A4F6B9668719C0B6F24C5DCACD5A40397714CC5A8719C0
249	2	S1.2.18	0103000020E6100000010000000500000097F3BA96CACD5A406B8FE9B8608719C079F428D0CACD5A409CA7BEA5668719C0C386339CC9CD5A40E5565995728719C085BCCD61C9CD5A407DFDA7A76C8719C097F3BA96CACD5A406B8FE9B8608719C0
250	2	S1.2.17	0103000020E6100000010000000500000079F428D0CACD5A409CA7BEA5668719C05AF59609CBCD5A40CEBF93926C8719C0025199D6C9CD5A404CB00A83788719C0C386339CC9CD5A40E5565995728719C079F428D0CACD5A409CA7BEA5668719C0
251	2	S1.2.16	0103000020E610000001000000050000005AF59609CBCD5A40CEBF93926C8719C03BF60443CBCD5A40FFD7687F728719C0401BFF10CACD5A40B409BC707E8719C0025199D6C9CD5A404CB00A83788719C05AF59609CBCD5A40CEBF93926C8719C0
252	2	S1.2.15	0103000020E610000001000000050000003BF60443CBCD5A40FFD7687F728719C01CF7727CCBCD5A4031F03D6C788719C07EE5644BCACD5A401C636D5E848719C0401BFF10CACD5A40B409BC707E8719C03BF60443CBCD5A40FFD7687F728719C0
253	2	S1.2.14	0103000020E610000001000000050000001CF7727CCBCD5A4031F03D6C788719C0FDF7E0B5CBCD5A40620813597E8719C0BCAFCA85CACD5A4083BC1E4C8A8719C07EE5644BCACD5A401C636D5E848719C01CF7727CCBCD5A4031F03D6C788719C0
254	2	S1.2.13	0103000020E61000000100000005000000FDF7E0B5CBCD5A40620813597E8719C0DFF84EEFCBCD5A409320E845848719C0FA7930C0CACD5A40EB15D039908719C0BCAFCA85CACD5A4083BC1E4C8A8719C0FDF7E0B5CBCD5A40620813597E8719C0
255	2	S1.2.12	0103000020E61000000100000005000000DFF84EEFCBCD5A409320E845848719C0C0F9BC28CCCD5A40C538BD328A8719C0384496FACACD5A40536F8127968719C0FA7930C0CACD5A40EB15D039908719C0DFF84EEFCBCD5A409320E845848719C0
256	2	S1.2.11	0103000020E61000000100000005000000C0F9BC28CCCD5A40C538BD328A8719C0A1FA2A62CCCD5A40F650921F908719C0760EFC34CBCD5A40BAC832159C8719C0384496FACACD5A40536F8127968719C0C0F9BC28CCCD5A40C538BD328A8719C0
257	2	S1.2.10	0103000020E61000000100000005000000A1FA2A62CCCD5A40F650921F908719C082FB989BCCCD5A402869670C968719C0B5D8616FCBCD5A402222E402A28719C0760EFC34CBCD5A40BAC832159C8719C0A1FA2A62CCCD5A40F650921F908719C0
258	2	S1.2.9	0103000020E6100000010000000500000082FB989BCCCD5A402869670C968719C063FC06D5CCCD5A4059813CF99B8719C0F3A2C7A9CBCD5A408A7B95F0A78719C0B5D8616FCBCD5A402222E402A28719C082FB989BCCCD5A402869670C968719C0
259	2	S1.2.8	0103000020E6100000010000000500000063FC06D5CCCD5A4059813CF99B8719C045FD740ECDCD5A408B9911E6A18719C0316D2DE4CBCD5A40F1D446DEAD8719C0F3A2C7A9CBCD5A408A7B95F0A78719C063FC06D5CCCD5A4059813CF99B8719C0
260	2	S1.2.7	0103000020E6100000010000000500000045FD740ECDCD5A408B9911E6A18719C026FEE247CDCD5A40BCB1E6D2A78719C06F37931ECCCD5A40592EF8CBB38719C0316D2DE4CBCD5A40F1D446DEAD8719C045FD740ECDCD5A408B9911E6A18719C0
261	2	S1.2.6	0103000020E6100000010000000500000026FEE247CDCD5A40BCB1E6D2A78719C007FF5081CDCD5A40EEC9BBBFAD8719C0AD01F958CCCD5A40C187A9B9B98719C06F37931ECCCD5A40592EF8CBB38719C026FEE247CDCD5A40BCB1E6D2A78719C0
262	2	S1.2.5	0103000020E6100000010000000500000007FF5081CDCD5A40EEC9BBBFAD8719C0E8FFBEBACDCD5A401FE290ACB38719C0EBCB5E93CCCD5A4028E15AA7BF8719C0AD01F958CCCD5A40C187A9B9B98719C007FF5081CDCD5A40EEC9BBBFAD8719C0
263	2	S1.2.4	0103000020E61000000100000005000000E8FFBEBACDCD5A401FE290ACB38719C0C9002DF4CDCD5A4051FA6599B98719C02A96C4CDCCCD5A40903A0C95C58719C0EBCB5E93CCCD5A4028E15AA7BF8719C0E8FFBEBACDCD5A401FE290ACB38719C0
264	2	S1.2.3	0103000020E61000000100000005000000C9002DF4CDCD5A4051FA6599B98719C0AB019B2DCECD5A4082123B86BF8719C068602A08CDCD5A40F893BD82CB8719C02A96C4CDCCCD5A40903A0C95C58719C0C9002DF4CDCD5A4051FA6599B98719C0
265	2	S1.2.2	0103000020E61000000100000005000000AB019B2DCECD5A4082123B86BF8719C08C020967CECD5A40B42A1073C58719C0A62A9042CDCD5A405FED6E70D18719C068602A08CDCD5A40F893BD82CB8719C0AB019B2DCECD5A4082123B86BF8719C0
266	2	S1.2.1	0103000020E610000001000000050000008C020967CECD5A40B42A1073C58719C06D0377A0CECD5A40E542E55FCB8719C0E4F4F57CCDCD5A40C746205ED78719C0A62A9042CDCD5A405FED6E70D18719C08C020967CECD5A40B42A1073C58719C0
267	2	S1.3.39	0103000020E610000001000000050000006C257497C4CD5A40FCA71B28F08619C0AAEFD9D1C4CD5A406401CD15F68619C055FD9089C3CD5A403A5756F3018719C0BA69334EC3CD5A409CBCC804FC8619C06C257497C4CD5A40FCA71B28F08619C0
268	2	S1.3.38	0103000020E61000000100000005000000AAEFD9D1C4CD5A406401CD15F68619C0E8B93F0CC5CD5A40CB5A7E03FC8619C0F090EEC4C3CD5A40D8F1E3E1078719C055FD9089C3CD5A403A5756F3018719C0AAEFD9D1C4CD5A406401CD15F68619C0
269	2	S1.3.37	0103000020E61000000100000005000000E8B93F0CC5CD5A40CB5A7E03FC8619C02684A546C5CD5A4033B42FF1018719C08B244C00C4CD5A40768C71D00D8719C0F090EEC4C3CD5A40D8F1E3E1078719C0E8B93F0CC5CD5A40CB5A7E03FC8619C0
270	2	S1.3.36	0103000020E610000001000000050000002684A546C5CD5A4033B42FF1018719C0654E0B81C5CD5A409B0DE1DE078719C027B8A93BC4CD5A401327FFBE138719C08B244C00C4CD5A40768C71D00D8719C02684A546C5CD5A4033B42FF1018719C0
271	2	S1.3.35	0103000020E61000000100000005000000654E0B81C5CD5A409B0DE1DE078719C0A31871BBC5CD5A40026792CC0D8719C0C24B0777C4CD5A40B1C18CAD198719C027B8A93BC4CD5A401327FFBE138719C0654E0B81C5CD5A409B0DE1DE078719C0
272	2	S1.3.34	0103000020E61000000100000005000000A31871BBC5CD5A40026792CC0D8719C0E1E2D6F5C5CD5A406AC043BA138719C05DDF64B2C4CD5A404F5C1A9C1F8719C0C24B0777C4CD5A40B1C18CAD198719C0A31871BBC5CD5A40026792CC0D8719C0
273	2	S1.3.33	0103000020E61000000100000005000000E1E2D6F5C5CD5A406AC043BA138719C01FAD3C30C6CD5A40D219F5A7198719C0F872C2EDC4CD5A40EDF6A78A258719C05DDF64B2C4CD5A404F5C1A9C1F8719C0E1E2D6F5C5CD5A406AC043BA138719C0
274	2	S1.3.32	0103000020E610000001000000050000001FAD3C30C6CD5A40D219F5A7198719C05D77A26AC6CD5A403973A6951F8719C093062029C5CD5A408B9135792B8719C0F872C2EDC4CD5A40EDF6A78A258719C01FAD3C30C6CD5A40D219F5A7198719C0
275	2	S1.3.31	0103000020E610000001000000050000005D77A26AC6CD5A403973A6951F8719C09B4108A5C6CD5A40A1CC5783258719C02E9A7D64C5CD5A40292CC367318719C093062029C5CD5A408B9135792B8719C05D77A26AC6CD5A403973A6951F8719C0
276	2	S1.3.30	0103000020E610000001000000050000009B4108A5C6CD5A40A1CC5783258719C0DA0B6EDFC6CD5A40092609712B8719C0C92DDB9FC5CD5A40C7C65056378719C02E9A7D64C5CD5A40292CC367318719C09B4108A5C6CD5A40A1CC5783258719C0
277	2	S1.3.29	0103000020E61000000100000005000000DA0B6EDFC6CD5A40092609712B8719C018D6D319C7CD5A40707FBA5E318719C064C138DBC5CD5A406561DE443D8719C0C92DDB9FC5CD5A40C7C65056378719C0DA0B6EDFC6CD5A40092609712B8719C0
278	2	S1.3.28	0103000020E6100000010000000500000018D6D319C7CD5A40707FBA5E318719C056A03954C7CD5A40D8D86B4C378719C000559616C6CD5A4002FC6B33438719C064C138DBC5CD5A406561DE443D8719C018D6D319C7CD5A40707FBA5E318719C0
279	2	S1.3.27	0103000020E6100000010000000500000056A03954C7CD5A40D8D86B4C378719C0946A9F8EC7CD5A4040321D3A3D8719C09BE8F351C6CD5A40A096F921498719C000559616C6CD5A4002FC6B33438719C056A03954C7CD5A40D8D86B4C378719C0
280	2	S1.3.26	0103000020E61000000100000005000000946A9F8EC7CD5A4040321D3A3D8719C0D23405C9C7CD5A40A78BCE27438719C0367C518DC6CD5A403E3187104F8719C09BE8F351C6CD5A40A096F921498719C0946A9F8EC7CD5A4040321D3A3D8719C0
1035	12	E.6.4	0103000020E610000001000000050000005DED24E1C0CD5A400EEE5E53AD8719C07F7BDB8DC0CD5A404A946A7BB08719C07DE29617C0CD5A4064586002A58719C0C4CEBB6AC0CD5A40728530D9A18719C05DED24E1C0CD5A400EEE5E53AD8719C0
1036	12	E.6.5	0103000020E610000001000000050000007F7BDB8DC0CD5A404A946A7BB08719C0A109923AC0CD5A40873A76A3B38719C035F671C4BFCD5A40562B902BA88719C07DE29617C0CD5A4064586002A58719C07F7BDB8DC0CD5A404A946A7BB08719C0
1037	12	E.6.6	0103000020E61000000100000005000000A109923AC0CD5A40873A76A3B38719C0C39748E7BFCD5A40C3E081CBB68719C0EE094D71BFCD5A4048FEBF54AB8719C035F671C4BFCD5A40562B902BA88719C0A109923AC0CD5A40873A76A3B38719C0
1038	12	E.6.7	0103000020E61000000100000005000000C39748E7BFCD5A40C3E081CBB68719C0E525FF93BFCD5A40FF868DF3B98719C0A71D281EBFCD5A403AD1EF7DAE8719C0EE094D71BFCD5A4048FEBF54AB8719C0C39748E7BFCD5A40C3E081CBB68719C0
281	2	S1.3.25	0103000020E61000000100000005000000D23405C9C7CD5A40A78BCE27438719C010FF6A03C8CD5A400FE57F15498719C0D10FAFC8C6CD5A40DCCB14FF548719C0367C518DC6CD5A403E3187104F8719C0D23405C9C7CD5A40A78BCE27438719C0
282	2	S1.3.24	0103000020E6100000010000000500000010FF6A03C8CD5A400FE57F15498719C04EC9D03DC8CD5A40773E31034F8719C06CA30C04C7CD5A407A66A2ED5A8719C0D10FAFC8C6CD5A40DCCB14FF548719C010FF6A03C8CD5A400FE57F15498719C0
283	2	S1.3.23	0103000020E610000001000000050000004EC9D03DC8CD5A40773E31034F8719C08D933678C8CD5A40DE97E2F0548719C007376A3FC7CD5A40180130DC608719C06CA30C04C7CD5A407A66A2ED5A8719C04EC9D03DC8CD5A40773E31034F8719C0
284	2	S1.3.22	0103000020E610000001000000050000008D933678C8CD5A40DE97E2F0548719C0CB5D9CB2C8CD5A4046F193DE5A8719C0A2CAC77AC7CD5A40B69BBDCA668719C007376A3FC7CD5A40180130DC608719C08D933678C8CD5A40DE97E2F0548719C0
285	2	S1.3.21	0103000020E61000000100000005000000CB5D9CB2C8CD5A4046F193DE5A8719C0092802EDC8CD5A40AE4A45CC608719C03D5E25B6C7CD5A4054364BB96C8719C0A2CAC77AC7CD5A40B69BBDCA668719C0CB5D9CB2C8CD5A4046F193DE5A8719C0
286	2	S1.3.20	0103000020E61000000100000005000000092802EDC8CD5A40AE4A45CC608719C047F26727C9CD5A4015A4F6B9668719C0D9F182F1C7CD5A40F1D0D8A7728719C03D5E25B6C7CD5A4054364BB96C8719C0092802EDC8CD5A40AE4A45CC608719C0
287	2	S1.3.19	0103000020E6100000010000000500000047F26727C9CD5A4015A4F6B9668719C085BCCD61C9CD5A407DFDA7A76C8719C07485E02CC8CD5A408F6B6696788719C0D9F182F1C7CD5A40F1D0D8A7728719C047F26727C9CD5A4015A4F6B9668719C0
288	2	S1.3.18	0103000020E6100000010000000500000085BCCD61C9CD5A407DFDA7A76C8719C0C386339CC9CD5A40E5565995728719C00F193E68C8CD5A402D06F4847E8719C07485E02CC8CD5A408F6B6696788719C085BCCD61C9CD5A407DFDA7A76C8719C0
289	2	S1.3.17	0103000020E61000000100000005000000C386339CC9CD5A40E5565995728719C0025199D6C9CD5A404CB00A83788719C0AAAC9BA3C8CD5A40CBA08173848719C00F193E68C8CD5A402D06F4847E8719C0C386339CC9CD5A40E5565995728719C0
290	2	S1.3.16	0103000020E61000000100000005000000025199D6C9CD5A404CB00A83788719C0401BFF10CACD5A40B409BC707E8719C04540F9DEC8CD5A40693B0F628A8719C0AAAC9BA3C8CD5A40CBA08173848719C0025199D6C9CD5A404CB00A83788719C0
291	2	S1.3.15	0103000020E61000000100000005000000401BFF10CACD5A40B409BC707E8719C07EE5644BCACD5A401C636D5E848719C0E0D3561AC9CD5A4007D69C50908719C04540F9DEC8CD5A40693B0F628A8719C0401BFF10CACD5A40B409BC707E8719C0
292	2	S1.3.14	0103000020E610000001000000050000007EE5644BCACD5A401C636D5E848719C0BCAFCA85CACD5A4083BC1E4C8A8719C07B67B455C9CD5A40A5702A3F968719C0E0D3561AC9CD5A4007D69C50908719C07EE5644BCACD5A401C636D5E848719C0
293	2	S1.3.13	0103000020E61000000100000005000000BCAFCA85CACD5A4083BC1E4C8A8719C0FA7930C0CACD5A40EB15D039908719C016FB1191C9CD5A40430BB82D9C8719C07B67B455C9CD5A40A5702A3F968719C0BCAFCA85CACD5A4083BC1E4C8A8719C0
294	2	S1.3.12	0103000020E61000000100000005000000FA7930C0CACD5A40EB15D039908719C0384496FACACD5A40536F8127968719C0B28E6FCCC9CD5A40E0A5451CA28719C016FB1191C9CD5A40430BB82D9C8719C0FA7930C0CACD5A40EB15D039908719C0
295	2	S1.3.11	0103000020E61000000100000005000000384496FACACD5A40536F8127968719C0760EFC34CBCD5A40BAC832159C8719C04D22CD07CACD5A407E40D30AA88719C0B28E6FCCC9CD5A40E0A5451CA28719C0384496FACACD5A40536F8127968719C0
296	2	S1.3.10	0103000020E61000000100000005000000760EFC34CBCD5A40BAC832159C8719C0B5D8616FCBCD5A402222E402A28719C0E8B52A43CACD5A401CDB60F9AD8719C04D22CD07CACD5A407E40D30AA88719C0760EFC34CBCD5A40BAC832159C8719C0
297	2	S1.3.9	0103000020E61000000100000005000000B5D8616FCBCD5A402222E402A28719C0F3A2C7A9CBCD5A408A7B95F0A78719C08349887ECACD5A40BA75EEE7B38719C0E8B52A43CACD5A401CDB60F9AD8719C0B5D8616FCBCD5A402222E402A28719C0
298	2	S1.3.8	0103000020E61000000100000005000000F3A2C7A9CBCD5A408A7B95F0A78719C0316D2DE4CBCD5A40F1D446DEAD8719C01EDDE5B9CACD5A4058107CD6B98719C08349887ECACD5A40BA75EEE7B38719C0F3A2C7A9CBCD5A408A7B95F0A78719C0
299	2	S1.3.7	0103000020E61000000100000005000000316D2DE4CBCD5A40F1D446DEAD8719C06F37931ECCCD5A40592EF8CBB38719C0B97043F5CACD5A40F6AA09C5BF8719C01EDDE5B9CACD5A4058107CD6B98719C0316D2DE4CBCD5A40F1D446DEAD8719C0
300	2	S1.3.6	0103000020E610000001000000050000006F37931ECCCD5A40592EF8CBB38719C0AD01F958CCCD5A40C187A9B9B98719C05404A130CBCD5A40944597B3C58719C0B97043F5CACD5A40F6AA09C5BF8719C06F37931ECCCD5A40592EF8CBB38719C0
301	2	S1.3.5	0103000020E61000000100000005000000AD01F958CCCD5A40C187A9B9B98719C0EBCB5E93CCCD5A4028E15AA7BF8719C0EF97FE6BCBCD5A4032E024A2CB8719C05404A130CBCD5A40944597B3C58719C0AD01F958CCCD5A40C187A9B9B98719C0
302	2	S1.3.4	0103000020E61000000100000005000000EBCB5E93CCCD5A4028E15AA7BF8719C02A96C4CDCCCD5A40903A0C95C58719C08B2B5CA7CBCD5A40CF7AB290D18719C0EF97FE6BCBCD5A4032E024A2CB8719C0EBCB5E93CCCD5A4028E15AA7BF8719C0
303	2	S1.3.3	0103000020E610000001000000050000002A96C4CDCCCD5A40903A0C95C58719C068602A08CDCD5A40F893BD82CB8719C026BFB9E2CBCD5A406D15407FD78719C08B2B5CA7CBCD5A40CF7AB290D18719C02A96C4CDCCCD5A40903A0C95C58719C0
304	2	S1.3.2	0103000020E6100000010000000500000068602A08CDCD5A40F893BD82CB8719C0A62A9042CDCD5A405FED6E70D18719C0C152171ECCCD5A400BB0CD6DDD8719C026BFB9E2CBCD5A406D15407FD78719C068602A08CDCD5A40F893BD82CB8719C0
305	2	S1.3.1	0103000020E61000000100000005000000A62A9042CDCD5A405FED6E70D18719C0E4F4F57CCDCD5A40C746205ED78719C05CE67459CCCD5A40A94A5B5CE38719C0C152171ECCCD5A400BB0CD6DDD8719C0A62A9042CDCD5A405FED6E70D18719C0
306	2	S1.4.39	0103000020E61000000100000005000000BA69334EC3CD5A409CBCC804FC8619C055FD9089C3CD5A403A5756F3018719C0000B4841C2CD5A4011ADDFD00D8719C008AEF204C2CD5A403DD175E1078719C0BA69334EC3CD5A409CBCC804FC8619C0
307	2	S1.4.38	0103000020E6100000010000000500000055FD9089C3CD5A403A5756F3018719C0F090EEC4C3CD5A40D8F1E3E1078719C0F8679D7DC2CD5A40E58849C0138719C0000B4841C2CD5A4011ADDFD00D8719C055FD9089C3CD5A403A5756F3018719C0
308	2	S1.4.37	0103000020E61000000100000005000000F090EEC4C3CD5A40D8F1E3E1078719C08B244C00C4CD5A40768C71D00D8719C0F0C4F2B9C2CD5A40B964B3AF198719C0F8679D7DC2CD5A40E58849C0138719C0F090EEC4C3CD5A40D8F1E3E1078719C0
309	2	S1.4.36	0103000020E610000001000000050000008B244C00C4CD5A40768C71D00D8719C027B8A93BC4CD5A401327FFBE138719C0E82148F6C2CD5A408D401D9F1F8719C0F0C4F2B9C2CD5A40B964B3AF198719C08B244C00C4CD5A40768C71D00D8719C0
310	2	S1.4.35	0103000020E6100000010000000500000027B8A93BC4CD5A401327FFBE138719C0C24B0777C4CD5A40B1C18CAD198719C0E17E9D32C3CD5A40611C878E258719C0E82148F6C2CD5A408D401D9F1F8719C027B8A93BC4CD5A401327FFBE138719C0
311	2	S1.4.34	0103000020E61000000100000005000000C24B0777C4CD5A40B1C18CAD198719C05DDF64B2C4CD5A404F5C1A9C1F8719C0D9DBF26EC3CD5A4035F8F07D2B8719C0E17E9D32C3CD5A40611C878E258719C0C24B0777C4CD5A40B1C18CAD198719C0
312	2	S1.4.33	0103000020E610000001000000050000005DDF64B2C4CD5A404F5C1A9C1F8719C0F872C2EDC4CD5A40EDF6A78A258719C0D13848ABC3CD5A4009D45A6D318719C0D9DBF26EC3CD5A4035F8F07D2B8719C05DDF64B2C4CD5A404F5C1A9C1F8719C0
313	2	S1.4.32	0103000020E61000000100000005000000F872C2EDC4CD5A40EDF6A78A258719C093062029C5CD5A408B9135792B8719C0C9959DE7C3CD5A40DDAFC45C378719C0D13848ABC3CD5A4009D45A6D318719C0F872C2EDC4CD5A40EDF6A78A258719C0
314	2	S1.4.31	0103000020E6100000010000000500000093062029C5CD5A408B9135792B8719C02E9A7D64C5CD5A40292CC367318719C0C1F2F223C4CD5A40B18B2E4C3D8719C0C9959DE7C3CD5A40DDAFC45C378719C093062029C5CD5A408B9135792B8719C0
315	2	S1.4.30	0103000020E610000001000000050000002E9A7D64C5CD5A40292CC367318719C0C92DDB9FC5CD5A40C7C65056378719C0B94F4860C4CD5A408667983B438719C0C1F2F223C4CD5A40B18B2E4C3D8719C02E9A7D64C5CD5A40292CC367318719C0
316	2	S1.4.29	0103000020E61000000100000005000000C92DDB9FC5CD5A40C7C65056378719C064C138DBC5CD5A406561DE443D8719C0B1AC9D9CC4CD5A405A43022B498719C0B94F4860C4CD5A408667983B438719C0C92DDB9FC5CD5A40C7C65056378719C0
317	2	S1.4.28	0103000020E6100000010000000500000064C138DBC5CD5A406561DE443D8719C000559616C6CD5A4002FC6B33438719C0A909F3D8C4CD5A402E1F6C1A4F8719C0B1AC9D9CC4CD5A405A43022B498719C064C138DBC5CD5A406561DE443D8719C0
318	2	S1.4.27	0103000020E6100000010000000500000000559616C6CD5A4002FC6B33438719C09BE8F351C6CD5A40A096F921498719C0A1664815C5CD5A4002FBD509558719C0A909F3D8C4CD5A402E1F6C1A4F8719C000559616C6CD5A4002FC6B33438719C0
319	2	S1.4.26	0103000020E610000001000000050000009BE8F351C6CD5A40A096F921498719C0367C518DC6CD5A403E3187104F8719C099C39D51C5CD5A40D6D63FF95A8719C0A1664815C5CD5A4002FBD509558719C09BE8F351C6CD5A40A096F921498719C0
320	2	S1.4.25	0103000020E61000000100000005000000367C518DC6CD5A403E3187104F8719C0D10FAFC8C6CD5A40DCCB14FF548719C09220F38DC5CD5A40AAB2A9E8608719C099C39D51C5CD5A40D6D63FF95A8719C0367C518DC6CD5A403E3187104F8719C0
321	2	S1.4.24	0103000020E61000000100000005000000D10FAFC8C6CD5A40DCCB14FF548719C06CA30C04C7CD5A407A66A2ED5A8719C08A7D48CAC5CD5A407E8E13D8668719C09220F38DC5CD5A40AAB2A9E8608719C0D10FAFC8C6CD5A40DCCB14FF548719C0
322	2	S1.4.23	0103000020E610000001000000050000006CA30C04C7CD5A407A66A2ED5A8719C007376A3FC7CD5A40180130DC608719C082DA9D06C6CD5A40526A7DC76C8719C08A7D48CAC5CD5A407E8E13D8668719C06CA30C04C7CD5A407A66A2ED5A8719C0
323	2	S1.4.22	0103000020E6100000010000000500000007376A3FC7CD5A40180130DC608719C0A2CAC77AC7CD5A40B69BBDCA668719C07A37F342C6CD5A402646E7B6728719C082DA9D06C6CD5A40526A7DC76C8719C007376A3FC7CD5A40180130DC608719C0
324	2	S1.4.21	0103000020E61000000100000005000000A2CAC77AC7CD5A40B69BBDCA668719C03D5E25B6C7CD5A4054364BB96C8719C07294487FC6CD5A40FA2151A6788719C07A37F342C6CD5A402646E7B6728719C0A2CAC77AC7CD5A40B69BBDCA668719C0
325	2	S1.4.20	0103000020E610000001000000050000003D5E25B6C7CD5A4054364BB96C8719C0D9F182F1C7CD5A40F1D0D8A7728719C06AF19DBBC6CD5A40CEFDBA957E8719C07294487FC6CD5A40FA2151A6788719C03D5E25B6C7CD5A4054364BB96C8719C0
326	2	S1.4.19	0103000020E61000000100000005000000D9F182F1C7CD5A40F1D0D8A7728719C07485E02CC8CD5A408F6B6696788719C0624EF3F7C6CD5A40A2D92485848719C06AF19DBBC6CD5A40CEFDBA957E8719C0D9F182F1C7CD5A40F1D0D8A7728719C0
327	2	S1.4.18	0103000020E610000001000000050000007485E02CC8CD5A408F6B6696788719C00F193E68C8CD5A402D06F4847E8719C05AAB4834C7CD5A4076B58E748A8719C0624EF3F7C6CD5A40A2D92485848719C07485E02CC8CD5A408F6B6696788719C0
328	2	S1.4.17	0103000020E610000001000000050000000F193E68C8CD5A402D06F4847E8719C0AAAC9BA3C8CD5A40CBA08173848719C052089E70C7CD5A404A91F863908719C05AAB4834C7CD5A4076B58E748A8719C00F193E68C8CD5A402D06F4847E8719C0
329	2	S1.4.16	0103000020E61000000100000005000000AAAC9BA3C8CD5A40CBA08173848719C04540F9DEC8CD5A40693B0F628A8719C04A65F3ACC7CD5A401E6D6253968719C052089E70C7CD5A404A91F863908719C0AAAC9BA3C8CD5A40CBA08173848719C0
190	2	S1.1.38	0103000020E6100000010000000500000054D46B62C7CD5A40B655BA5ADE8619C0D80BE29AC7CD5A40B22CB346E48619C0E0E29053C6CD5A40BFC31825F08619C0FFE1221AC6CD5A408DAB4338EA8619C054D46B62C7CD5A40B655BA5ADE8619C0
330	2	S1.4.15	0103000020E610000001000000050000004540F9DEC8CD5A40693B0F628A8719C0E0D3561AC9CD5A4007D69C50908719C043C248E9C7CD5A40F248CC429C8719C04A65F3ACC7CD5A401E6D6253968719C04540F9DEC8CD5A40693B0F628A8719C0
331	2	S1.4.14	0103000020E61000000100000005000000E0D3561AC9CD5A4007D69C50908719C07B67B455C9CD5A40A5702A3F968719C03B1F9E25C8CD5A40C6243632A28719C043C248E9C7CD5A40F248CC429C8719C0E0D3561AC9CD5A4007D69C50908719C0
332	2	S1.4.13	0103000020E610000001000000050000007B67B455C9CD5A40A5702A3F968719C016FB1191C9CD5A40430BB82D9C8719C0337CF361C8CD5A409A00A021A88719C03B1F9E25C8CD5A40C6243632A28719C07B67B455C9CD5A40A5702A3F968719C0
333	2	S1.4.12	0103000020E6100000010000000500000016FB1191C9CD5A40430BB82D9C8719C0B28E6FCCC9CD5A40E0A5451CA28719C02BD9489EC8CD5A406EDC0911AE8719C0337CF361C8CD5A409A00A021A88719C016FB1191C9CD5A40430BB82D9C8719C0
334	2	S1.4.11	0103000020E61000000100000005000000B28E6FCCC9CD5A40E0A5451CA28719C04D22CD07CACD5A407E40D30AA88719C023369EDAC8CD5A4042B87300B48719C02BD9489EC8CD5A406EDC0911AE8719C0B28E6FCCC9CD5A40E0A5451CA28719C0
335	2	S1.4.10	0103000020E610000001000000050000004D22CD07CACD5A407E40D30AA88719C0E8B52A43CACD5A401CDB60F9AD8719C01B93F316C9CD5A401794DDEFB98719C023369EDAC8CD5A4042B87300B48719C04D22CD07CACD5A407E40D30AA88719C0
336	2	S1.4.9	0103000020E61000000100000005000000E8B52A43CACD5A401CDB60F9AD8719C08349887ECACD5A40BA75EEE7B38719C013F04853C9CD5A40EB6F47DFBF8719C01B93F316C9CD5A401794DDEFB98719C0E8B52A43CACD5A401CDB60F9AD8719C0
337	2	S1.4.8	0103000020E610000001000000050000008349887ECACD5A40BA75EEE7B38719C01EDDE5B9CACD5A4058107CD6B98719C00B4D9E8FC9CD5A40BF4BB1CEC58719C013F04853C9CD5A40EB6F47DFBF8719C08349887ECACD5A40BA75EEE7B38719C0
338	2	S1.4.7	0103000020E610000001000000050000001EDDE5B9CACD5A4058107CD6B98719C0B97043F5CACD5A40F6AA09C5BF8719C003AAF3CBC9CD5A4093271BBECB8719C00B4D9E8FC9CD5A40BF4BB1CEC58719C01EDDE5B9CACD5A4058107CD6B98719C0
339	2	S1.4.6	0103000020E61000000100000005000000B97043F5CACD5A40F6AA09C5BF8719C05404A130CBCD5A40944597B3C58719C0FB064908CACD5A40670385ADD18719C003AAF3CBC9CD5A4093271BBECB8719C0B97043F5CACD5A40F6AA09C5BF8719C0
340	2	S1.4.5	0103000020E610000001000000050000005404A130CBCD5A40944597B3C58719C0EF97FE6BCBCD5A4032E024A2CB8719C0F4639E44CACD5A403BDFEE9CD78719C0FB064908CACD5A40670385ADD18719C05404A130CBCD5A40944597B3C58719C0
341	2	S1.4.4	0103000020E61000000100000005000000EF97FE6BCBCD5A4032E024A2CB8719C08B2B5CA7CBCD5A40CF7AB290D18719C0ECC0F380CACD5A400FBB588CDD8719C0F4639E44CACD5A403BDFEE9CD78719C0EF97FE6BCBCD5A4032E024A2CB8719C0
342	2	S1.4.3	0103000020E610000001000000050000008B2B5CA7CBCD5A40CF7AB290D18719C026BFB9E2CBCD5A406D15407FD78719C0E41D49BDCACD5A40E396C27BE38719C0ECC0F380CACD5A400FBB588CDD8719C08B2B5CA7CBCD5A40CF7AB290D18719C0
343	2	S1.4.2	0103000020E6100000010000000500000026BFB9E2CBCD5A406D15407FD78719C0C152171ECCCD5A400BB0CD6DDD8719C0DC7A9EF9CACD5A40B7722C6BE98719C0E41D49BDCACD5A40E396C27BE38719C026BFB9E2CBCD5A406D15407FD78719C0
344	2	S1.4.1	0103000020E61000000100000005000000C152171ECCCD5A400BB0CD6DDD8719C05CE67459CCCD5A40A94A5B5CE38719C0D4D7F335CBCD5A408B4E965AEF8719C0DC7A9EF9CACD5A40B7722C6BE98719C0C152171ECCCD5A400BB0CD6DDD8719C0
345	3	S0.1.39	0103000020E6100000010000000500000026C79DD2C1CD5A405A828C800A8719C045AC0E0FC2CD5A405559856C108719C0E64AAE01C1CD5A40D272C3581A8719C0A0DD21C5C0CD5A402592E865148719C026C79DD2C1CD5A405A828C800A8719C0
346	3	S0.1.38	0103000020E6100000010000000500000045AC0E0FC2CD5A405559856C108719C064917F4BC2CD5A4051307E58168719C02BB83A3EC1CD5A407F539E4B208719C0E64AAE01C1CD5A40D272C3581A8719C045AC0E0FC2CD5A405559856C108719C0
347	3	S0.1.37	0103000020E6100000010000000500000064917F4BC2CD5A4051307E58168719C08376F087C2CD5A404C0777441C8719C07125C77AC1CD5A402B34793E268719C02BB83A3EC1CD5A407F539E4B208719C064917F4BC2CD5A4051307E58168719C0
348	3	S0.1.36	0103000020E610000001000000050000008376F087C2CD5A404C0777441C8719C0A15B61C4C2CD5A4047DE6F30228719C0B79253B7C1CD5A40D81454312C8719C07125C77AC1CD5A402B34793E268719C08376F087C2CD5A404C0777441C8719C0
349	3	S0.1.35	0103000020E61000000100000005000000A15B61C4C2CD5A4047DE6F30228719C0C040D200C3CD5A4042B5681C288719C0FCFFDFF3C1CD5A4085F52E24328719C0B79253B7C1CD5A40D81454312C8719C0A15B61C4C2CD5A4047DE6F30228719C0
350	3	S0.1.34	0103000020E61000000100000005000000C040D200C3CD5A4042B5681C288719C0DF25433DC3CD5A403E8C61082E8719C0426D6C30C2CD5A4032D60917388719C0FCFFDFF3C1CD5A4085F52E24328719C0C040D200C3CD5A4042B5681C288719C0
351	3	S0.1.33	0103000020E61000000100000005000000DF25433DC3CD5A403E8C61082E8719C0FE0AB479C3CD5A4039635AF4338719C088DAF86CC2CD5A40DFB6E4093E8719C0426D6C30C2CD5A4032D60917388719C0DF25433DC3CD5A403E8C61082E8719C0
352	3	S0.1.32	0103000020E61000000100000005000000FE0AB479C3CD5A4039635AF4338719C01DF024B6C3CD5A40343A53E0398719C0CD4785A9C2CD5A408C97BFFC438719C088DAF86CC2CD5A40DFB6E4093E8719C0FE0AB479C3CD5A4039635AF4338719C0
353	3	S0.1.31	0103000020E610000001000000050000001DF024B6C3CD5A40343A53E0398719C03CD595F2C3CD5A4030114CCC3F8719C013B511E6C2CD5A4038789AEF498719C0CD4785A9C2CD5A408C97BFFC438719C01DF024B6C3CD5A40343A53E0398719C0
354	3	S0.1.30	0103000020E610000001000000050000003CD595F2C3CD5A4030114CCC3F8719C05BBA062FC4CD5A402BE844B8458719C059229E22C3CD5A40E55875E24F8719C013B511E6C2CD5A4038789AEF498719C03CD595F2C3CD5A4030114CCC3F8719C0
355	3	S0.1.29	0103000020E610000001000000050000005BBA062FC4CD5A402BE844B8458719C07A9F776BC4CD5A4026BF3DA44B8719C09E8F2A5FC3CD5A40923950D5558719C059229E22C3CD5A40E55875E24F8719C05BBA062FC4CD5A402BE844B8458719C0
356	3	S0.1.28	0103000020E610000001000000050000007A9F776BC4CD5A4026BF3DA44B8719C09884E8A7C4CD5A4021963690518719C0E4FCB69BC3CD5A403F1A2BC85B8719C09E8F2A5FC3CD5A40923950D5558719C07A9F776BC4CD5A4026BF3DA44B8719C0
357	3	S0.1.27	0103000020E610000001000000050000009884E8A7C4CD5A4021963690518719C0B76959E4C4CD5A401D6D2F7C578719C02A6A43D8C3CD5A40ECFA05BB618719C0E4FCB69BC3CD5A403F1A2BC85B8719C09884E8A7C4CD5A4021963690518719C0
358	3	S0.1.26	0103000020E61000000100000005000000B76959E4C4CD5A401D6D2F7C578719C0D64ECA20C5CD5A40184428685D8719C06FD7CF14C4CD5A4098DBE0AD678719C02A6A43D8C3CD5A40ECFA05BB618719C0B76959E4C4CD5A401D6D2F7C578719C0
359	3	S0.1.25	0103000020E61000000100000005000000D64ECA20C5CD5A40184428685D8719C0F5333B5DC5CD5A40131B2154638719C0B5445C51C4CD5A4045BCBBA06D8719C06FD7CF14C4CD5A4098DBE0AD678719C0D64ECA20C5CD5A40184428685D8719C0
360	3	S0.1.24	0103000020E61000000100000005000000F5333B5DC5CD5A40131B2154638719C01419AC99C5CD5A400FF21940698719C0FBB1E88DC4CD5A40F29C9693738719C0B5445C51C4CD5A4045BCBBA06D8719C0F5333B5DC5CD5A40131B2154638719C0
361	3	S0.1.23	0103000020E610000001000000050000001419AC99C5CD5A400FF21940698719C033FE1CD6C5CD5A400AC9122C6F8719C0401F75CAC4CD5A409F7D7186798719C0FBB1E88DC4CD5A40F29C9693738719C01419AC99C5CD5A400FF21940698719C0
362	3	S0.1.22	0103000020E6100000010000000500000033FE1CD6C5CD5A400AC9122C6F8719C052E38D12C6CD5A4005A00B18758719C0868C0107C5CD5A404C5E4C797F8719C0401F75CAC4CD5A409F7D7186798719C033FE1CD6C5CD5A400AC9122C6F8719C0
363	3	S0.1.21	0103000020E6100000010000000500000052E38D12C6CD5A4005A00B18758719C071C8FE4EC6CD5A40007704047B8719C0CCF98D43C5CD5A40F93E276C858719C0868C0107C5CD5A404C5E4C797F8719C052E38D12C6CD5A4005A00B18758719C0
364	3	S0.1.20	0103000020E6100000010000000500000071C8FE4EC6CD5A40007704047B8719C08FAD6F8BC6CD5A40FC4DFDEF808719C011671A80C5CD5A40A51F025F8B8719C0CCF98D43C5CD5A40F93E276C858719C071C8FE4EC6CD5A40007704047B8719C0
365	3	S0.1.19	0103000020E610000001000000050000008FAD6F8BC6CD5A40FC4DFDEF808719C0AE92E0C7C6CD5A40F724F6DB868719C057D4A6BCC5CD5A405200DD51918719C011671A80C5CD5A40A51F025F8B8719C08FAD6F8BC6CD5A40FC4DFDEF808719C0
366	3	S0.1.18	0103000020E61000000100000005000000AE92E0C7C6CD5A40F724F6DB868719C0CD775104C7CD5A40F2FBEEC78C8719C09D4133F9C5CD5A40FFE0B744978719C057D4A6BCC5CD5A405200DD51918719C0AE92E0C7C6CD5A40F724F6DB868719C0
367	3	S0.1.17	0103000020E61000000100000005000000CD775104C7CD5A40F2FBEEC78C8719C0EC5CC240C7CD5A40EDD2E7B3928719C0E2AEBF35C6CD5A40ACC192379D8719C09D4133F9C5CD5A40FFE0B744978719C0CD775104C7CD5A40F2FBEEC78C8719C0
368	3	S0.1.16	0103000020E61000000100000005000000EC5CC240C7CD5A40EDD2E7B3928719C00B42337DC7CD5A40E9A9E09F988719C0281C4C72C6CD5A4059A26D2AA38719C0E2AEBF35C6CD5A40ACC192379D8719C0EC5CC240C7CD5A40EDD2E7B3928719C0
369	3	S0.1.15	0103000020E610000001000000050000000B42337DC7CD5A40E9A9E09F988719C02A27A4B9C7CD5A40E480D98B9E8719C06E89D8AEC6CD5A400683481DA98719C0281C4C72C6CD5A4059A26D2AA38719C00B42337DC7CD5A40E9A9E09F988719C0
370	3	S0.1.14	0103000020E610000001000000050000002A27A4B9C7CD5A40E480D98B9E8719C0490C15F6C7CD5A40DF57D277A48719C0B3F664EBC6CD5A40B2632310AF8719C06E89D8AEC6CD5A400683481DA98719C02A27A4B9C7CD5A40E480D98B9E8719C0
1039	12	E.6.8	0103000020E61000000100000005000000E525FF93BFCD5A40FF868DF3B98719C007B4B540BFCD5A403C2D991BBD8719C0603103CBBECD5A402CA41FA7B18719C0A71D281EBFCD5A403AD1EF7DAE8719C0E525FF93BFCD5A40FF868DF3B98719C0
1040	12	E.6.9	0103000020E6100000010000000500000007B4B540BFCD5A403C2D991BBD8719C02A426CEDBECD5A4078D3A443C08719C01945DE77BECD5A401E774FD0B48719C0603103CBBECD5A402CA41FA7B18719C007B4B540BFCD5A403C2D991BBD8719C0
1041	12	E.6.10	0103000020E610000001000000050000002A426CEDBECD5A4078D3A443C08719C04CD0229ABECD5A40B479B06BC38719C0D258B924BECD5A40104A7FF9B78719C01945DE77BECD5A401E774FD0B48719C02A426CEDBECD5A4078D3A443C08719C0
1042	12	E.6.11	0103000020E610000001000000050000004CD0229ABECD5A40B479B06BC38719C06E5ED946BECD5A40F11FBC93C68719C08B6C94D1BDCD5A40021DAF22BB8719C0D258B924BECD5A40104A7FF9B78719C04CD0229ABECD5A40B479B06BC38719C0
1043	12	E.6.12	0103000020E610000001000000050000006E5ED946BECD5A40F11FBC93C68719C090EC8FF3BDCD5A402DC6C7BBC98719C044806F7EBDCD5A40F4EFDE4BBE8719C08B6C94D1BDCD5A40021DAF22BB8719C06E5ED946BECD5A40F11FBC93C68719C0
1044	12	E.6.13	0103000020E6100000010000000500000090EC8FF3BDCD5A402DC6C7BBC98719C0B27A46A0BDCD5A406A6CD3E3CC8719C0FC934A2BBDCD5A40E5C20E75C18719C044806F7EBDCD5A40F4EFDE4BBE8719C090EC8FF3BDCD5A402DC6C7BBC98719C0
1045	12	E.6.14	0103000020E61000000100000005000000B27A46A0BDCD5A406A6CD3E3CC8719C0D508FD4CBDCD5A40A612DF0BD08719C0B5A725D8BCCD5A40D7953E9EC48719C0FC934A2BBDCD5A40E5C20E75C18719C0B27A46A0BDCD5A406A6CD3E3CC8719C0
1046	12	E.6.15	0103000020E61000000100000005000000D508FD4CBDCD5A40A612DF0BD08719C0F796B3F9BCCD5A40E2B8EA33D38719C06EBB0085BCCD5A40C9686EC7C78719C0B5A725D8BCCD5A40D7953E9EC48719C0D508FD4CBDCD5A40A612DF0BD08719C0
1047	12	E.6.16	0103000020E61000000100000005000000F796B3F9BCCD5A40E2B8EA33D38719C019256AA6BCCD5A401F5FF65BD68719C027CFDB31BCCD5A40BB3B9EF0CA8719C06EBB0085BCCD5A40C9686EC7C78719C0F796B3F9BCCD5A40E2B8EA33D38719C0
1048	12	E.6.17	0103000020E6100000010000000500000019256AA6BCCD5A401F5FF65BD68719C03BB32053BCCD5A405B050284D98719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C027CFDB31BCCD5A40BB3B9EF0CA8719C019256AA6BCCD5A401F5FF65BD68719C0
1049	12	E.6.18	0103000020E610000001000000050000003BB32053BCCD5A405B050284D98719C05D41D7FFBBCD5A4097AB0DACDC8719C099F6918BBBCD5A409FE1FD42D18719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C03BB32053BCCD5A405B050284D98719C0
1050	12	E.6.19	0103000020E610000001000000050000005D41D7FFBBCD5A4097AB0DACDC8719C07FCF8DACBBCD5A40D45119D4DF8719C0520A6D38BBCD5A4091B42D6CD48719C099F6918BBBCD5A409FE1FD42D18719C05D41D7FFBBCD5A4097AB0DACDC8719C0
1051	12	E.6.20	0103000020E610000001000000050000007FCF8DACBBCD5A40D45119D4DF8719C0A25D4459BBCD5A4010F824FCE28719C00B1E48E5BACD5A4083875D95D78719C0520A6D38BBCD5A4091B42D6CD48719C07FCF8DACBBCD5A40D45119D4DF8719C0
1052	12	E.6.21	0103000020E61000000100000005000000A25D4459BBCD5A4010F824FCE28719C0C4EBFA05BBCD5A404C9E3024E68719C0C3312392BACD5A40755A8DBEDA8719C00B1E48E5BACD5A4083875D95D78719C0A25D4459BBCD5A4010F824FCE28719C0
1053	12	E.6.22	0103000020E61000000100000005000000C4EBFA05BBCD5A404C9E3024E68719C0E679B1B2BACD5A4089443C4CE98719C07C45FE3EBACD5A40672DBDE7DD8719C0C3312392BACD5A40755A8DBEDA8719C0C4EBFA05BBCD5A404C9E3024E68719C0
1054	12	E.6.23	0103000020E61000000100000005000000E679B1B2BACD5A4089443C4CE98719C00808685FBACD5A40C5EA4774EC8719C03559D9EBB9CD5A405900ED10E18719C07C45FE3EBACD5A40672DBDE7DD8719C0E679B1B2BACD5A4089443C4CE98719C0
1055	12	E.6.24	0103000020E610000001000000050000000808685FBACD5A40C5EA4774EC8719C02A961E0CBACD5A400191539CEF8719C0EE6CB498B9CD5A404BD31C3AE48719C03559D9EBB9CD5A405900ED10E18719C00808685FBACD5A40C5EA4774EC8719C0
1056	12	E.6.25	0103000020E610000001000000050000002A961E0CBACD5A400191539CEF8719C04D24D5B8B9CD5A403E375FC4F28719C0A7808F45B9CD5A403DA64C63E78719C0EE6CB498B9CD5A404BD31C3AE48719C02A961E0CBACD5A400191539CEF8719C0
1057	12	E.6.26	0103000020E610000001000000050000004D24D5B8B9CD5A403E375FC4F28719C06FB28B65B9CD5A407ADD6AECF58719C060946AF2B8CD5A402F797C8CEA8719C0A7808F45B9CD5A403DA64C63E78719C04D24D5B8B9CD5A403E375FC4F28719C0
1058	12	E.6.27	0103000020E610000001000000050000006FB28B65B9CD5A407ADD6AECF58719C091404212B9CD5A40B6837614F98719C019A8459FB8CD5A40214CACB5ED8719C060946AF2B8CD5A402F797C8CEA8719C06FB28B65B9CD5A407ADD6AECF58719C0
1059	12	E.6.28	0103000020E6100000010000000500000091404212B9CD5A40B6837614F98719C0B3CEF8BEB8CD5A40F329823CFC8719C0D2BB204CB8CD5A40131FDCDEF08719C019A8459FB8CD5A40214CACB5ED8719C091404212B9CD5A40B6837614F98719C0
1060	12	E.6.29	0103000020E61000000100000005000000B3CEF8BEB8CD5A40F329823CFC8719C0D55CAF6BB8CD5A402FD08D64FF8719C08ACFFBF8B7CD5A4005F20B08F48719C0D2BB204CB8CD5A40131FDCDEF08719C0B3CEF8BEB8CD5A40F329823CFC8719C0
1061	12	E.6.30	0103000020E61000000100000005000000D55CAF6BB8CD5A402FD08D64FF8719C0F8EA6518B8CD5A406B76998C028819C043E3D6A5B7CD5A40F7C43B31F78719C08ACFFBF8B7CD5A4005F20B08F48719C0D55CAF6BB8CD5A402FD08D64FF8719C0
1062	12	E.6.31	0103000020E61000000100000005000000F8EA6518B8CD5A406B76998C028819C01A791CC5B7CD5A40A81CA5B4058819C0FCF6B152B7CD5A40E9976B5AFA8719C043E3D6A5B7CD5A40F7C43B31F78719C0F8EA6518B8CD5A406B76998C028819C0
1063	12	E.6.32	0103000020E610000001000000050000001A791CC5B7CD5A40A81CA5B4058819C03C07D371B7CD5A40E4C2B0DC088819C0B50A8DFFB6CD5A40DB6A9B83FD8719C0FCF6B152B7CD5A40E9976B5AFA8719C01A791CC5B7CD5A40A81CA5B4058819C0
1064	12	E.6.33	0103000020E610000001000000050000003C07D371B7CD5A40E4C2B0DC088819C05E95891EB7CD5A402069BC040C8819C06E1E68ACB6CD5A40CD3DCBAC008819C0B50A8DFFB6CD5A40DB6A9B83FD8719C03C07D371B7CD5A40E4C2B0DC088819C0
1065	12	E.6.34	0103000020E610000001000000050000005E95891EB7CD5A402069BC040C8819C0802340CBB6CD5A405D0FC82C0F8819C027324359B6CD5A40BF10FBD5038819C06E1E68ACB6CD5A40CD3DCBAC008819C05E95891EB7CD5A402069BC040C8819C0
1066	12	E.6.35	0103000020E61000000100000005000000802340CBB6CD5A405D0FC82C0F8819C0A2B1F677B6CD5A4099B5D354128819C0E0451E06B6CD5A40B1E32AFF068819C027324359B6CD5A40BF10FBD5038819C0802340CBB6CD5A405D0FC82C0F8819C0
1067	12	E.6.36	0103000020E61000000100000005000000A2B1F677B6CD5A4099B5D354128819C0C53FAD24B6CD5A40D55BDF7C158819C09959F9B2B5CD5A40A3B65A280A8819C0E0451E06B6CD5A40B1E32AFF068819C0A2B1F677B6CD5A4099B5D354128819C0
1068	12	E.6.37	0103000020E61000000100000005000000C53FAD24B6CD5A40D55BDF7C158819C0E7CD63D1B5CD5A401202EBA4188819C0516DD45FB5CD5A4094898A510D8819C09959F9B2B5CD5A40A3B65A280A8819C0C53FAD24B6CD5A40D55BDF7C158819C0
1069	12	E.6.38	0103000020E61000000100000005000000E7CD63D1B5CD5A401202EBA4188819C0095C1A7EB5CD5A404EA8F6CC1B8819C00A81AF0CB5CD5A40865CBA7A108819C0516DD45FB5CD5A4094898A510D8819C0E7CD63D1B5CD5A401202EBA4188819C0
1070	12	E.6.39	0103000020E61000000100000005000000095C1A7EB5CD5A404EA8F6CC1B8819C02BEAD02AB5CD5A408B4E02F51E8819C0C3948AB9B4CD5A40782FEAA3138819C00A81AF0CB5CD5A40865CBA7A108819C0095C1A7EB5CD5A404EA8F6CC1B8819C0
1071	12	E.6.40	0103000020E610000001000000050000002BEAD02AB5CD5A408B4E02F51E8819C04D7887D7B4CD5A40C7F40D1D228819C07CA86566B4CD5A406A021ACD168819C0C3948AB9B4CD5A40782FEAA3138819C02BEAD02AB5CD5A408B4E02F51E8819C0
1072	12	E.6.41	0103000020E610000001000000050000004D7887D7B4CD5A40C7F40D1D228819C070063E84B4CD5A40039B1945258819C035BC4013B4CD5A405CD549F6198819C07CA86566B4CD5A406A021ACD168819C04D7887D7B4CD5A40C7F40D1D228819C0
1073	12	E.6.42	0103000020E6100000010000000500000070063E84B4CD5A40039B1945258819C09294F430B4CD5A404041256D288819C0EECF1BC0B3CD5A404EA8791F1D8819C035BC4013B4CD5A405CD549F6198819C070063E84B4CD5A40039B1945258819C0
1074	12	E.6.43	0103000020E610000001000000050000009294F430B4CD5A404041256D288819C0B422ABDDB3CD5A407CE730952B8819C0A7E3F66CB3CD5A40407BA948208819C0EECF1BC0B3CD5A404EA8791F1D8819C09294F430B4CD5A404041256D288819C0
1075	12	E.6.44	0103000020E61000000100000005000000B422ABDDB3CD5A407CE730952B8819C0D6B0618AB3CD5A40B88D3CBD2E8819C060F7D119B3CD5A40324ED971238819C0A7E3F66CB3CD5A40407BA948208819C0B422ABDDB3CD5A407CE730952B8819C0
1076	12	E.6.45	0103000020E61000000100000005000000D6B0618AB3CD5A40B88D3CBD2E8819C0F83E1837B3CD5A40F53348E5318819C0180BADC6B2CD5A402421099B268819C060F7D119B3CD5A40324ED971238819C0D6B0618AB3CD5A40B88D3CBD2E8819C0
1077	12	E.6.46	0103000020E61000000100000005000000F83E1837B3CD5A40F53348E5318819C01ACDCEE3B2CD5A4031DA530D358819C0D11E8873B2CD5A4016F438C4298819C0180BADC6B2CD5A402421099B268819C0F83E1837B3CD5A40F53348E5318819C0
1078	12	E.6.47	0103000020E610000001000000050000001ACDCEE3B2CD5A4031DA530D358819C03D5B8590B2CD5A406D805F35388819C08A326320B2CD5A4008C768ED2C8819C0D11E8873B2CD5A4016F438C4298819C01ACDCEE3B2CD5A4031DA530D358819C0
1079	12	E.6.48	0103000020E610000001000000050000003D5B8590B2CD5A406D805F35388819C05FE93B3DB2CD5A40AA266B5D3B8819C043463ECDB1CD5A40FA999816308819C08A326320B2CD5A4008C768ED2C8819C03D5B8590B2CD5A406D805F35388819C0
1080	12	E.6.49	0103000020E610000001000000050000005FE93B3DB2CD5A40AA266B5D3B8819C08177F2E9B1CD5A40E6CC76853E8819C0FC59197AB1CD5A40EC6CC83F338819C043463ECDB1CD5A40FA999816308819C05FE93B3DB2CD5A40AA266B5D3B8819C0
1081	12	E.5.1	0103000020E6100000010000000500000099932A64C1CD5A409C0CA15D988719C052A70511C1CD5A408EDFD0869B8719C08C7D539AC0CD5A40881D5A0A908719C03CE453EDC0CD5A40E01D06E08C8719C099932A64C1CD5A409C0CA15D988719C0
1082	12	E.5.2	0103000020E6100000010000000500000052A70511C1CD5A408EDFD0869B8719C00BBBE0BDC0CD5A4080B200B09E8719C0DB165347C0CD5A402F1DAE34938719C08C7D539AC0CD5A40881D5A0A908719C052A70511C1CD5A408EDFD0869B8719C0
1083	12	E.5.3	0103000020E610000001000000050000000BBBE0BDC0CD5A4080B200B09E8719C0C4CEBB6AC0CD5A40728530D9A18719C02BB052F4BFCD5A40D71C025F968719C0DB165347C0CD5A402F1DAE34938719C00BBBE0BDC0CD5A4080B200B09E8719C0
1084	12	E.5.4	0103000020E61000000100000005000000C4CEBB6AC0CD5A40728530D9A18719C07DE29617C0CD5A4064586002A58719C07A4952A1BFCD5A407E1C5689998719C02BB052F4BFCD5A40D71C025F968719C0C4CEBB6AC0CD5A40728530D9A18719C0
1085	12	E.5.5	0103000020E610000001000000050000007DE29617C0CD5A4064586002A58719C035F671C4BFCD5A40562B902BA88719C0CAE2514EBFCD5A40261CAAB39C8719C07A4952A1BFCD5A407E1C5689998719C07DE29617C0CD5A4064586002A58719C0
1086	12	E.5.6	0103000020E6100000010000000500000035F671C4BFCD5A40562B902BA88719C0EE094D71BFCD5A4048FEBF54AB8719C01A7C51FBBECD5A40CD1BFEDD9F8719C0CAE2514EBFCD5A40261CAAB39C8719C035F671C4BFCD5A40562B902BA88719C0
1087	12	E.5.7	0103000020E61000000100000005000000EE094D71BFCD5A4048FEBF54AB8719C0A71D281EBFCD5A403AD1EF7DAE8719C0691551A8BECD5A40751B5208A38719C01A7C51FBBECD5A40CD1BFEDD9F8719C0EE094D71BFCD5A4048FEBF54AB8719C0
1088	12	E.5.8	0103000020E61000000100000005000000A71D281EBFCD5A403AD1EF7DAE8719C0603103CBBECD5A402CA41FA7B18719C0B9AE5055BECD5A401C1BA632A68719C0691551A8BECD5A40751B5208A38719C0A71D281EBFCD5A403AD1EF7DAE8719C0
1089	12	E.5.9	0103000020E61000000100000005000000603103CBBECD5A402CA41FA7B18719C01945DE77BECD5A401E774FD0B48719C008485002BECD5A40C41AFA5CA98719C0B9AE5055BECD5A401C1BA632A68719C0603103CBBECD5A402CA41FA7B18719C0
1090	12	E.5.10	0103000020E610000001000000050000001945DE77BECD5A401E774FD0B48719C0D258B924BECD5A40104A7FF9B78719C058E14FAFBDCD5A406C1A4E87AC8719C008485002BECD5A40C41AFA5CA98719C01945DE77BECD5A401E774FD0B48719C0
1091	12	E.5.11	0103000020E61000000100000005000000D258B924BECD5A40104A7FF9B78719C08B6C94D1BDCD5A40021DAF22BB8719C0A87A4F5CBDCD5A40131AA2B1AF8719C058E14FAFBDCD5A406C1A4E87AC8719C0D258B924BECD5A40104A7FF9B78719C0
1092	12	E.5.12	0103000020E610000001000000050000008B6C94D1BDCD5A40021DAF22BB8719C044806F7EBDCD5A40F4EFDE4BBE8719C0F7134F09BDCD5A40BB19F6DBB28719C0A87A4F5CBDCD5A40131AA2B1AF8719C08B6C94D1BDCD5A40021DAF22BB8719C0
1093	12	E.5.13	0103000020E6100000010000000500000044806F7EBDCD5A40F4EFDE4BBE8719C0FC934A2BBDCD5A40E5C20E75C18719C047AD4EB6BCCD5A4062194A06B68719C0F7134F09BDCD5A40BB19F6DBB28719C044806F7EBDCD5A40F4EFDE4BBE8719C0
1094	12	E.5.14	0103000020E61000000100000005000000FC934A2BBDCD5A40E5C20E75C18719C0B5A725D8BCCD5A40D7953E9EC48719C096464E63BCCD5A400A199E30B98719C047AD4EB6BCCD5A4062194A06B68719C0FC934A2BBDCD5A40E5C20E75C18719C0
1095	12	E.5.15	0103000020E61000000100000005000000B5A725D8BCCD5A40D7953E9EC48719C06EBB0085BCCD5A40C9686EC7C78719C0E6DF4D10BCCD5A40B118F25ABC8719C096464E63BCCD5A400A199E30B98719C0B5A725D8BCCD5A40D7953E9EC48719C0
1096	12	E.5.16	0103000020E610000001000000050000006EBB0085BCCD5A40C9686EC7C78719C027CFDB31BCCD5A40BB3B9EF0CA8719C035794DBDBBCD5A4059184685BF8719C0E6DF4D10BCCD5A40B118F25ABC8719C06EBB0085BCCD5A40C9686EC7C78719C0
1097	12	E.5.17	0103000020E6100000010000000500000027CFDB31BCCD5A40BB3B9EF0CA8719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C085124D6ABBCD5A4000189AAFC28719C035794DBDBBCD5A4059184685BF8719C027CFDB31BCCD5A40BB3B9EF0CA8719C0
1098	12	E.5.18	0103000020E61000000100000005000000E0E2B6DEBBCD5A40AD0ECE19CE8719C099F6918BBBCD5A409FE1FD42D18719C0D5AB4C17BBCD5A40A817EED9C58719C085124D6ABBCD5A4000189AAFC28719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C0
1099	12	E.5.19	0103000020E6100000010000000500000099F6918BBBCD5A409FE1FD42D18719C0520A6D38BBCD5A4091B42D6CD48719C024454CC4BACD5A404F174204C98719C0D5AB4C17BBCD5A40A817EED9C58719C099F6918BBBCD5A409FE1FD42D18719C0
1100	12	E.5.20	0103000020E61000000100000005000000520A6D38BBCD5A4091B42D6CD48719C00B1E48E5BACD5A4083875D95D78719C074DE4B71BACD5A40F716962ECC8719C024454CC4BACD5A404F174204C98719C0520A6D38BBCD5A4091B42D6CD48719C0
1101	12	E.5.21	0103000020E610000001000000050000000B1E48E5BACD5A4083875D95D78719C0C3312392BACD5A40755A8DBEDA8719C0C3774B1EBACD5A409F16EA58CF8719C074DE4B71BACD5A40F716962ECC8719C00B1E48E5BACD5A4083875D95D78719C0
1102	12	E.5.22	0103000020E61000000100000005000000C3312392BACD5A40755A8DBEDA8719C07C45FE3EBACD5A40672DBDE7DD8719C013114BCBB9CD5A4046163E83D28719C0C3774B1EBACD5A409F16EA58CF8719C0C3312392BACD5A40755A8DBEDA8719C0
1103	12	E.5.23	0103000020E610000001000000050000007C45FE3EBACD5A40672DBDE7DD8719C03559D9EBB9CD5A405900ED10E18719C063AA4A78B9CD5A40EE1592ADD58719C013114BCBB9CD5A4046163E83D28719C07C45FE3EBACD5A40672DBDE7DD8719C0
1104	12	E.5.24	0103000020E610000001000000050000003559D9EBB9CD5A405900ED10E18719C0EE6CB498B9CD5A404BD31C3AE48719C0B2434A25B9CD5A409515E6D7D88719C063AA4A78B9CD5A40EE1592ADD58719C03559D9EBB9CD5A405900ED10E18719C0
1105	12	E.5.25	0103000020E61000000100000005000000EE6CB498B9CD5A404BD31C3AE48719C0A7808F45B9CD5A403DA64C63E78719C002DD49D2B8CD5A403D153A02DC8719C0B2434A25B9CD5A409515E6D7D88719C0EE6CB498B9CD5A404BD31C3AE48719C0
1106	12	E.5.26	0103000020E61000000100000005000000A7808F45B9CD5A403DA64C63E78719C060946AF2B8CD5A402F797C8CEA8719C05176497FB8CD5A40E4148E2CDF8719C002DD49D2B8CD5A403D153A02DC8719C0A7808F45B9CD5A403DA64C63E78719C0
1107	12	E.5.27	0103000020E6100000010000000500000060946AF2B8CD5A402F797C8CEA8719C019A8459FB8CD5A40214CACB5ED8719C0A10F492CB8CD5A408C14E256E28719C05176497FB8CD5A40E4148E2CDF8719C060946AF2B8CD5A402F797C8CEA8719C0
1108	12	E.5.28	0103000020E6100000010000000500000019A8459FB8CD5A40214CACB5ED8719C0D2BB204CB8CD5A40131FDCDEF08719C0F1A848D9B7CD5A4033143681E58719C0A10F492CB8CD5A408C14E256E28719C019A8459FB8CD5A40214CACB5ED8719C0
1109	12	E.5.29	0103000020E61000000100000005000000D2BB204CB8CD5A40131FDCDEF08719C08ACFFBF8B7CD5A4005F20B08F48719C040424886B7CD5A40DB138AABE88719C0F1A848D9B7CD5A4033143681E58719C0D2BB204CB8CD5A40131FDCDEF08719C0
1110	12	E.5.30	0103000020E610000001000000050000008ACFFBF8B7CD5A4005F20B08F48719C043E3D6A5B7CD5A40F7C43B31F78719C090DB4733B7CD5A408313DED5EB8719C040424886B7CD5A40DB138AABE88719C08ACFFBF8B7CD5A4005F20B08F48719C0
1111	12	E.5.31	0103000020E6100000010000000500000043E3D6A5B7CD5A40F7C43B31F78719C0FCF6B152B7CD5A40E9976B5AFA8719C0DF7447E0B6CD5A402A133200EF8719C090DB4733B7CD5A408313DED5EB8719C043E3D6A5B7CD5A40F7C43B31F78719C0
1112	12	E.5.32	0103000020E61000000100000005000000FCF6B152B7CD5A40E9976B5AFA8719C0B50A8DFFB6CD5A40DB6A9B83FD8719C02F0E478DB6CD5A40D212862AF28719C0DF7447E0B6CD5A402A133200EF8719C0FCF6B152B7CD5A40E9976B5AFA8719C0
1113	12	E.5.33	0103000020E61000000100000005000000B50A8DFFB6CD5A40DB6A9B83FD8719C06E1E68ACB6CD5A40CD3DCBAC008819C07FA7463AB6CD5A407912DA54F58719C02F0E478DB6CD5A40D212862AF28719C0B50A8DFFB6CD5A40DB6A9B83FD8719C0
1114	12	E.5.34	0103000020E610000001000000050000006E1E68ACB6CD5A40CD3DCBAC008819C027324359B6CD5A40BF10FBD5038819C0CE4046E7B5CD5A4021122E7FF88719C07FA7463AB6CD5A407912DA54F58719C06E1E68ACB6CD5A40CD3DCBAC008819C0
1115	12	E.5.35	0103000020E6100000010000000500000027324359B6CD5A40BF10FBD5038819C0E0451E06B6CD5A40B1E32AFF068819C01EDA4594B5CD5A40C81182A9FB8719C0CE4046E7B5CD5A4021122E7FF88719C027324359B6CD5A40BF10FBD5038819C0
1116	12	E.5.36	0103000020E61000000100000005000000E0451E06B6CD5A40B1E32AFF068819C09959F9B2B5CD5A40A3B65A280A8819C06D734541B5CD5A407011D6D3FE8719C01EDA4594B5CD5A40C81182A9FB8719C0E0451E06B6CD5A40B1E32AFF068819C0
1117	12	E.5.37	0103000020E610000001000000050000009959F9B2B5CD5A40A3B65A280A8819C0516DD45FB5CD5A4094898A510D8819C0BD0C45EEB4CD5A4017112AFE018819C06D734541B5CD5A407011D6D3FE8719C09959F9B2B5CD5A40A3B65A280A8819C0
1118	12	E.5.38	0103000020E61000000100000005000000516DD45FB5CD5A4094898A510D8819C00A81AF0CB5CD5A40865CBA7A108819C00CA6449BB4CD5A40BF107E28058819C0BD0C45EEB4CD5A4017112AFE018819C0516DD45FB5CD5A4094898A510D8819C0
1119	12	E.5.39	0103000020E610000001000000050000000A81AF0CB5CD5A40865CBA7A108819C0C3948AB9B4CD5A40782FEAA3138819C05C3F4448B4CD5A406610D252088819C00CA6449BB4CD5A40BF107E28058819C00A81AF0CB5CD5A40865CBA7A108819C0
1120	12	E.5.40	0103000020E61000000100000005000000C3948AB9B4CD5A40782FEAA3138819C07CA86566B4CD5A406A021ACD168819C0ACD843F5B3CD5A400E10267D0B8819C05C3F4448B4CD5A406610D252088819C0C3948AB9B4CD5A40782FEAA3138819C0
1121	12	E.5.41	0103000020E610000001000000050000007CA86566B4CD5A406A021ACD168819C035BC4013B4CD5A405CD549F6198819C0FB7143A2B3CD5A40B60F7AA70E8819C0ACD843F5B3CD5A400E10267D0B8819C07CA86566B4CD5A406A021ACD168819C0
1122	12	E.5.42	0103000020E6100000010000000500000035BC4013B4CD5A405CD549F6198819C0EECF1BC0B3CD5A404EA8791F1D8819C04B0B434FB3CD5A405D0FCED1118819C0FB7143A2B3CD5A40B60F7AA70E8819C035BC4013B4CD5A405CD549F6198819C0
1123	12	E.5.43	0103000020E61000000100000005000000EECF1BC0B3CD5A404EA8791F1D8819C0A7E3F66CB3CD5A40407BA948208819C09AA442FCB2CD5A40050F22FC148819C04B0B434FB3CD5A405D0FCED1118819C0EECF1BC0B3CD5A404EA8791F1D8819C0
1124	12	E.5.44	0103000020E61000000100000005000000A7E3F66CB3CD5A40407BA948208819C060F7D119B3CD5A40324ED971238819C0EA3D42A9B2CD5A40AC0E7626188819C09AA442FCB2CD5A40050F22FC148819C0A7E3F66CB3CD5A40407BA948208819C0
1125	12	E.5.45	0103000020E6100000010000000500000060F7D119B3CD5A40324ED971238819C0180BADC6B2CD5A402421099B268819C03AD74156B2CD5A40540ECA501B8819C0EA3D42A9B2CD5A40AC0E7626188819C060F7D119B3CD5A40324ED971238819C0
1126	12	E.5.46	0103000020E61000000100000005000000180BADC6B2CD5A402421099B268819C0D11E8873B2CD5A4016F438C4298819C089704103B2CD5A40FB0D1E7B1E8819C03AD74156B2CD5A40540ECA501B8819C0180BADC6B2CD5A402421099B268819C0
1127	12	E.5.47	0103000020E61000000100000005000000D11E8873B2CD5A4016F438C4298819C08A326320B2CD5A4008C768ED2C8819C0D90941B0B1CD5A40A30D72A5218819C089704103B2CD5A40FB0D1E7B1E8819C0D11E8873B2CD5A4016F438C4298819C0
1128	12	E.5.48	0103000020E610000001000000050000008A326320B2CD5A4008C768ED2C8819C043463ECDB1CD5A40FA999816308819C028A3405DB1CD5A404A0DC6CF248819C0D90941B0B1CD5A40A30D72A5218819C08A326320B2CD5A4008C768ED2C8819C0
1129	12	E.5.49	0103000020E6100000010000000500000043463ECDB1CD5A40FA999816308819C0FC59197AB1CD5A40EC6CC83F338819C0783C400AB1CD5A40F20C1AFA278819C028A3405DB1CD5A404A0DC6CF248819C043463ECDB1CD5A40FA999816308819C0
1130	12	E.4.1	0103000020E610000001000000050000003CE453EDC0CD5A40E01D06E08C8719C08C7D539AC0CD5A40881D5A0A908719C0C553A123C0CD5A40805BE38D848719C0DF347D76C0CD5A40232F6B62818719C03CE453EDC0CD5A40E01D06E08C8719C0
1131	12	E.4.2	0103000020E610000001000000050000008C7D539AC0CD5A40881D5A0A908719C0DB165347C0CD5A402F1DAE34938719C0AC72C5D0BFCD5A40DD875BB9878719C0C553A123C0CD5A40805BE38D848719C08C7D539AC0CD5A40881D5A0A908719C0
1132	12	E.4.3	0103000020E61000000100000005000000DB165347C0CD5A402F1DAE34938719C02BB052F4BFCD5A40D71C025F968719C09291E97DBFCD5A403AB4D3E48A8719C0AC72C5D0BFCD5A40DD875BB9878719C0DB165347C0CD5A402F1DAE34938719C0
1133	12	E.4.4	0103000020E610000001000000050000002BB052F4BFCD5A40D71C025F968719C07A4952A1BFCD5A407E1C5689998719C078B00D2BBFCD5A4098E04B108E8719C09291E97DBFCD5A403AB4D3E48A8719C02BB052F4BFCD5A40D71C025F968719C0
1134	12	E.4.5	0103000020E610000001000000050000007A4952A1BFCD5A407E1C5689998719C0CAE2514EBFCD5A40261CAAB39C8719C05ECF31D8BECD5A40F50CC43B918719C078B00D2BBFCD5A4098E04B108E8719C07A4952A1BFCD5A407E1C5689998719C0
1135	12	E.4.6	0103000020E61000000100000005000000CAE2514EBFCD5A40261CAAB39C8719C01A7C51FBBECD5A40CD1BFEDD9F8719C045EE5585BECD5A4052393C67948719C05ECF31D8BECD5A40F50CC43B918719C0CAE2514EBFCD5A40261CAAB39C8719C0
1136	12	E.4.7	0103000020E610000001000000050000001A7C51FBBECD5A40CD1BFEDD9F8719C0691551A8BECD5A40751B5208A38719C02B0D7A32BECD5A40AF65B492978719C045EE5585BECD5A4052393C67948719C01A7C51FBBECD5A40CD1BFEDD9F8719C0
1137	12	E.4.8	0103000020E61000000100000005000000691551A8BECD5A40751B5208A38719C0B9AE5055BECD5A401C1BA632A68719C0112C9EDFBDCD5A400C922CBE9A8719C02B0D7A32BECD5A40AF65B492978719C0691551A8BECD5A40751B5208A38719C0
1138	12	E.4.9	0103000020E61000000100000005000000B9AE5055BECD5A401C1BA632A68719C008485002BECD5A40C41AFA5CA98719C0F84AC28CBDCD5A4069BEA4E99D8719C0112C9EDFBDCD5A400C922CBE9A8719C0B9AE5055BECD5A401C1BA632A68719C0
1139	12	E.4.10	0103000020E6100000010000000500000008485002BECD5A40C41AFA5CA98719C058E14FAFBDCD5A406C1A4E87AC8719C0DE69E639BDCD5A40C6EA1C15A18719C0F84AC28CBDCD5A4069BEA4E99D8719C008485002BECD5A40C41AFA5CA98719C0
1140	12	E.4.11	0103000020E6100000010000000500000058E14FAFBDCD5A406C1A4E87AC8719C0A87A4F5CBDCD5A40131AA2B1AF8719C0C4880AE7BCCD5A4024179540A48719C0DE69E639BDCD5A40C6EA1C15A18719C058E14FAFBDCD5A406C1A4E87AC8719C0
1141	12	E.4.12	0103000020E61000000100000005000000A87A4F5CBDCD5A40131AA2B1AF8719C0F7134F09BDCD5A40BB19F6DBB28719C0AAA72E94BCCD5A4081430D6CA78719C0C4880AE7BCCD5A4024179540A48719C0A87A4F5CBDCD5A40131AA2B1AF8719C0
1142	12	E.4.13	0103000020E61000000100000005000000F7134F09BDCD5A40BB19F6DBB28719C047AD4EB6BCCD5A4062194A06B68719C091C65241BCCD5A40DE6F8597AA8719C0AAA72E94BCCD5A4081430D6CA78719C0F7134F09BDCD5A40BB19F6DBB28719C0
1143	12	E.4.14	0103000020E6100000010000000500000047AD4EB6BCCD5A4062194A06B68719C096464E63BCCD5A400A199E30B98719C077E576EEBBCD5A403B9CFDC2AD8719C091C65241BCCD5A40DE6F8597AA8719C047AD4EB6BCCD5A4062194A06B68719C0
1144	12	E.4.15	0103000020E6100000010000000500000096464E63BCCD5A400A199E30B98719C0E6DF4D10BCCD5A40B118F25ABC8719C05D049B9BBBCD5A4098C875EEB08719C077E576EEBBCD5A403B9CFDC2AD8719C096464E63BCCD5A400A199E30B98719C0
1145	12	E.4.16	0103000020E61000000100000005000000E6DF4D10BCCD5A40B118F25ABC8719C035794DBDBBCD5A4059184685BF8719C04423BF48BBCD5A40F5F4ED19B48719C05D049B9BBBCD5A4098C875EEB08719C0E6DF4D10BCCD5A40B118F25ABC8719C0
1146	12	E.4.17	0103000020E6100000010000000500000035794DBDBBCD5A4059184685BF8719C085124D6ABBCD5A4000189AAFC28719C02A42E3F5BACD5A4052216645B78719C04423BF48BBCD5A40F5F4ED19B48719C035794DBDBBCD5A4059184685BF8719C0
1147	12	E.4.18	0103000020E6100000010000000500000085124D6ABBCD5A4000189AAFC28719C0D5AB4C17BBCD5A40A817EED9C58719C0106107A3BACD5A40B04DDE70BA8719C02A42E3F5BACD5A4052216645B78719C085124D6ABBCD5A4000189AAFC28719C0
1148	12	E.4.19	0103000020E61000000100000005000000D5AB4C17BBCD5A40A817EED9C58719C024454CC4BACD5A404F174204C98719C0F67F2B50BACD5A400D7A569CBD8719C0106107A3BACD5A40B04DDE70BA8719C0D5AB4C17BBCD5A40A817EED9C58719C0
1149	12	E.4.20	0103000020E6100000010000000500000024454CC4BACD5A404F174204C98719C074DE4B71BACD5A40F716962ECC8719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0F67F2B50BACD5A400D7A569CBD8719C024454CC4BACD5A404F174204C98719C0
1150	12	E.4.21	0103000020E6100000010000000500000074DE4B71BACD5A40F716962ECC8719C0C3774B1EBACD5A409F16EA58CF8719C0C3BD73AAB9CD5A40C7D246F3C38719C0DD9E4FFDB9CD5A406AA6CEC7C08719C074DE4B71BACD5A40F716962ECC8719C0
1151	12	E.4.22	0103000020E61000000100000005000000C3774B1EBACD5A409F16EA58CF8719C013114BCBB9CD5A4046163E83D28719C0A9DC9757B9CD5A4024FFBE1EC78719C0C3BD73AAB9CD5A40C7D246F3C38719C0C3774B1EBACD5A409F16EA58CF8719C0
1152	12	E.4.23	0103000020E6100000010000000500000013114BCBB9CD5A4046163E83D28719C063AA4A78B9CD5A40EE1592ADD58719C090FBBB04B9CD5A40812B374ACA8719C0A9DC9757B9CD5A4024FFBE1EC78719C013114BCBB9CD5A4046163E83D28719C0
1153	12	E.4.24	0103000020E6100000010000000500000063AA4A78B9CD5A40EE1592ADD58719C0B2434A25B9CD5A409515E6D7D88719C0761AE0B1B8CD5A40DE57AF75CD8719C090FBBB04B9CD5A40812B374ACA8719C063AA4A78B9CD5A40EE1592ADD58719C0
1154	12	E.4.25	0103000020E61000000100000005000000B2434A25B9CD5A409515E6D7D88719C002DD49D2B8CD5A403D153A02DC8719C05C39045FB8CD5A403C8427A1D08719C0761AE0B1B8CD5A40DE57AF75CD8719C0B2434A25B9CD5A409515E6D7D88719C0
1155	12	E.4.26	0103000020E6100000010000000500000002DD49D2B8CD5A403D153A02DC8719C05176497FB8CD5A40E4148E2CDF8719C04258280CB8CD5A4099B09FCCD38719C05C39045FB8CD5A403C8427A1D08719C002DD49D2B8CD5A403D153A02DC8719C0
1156	12	E.4.27	0103000020E610000001000000050000005176497FB8CD5A40E4148E2CDF8719C0A10F492CB8CD5A408C14E256E28719C029774CB9B7CD5A40F6DC17F8D68719C04258280CB8CD5A4099B09FCCD38719C05176497FB8CD5A40E4148E2CDF8719C0
1157	12	E.4.28	0103000020E61000000100000005000000A10F492CB8CD5A408C14E256E28719C0F1A848D9B7CD5A4033143681E58719C00F967066B7CD5A4053099023DA8719C029774CB9B7CD5A40F6DC17F8D68719C0A10F492CB8CD5A408C14E256E28719C0
1158	12	E.4.29	0103000020E61000000100000005000000F1A848D9B7CD5A4033143681E58719C040424886B7CD5A40DB138AABE88719C0F5B49413B7CD5A40B035084FDD8719C00F967066B7CD5A4053099023DA8719C0F1A848D9B7CD5A4033143681E58719C0
1159	12	E.4.30	0103000020E6100000010000000500000040424886B7CD5A40DB138AABE88719C090DB4733B7CD5A408313DED5EB8719C0DCD3B8C0B6CD5A400D62807AE08719C0F5B49413B7CD5A40B035084FDD8719C040424886B7CD5A40DB138AABE88719C0
1160	12	E.4.31	0103000020E6100000010000000500000090DB4733B7CD5A408313DED5EB8719C0DF7447E0B6CD5A402A133200EF8719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0DCD3B8C0B6CD5A400D62807AE08719C090DB4733B7CD5A408313DED5EB8719C0
1161	12	E.4.32	0103000020E61000000100000005000000DF7447E0B6CD5A402A133200EF8719C02F0E478DB6CD5A40D212862AF28719C0A811011BB6CD5A40C8BA70D1E68719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0DF7447E0B6CD5A402A133200EF8719C0
1162	12	E.4.33	0103000020E610000001000000050000002F0E478DB6CD5A40D212862AF28719C07FA7463AB6CD5A407912DA54F58719C08E3025C8B5CD5A4025E7E8FCE98719C0A811011BB6CD5A40C8BA70D1E68719C02F0E478DB6CD5A40D212862AF28719C0
1163	12	E.4.34	0103000020E610000001000000050000007FA7463AB6CD5A407912DA54F58719C0CE4046E7B5CD5A4021122E7FF88719C0754F4975B5CD5A4082136128ED8719C08E3025C8B5CD5A4025E7E8FCE98719C07FA7463AB6CD5A407912DA54F58719C0
1164	12	E.4.35	0103000020E61000000100000005000000CE4046E7B5CD5A4021122E7FF88719C01EDA4594B5CD5A40C81182A9FB8719C05B6E6D22B5CD5A40DF3FD953F08719C0754F4975B5CD5A4082136128ED8719C0CE4046E7B5CD5A4021122E7FF88719C0
1165	12	E.4.36	0103000020E610000001000000050000001EDA4594B5CD5A40C81182A9FB8719C06D734541B5CD5A407011D6D3FE8719C0418D91CFB4CD5A403C6C517FF38719C05B6E6D22B5CD5A40DF3FD953F08719C01EDA4594B5CD5A40C81182A9FB8719C0
1166	12	E.4.37	0103000020E610000001000000050000006D734541B5CD5A407011D6D3FE8719C0BD0C45EEB4CD5A4017112AFE018819C028ACB57CB4CD5A409998C9AAF68719C0418D91CFB4CD5A403C6C517FF38719C06D734541B5CD5A407011D6D3FE8719C0
1167	12	E.4.38	0103000020E61000000100000005000000BD0C45EEB4CD5A4017112AFE018819C00CA6449BB4CD5A40BF107E28058819C00ECBD929B4CD5A40F6C441D6F98719C028ACB57CB4CD5A409998C9AAF68719C0BD0C45EEB4CD5A4017112AFE018819C0
1168	12	E.4.39	0103000020E610000001000000050000000CA6449BB4CD5A40BF107E28058819C05C3F4448B4CD5A406610D252088819C0F4E9FDD6B3CD5A4054F1B901FD8719C00ECBD929B4CD5A40F6C441D6F98719C00CA6449BB4CD5A40BF107E28058819C0
1169	12	E.4.40	0103000020E610000001000000050000005C3F4448B4CD5A406610D252088819C0ACD843F5B3CD5A400E10267D0B8819C0DA082284B3CD5A40B11D322D008819C0F4E9FDD6B3CD5A4054F1B901FD8719C05C3F4448B4CD5A406610D252088819C0
1170	12	E.4.41	0103000020E61000000100000005000000ACD843F5B3CD5A400E10267D0B8819C0FB7143A2B3CD5A40B60F7AA70E8819C0C1274631B3CD5A400E4AAA58038819C0DA082284B3CD5A40B11D322D008819C0ACD843F5B3CD5A400E10267D0B8819C0
1171	12	E.4.42	0103000020E61000000100000005000000FB7143A2B3CD5A40B60F7AA70E8819C04B0B434FB3CD5A405D0FCED1118819C0A7466ADEB2CD5A406B762284068819C0C1274631B3CD5A400E4AAA58038819C0FB7143A2B3CD5A40B60F7AA70E8819C0
1172	12	E.4.43	0103000020E610000001000000050000004B0B434FB3CD5A405D0FCED1118819C09AA442FCB2CD5A40050F22FC148819C08D658E8BB2CD5A40C8A29AAF098819C0A7466ADEB2CD5A406B762284068819C04B0B434FB3CD5A405D0FCED1118819C0
1173	12	E.4.44	0103000020E610000001000000050000009AA442FCB2CD5A40050F22FC148819C0EA3D42A9B2CD5A40AC0E7626188819C07484B238B2CD5A4025CF12DB0C8819C08D658E8BB2CD5A40C8A29AAF098819C09AA442FCB2CD5A40050F22FC148819C0
1174	12	E.4.45	0103000020E61000000100000005000000EA3D42A9B2CD5A40AC0E7626188819C03AD74156B2CD5A40540ECA501B8819C05AA3D6E5B1CD5A4082FB8A06108819C07484B238B2CD5A4025CF12DB0C8819C0EA3D42A9B2CD5A40AC0E7626188819C0
1175	12	E.4.46	0103000020E610000001000000050000003AD74156B2CD5A40540ECA501B8819C089704103B2CD5A40FB0D1E7B1E8819C040C2FA92B1CD5A40E0270332138819C05AA3D6E5B1CD5A4082FB8A06108819C03AD74156B2CD5A40540ECA501B8819C0
1176	12	E.4.47	0103000020E6100000010000000500000089704103B2CD5A40FB0D1E7B1E8819C0D90941B0B1CD5A40A30D72A5218819C026E11E40B1CD5A403D547B5D168819C040C2FA92B1CD5A40E0270332138819C089704103B2CD5A40FB0D1E7B1E8819C0
1177	12	E.4.48	0103000020E61000000100000005000000D90941B0B1CD5A40A30D72A5218819C028A3405DB1CD5A404A0DC6CF248819C00D0043EDB0CD5A409A80F388198819C026E11E40B1CD5A403D547B5D168819C0D90941B0B1CD5A40A30D72A5218819C0
1178	12	E.4.49	0103000020E6100000010000000500000028A3405DB1CD5A404A0DC6CF248819C0783C400AB1CD5A40F20C1AFA278819C0F31E679AB0CD5A40F7AC6BB41C8819C00D0043EDB0CD5A409A80F388198819C028A3405DB1CD5A404A0DC6CF248819C0
1179	12	E.3.1	0103000020E61000000100000005000000DF347D76C0CD5A40232F6B62818719C0C553A123C0CD5A40805BE38D848719C0FF29EFACBFCD5A4079996C11798719C08285A6FFBFCD5A406640D0E4758719C0DF347D76C0CD5A40232F6B62818719C0
1180	12	E.3.2	0103000020E61000000100000005000000C553A123C0CD5A40805BE38D848719C0AC72C5D0BFCD5A40DD875BB9878719C07CCE375ABFCD5A408CF2083E7C8719C0FF29EFACBFCD5A4079996C11798719C0C553A123C0CD5A40805BE38D848719C0
1181	12	E.3.3	0103000020E61000000100000005000000AC72C5D0BFCD5A40DD875BB9878719C09291E97DBFCD5A403AB4D3E48A8719C0F9728007BFCD5A409E4BA56A7F8719C07CCE375ABFCD5A408CF2083E7C8719C0AC72C5D0BFCD5A40DD875BB9878719C0
1182	12	E.3.4	0103000020E610000001000000050000009291E97DBFCD5A403AB4D3E48A8719C078B00D2BBFCD5A4098E04B108E8719C07617C9B4BECD5A40B1A44197828719C0F9728007BFCD5A409E4BA56A7F8719C09291E97DBFCD5A403AB4D3E48A8719C0
1183	12	E.3.5	0103000020E6100000010000000500000078B00D2BBFCD5A4098E04B108E8719C05ECF31D8BECD5A40F50CC43B918719C0F3BB1162BECD5A40C4FDDDC3858719C07617C9B4BECD5A40B1A44197828719C078B00D2BBFCD5A4098E04B108E8719C0
1184	12	E.3.6	0103000020E610000001000000050000005ECF31D8BECD5A40F50CC43B918719C045EE5585BECD5A4052393C67948719C070605A0FBECD5A40D7567AF0888719C0F3BB1162BECD5A40C4FDDDC3858719C05ECF31D8BECD5A40F50CC43B918719C0
1185	12	E.3.7	0103000020E6100000010000000500000045EE5585BECD5A4052393C67948719C02B0D7A32BECD5A40AF65B492978719C0ED04A3BCBDCD5A40E9AF161D8C8719C070605A0FBECD5A40D7567AF0888719C045EE5585BECD5A4052393C67948719C0
1186	12	E.3.8	0103000020E610000001000000050000002B0D7A32BECD5A40AF65B492978719C0112C9EDFBDCD5A400C922CBE9A8719C06AA9EB69BDCD5A40FC08B3498F8719C0ED04A3BCBDCD5A40E9AF161D8C8719C02B0D7A32BECD5A40AF65B492978719C0
1187	12	E.3.9	0103000020E61000000100000005000000112C9EDFBDCD5A400C922CBE9A8719C0F84AC28CBDCD5A4069BEA4E99D8719C0E74D3417BDCD5A400F624F76928719C06AA9EB69BDCD5A40FC08B3498F8719C0112C9EDFBDCD5A400C922CBE9A8719C0
1188	12	E.3.10	0103000020E61000000100000005000000F84AC28CBDCD5A4069BEA4E99D8719C0DE69E639BDCD5A40C6EA1C15A18719C064F27CC4BCCD5A4022BBEBA2958719C0E74D3417BDCD5A400F624F76928719C0F84AC28CBDCD5A4069BEA4E99D8719C0
1189	12	E.3.11	0103000020E61000000100000005000000DE69E639BDCD5A40C6EA1C15A18719C0C4880AE7BCCD5A4024179540A48719C0E196C571BCCD5A40341488CF988719C064F27CC4BCCD5A4022BBEBA2958719C0DE69E639BDCD5A40C6EA1C15A18719C0
1190	12	E.3.12	0103000020E61000000100000005000000C4880AE7BCCD5A4024179540A48719C0AAA72E94BCCD5A4081430D6CA78719C05E3B0E1FBCCD5A40476D24FC9B8719C0E196C571BCCD5A40341488CF988719C0C4880AE7BCCD5A4024179540A48719C0
1191	12	E.3.13	0103000020E61000000100000005000000AAA72E94BCCD5A4081430D6CA78719C091C65241BCCD5A40DE6F8597AA8719C0DBDF56CCBBCD5A405AC6C0289F8719C05E3B0E1FBCCD5A40476D24FC9B8719C0AAA72E94BCCD5A4081430D6CA78719C0
1192	12	E.3.14	0103000020E6100000010000000500000091C65241BCCD5A40DE6F8597AA8719C077E576EEBBCD5A403B9CFDC2AD8719C058849F79BBCD5A406D1F5D55A28719C0DBDF56CCBBCD5A405AC6C0289F8719C091C65241BCCD5A40DE6F8597AA8719C0
1193	12	E.3.15	0103000020E6100000010000000500000077E576EEBBCD5A403B9CFDC2AD8719C05D049B9BBBCD5A4098C875EEB08719C0D528E826BBCD5A407F78F981A58719C058849F79BBCD5A406D1F5D55A28719C077E576EEBBCD5A403B9CFDC2AD8719C0
1194	12	E.3.16	0103000020E610000001000000050000005D049B9BBBCD5A4098C875EEB08719C04423BF48BBCD5A40F5F4ED19B48719C052CD30D4BACD5A4092D195AEA88719C0D528E826BBCD5A407F78F981A58719C05D049B9BBBCD5A4098C875EEB08719C0
1195	12	E.3.17	0103000020E610000001000000050000004423BF48BBCD5A40F5F4ED19B48719C02A42E3F5BACD5A4052216645B78719C0CF717981BACD5A40A52A32DBAB8719C052CD30D4BACD5A4092D195AEA88719C04423BF48BBCD5A40F5F4ED19B48719C0
371	3	S0.1.13	0103000020E61000000100000005000000490C15F6C7CD5A40DF57D277A48719C068F18532C8CD5A40DB2ECB63AA8719C0F963F127C7CD5A405F44FE02B58719C0B3F664EBC6CD5A40B2632310AF8719C0490C15F6C7CD5A40DF57D277A48719C0
372	3	S0.1.12	0103000020E6100000010000000500000068F18532C8CD5A40DB2ECB63AA8719C086D6F66EC8CD5A40D605C44FB08719C03FD17D64C7CD5A400C25D9F5BA8719C0F963F127C7CD5A405F44FE02B58719C068F18532C8CD5A40DB2ECB63AA8719C0
373	3	S0.1.11	0103000020E6100000010000000500000086D6F66EC8CD5A40D605C44FB08719C0A5BB67ABC8CD5A40D1DCBC3BB68719C0843E0AA1C7CD5A40B905B4E8C08719C03FD17D64C7CD5A400C25D9F5BA8719C086D6F66EC8CD5A40D605C44FB08719C0
374	3	S0.1.10	0103000020E61000000100000005000000A5BB67ABC8CD5A40D1DCBC3BB68719C0C4A0D8E7C8CD5A40CCB3B527BC8719C0CAAB96DDC7CD5A4066E68EDBC68719C0843E0AA1C7CD5A40B905B4E8C08719C0A5BB67ABC8CD5A40D1DCBC3BB68719C0
375	3	S0.1.9	0103000020E61000000100000005000000C4A0D8E7C8CD5A40CCB3B527BC8719C0E3854924C9CD5A40C88AAE13C28719C01019231AC8CD5A4012C769CECC8719C0CAAB96DDC7CD5A4066E68EDBC68719C0C4A0D8E7C8CD5A40CCB3B527BC8719C0
376	3	S0.1.8	0103000020E61000000100000005000000E3854924C9CD5A40C88AAE13C28719C0026BBA60C9CD5A40C361A7FFC78719C05586AF56C8CD5A40BFA744C1D28719C01019231AC8CD5A4012C769CECC8719C0E3854924C9CD5A40C88AAE13C28719C0
377	3	S0.1.7	0103000020E61000000100000005000000026BBA60C9CD5A40C361A7FFC78719C021502B9DC9CD5A40BE38A0EBCD8719C09BF33B93C8CD5A406C881FB4D88719C05586AF56C8CD5A40BFA744C1D28719C0026BBA60C9CD5A40C361A7FFC78719C0
378	3	S0.1.6	0103000020E6100000010000000500000021502B9DC9CD5A40BE38A0EBCD8719C040359CD9C9CD5A40BA0F99D7D38719C0E160C8CFC8CD5A401969FAA6DE8719C09BF33B93C8CD5A406C881FB4D88719C021502B9DC9CD5A40BE38A0EBCD8719C0
379	3	S0.1.5	0103000020E6100000010000000500000040359CD9C9CD5A40BA0F99D7D38719C05F1A0D16CACD5A40B5E691C3D98719C026CE540CC9CD5A40C649D599E48719C0E160C8CFC8CD5A401969FAA6DE8719C040359CD9C9CD5A40BA0F99D7D38719C0
380	3	S0.1.4	0103000020E610000001000000050000005F1A0D16CACD5A40B5E691C3D98719C07DFF7D52CACD5A40B0BD8AAFDF8719C06C3BE148C9CD5A40732AB08CEA8719C026CE540CC9CD5A40C649D599E48719C05F1A0D16CACD5A40B5E691C3D98719C0
381	3	S0.1.3	0103000020E610000001000000050000007DFF7D52CACD5A40B0BD8AAFDF8719C09CE4EE8ECACD5A40AB94839BE58719C0B2A86D85C9CD5A401F0B8B7FF08719C06C3BE148C9CD5A40732AB08CEA8719C07DFF7D52CACD5A40B0BD8AAFDF8719C0
382	3	S0.1.2	0103000020E610000001000000050000009CE4EE8ECACD5A40AB94839BE58719C0BBC95FCBCACD5A40A76B7C87EB8719C0F715FAC1C9CD5A40CCEB6572F68719C0B2A86D85C9CD5A401F0B8B7FF08719C09CE4EE8ECACD5A40AB94839BE58719C0
383	3	S0.1.1	0103000020E61000000100000005000000BBC95FCBCACD5A40A76B7C87EB8719C0DAAED007CBCD5A40A2427573F18719C03D8386FEC9CD5A4079CC4065FC8719C0F715FAC1C9CD5A40CCEB6572F68719C0BBC95FCBCACD5A40A76B7C87EB8719C0
384	3	S0.2.39	0103000020E61000000100000005000000A0DD21C5C0CD5A402592E865148719C0E64AAE01C1CD5A40D272C3581A8719C087E94DF4BFCD5A404E8C0145248719C01BF4A5B7BFCD5A40F0A1444B1E8719C0A0DD21C5C0CD5A402592E865148719C0
385	3	S0.2.38	0103000020E61000000100000005000000E64AAE01C1CD5A40D272C3581A8719C02BB83A3EC1CD5A407F539E4B208719C0F4DEF530C0CD5A40AD76BE3E2A8719C087E94DF4BFCD5A404E8C0145248719C0E64AAE01C1CD5A40D272C3581A8719C0
386	3	S0.2.37	0103000020E610000001000000050000002BB83A3EC1CD5A407F539E4B208719C07125C77AC1CD5A402B34793E268719C060D49D6DC0CD5A400B617B38308719C0F4DEF530C0CD5A40AD76BE3E2A8719C02BB83A3EC1CD5A407F539E4B208719C0
387	3	S0.2.36	0103000020E610000001000000050000007125C77AC1CD5A402B34793E268719C0B79253B7C1CD5A40D81454312C8719C0CDC945AAC0CD5A40694B3832368719C060D49D6DC0CD5A400B617B38308719C07125C77AC1CD5A402B34793E268719C0
388	3	S0.2.35	0103000020E61000000100000005000000B79253B7C1CD5A40D81454312C8719C0FCFFDFF3C1CD5A4085F52E24328719C039BFEDE6C0CD5A40C835F52B3C8719C0CDC945AAC0CD5A40694B3832368719C0B79253B7C1CD5A40D81454312C8719C0
389	3	S0.2.34	0103000020E61000000100000005000000FCFFDFF3C1CD5A4085F52E24328719C0426D6C30C2CD5A4032D60917388719C0A6B49523C1CD5A402620B225428719C039BFEDE6C0CD5A40C835F52B3C8719C0FCFFDFF3C1CD5A4085F52E24328719C0
390	3	S0.2.33	0103000020E61000000100000005000000426D6C30C2CD5A4032D60917388719C088DAF86CC2CD5A40DFB6E4093E8719C012AA3D60C1CD5A40850A6F1F488719C0A6B49523C1CD5A402620B225428719C0426D6C30C2CD5A4032D60917388719C0
391	3	S0.2.32	0103000020E6100000010000000500000088DAF86CC2CD5A40DFB6E4093E8719C0CD4785A9C2CD5A408C97BFFC438719C07E9FE59CC1CD5A40E3F42B194E8719C012AA3D60C1CD5A40850A6F1F488719C088DAF86CC2CD5A40DFB6E4093E8719C0
392	3	S0.2.31	0103000020E61000000100000005000000CD4785A9C2CD5A408C97BFFC438719C013B511E6C2CD5A4038789AEF498719C0EB948DD9C1CD5A4041DFE812548719C07E9FE59CC1CD5A40E3F42B194E8719C0CD4785A9C2CD5A408C97BFFC438719C0
393	3	S0.2.30	0103000020E6100000010000000500000013B511E6C2CD5A4038789AEF498719C059229E22C3CD5A40E55875E24F8719C0578A3516C2CD5A40A0C9A50C5A8719C0EB948DD9C1CD5A4041DFE812548719C013B511E6C2CD5A4038789AEF498719C0
394	3	S0.2.29	0103000020E6100000010000000500000059229E22C3CD5A40E55875E24F8719C09E8F2A5FC3CD5A40923950D5558719C0C47FDD52C2CD5A40FEB36206608719C0578A3516C2CD5A40A0C9A50C5A8719C059229E22C3CD5A40E55875E24F8719C0
395	3	S0.2.28	0103000020E610000001000000050000009E8F2A5FC3CD5A40923950D5558719C0E4FCB69BC3CD5A403F1A2BC85B8719C03075858FC2CD5A405C9E1F00668719C0C47FDD52C2CD5A40FEB36206608719C09E8F2A5FC3CD5A40923950D5558719C0
396	3	S0.2.27	0103000020E61000000100000005000000E4FCB69BC3CD5A403F1A2BC85B8719C02A6A43D8C3CD5A40ECFA05BB618719C09D6A2DCCC2CD5A40BB88DCF96B8719C03075858FC2CD5A405C9E1F00668719C0E4FCB69BC3CD5A403F1A2BC85B8719C0
397	3	S0.2.26	0103000020E610000001000000050000002A6A43D8C3CD5A40ECFA05BB618719C06FD7CF14C4CD5A4098DBE0AD678719C00960D508C3CD5A40197399F3718719C09D6A2DCCC2CD5A40BB88DCF96B8719C02A6A43D8C3CD5A40ECFA05BB618719C0
398	3	S0.2.25	0103000020E610000001000000050000006FD7CF14C4CD5A4098DBE0AD678719C0B5445C51C4CD5A4045BCBBA06D8719C076557D45C3CD5A40775D56ED778719C00960D508C3CD5A40197399F3718719C06FD7CF14C4CD5A4098DBE0AD678719C0
399	3	S0.2.24	0103000020E61000000100000005000000B5445C51C4CD5A4045BCBBA06D8719C0FBB1E88DC4CD5A40F29C9693738719C0E24A2582C3CD5A40D64713E77D8719C076557D45C3CD5A40775D56ED778719C0B5445C51C4CD5A4045BCBBA06D8719C0
400	3	S0.2.23	0103000020E61000000100000005000000FBB1E88DC4CD5A40F29C9693738719C0401F75CAC4CD5A409F7D7186798719C04E40CDBEC3CD5A403432D0E0838719C0E24A2582C3CD5A40D64713E77D8719C0FBB1E88DC4CD5A40F29C9693738719C0
401	3	S0.2.22	0103000020E61000000100000005000000401F75CAC4CD5A409F7D7186798719C0868C0107C5CD5A404C5E4C797F8719C0BB3575FBC3CD5A40921C8DDA898719C04E40CDBEC3CD5A403432D0E0838719C0401F75CAC4CD5A409F7D7186798719C0
402	3	S0.2.21	0103000020E61000000100000005000000868C0107C5CD5A404C5E4C797F8719C0CCF98D43C5CD5A40F93E276C858719C0272B1D38C4CD5A40F1064AD48F8719C0BB3575FBC3CD5A40921C8DDA898719C0868C0107C5CD5A404C5E4C797F8719C0
403	3	S0.2.20	0103000020E61000000100000005000000CCF98D43C5CD5A40F93E276C858719C011671A80C5CD5A40A51F025F8B8719C09420C574C4CD5A404FF106CE958719C0272B1D38C4CD5A40F1064AD48F8719C0CCF98D43C5CD5A40F93E276C858719C0
404	3	S0.2.19	0103000020E6100000010000000500000011671A80C5CD5A40A51F025F8B8719C057D4A6BCC5CD5A405200DD51918719C000166DB1C4CD5A40AEDBC3C79B8719C09420C574C4CD5A404FF106CE958719C011671A80C5CD5A40A51F025F8B8719C0
405	3	S0.2.18	0103000020E6100000010000000500000057D4A6BCC5CD5A405200DD51918719C09D4133F9C5CD5A40FFE0B744978719C06D0B15EEC4CD5A400CC680C1A18719C000166DB1C4CD5A40AEDBC3C79B8719C057D4A6BCC5CD5A405200DD51918719C0
406	3	S0.2.17	0103000020E610000001000000050000009D4133F9C5CD5A40FFE0B744978719C0E2AEBF35C6CD5A40ACC192379D8719C0D900BD2AC5CD5A406AB03DBBA78719C06D0B15EEC4CD5A400CC680C1A18719C09D4133F9C5CD5A40FFE0B744978719C0
407	3	S0.2.16	0103000020E61000000100000005000000E2AEBF35C6CD5A40ACC192379D8719C0281C4C72C6CD5A4059A26D2AA38719C045F66467C5CD5A40C99AFAB4AD8719C0D900BD2AC5CD5A406AB03DBBA78719C0E2AEBF35C6CD5A40ACC192379D8719C0
408	3	S0.2.15	0103000020E61000000100000005000000281C4C72C6CD5A4059A26D2AA38719C06E89D8AEC6CD5A400683481DA98719C0B2EB0CA4C5CD5A402785B7AEB38719C045F66467C5CD5A40C99AFAB4AD8719C0281C4C72C6CD5A4059A26D2AA38719C0
409	3	S0.2.14	0103000020E610000001000000050000006E89D8AEC6CD5A400683481DA98719C0B3F664EBC6CD5A40B2632310AF8719C01EE1B4E0C5CD5A40856F74A8B98719C0B2EB0CA4C5CD5A402785B7AEB38719C06E89D8AEC6CD5A400683481DA98719C0
410	3	S0.2.13	0103000020E61000000100000005000000B3F664EBC6CD5A40B2632310AF8719C0F963F127C7CD5A405F44FE02B58719C08BD65C1DC6CD5A40E45931A2BF8719C01EE1B4E0C5CD5A40856F74A8B98719C0B3F664EBC6CD5A40B2632310AF8719C0
411	3	S0.2.12	0103000020E61000000100000005000000F963F127C7CD5A405F44FE02B58719C03FD17D64C7CD5A400C25D9F5BA8719C0F7CB045AC6CD5A404244EE9BC58719C08BD65C1DC6CD5A40E45931A2BF8719C0F963F127C7CD5A405F44FE02B58719C0
412	3	S0.2.11	0103000020E610000001000000050000003FD17D64C7CD5A400C25D9F5BA8719C0843E0AA1C7CD5A40B905B4E8C08719C064C1AC96C6CD5A40A02EAB95CB8719C0F7CB045AC6CD5A404244EE9BC58719C03FD17D64C7CD5A400C25D9F5BA8719C0
413	3	S0.2.10	0103000020E61000000100000005000000843E0AA1C7CD5A40B905B4E8C08719C0CAAB96DDC7CD5A4066E68EDBC68719C0D0B654D3C6CD5A40FF18688FD18719C064C1AC96C6CD5A40A02EAB95CB8719C0843E0AA1C7CD5A40B905B4E8C08719C0
414	3	S0.2.9	0103000020E61000000100000005000000CAAB96DDC7CD5A4066E68EDBC68719C01019231AC8CD5A4012C769CECC8719C03DACFC0FC7CD5A405D032589D78719C0D0B654D3C6CD5A40FF18688FD18719C0CAAB96DDC7CD5A4066E68EDBC68719C0
415	3	S0.2.8	0103000020E610000001000000050000001019231AC8CD5A4012C769CECC8719C05586AF56C8CD5A40BFA744C1D28719C0A9A1A44CC7CD5A40BBEDE182DD8719C03DACFC0FC7CD5A405D032589D78719C01019231AC8CD5A4012C769CECC8719C0
416	3	S0.2.7	0103000020E610000001000000050000005586AF56C8CD5A40BFA744C1D28719C09BF33B93C8CD5A406C881FB4D88719C015974C89C7CD5A401AD89E7CE38719C0A9A1A44CC7CD5A40BBEDE182DD8719C05586AF56C8CD5A40BFA744C1D28719C0
417	3	S0.2.6	0103000020E610000001000000050000009BF33B93C8CD5A406C881FB4D88719C0E160C8CFC8CD5A401969FAA6DE8719C0828CF4C5C7CD5A4078C25B76E98719C015974C89C7CD5A401AD89E7CE38719C09BF33B93C8CD5A406C881FB4D88719C0
418	3	S0.2.5	0103000020E61000000100000005000000E160C8CFC8CD5A401969FAA6DE8719C026CE540CC9CD5A40C649D599E48719C0EE819C02C8CD5A40D7AC1870EF8719C0828CF4C5C7CD5A4078C25B76E98719C0E160C8CFC8CD5A401969FAA6DE8719C0
419	3	S0.2.4	0103000020E6100000010000000500000026CE540CC9CD5A40C649D599E48719C06C3BE148C9CD5A40732AB08CEA8719C05B77443FC8CD5A403597D569F58719C0EE819C02C8CD5A40D7AC1870EF8719C026CE540CC9CD5A40C649D599E48719C0
420	3	S0.2.3	0103000020E610000001000000050000006C3BE148C9CD5A40732AB08CEA8719C0B2A86D85C9CD5A401F0B8B7FF08719C0C76CEC7BC8CD5A4093819263FB8719C05B77443FC8CD5A403597D569F58719C06C3BE148C9CD5A40732AB08CEA8719C0
421	3	S0.2.2	0103000020E61000000100000005000000B2A86D85C9CD5A401F0B8B7FF08719C0F715FAC1C9CD5A40CCEB6572F68719C0346294B8C8CD5A40F26B4F5D018819C0C76CEC7BC8CD5A4093819263FB8719C0B2A86D85C9CD5A401F0B8B7FF08719C0
422	3	S0.2.1	0103000020E61000000100000005000000F715FAC1C9CD5A40CCEB6572F68719C03D8386FEC9CD5A4079CC4065FC8719C0A0573CF5C8CD5A4050560C57078819C0346294B8C8CD5A40F26B4F5D018819C0F715FAC1C9CD5A40CCEB6572F68719C0
423	3	S0.3.39	0103000020E610000001000000050000001BF4A5B7BFCD5A40F0A1444B1E8719C087E94DF4BFCD5A404E8C0145248719C02988EDE6BECD5A40CCA53F312E8719C0960A2AAABECD5A40BCB1A030288719C01BF4A5B7BFCD5A40F0A1444B1E8719C0
424	3	S0.3.38	0103000020E6100000010000000500000087E94DF4BFCD5A404E8C0145248719C0F4DEF530C0CD5A40AD76BE3E2A8719C0BC05B123BFCD5A40DC99DE31348719C02988EDE6BECD5A40CCA53F312E8719C087E94DF4BFCD5A404E8C0145248719C0
425	3	S0.3.37	0103000020E61000000100000005000000F4DEF530C0CD5A40AD76BE3E2A8719C060D49D6DC0CD5A400B617B38308719C050837460BFCD5A40EC8D7D323A8719C0BC05B123BFCD5A40DC99DE31348719C0F4DEF530C0CD5A40AD76BE3E2A8719C0
426	3	S0.3.36	0103000020E6100000010000000500000060D49D6DC0CD5A400B617B38308719C0CDC945AAC0CD5A40694B3832368719C0E300389DBFCD5A40FB811C33408719C050837460BFCD5A40EC8D7D323A8719C060D49D6DC0CD5A400B617B38308719C0
427	3	S0.3.35	0103000020E61000000100000005000000CDC945AAC0CD5A40694B3832368719C039BFEDE6C0CD5A40C835F52B3C8719C0767EFBD9BFCD5A400B76BB33468719C0E300389DBFCD5A40FB811C33408719C0CDC945AAC0CD5A40694B3832368719C0
428	3	S0.3.34	0103000020E6100000010000000500000039BFEDE6C0CD5A40C835F52B3C8719C0A6B49523C1CD5A402620B225428719C009FCBE16C0CD5A401B6A5A344C8719C0767EFBD9BFCD5A400B76BB33468719C039BFEDE6C0CD5A40C835F52B3C8719C0
429	3	S0.3.33	0103000020E61000000100000005000000A6B49523C1CD5A402620B225428719C012AA3D60C1CD5A40850A6F1F488719C09C798253C0CD5A402B5EF934528719C009FCBE16C0CD5A401B6A5A344C8719C0A6B49523C1CD5A402620B225428719C0
430	3	S0.3.32	0103000020E6100000010000000500000012AA3D60C1CD5A40850A6F1F488719C07E9FE59CC1CD5A40E3F42B194E8719C02FF74590C0CD5A403B529835588719C09C798253C0CD5A402B5EF934528719C012AA3D60C1CD5A40850A6F1F488719C0
431	3	S0.3.31	0103000020E610000001000000050000007E9FE59CC1CD5A40E3F42B194E8719C0EB948DD9C1CD5A4041DFE812548719C0C37409CDC0CD5A404B4637365E8719C02FF74590C0CD5A403B529835588719C07E9FE59CC1CD5A40E3F42B194E8719C0
432	3	S0.3.30	0103000020E61000000100000005000000EB948DD9C1CD5A4041DFE812548719C0578A3516C2CD5A40A0C9A50C5A8719C056F2CC09C1CD5A405A3AD636648719C0C37409CDC0CD5A404B4637365E8719C0EB948DD9C1CD5A4041DFE812548719C0
433	3	S0.3.29	0103000020E61000000100000005000000578A3516C2CD5A40A0C9A50C5A8719C0C47FDD52C2CD5A40FEB36206608719C0E96F9046C1CD5A406A2E75376A8719C056F2CC09C1CD5A405A3AD636648719C0578A3516C2CD5A40A0C9A50C5A8719C0
434	3	S0.3.28	0103000020E61000000100000005000000C47FDD52C2CD5A40FEB36206608719C03075858FC2CD5A405C9E1F00668719C07CED5383C1CD5A407A221438708719C0E96F9046C1CD5A406A2E75376A8719C0C47FDD52C2CD5A40FEB36206608719C0
435	3	S0.3.27	0103000020E610000001000000050000003075858FC2CD5A405C9E1F00668719C09D6A2DCCC2CD5A40BB88DCF96B8719C00F6B17C0C1CD5A408A16B338768719C07CED5383C1CD5A407A221438708719C03075858FC2CD5A405C9E1F00668719C0
436	3	S0.3.26	0103000020E610000001000000050000009D6A2DCCC2CD5A40BB88DCF96B8719C00960D508C3CD5A40197399F3718719C0A3E8DAFCC1CD5A409A0A52397C8719C00F6B17C0C1CD5A408A16B338768719C09D6A2DCCC2CD5A40BB88DCF96B8719C0
437	3	S0.3.25	0103000020E610000001000000050000000960D508C3CD5A40197399F3718719C076557D45C3CD5A40775D56ED778719C036669E39C2CD5A40AAFEF039828719C0A3E8DAFCC1CD5A409A0A52397C8719C00960D508C3CD5A40197399F3718719C0
438	3	S0.3.24	0103000020E6100000010000000500000076557D45C3CD5A40775D56ED778719C0E24A2582C3CD5A40D64713E77D8719C0C9E36176C2CD5A40BAF28F3A888719C036669E39C2CD5A40AAFEF039828719C076557D45C3CD5A40775D56ED778719C0
439	3	S0.3.23	0103000020E61000000100000005000000E24A2582C3CD5A40D64713E77D8719C04E40CDBEC3CD5A403432D0E0838719C05C6125B3C2CD5A40C9E62E3B8E8719C0C9E36176C2CD5A40BAF28F3A888719C0E24A2582C3CD5A40D64713E77D8719C0
440	3	S0.3.22	0103000020E610000001000000050000004E40CDBEC3CD5A403432D0E0838719C0BB3575FBC3CD5A40921C8DDA898719C0EFDEE8EFC2CD5A40D9DACD3B948719C05C6125B3C2CD5A40C9E62E3B8E8719C04E40CDBEC3CD5A403432D0E0838719C0
441	3	S0.3.21	0103000020E61000000100000005000000BB3575FBC3CD5A40921C8DDA898719C0272B1D38C4CD5A40F1064AD48F8719C0825CAC2CC3CD5A40E9CE6C3C9A8719C0EFDEE8EFC2CD5A40D9DACD3B948719C0BB3575FBC3CD5A40921C8DDA898719C0
442	3	S0.3.20	0103000020E61000000100000005000000272B1D38C4CD5A40F1064AD48F8719C09420C574C4CD5A404FF106CE958719C016DA6F69C3CD5A40F9C20B3DA08719C0825CAC2CC3CD5A40E9CE6C3C9A8719C0272B1D38C4CD5A40F1064AD48F8719C0
443	3	S0.3.19	0103000020E610000001000000050000009420C574C4CD5A404FF106CE958719C000166DB1C4CD5A40AEDBC3C79B8719C0A95733A6C3CD5A4009B7AA3DA68719C016DA6F69C3CD5A40F9C20B3DA08719C09420C574C4CD5A404FF106CE958719C0
444	3	S0.3.18	0103000020E6100000010000000500000000166DB1C4CD5A40AEDBC3C79B8719C06D0B15EEC4CD5A400CC680C1A18719C03CD5F6E2C3CD5A4019AB493EAC8719C0A95733A6C3CD5A4009B7AA3DA68719C000166DB1C4CD5A40AEDBC3C79B8719C0
445	3	S0.3.17	0103000020E610000001000000050000006D0B15EEC4CD5A400CC680C1A18719C0D900BD2AC5CD5A406AB03DBBA78719C0CF52BA1FC4CD5A40289FE83EB28719C03CD5F6E2C3CD5A4019AB493EAC8719C06D0B15EEC4CD5A400CC680C1A18719C0
446	3	S0.3.16	0103000020E61000000100000005000000D900BD2AC5CD5A406AB03DBBA78719C045F66467C5CD5A40C99AFAB4AD8719C062D07D5CC4CD5A403893873FB88719C0CF52BA1FC4CD5A40289FE83EB28719C0D900BD2AC5CD5A406AB03DBBA78719C0
447	3	S0.3.15	0103000020E6100000010000000500000045F66467C5CD5A40C99AFAB4AD8719C0B2EB0CA4C5CD5A402785B7AEB38719C0F54D4199C4CD5A4048872640BE8719C062D07D5CC4CD5A403893873FB88719C045F66467C5CD5A40C99AFAB4AD8719C0
448	3	S0.3.14	0103000020E61000000100000005000000B2EB0CA4C5CD5A402785B7AEB38719C01EE1B4E0C5CD5A40856F74A8B98719C089CB04D6C4CD5A40587BC540C48719C0F54D4199C4CD5A4048872640BE8719C0B2EB0CA4C5CD5A402785B7AEB38719C0
449	3	S0.3.13	0103000020E610000001000000050000001EE1B4E0C5CD5A40856F74A8B98719C08BD65C1DC6CD5A40E45931A2BF8719C01C49C812C5CD5A40686F6441CA8719C089CB04D6C4CD5A40587BC540C48719C01EE1B4E0C5CD5A40856F74A8B98719C0
450	3	S0.3.12	0103000020E610000001000000050000008BD65C1DC6CD5A40E45931A2BF8719C0F7CB045AC6CD5A404244EE9BC58719C0AFC68B4FC5CD5A4078630342D08719C01C49C812C5CD5A40686F6441CA8719C08BD65C1DC6CD5A40E45931A2BF8719C0
451	3	S0.3.11	0103000020E61000000100000005000000F7CB045AC6CD5A404244EE9BC58719C064C1AC96C6CD5A40A02EAB95CB8719C042444F8CC5CD5A408857A242D68719C0AFC68B4FC5CD5A4078630342D08719C0F7CB045AC6CD5A404244EE9BC58719C0
452	3	S0.3.10	0103000020E6100000010000000500000064C1AC96C6CD5A40A02EAB95CB8719C0D0B654D3C6CD5A40FF18688FD18719C0D5C112C9C5CD5A40974B4143DC8719C042444F8CC5CD5A408857A242D68719C064C1AC96C6CD5A40A02EAB95CB8719C0
453	3	S0.3.9	0103000020E61000000100000005000000D0B654D3C6CD5A40FF18688FD18719C03DACFC0FC7CD5A405D032589D78719C0693FD605C6CD5A40A73FE043E28719C0D5C112C9C5CD5A40974B4143DC8719C0D0B654D3C6CD5A40FF18688FD18719C0
454	3	S0.3.8	0103000020E610000001000000050000003DACFC0FC7CD5A405D032589D78719C0A9A1A44CC7CD5A40BBEDE182DD8719C0FCBC9942C6CD5A40B7337F44E88719C0693FD605C6CD5A40A73FE043E28719C03DACFC0FC7CD5A405D032589D78719C0
455	3	S0.3.7	0103000020E61000000100000005000000A9A1A44CC7CD5A40BBEDE182DD8719C015974C89C7CD5A401AD89E7CE38719C08F3A5D7FC6CD5A40C7271E45EE8719C0FCBC9942C6CD5A40B7337F44E88719C0A9A1A44CC7CD5A40BBEDE182DD8719C0
456	3	S0.3.6	0103000020E6100000010000000500000015974C89C7CD5A401AD89E7CE38719C0828CF4C5C7CD5A4078C25B76E98719C022B820BCC6CD5A40D71BBD45F48719C08F3A5D7FC6CD5A40C7271E45EE8719C015974C89C7CD5A401AD89E7CE38719C0
457	3	S0.3.5	0103000020E61000000100000005000000828CF4C5C7CD5A4078C25B76E98719C0EE819C02C8CD5A40D7AC1870EF8719C0B535E4F8C6CD5A40E70F5C46FA8719C022B820BCC6CD5A40D71BBD45F48719C0828CF4C5C7CD5A4078C25B76E98719C0
458	3	S0.3.4	0103000020E61000000100000005000000EE819C02C8CD5A40D7AC1870EF8719C05B77443FC8CD5A403597D569F58719C048B3A735C7CD5A40F603FB46008819C0B535E4F8C6CD5A40E70F5C46FA8719C0EE819C02C8CD5A40D7AC1870EF8719C0
459	3	S0.3.3	0103000020E610000001000000050000005B77443FC8CD5A403597D569F58719C0C76CEC7BC8CD5A4093819263FB8719C0DC306B72C7CD5A4006F89947068819C048B3A735C7CD5A40F603FB46008819C05B77443FC8CD5A403597D569F58719C0
460	3	S0.3.2	0103000020E61000000100000005000000C76CEC7BC8CD5A4093819263FB8719C0346294B8C8CD5A40F26B4F5D018819C06FAE2EAFC7CD5A4016EC38480C8819C0DC306B72C7CD5A4006F89947068819C0C76CEC7BC8CD5A4093819263FB8719C0
461	3	S0.3.1	0103000020E61000000100000005000000346294B8C8CD5A40F26B4F5D018819C0A0573CF5C8CD5A4050560C57078819C0022CF2EBC7CD5A4026E0D748128819C06FAE2EAFC7CD5A4016EC38480C8819C0346294B8C8CD5A40F26B4F5D018819C0
462	3	S0.4.39	0103000020E61000000100000005000000960A2AAABECD5A40BCB1A030288719C02988EDE6BECD5A40CCA53F312E8719C0CA268DD9BDCD5A4048BF7D1D388719C01021AE9CBDCD5A4087C1FC15328719C0960A2AAABECD5A40BCB1A030288719C0
463	3	S0.4.38	0103000020E610000001000000050000002988EDE6BECD5A40CCA53F312E8719C0BC05B123BFCD5A40DC99DE31348719C0842C6C16BECD5A400ABDFE243E8719C0CA268DD9BDCD5A4048BF7D1D388719C02988EDE6BECD5A40CCA53F312E8719C0
464	3	S0.4.37	0103000020E61000000100000005000000BC05B123BFCD5A40DC99DE31348719C050837460BFCD5A40EC8D7D323A8719C03E324B53BECD5A40CBBA7F2C448719C0842C6C16BECD5A400ABDFE243E8719C0BC05B123BFCD5A40DC99DE31348719C0
465	3	S0.4.36	0103000020E6100000010000000500000050837460BFCD5A40EC8D7D323A8719C0E300389DBFCD5A40FB811C33408719C0F8372A90BECD5A408DB800344A8719C03E324B53BECD5A40CBBA7F2C448719C050837460BFCD5A40EC8D7D323A8719C0
466	3	S0.4.35	0103000020E61000000100000005000000E300389DBFCD5A40FB811C33408719C0767EFBD9BFCD5A400B76BB33468719C0B23D09CDBECD5A404EB6813B508719C0F8372A90BECD5A408DB800344A8719C0E300389DBFCD5A40FB811C33408719C0
467	3	S0.4.34	0103000020E61000000100000005000000767EFBD9BFCD5A400B76BB33468719C009FCBE16C0CD5A401B6A5A344C8719C06C43E809BFCD5A400FB40243568719C0B23D09CDBECD5A404EB6813B508719C0767EFBD9BFCD5A400B76BB33468719C0
468	3	S0.4.33	0103000020E6100000010000000500000009FCBE16C0CD5A401B6A5A344C8719C09C798253C0CD5A402B5EF934528719C02649C746BFCD5A40D1B1834A5C8719C06C43E809BFCD5A400FB40243568719C009FCBE16C0CD5A401B6A5A344C8719C0
469	3	S0.4.32	0103000020E610000001000000050000009C798253C0CD5A402B5EF934528719C02FF74590C0CD5A403B529835588719C0E04EA683BFCD5A4092AF0452628719C02649C746BFCD5A40D1B1834A5C8719C09C798253C0CD5A402B5EF934528719C0
470	3	S0.4.31	0103000020E610000001000000050000002FF74590C0CD5A403B529835588719C0C37409CDC0CD5A404B4637365E8719C09A5485C0BFCD5A4053AD8559688719C0E04EA683BFCD5A4092AF0452628719C02FF74590C0CD5A403B529835588719C0
471	3	S0.4.30	0103000020E61000000100000005000000C37409CDC0CD5A404B4637365E8719C056F2CC09C1CD5A405A3AD636648719C0545A64FDBFCD5A4015AB06616E8719C09A5485C0BFCD5A4053AD8559688719C0C37409CDC0CD5A404B4637365E8719C0
472	3	S0.4.29	0103000020E6100000010000000500000056F2CC09C1CD5A405A3AD636648719C0E96F9046C1CD5A406A2E75376A8719C00E60433AC0CD5A40D6A88768748719C0545A64FDBFCD5A4015AB06616E8719C056F2CC09C1CD5A405A3AD636648719C0
473	3	S0.4.28	0103000020E61000000100000005000000E96F9046C1CD5A406A2E75376A8719C07CED5383C1CD5A407A221438708719C0C8652277C0CD5A4098A608707A8719C00E60433AC0CD5A40D6A88768748719C0E96F9046C1CD5A406A2E75376A8719C0
474	3	S0.4.27	0103000020E610000001000000050000007CED5383C1CD5A407A221438708719C00F6B17C0C1CD5A408A16B338768719C0826B01B4C0CD5A4059A48977808719C0C8652277C0CD5A4098A608707A8719C07CED5383C1CD5A407A221438708719C0
475	3	S0.4.26	0103000020E610000001000000050000000F6B17C0C1CD5A408A16B338768719C0A3E8DAFCC1CD5A409A0A52397C8719C03C71E0F0C0CD5A401AA20A7F868719C0826B01B4C0CD5A4059A48977808719C00F6B17C0C1CD5A408A16B338768719C0
476	3	S0.4.25	0103000020E61000000100000005000000A3E8DAFCC1CD5A409A0A52397C8719C036669E39C2CD5A40AAFEF039828719C0F676BF2DC1CD5A40DC9F8B868C8719C03C71E0F0C0CD5A401AA20A7F868719C0A3E8DAFCC1CD5A409A0A52397C8719C0
477	3	S0.4.24	0103000020E6100000010000000500000036669E39C2CD5A40AAFEF039828719C0C9E36176C2CD5A40BAF28F3A888719C0B07C9E6AC1CD5A409D9D0C8E928719C0F676BF2DC1CD5A40DC9F8B868C8719C036669E39C2CD5A40AAFEF039828719C0
478	3	S0.4.23	0103000020E61000000100000005000000C9E36176C2CD5A40BAF28F3A888719C05C6125B3C2CD5A40C9E62E3B8E8719C06A827DA7C1CD5A405F9B8D95988719C0B07C9E6AC1CD5A409D9D0C8E928719C0C9E36176C2CD5A40BAF28F3A888719C0
479	3	S0.4.22	0103000020E610000001000000050000005C6125B3C2CD5A40C9E62E3B8E8719C0EFDEE8EFC2CD5A40D9DACD3B948719C024885CE4C1CD5A4020990E9D9E8719C06A827DA7C1CD5A405F9B8D95988719C05C6125B3C2CD5A40C9E62E3B8E8719C0
480	3	S0.4.21	0103000020E61000000100000005000000EFDEE8EFC2CD5A40D9DACD3B948719C0825CAC2CC3CD5A40E9CE6C3C9A8719C0DE8D3B21C2CD5A40E1968FA4A48719C024885CE4C1CD5A4020990E9D9E8719C0EFDEE8EFC2CD5A40D9DACD3B948719C0
481	3	S0.4.20	0103000020E61000000100000005000000825CAC2CC3CD5A40E9CE6C3C9A8719C016DA6F69C3CD5A40F9C20B3DA08719C097931A5EC2CD5A40A39410ACAA8719C0DE8D3B21C2CD5A40E1968FA4A48719C0825CAC2CC3CD5A40E9CE6C3C9A8719C0
482	3	S0.4.19	0103000020E6100000010000000500000016DA6F69C3CD5A40F9C20B3DA08719C0A95733A6C3CD5A4009B7AA3DA68719C05199F99AC2CD5A40649291B3B08719C097931A5EC2CD5A40A39410ACAA8719C016DA6F69C3CD5A40F9C20B3DA08719C0
483	3	S0.4.18	0103000020E61000000100000005000000A95733A6C3CD5A4009B7AA3DA68719C03CD5F6E2C3CD5A4019AB493EAC8719C00B9FD8D7C2CD5A40259012BBB68719C05199F99AC2CD5A40649291B3B08719C0A95733A6C3CD5A4009B7AA3DA68719C0
484	3	S0.4.17	0103000020E610000001000000050000003CD5F6E2C3CD5A4019AB493EAC8719C0CF52BA1FC4CD5A40289FE83EB28719C0C5A4B714C3CD5A40E78D93C2BC8719C00B9FD8D7C2CD5A40259012BBB68719C03CD5F6E2C3CD5A4019AB493EAC8719C0
485	3	S0.4.16	0103000020E61000000100000005000000CF52BA1FC4CD5A40289FE83EB28719C062D07D5CC4CD5A403893873FB88719C07FAA9651C3CD5A40A88B14CAC28719C0C5A4B714C3CD5A40E78D93C2BC8719C0CF52BA1FC4CD5A40289FE83EB28719C0
486	3	S0.4.15	0103000020E6100000010000000500000062D07D5CC4CD5A403893873FB88719C0F54D4199C4CD5A4048872640BE8719C039B0758EC3CD5A406A8995D1C88719C07FAA9651C3CD5A40A88B14CAC28719C062D07D5CC4CD5A403893873FB88719C0
487	3	S0.4.14	0103000020E61000000100000005000000F54D4199C4CD5A4048872640BE8719C089CB04D6C4CD5A40587BC540C48719C0F3B554CBC3CD5A402B8716D9CE8719C039B0758EC3CD5A406A8995D1C88719C0F54D4199C4CD5A4048872640BE8719C0
488	3	S0.4.13	0103000020E6100000010000000500000089CB04D6C4CD5A40587BC540C48719C01C49C812C5CD5A40686F6441CA8719C0ADBB3308C4CD5A40EC8497E0D48719C0F3B554CBC3CD5A402B8716D9CE8719C089CB04D6C4CD5A40587BC540C48719C0
489	3	S0.4.12	0103000020E610000001000000050000001C49C812C5CD5A40686F6441CA8719C0AFC68B4FC5CD5A4078630342D08719C067C11245C4CD5A40AE8218E8DA8719C0ADBB3308C4CD5A40EC8497E0D48719C01C49C812C5CD5A40686F6441CA8719C0
490	3	S0.4.11	0103000020E61000000100000005000000AFC68B4FC5CD5A4078630342D08719C042444F8CC5CD5A408857A242D68719C021C7F181C4CD5A406F8099EFE08719C067C11245C4CD5A40AE8218E8DA8719C0AFC68B4FC5CD5A4078630342D08719C0
491	3	S0.4.10	0103000020E6100000010000000500000042444F8CC5CD5A408857A242D68719C0D5C112C9C5CD5A40974B4143DC8719C0DBCCD0BEC4CD5A40317E1AF7E68719C021C7F181C4CD5A406F8099EFE08719C042444F8CC5CD5A408857A242D68719C0
492	3	S0.4.9	0103000020E61000000100000005000000D5C112C9C5CD5A40974B4143DC8719C0693FD605C6CD5A40A73FE043E28719C095D2AFFBC4CD5A40F27B9BFEEC8719C0DBCCD0BEC4CD5A40317E1AF7E68719C0D5C112C9C5CD5A40974B4143DC8719C0
493	3	S0.4.8	0103000020E61000000100000005000000693FD605C6CD5A40A73FE043E28719C0FCBC9942C6CD5A40B7337F44E88719C04FD88E38C5CD5A40B3791C06F38719C095D2AFFBC4CD5A40F27B9BFEEC8719C0693FD605C6CD5A40A73FE043E28719C0
494	3	S0.4.7	0103000020E61000000100000005000000FCBC9942C6CD5A40B7337F44E88719C08F3A5D7FC6CD5A40C7271E45EE8719C009DE6D75C5CD5A4075779D0DF98719C04FD88E38C5CD5A40B3791C06F38719C0FCBC9942C6CD5A40B7337F44E88719C0
495	3	S0.4.6	0103000020E610000001000000050000008F3A5D7FC6CD5A40C7271E45EE8719C022B820BCC6CD5A40D71BBD45F48719C0C3E34CB2C5CD5A4036751E15FF8719C009DE6D75C5CD5A4075779D0DF98719C08F3A5D7FC6CD5A40C7271E45EE8719C0
496	3	S0.4.5	0103000020E6100000010000000500000022B820BCC6CD5A40D71BBD45F48719C0B535E4F8C6CD5A40E70F5C46FA8719C07DE92BEFC5CD5A40F7729F1C058819C0C3E34CB2C5CD5A4036751E15FF8719C022B820BCC6CD5A40D71BBD45F48719C0
497	3	S0.4.4	0103000020E61000000100000005000000B535E4F8C6CD5A40E70F5C46FA8719C048B3A735C7CD5A40F603FB46008819C037EF0A2CC6CD5A40B97020240B8819C07DE92BEFC5CD5A40F7729F1C058819C0B535E4F8C6CD5A40E70F5C46FA8719C0
498	3	S0.4.3	0103000020E6100000010000000500000048B3A735C7CD5A40F603FB46008819C0DC306B72C7CD5A4006F89947068819C0F1F4E968C6CD5A407A6EA12B118819C037EF0A2CC6CD5A40B97020240B8819C048B3A735C7CD5A40F603FB46008819C0
499	3	S0.4.2	0103000020E61000000100000005000000DC306B72C7CD5A4006F89947068819C06FAE2EAFC7CD5A4016EC38480C8819C0ABFAC8A5C6CD5A403C6C2233178819C0F1F4E968C6CD5A407A6EA12B118819C0DC306B72C7CD5A4006F89947068819C0
500	3	S0.4.1	0103000020E610000001000000050000006FAE2EAFC7CD5A4016EC38480C8819C0022CF2EBC7CD5A4026E0D748128819C06500A8E2C6CD5A40FD69A33A1D8819C0ABFAC8A5C6CD5A403C6C2233178819C06FAE2EAFC7CD5A4016EC38480C8819C0
1196	12	E.3.18	0103000020E610000001000000050000002A42E3F5BACD5A4052216645B78719C0106107A3BACD5A40B04DDE70BA8719C04C16C22EBACD5A40B883CE07AF8719C0CF717981BACD5A40A52A32DBAB8719C02A42E3F5BACD5A4052216645B78719C0
1197	12	E.3.19	0103000020E61000000100000005000000106107A3BACD5A40B04DDE70BA8719C0F67F2B50BACD5A400D7A569CBD8719C0C9BA0ADCB9CD5A40CADC6A34B28719C04C16C22EBACD5A40B883CE07AF8719C0106107A3BACD5A40B04DDE70BA8719C0
1198	12	E.3.20	0103000020E61000000100000005000000F67F2B50BACD5A400D7A569CBD8719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0465F5389B9CD5A40DD350761B58719C0C9BA0ADCB9CD5A40CADC6A34B28719C0F67F2B50BACD5A400D7A569CBD8719C0
1199	12	E.3.21	0103000020E61000000100000005000000DD9E4FFDB9CD5A406AA6CEC7C08719C0C3BD73AAB9CD5A40C7D246F3C38719C0C3039C36B9CD5A40F08EA38DB88719C0465F5389B9CD5A40DD350761B58719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0
1200	12	E.3.22	0103000020E61000000100000005000000C3BD73AAB9CD5A40C7D246F3C38719C0A9DC9757B9CD5A4024FFBE1EC78719C040A8E4E3B8CD5A4003E83FBABB8719C0C3039C36B9CD5A40F08EA38DB88719C0C3BD73AAB9CD5A40C7D246F3C38719C0
1201	12	E.3.23	0103000020E61000000100000005000000A9DC9757B9CD5A4024FFBE1EC78719C090FBBB04B9CD5A40812B374ACA8719C0BD4C2D91B8CD5A401541DCE6BE8719C040A8E4E3B8CD5A4003E83FBABB8719C0A9DC9757B9CD5A4024FFBE1EC78719C0
1202	12	E.3.24	0103000020E6100000010000000500000090FBBB04B9CD5A40812B374ACA8719C0761AE0B1B8CD5A40DE57AF75CD8719C03AF1753EB8CD5A40289A7813C28719C0BD4C2D91B8CD5A401541DCE6BE8719C090FBBB04B9CD5A40812B374ACA8719C0
1203	12	E.3.25	0103000020E61000000100000005000000761AE0B1B8CD5A40DE57AF75CD8719C05C39045FB8CD5A403C8427A1D08719C0B695BEEBB7CD5A403BF31440C58719C03AF1753EB8CD5A40289A7813C28719C0761AE0B1B8CD5A40DE57AF75CD8719C0
1204	12	E.3.26	0103000020E610000001000000050000005C39045FB8CD5A403C8427A1D08719C04258280CB8CD5A4099B09FCCD38719C0333A0799B7CD5A404E4CB16CC88719C0B695BEEBB7CD5A403BF31440C58719C05C39045FB8CD5A403C8427A1D08719C0
1205	12	E.3.27	0103000020E610000001000000050000004258280CB8CD5A4099B09FCCD38719C029774CB9B7CD5A40F6DC17F8D68719C0B0DE4F46B7CD5A4060A54D99CB8719C0333A0799B7CD5A404E4CB16CC88719C04258280CB8CD5A4099B09FCCD38719C0
1206	12	E.3.28	0103000020E6100000010000000500000029774CB9B7CD5A40F6DC17F8D68719C00F967066B7CD5A4053099023DA8719C02D8398F3B6CD5A4073FEE9C5CE8719C0B0DE4F46B7CD5A4060A54D99CB8719C029774CB9B7CD5A40F6DC17F8D68719C0
1207	12	E.3.29	0103000020E610000001000000050000000F967066B7CD5A4053099023DA8719C0F5B49413B7CD5A40B035084FDD8719C0AA27E1A0B6CD5A40865786F2D18719C02D8398F3B6CD5A4073FEE9C5CE8719C00F967066B7CD5A4053099023DA8719C0
1208	12	E.3.30	0103000020E61000000100000005000000F5B49413B7CD5A40B035084FDD8719C0DCD3B8C0B6CD5A400D62807AE08719C027CC294EB6CD5A4099B0221FD58719C0AA27E1A0B6CD5A40865786F2D18719C0F5B49413B7CD5A40B035084FDD8719C0
1209	12	E.3.31	0103000020E61000000100000005000000DCD3B8C0B6CD5A400D62807AE08719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0A47072FBB5CD5A40AB09BF4BD88719C027CC294EB6CD5A4099B0221FD58719C0DCD3B8C0B6CD5A400D62807AE08719C0
1210	12	E.3.32	0103000020E61000000100000005000000C2F2DC6DB6CD5A406A8EF8A5E38719C0A811011BB6CD5A40C8BA70D1E68719C02115BBA8B5CD5A40BE625B78DB8719C0A47072FBB5CD5A40AB09BF4BD88719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0
1211	12	E.3.33	0103000020E61000000100000005000000A811011BB6CD5A40C8BA70D1E68719C08E3025C8B5CD5A4025E7E8FCE98719C09EB90356B5CD5A40D1BBF7A4DE8719C02115BBA8B5CD5A40BE625B78DB8719C0A811011BB6CD5A40C8BA70D1E68719C0
1212	12	E.3.34	0103000020E610000001000000050000008E3025C8B5CD5A4025E7E8FCE98719C0754F4975B5CD5A4082136128ED8719C01B5E4C03B5CD5A40E41494D1E18719C09EB90356B5CD5A40D1BBF7A4DE8719C08E3025C8B5CD5A4025E7E8FCE98719C0
1213	12	E.3.35	0103000020E61000000100000005000000754F4975B5CD5A4082136128ED8719C05B6E6D22B5CD5A40DF3FD953F08719C0980295B0B4CD5A40F66D30FEE48719C01B5E4C03B5CD5A40E41494D1E18719C0754F4975B5CD5A4082136128ED8719C0
1214	12	E.3.36	0103000020E610000001000000050000005B6E6D22B5CD5A40DF3FD953F08719C0418D91CFB4CD5A403C6C517FF38719C015A7DD5DB4CD5A4009C7CC2AE88719C0980295B0B4CD5A40F66D30FEE48719C05B6E6D22B5CD5A40DF3FD953F08719C0
1215	12	E.3.37	0103000020E61000000100000005000000418D91CFB4CD5A403C6C517FF38719C028ACB57CB4CD5A409998C9AAF68719C0924B260BB4CD5A401C206957EB8719C015A7DD5DB4CD5A4009C7CC2AE88719C0418D91CFB4CD5A403C6C517FF38719C0
1216	12	E.3.38	0103000020E6100000010000000500000028ACB57CB4CD5A409998C9AAF68719C00ECBD929B4CD5A40F6C441D6F98719C00FF06EB8B3CD5A402F790584EE8719C0924B260BB4CD5A401C206957EB8719C028ACB57CB4CD5A409998C9AAF68719C0
1217	12	E.3.39	0103000020E610000001000000050000000ECBD929B4CD5A40F6C441D6F98719C0F4E9FDD6B3CD5A4054F1B901FD8719C08C94B765B3CD5A4041D2A1B0F18719C00FF06EB8B3CD5A402F790584EE8719C00ECBD929B4CD5A40F6C441D6F98719C0
1218	12	E.3.40	0103000020E61000000100000005000000F4E9FDD6B3CD5A4054F1B901FD8719C0DA082284B3CD5A40B11D322D008819C009390013B3CD5A40542B3EDDF48719C08C94B765B3CD5A4041D2A1B0F18719C0F4E9FDD6B3CD5A4054F1B901FD8719C0
1219	12	E.3.41	0103000020E61000000100000005000000DA082284B3CD5A40B11D322D008819C0C1274631B3CD5A400E4AAA58038819C086DD48C0B2CD5A406784DA09F88719C009390013B3CD5A40542B3EDDF48719C0DA082284B3CD5A40B11D322D008819C0
1220	12	E.3.42	0103000020E61000000100000005000000C1274631B3CD5A400E4AAA58038819C0A7466ADEB2CD5A406B762284068819C00382916DB2CD5A407ADD7636FB8719C086DD48C0B2CD5A406784DA09F88719C0C1274631B3CD5A400E4AAA58038819C0
1221	12	E.3.43	0103000020E61000000100000005000000A7466ADEB2CD5A406B762284068819C08D658E8BB2CD5A40C8A29AAF098819C08026DA1AB2CD5A408C361363FE8719C00382916DB2CD5A407ADD7636FB8719C0A7466ADEB2CD5A406B762284068819C0
1222	12	E.3.44	0103000020E610000001000000050000008D658E8BB2CD5A40C8A29AAF098819C07484B238B2CD5A4025CF12DB0C8819C0FDCA22C8B1CD5A409F8FAF8F018819C08026DA1AB2CD5A408C361363FE8719C08D658E8BB2CD5A40C8A29AAF098819C0
1223	12	E.3.45	0103000020E610000001000000050000007484B238B2CD5A4025CF12DB0C8819C05AA3D6E5B1CD5A4082FB8A06108819C07A6F6B75B1CD5A40B2E84BBC048819C0FDCA22C8B1CD5A409F8FAF8F018819C07484B238B2CD5A4025CF12DB0C8819C0
1224	12	E.3.46	0103000020E610000001000000050000005AA3D6E5B1CD5A4082FB8A06108819C040C2FA92B1CD5A40E0270332138819C0F713B422B1CD5A40C541E8E8078819C07A6F6B75B1CD5A40B2E84BBC048819C05AA3D6E5B1CD5A4082FB8A06108819C0
1225	12	E.3.47	0103000020E6100000010000000500000040C2FA92B1CD5A40E0270332138819C026E11E40B1CD5A403D547B5D168819C074B8FCCFB0CD5A40D79A84150B8819C0F713B422B1CD5A40C541E8E8078819C040C2FA92B1CD5A40E0270332138819C0
1226	12	E.3.48	0103000020E6100000010000000500000026E11E40B1CD5A403D547B5D168819C00D0043EDB0CD5A409A80F388198819C0F15C457DB0CD5A40EAF320420E8819C074B8FCCFB0CD5A40D79A84150B8819C026E11E40B1CD5A403D547B5D168819C0
1227	12	E.3.49	0103000020E610000001000000050000000D0043EDB0CD5A409A80F388198819C0F31E679AB0CD5A40F7AC6BB41C8819C06E018E2AB0CD5A40FD4CBD6E118819C0F15C457DB0CD5A40EAF320420E8819C00D0043EDB0CD5A409A80F388198819C0
1228	12	E.2.1	0103000020E610000001000000050000008285A6FFBFCD5A406640D0E4758719C0FF29EFACBFCD5A4079996C11798719C039003D36BFCD5A4072D7F5946D8719C025D6CF88BFCD5A40AA5135676A8719C08285A6FFBFCD5A406640D0E4758719C0
1229	12	E.2.2	0103000020E61000000100000005000000FF29EFACBFCD5A4079996C11798719C07CCE375ABFCD5A408CF2083E7C8719C04C2AAAE3BECD5A403B5DB6C2708719C039003D36BFCD5A4072D7F5946D8719C0FF29EFACBFCD5A4079996C11798719C0
1230	12	E.2.3	0103000020E610000001000000050000007CCE375ABFCD5A408CF2083E7C8719C0F9728007BFCD5A409E4BA56A7F8719C060541791BECD5A4003E376F0738719C04C2AAAE3BECD5A403B5DB6C2708719C07CCE375ABFCD5A408CF2083E7C8719C0
1231	12	E.2.4	0103000020E61000000100000005000000F9728007BFCD5A409E4BA56A7F8719C07617C9B4BECD5A40B1A44197828719C0747E843EBECD5A40CB68371E778719C060541791BECD5A4003E376F0738719C0F9728007BFCD5A409E4BA56A7F8719C0
1232	12	E.2.5	0103000020E610000001000000050000007617C9B4BECD5A40B1A44197828719C0F3BB1162BECD5A40C4FDDDC3858719C087A8F1EBBDCD5A4094EEF74B7A8719C0747E843EBECD5A40CB68371E778719C07617C9B4BECD5A40B1A44197828719C0
1233	12	E.2.6	0103000020E61000000100000005000000F3BB1162BECD5A40C4FDDDC3858719C070605A0FBECD5A40D7567AF0888719C09BD25E99BDCD5A405C74B8797D8719C087A8F1EBBDCD5A4094EEF74B7A8719C0F3BB1162BECD5A40C4FDDDC3858719C0
1234	12	E.2.7	0103000020E6100000010000000500000070605A0FBECD5A40D7567AF0888719C0ED04A3BCBDCD5A40E9AF161D8C8719C0AFFCCB46BDCD5A4024FA78A7808719C09BD25E99BDCD5A405C74B8797D8719C070605A0FBECD5A40D7567AF0888719C0
1235	12	E.2.8	0103000020E61000000100000005000000ED04A3BCBDCD5A40E9AF161D8C8719C06AA9EB69BDCD5A40FC08B3498F8719C0C32639F4BCCD5A40ED7F39D5838719C0AFFCCB46BDCD5A4024FA78A7808719C0ED04A3BCBDCD5A40E9AF161D8C8719C0
1236	12	E.2.9	0103000020E610000001000000050000006AA9EB69BDCD5A40FC08B3498F8719C0E74D3417BDCD5A400F624F76928719C0D650A6A1BCCD5A40B505FA02878719C0C32639F4BCCD5A40ED7F39D5838719C06AA9EB69BDCD5A40FC08B3498F8719C0
1237	12	E.2.10	0103000020E61000000100000005000000E74D3417BDCD5A400F624F76928719C064F27CC4BCCD5A4022BBEBA2958719C0EA7A134FBCCD5A407D8BBA308A8719C0D650A6A1BCCD5A40B505FA02878719C0E74D3417BDCD5A400F624F76928719C0
1238	12	E.2.11	0103000020E6100000010000000500000064F27CC4BCCD5A4022BBEBA2958719C0E196C571BCCD5A40341488CF988719C0FEA480FCBBCD5A4046117B5E8D8719C0EA7A134FBCCD5A407D8BBA308A8719C064F27CC4BCCD5A4022BBEBA2958719C0
1239	12	E.2.12	0103000020E61000000100000005000000E196C571BCCD5A40341488CF988719C05E3B0E1FBCCD5A40476D24FC9B8719C011CFEDA9BBCD5A400E973B8C908719C0FEA480FCBBCD5A4046117B5E8D8719C0E196C571BCCD5A40341488CF988719C0
1240	12	E.2.13	0103000020E610000001000000050000005E3B0E1FBCCD5A40476D24FC9B8719C0DBDF56CCBBCD5A405AC6C0289F8719C025F95A57BBCD5A40D71CFCB9938719C011CFEDA9BBCD5A400E973B8C908719C05E3B0E1FBCCD5A40476D24FC9B8719C0
1241	12	E.2.14	0103000020E61000000100000005000000DBDF56CCBBCD5A405AC6C0289F8719C058849F79BBCD5A406D1F5D55A28719C03923C804BBCD5A409FA2BCE7968719C025F95A57BBCD5A40D71CFCB9938719C0DBDF56CCBBCD5A405AC6C0289F8719C0
1242	12	E.2.15	0103000020E6100000010000000500000058849F79BBCD5A406D1F5D55A28719C0D528E826BBCD5A407F78F981A58719C04C4D35B2BACD5A4067287D159A8719C03923C804BBCD5A409FA2BCE7968719C058849F79BBCD5A406D1F5D55A28719C0
1243	12	E.2.16	0103000020E61000000100000005000000D528E826BBCD5A407F78F981A58719C052CD30D4BACD5A4092D195AEA88719C06077A25FBACD5A4030AE3D439D8719C04C4D35B2BACD5A4067287D159A8719C0D528E826BBCD5A407F78F981A58719C0
1244	12	E.2.17	0103000020E6100000010000000500000052CD30D4BACD5A4092D195AEA88719C0CF717981BACD5A40A52A32DBAB8719C074A10F0DBACD5A40F833FE70A08719C06077A25FBACD5A4030AE3D439D8719C052CD30D4BACD5A4092D195AEA88719C0
1245	12	E.2.18	0103000020E61000000100000005000000CF717981BACD5A40A52A32DBAB8719C04C16C22EBACD5A40B883CE07AF8719C087CB7CBAB9CD5A40C0B9BE9EA38719C074A10F0DBACD5A40F833FE70A08719C0CF717981BACD5A40A52A32DBAB8719C0
1246	12	E.2.19	0103000020E610000001000000050000004C16C22EBACD5A40B883CE07AF8719C0C9BA0ADCB9CD5A40CADC6A34B28719C09BF5E967B9CD5A40893F7FCCA68719C087CB7CBAB9CD5A40C0B9BE9EA38719C04C16C22EBACD5A40B883CE07AF8719C0
1247	12	E.2.20	0103000020E61000000100000005000000C9BA0ADCB9CD5A40CADC6A34B28719C0465F5389B9CD5A40DD350761B58719C0AF1F5715B9CD5A4051C53FFAA98719C09BF5E967B9CD5A40893F7FCCA68719C0C9BA0ADCB9CD5A40CADC6A34B28719C0
1248	12	E.2.21	0103000020E61000000100000005000000465F5389B9CD5A40DD350761B58719C0C3039C36B9CD5A40F08EA38DB88719C0C349C4C2B8CD5A40194B0028AD8719C0AF1F5715B9CD5A4051C53FFAA98719C0465F5389B9CD5A40DD350761B58719C0
1249	12	E.2.22	0103000020E61000000100000005000000C3039C36B9CD5A40F08EA38DB88719C040A8E4E3B8CD5A4003E83FBABB8719C0D6733170B8CD5A40E2D0C055B08719C0C349C4C2B8CD5A40194B0028AD8719C0C3039C36B9CD5A40F08EA38DB88719C0
1250	12	E.2.23	0103000020E6100000010000000500000040A8E4E3B8CD5A4003E83FBABB8719C0BD4C2D91B8CD5A401541DCE6BE8719C0EA9D9E1DB8CD5A40AA568183B38719C0D6733170B8CD5A40E2D0C055B08719C040A8E4E3B8CD5A4003E83FBABB8719C0
1251	12	E.2.24	0103000020E61000000100000005000000BD4C2D91B8CD5A401541DCE6BE8719C03AF1753EB8CD5A40289A7813C28719C0FEC70BCBB7CD5A4072DC41B1B68719C0EA9D9E1DB8CD5A40AA568183B38719C0BD4C2D91B8CD5A401541DCE6BE8719C0
1252	12	E.2.25	0103000020E610000001000000050000003AF1753EB8CD5A40289A7813C28719C0B695BEEBB7CD5A403BF31440C58719C011F27878B7CD5A403B6202DFB98719C0FEC70BCBB7CD5A4072DC41B1B68719C03AF1753EB8CD5A40289A7813C28719C0
1253	12	E.2.26	0103000020E61000000100000005000000B695BEEBB7CD5A403BF31440C58719C0333A0799B7CD5A404E4CB16CC88719C0251CE625B7CD5A4003E8C20CBD8719C011F27878B7CD5A403B6202DFB98719C0B695BEEBB7CD5A403BF31440C58719C0
1254	12	E.2.27	0103000020E61000000100000005000000333A0799B7CD5A404E4CB16CC88719C0B0DE4F46B7CD5A4060A54D99CB8719C0394653D3B6CD5A40CB6D833AC08719C0251CE625B7CD5A4003E8C20CBD8719C0333A0799B7CD5A404E4CB16CC88719C0
1255	12	E.2.28	0103000020E61000000100000005000000B0DE4F46B7CD5A4060A54D99CB8719C02D8398F3B6CD5A4073FEE9C5CE8719C04C70C080B6CD5A4094F34368C38719C0394653D3B6CD5A40CB6D833AC08719C0B0DE4F46B7CD5A4060A54D99CB8719C0
1256	12	E.2.29	0103000020E610000001000000050000002D8398F3B6CD5A4073FEE9C5CE8719C0AA27E1A0B6CD5A40865786F2D18719C0609A2D2EB6CD5A405C790496C68719C04C70C080B6CD5A4094F34368C38719C02D8398F3B6CD5A4073FEE9C5CE8719C0
1257	12	E.2.30	0103000020E61000000100000005000000AA27E1A0B6CD5A40865786F2D18719C027CC294EB6CD5A4099B0221FD58719C074C49ADBB5CD5A4024FFC4C3C98719C0609A2D2EB6CD5A405C790496C68719C0AA27E1A0B6CD5A40865786F2D18719C0
502	4	A.1.2	0103000020E6100000010000000500000019104978C9CD5A40018563C7718819C05D145423C9CD5A40952D6410758819C0B0CAF7B6C9CD5A40720CBEE1828819C06CC6EC0BCACD5A40AE0307957F8819C019104978C9CD5A40018563C7718819C0
1258	12	E.2.31	0103000020E6100000010000000500000027CC294EB6CD5A4099B0221FD58719C0A47072FBB5CD5A40AB09BF4BD88719C088EE0789B5CD5A40ED8485F1CC8719C074C49ADBB5CD5A4024FFC4C3C98719C027CC294EB6CD5A4099B0221FD58719C0
1259	12	E.2.32	0103000020E61000000100000005000000A47072FBB5CD5A40AB09BF4BD88719C02115BBA8B5CD5A40BE625B78DB8719C09B187536B5CD5A40B50A461FD08719C088EE0789B5CD5A40ED8485F1CC8719C0A47072FBB5CD5A40AB09BF4BD88719C0
1260	12	E.2.33	0103000020E610000001000000050000002115BBA8B5CD5A40BE625B78DB8719C09EB90356B5CD5A40D1BBF7A4DE8719C0AF42E2E3B4CD5A407D90064DD38719C09B187536B5CD5A40B50A461FD08719C02115BBA8B5CD5A40BE625B78DB8719C0
1261	12	E.2.34	0103000020E610000001000000050000009EB90356B5CD5A40D1BBF7A4DE8719C01B5E4C03B5CD5A40E41494D1E18719C0C36C4F91B4CD5A404616C77AD68719C0AF42E2E3B4CD5A407D90064DD38719C09EB90356B5CD5A40D1BBF7A4DE8719C0
1262	12	E.2.35	0103000020E610000001000000050000001B5E4C03B5CD5A40E41494D1E18719C0980295B0B4CD5A40F66D30FEE48719C0D696BC3EB4CD5A400E9C87A8D98719C0C36C4F91B4CD5A404616C77AD68719C01B5E4C03B5CD5A40E41494D1E18719C0
1263	12	E.2.36	0103000020E61000000100000005000000980295B0B4CD5A40F66D30FEE48719C015A7DD5DB4CD5A4009C7CC2AE88719C0EAC029ECB3CD5A40D62148D6DC8719C0D696BC3EB4CD5A400E9C87A8D98719C0980295B0B4CD5A40F66D30FEE48719C0
1264	12	E.2.37	0103000020E6100000010000000500000015A7DD5DB4CD5A4009C7CC2AE88719C0924B260BB4CD5A401C206957EB8719C0FEEA9699B3CD5A409FA70804E08719C0EAC029ECB3CD5A40D62148D6DC8719C015A7DD5DB4CD5A4009C7CC2AE88719C0
1265	12	E.2.38	0103000020E61000000100000005000000924B260BB4CD5A401C206957EB8719C00FF06EB8B3CD5A402F790584EE8719C011150447B3CD5A40672DC931E38719C0FEEA9699B3CD5A409FA70804E08719C0924B260BB4CD5A401C206957EB8719C0
1266	12	E.2.39	0103000020E610000001000000050000000FF06EB8B3CD5A402F790584EE8719C08C94B765B3CD5A4041D2A1B0F18719C0253F71F4B2CD5A4030B3895FE68719C011150447B3CD5A40672DC931E38719C00FF06EB8B3CD5A402F790584EE8719C0
1267	12	E.2.40	0103000020E610000001000000050000008C94B765B3CD5A4041D2A1B0F18719C009390013B3CD5A40542B3EDDF48719C03969DEA1B2CD5A40F8384A8DE98719C0253F71F4B2CD5A4030B3895FE68719C08C94B765B3CD5A4041D2A1B0F18719C0
1268	12	E.2.41	0103000020E6100000010000000500000009390013B3CD5A40542B3EDDF48719C086DD48C0B2CD5A406784DA09F88719C04C934B4FB2CD5A40C0BE0ABBEC8719C03969DEA1B2CD5A40F8384A8DE98719C009390013B3CD5A40542B3EDDF48719C0
1269	12	E.2.42	0103000020E6100000010000000500000086DD48C0B2CD5A406784DA09F88719C00382916DB2CD5A407ADD7636FB8719C060BDB8FCB1CD5A408944CBE8EF8719C04C934B4FB2CD5A40C0BE0ABBEC8719C086DD48C0B2CD5A406784DA09F88719C0
1270	12	E.2.43	0103000020E610000001000000050000000382916DB2CD5A407ADD7636FB8719C08026DA1AB2CD5A408C361363FE8719C074E725AAB1CD5A4051CA8B16F38719C060BDB8FCB1CD5A408944CBE8EF8719C00382916DB2CD5A407ADD7636FB8719C0
1271	12	E.2.44	0103000020E610000001000000050000008026DA1AB2CD5A408C361363FE8719C0FDCA22C8B1CD5A409F8FAF8F018819C088119357B1CD5A4019504C44F68719C074E725AAB1CD5A4051CA8B16F38719C08026DA1AB2CD5A408C361363FE8719C0
1272	12	E.2.45	0103000020E61000000100000005000000FDCA22C8B1CD5A409F8FAF8F018819C07A6F6B75B1CD5A40B2E84BBC048819C09B3B0005B1CD5A40E2D50C72F98719C088119357B1CD5A4019504C44F68719C0FDCA22C8B1CD5A409F8FAF8F018819C0
1273	12	E.2.46	0103000020E610000001000000050000007A6F6B75B1CD5A40B2E84BBC048819C0F713B422B1CD5A40C541E8E8078819C0AF656DB2B0CD5A40AA5BCD9FFC8719C09B3B0005B1CD5A40E2D50C72F98719C07A6F6B75B1CD5A40B2E84BBC048819C0
1274	12	E.2.47	0103000020E61000000100000005000000F713B422B1CD5A40C541E8E8078819C074B8FCCFB0CD5A40D79A84150B8819C0C38FDA5FB0CD5A4072E18DCDFF8719C0AF656DB2B0CD5A40AA5BCD9FFC8719C0F713B422B1CD5A40C541E8E8078819C0
1275	12	E.2.48	0103000020E6100000010000000500000074B8FCCFB0CD5A40D79A84150B8819C0F15C457DB0CD5A40EAF320420E8819C0D6B9470DB0CD5A403B674EFB028819C0C38FDA5FB0CD5A4072E18DCDFF8719C074B8FCCFB0CD5A40D79A84150B8819C0
1276	12	E.2.49	0103000020E61000000100000005000000F15C457DB0CD5A40EAF320420E8819C06E018E2AB0CD5A40FD4CBD6E118819C0EAE3B4BAAFCD5A4003ED0E29068819C0D6B9470DB0CD5A403B674EFB028819C0F15C457DB0CD5A40EAF320420E8819C0
1277	12	E.1.1	0103000020E6100000010000000500000025D6CF88BFCD5A40AA5135676A8719C039003D36BFCD5A4072D7F5946D8719C072D68ABFBECD5A406B157F18628719C0C826F911BFCD5A40ED629AE95E8719C025D6CF88BFCD5A40AA5135676A8719C0
1278	12	E.1.2	0103000020E6100000010000000500000039003D36BFCD5A4072D7F5946D8719C04C2AAAE3BECD5A403B5DB6C2708719C01D861C6DBECD5A40E9C76347658719C072D68ABFBECD5A406B157F18628719C039003D36BFCD5A4072D7F5946D8719C0
1279	12	E.1.3	0103000020E610000001000000050000004C2AAAE3BECD5A403B5DB6C2708719C060541791BECD5A4003E376F0738719C0C735AE1ABECD5A40677A4876688719C01D861C6DBECD5A40E9C76347658719C04C2AAAE3BECD5A403B5DB6C2708719C0
1280	12	E.1.4	0103000020E6100000010000000500000060541791BECD5A4003E376F0738719C0747E843EBECD5A40CB68371E778719C072E53FC8BDCD5A40E52C2DA56B8719C0C735AE1ABECD5A40677A4876688719C060541791BECD5A4003E376F0738719C0
1281	12	E.1.5	0103000020E61000000100000005000000747E843EBECD5A40CB68371E778719C087A8F1EBBDCD5A4094EEF74B7A8719C01C95D175BDCD5A4063DF11D46E8719C072E53FC8BDCD5A40E52C2DA56B8719C0747E843EBECD5A40CB68371E778719C0
1282	12	E.1.6	0103000020E6100000010000000500000087A8F1EBBDCD5A4094EEF74B7A8719C09BD25E99BDCD5A405C74B8797D8719C0C6446323BDCD5A40E191F602728719C01C95D175BDCD5A4063DF11D46E8719C087A8F1EBBDCD5A4094EEF74B7A8719C0
1283	12	E.1.7	0103000020E610000001000000050000009BD25E99BDCD5A405C74B8797D8719C0AFFCCB46BDCD5A4024FA78A7808719C071F4F4D0BCCD5A405F44DB31758719C0C6446323BDCD5A40E191F602728719C09BD25E99BDCD5A405C74B8797D8719C0
1284	12	E.1.8	0103000020E61000000100000005000000AFFCCB46BDCD5A4024FA78A7808719C0C32639F4BCCD5A40ED7F39D5838719C01BA4867EBCCD5A40DDF6BF60788719C071F4F4D0BCCD5A405F44DB31758719C0AFFCCB46BDCD5A4024FA78A7808719C0
1285	12	E.1.9	0103000020E61000000100000005000000C32639F4BCCD5A40ED7F39D5838719C0D650A6A1BCCD5A40B505FA02878719C0C553182CBCCD5A405BA9A48F7B8719C01BA4867EBCCD5A40DDF6BF60788719C0C32639F4BCCD5A40ED7F39D5838719C0
1286	12	E.1.10	0103000020E61000000100000005000000D650A6A1BCCD5A40B505FA02878719C0EA7A134FBCCD5A407D8BBA308A8719C07003AAD9BBCD5A40D95B89BE7E8719C0C553182CBCCD5A405BA9A48F7B8719C0D650A6A1BCCD5A40B505FA02878719C0
1307	12	E.1.31	0103000020E6100000010000000500000074C49ADBB5CD5A4024FFC4C3C98719C088EE0789B5CD5A40ED8485F1CC8719C06A6C9D16B5CD5A402E004C97C18719C0C0BC0B69B5CD5A40B04D6768BE8719C074C49ADBB5CD5A4024FFC4C3C98719C0
1308	12	E.1.32	0103000020E6100000010000000500000088EE0789B5CD5A40ED8485F1CC8719C09B187536B5CD5A40B50A461FD08719C0141C2FC4B4CD5A40ACB230C6C48719C06A6C9D16B5CD5A402E004C97C18719C088EE0789B5CD5A40ED8485F1CC8719C0
1309	12	E.1.33	0103000020E610000001000000050000009B187536B5CD5A40B50A461FD08719C0AF42E2E3B4CD5A407D90064DD38719C0BFCBC071B4CD5A402A6515F5C78719C0141C2FC4B4CD5A40ACB230C6C48719C09B187536B5CD5A40B50A461FD08719C0
1310	12	E.1.34	0103000020E61000000100000005000000AF42E2E3B4CD5A407D90064DD38719C0C36C4F91B4CD5A404616C77AD68719C0697B521FB4CD5A40A817FA23CB8719C0BFCBC071B4CD5A402A6515F5C78719C0AF42E2E3B4CD5A407D90064DD38719C0
1311	12	E.1.35	0103000020E61000000100000005000000C36C4F91B4CD5A404616C77AD68719C0D696BC3EB4CD5A400E9C87A8D98719C0142BE4CCB3CD5A4026CADE52CE8719C0697B521FB4CD5A40A817FA23CB8719C0C36C4F91B4CD5A404616C77AD68719C0
1312	12	E.1.36	0103000020E61000000100000005000000D696BC3EB4CD5A400E9C87A8D98719C0EAC029ECB3CD5A40D62148D6DC8719C0BEDA757AB3CD5A40A47CC381D18719C0142BE4CCB3CD5A4026CADE52CE8719C0D696BC3EB4CD5A400E9C87A8D98719C0
1313	12	E.1.37	0103000020E61000000100000005000000EAC029ECB3CD5A40D62148D6DC8719C0FEEA9699B3CD5A409FA70804E08719C0688A0728B3CD5A40212FA8B0D48719C0BEDA757AB3CD5A40A47CC381D18719C0EAC029ECB3CD5A40D62148D6DC8719C0
1314	12	E.1.38	0103000020E61000000100000005000000FEEA9699B3CD5A409FA70804E08719C011150447B3CD5A40672DC931E38719C0133A99D5B2CD5A409FE18CDFD78719C0688A0728B3CD5A40212FA8B0D48719C0FEEA9699B3CD5A409FA70804E08719C0
1315	12	E.1.39	0103000020E6100000010000000500000011150447B3CD5A40672DC931E38719C0253F71F4B2CD5A4030B3895FE68719C0BDE92A83B2CD5A401D94710EDB8719C0133A99D5B2CD5A409FE18CDFD78719C011150447B3CD5A40672DC931E38719C0
1316	12	E.1.40	0103000020E61000000100000005000000253F71F4B2CD5A4030B3895FE68719C03969DEA1B2CD5A40F8384A8DE98719C06899BC30B2CD5A409B46563DDE8719C0BDE92A83B2CD5A401D94710EDB8719C0253F71F4B2CD5A4030B3895FE68719C0
1317	12	E.1.41	0103000020E610000001000000050000003969DEA1B2CD5A40F8384A8DE98719C04C934B4FB2CD5A40C0BE0ABBEC8719C012494EDEB1CD5A4019F93A6CE18719C06899BC30B2CD5A409B46563DDE8719C03969DEA1B2CD5A40F8384A8DE98719C0
1288	12	E.1.12	0103000020E61000000100000005000000FEA480FCBBCD5A4046117B5E8D8719C011CFEDA9BBCD5A400E973B8C908719C0C562CD34BBCD5A40D5C0521C858719C01AB33B87BBCD5A40570E6EED818719C0FEA480FCBBCD5A4046117B5E8D8719C0
1289	12	E.1.13	0103000020E6100000010000000500000011CFEDA9BBCD5A400E973B8C908719C025F95A57BBCD5A40D71CFCB9938719C06F125FE2BACD5A405273374B888719C0C562CD34BBCD5A40D5C0521C858719C011CFEDA9BBCD5A400E973B8C908719C0
1290	12	E.1.14	0103000020E6100000010000000500000025F95A57BBCD5A40D71CFCB9938719C03923C804BBCD5A409FA2BCE7968719C019C2F08FBACD5A40D0251C7A8B8719C06F125FE2BACD5A405273374B888719C025F95A57BBCD5A40D71CFCB9938719C0
1291	12	E.1.15	0103000020E610000001000000050000003923C804BBCD5A409FA2BCE7968719C04C4D35B2BACD5A4067287D159A8719C0C471823DBACD5A404ED800A98E8719C019C2F08FBACD5A40D0251C7A8B8719C03923C804BBCD5A409FA2BCE7968719C0
1292	12	E.1.16	0103000020E610000001000000050000004C4D35B2BACD5A4067287D159A8719C06077A25FBACD5A4030AE3D439D8719C06E2114EBB9CD5A40CC8AE5D7918719C0C471823DBACD5A404ED800A98E8719C04C4D35B2BACD5A4067287D159A8719C0
1293	12	E.1.17	0103000020E610000001000000050000006077A25FBACD5A4030AE3D439D8719C074A10F0DBACD5A40F833FE70A08719C019D1A598B9CD5A404A3DCA06958719C06E2114EBB9CD5A40CC8AE5D7918719C06077A25FBACD5A4030AE3D439D8719C0
1294	12	E.1.18	0103000020E6100000010000000500000074A10F0DBACD5A40F833FE70A08719C087CB7CBAB9CD5A40C0B9BE9EA38719C0C3803746B9CD5A40C8EFAE35988719C019D1A598B9CD5A404A3DCA06958719C074A10F0DBACD5A40F833FE70A08719C0
1295	12	E.1.19	0103000020E6100000010000000500000087CB7CBAB9CD5A40C0B9BE9EA38719C09BF5E967B9CD5A40893F7FCCA68719C06D30C9F3B8CD5A4046A293649B8719C0C3803746B9CD5A40C8EFAE35988719C087CB7CBAB9CD5A40C0B9BE9EA38719C0
1296	12	E.1.20	0103000020E610000001000000050000009BF5E967B9CD5A40893F7FCCA68719C0AF1F5715B9CD5A4051C53FFAA98719C018E05AA1B8CD5A40C45478939E8719C06D30C9F3B8CD5A4046A293649B8719C09BF5E967B9CD5A40893F7FCCA68719C0
1297	12	E.1.21	0103000020E61000000100000005000000AF1F5715B9CD5A4051C53FFAA98719C0C349C4C2B8CD5A40194B0028AD8719C0C28FEC4EB8CD5A4042075DC2A18719C018E05AA1B8CD5A40C45478939E8719C0AF1F5715B9CD5A4051C53FFAA98719C0
1298	12	E.1.22	0103000020E61000000100000005000000C349C4C2B8CD5A40194B0028AD8719C0D6733170B8CD5A40E2D0C055B08719C06D3F7EFCB7CD5A40C0B941F1A48719C0C28FEC4EB8CD5A4042075DC2A18719C0C349C4C2B8CD5A40194B0028AD8719C0
1299	12	E.1.23	0103000020E61000000100000005000000D6733170B8CD5A40E2D0C055B08719C0EA9D9E1DB8CD5A40AA568183B38719C017EF0FAAB7CD5A403E6C2620A88719C06D3F7EFCB7CD5A40C0B941F1A48719C0D6733170B8CD5A40E2D0C055B08719C0
1300	12	E.1.24	0103000020E61000000100000005000000EA9D9E1DB8CD5A40AA568183B38719C0FEC70BCBB7CD5A4072DC41B1B68719C0C19EA157B7CD5A40BC1E0B4FAB8719C017EF0FAAB7CD5A403E6C2620A88719C0EA9D9E1DB8CD5A40AA568183B38719C0
1301	12	E.1.25	0103000020E61000000100000005000000FEC70BCBB7CD5A4072DC41B1B68719C011F27878B7CD5A403B6202DFB98719C06C4E3305B7CD5A403AD1EF7DAE8719C0C19EA157B7CD5A40BC1E0B4FAB8719C0FEC70BCBB7CD5A4072DC41B1B68719C0
1302	12	E.1.26	0103000020E6100000010000000500000011F27878B7CD5A403B6202DFB98719C0251CE625B7CD5A4003E8C20CBD8719C016FEC4B2B6CD5A40B883D4ACB18719C06C4E3305B7CD5A403AD1EF7DAE8719C011F27878B7CD5A403B6202DFB98719C0
1303	12	E.1.27	0103000020E61000000100000005000000251CE625B7CD5A4003E8C20CBD8719C0394653D3B6CD5A40CB6D833AC08719C0C0AD5660B6CD5A403636B9DBB48719C016FEC4B2B6CD5A40B883D4ACB18719C0251CE625B7CD5A4003E8C20CBD8719C0
1304	12	E.1.28	0103000020E61000000100000005000000394653D3B6CD5A40CB6D833AC08719C04C70C080B6CD5A4094F34368C38719C06B5DE80DB6CD5A40B4E89D0AB88719C0C0AD5660B6CD5A403636B9DBB48719C0394653D3B6CD5A40CB6D833AC08719C0
1305	12	E.1.29	0103000020E610000001000000050000004C70C080B6CD5A4094F34368C38719C0609A2D2EB6CD5A405C790496C68719C0150D7ABBB5CD5A40329B8239BB8719C06B5DE80DB6CD5A40B4E89D0AB88719C04C70C080B6CD5A4094F34368C38719C0
1306	12	E.1.30	0103000020E61000000100000005000000609A2D2EB6CD5A405C790496C68719C074C49ADBB5CD5A4024FFC4C3C98719C0C0BC0B69B5CD5A40B04D6768BE8719C0150D7ABBB5CD5A40329B8239BB8719C0609A2D2EB6CD5A405C790496C68719C0
501	4	A.1.1	0103000020E61000000100000005000000D40B3ECDC9CD5A406EDC627E6E8819C019104978C9CD5A40018563C7718819C06CC6EC0BCACD5A40AE0307957F8819C027C2E160CACD5A40EAFA4F487C8819C0D40B3ECDC9CD5A406EDC627E6E8819C0
503	4	A.1.3	0103000020E610000001000000050000005D145423C9CD5A40952D6410758819C0A2185FCEC8CD5A4028D66459788819C0F5CE0262C9CD5A403615752E868819C0B0CAF7B6C9CD5A40720CBEE1828819C05D145423C9CD5A40952D6410758819C0
504	4	A.1.4	0103000020E61000000100000005000000A2185FCEC8CD5A4028D66459788819C0E61C6A79C8CD5A40BB7E65A27B8819C039D30D0DC9CD5A40FA1D2C7B898819C0F5CE0262C9CD5A403615752E868819C0A2185FCEC8CD5A4028D66459788819C0
505	4	A.1.5	0103000020E61000000100000005000000E61C6A79C8CD5A40BB7E65A27B8819C02B217524C8CD5A404E2766EB7E8819C07ED718B8C8CD5A40BE26E3C78C8819C039D30D0DC9CD5A40FA1D2C7B898819C0E61C6A79C8CD5A40BB7E65A27B8819C0
506	4	A.1.6	0103000020E610000001000000050000002B217524C8CD5A404E2766EB7E8819C06F2580CFC7CD5A40E2CF6634828819C0C2DB2363C8CD5A40812F9A14908819C07ED718B8C8CD5A40BE26E3C78C8819C02B217524C8CD5A404E2766EB7E8819C0
507	4	A.1.7	0103000020E610000001000000050000006F2580CFC7CD5A40E2CF6634828819C0B4298B7AC7CD5A407578677D858819C007E02E0EC8CD5A4045385161938819C0C2DB2363C8CD5A40812F9A14908819C06F2580CFC7CD5A40E2CF6634828819C0
508	4	A.1.8	0103000020E61000000100000005000000B4298B7AC7CD5A407578677D858819C0F92D9625C7CD5A40082168C6888819C04CE439B9C7CD5A40094108AE968819C007E02E0EC8CD5A4045385161938819C0B4298B7AC7CD5A407578677D858819C0
509	4	A.1.9	0103000020E61000000100000005000000F92D9625C7CD5A40082168C6888819C03D32A1D0C6CD5A409BC9680F8C8819C090E84464C7CD5A40CD49BFFA998819C04CE439B9C7CD5A40094108AE968819C0F92D9625C7CD5A40082168C6888819C0
510	4	A.1.10	0103000020E610000001000000050000003D32A1D0C6CD5A409BC9680F8C8819C08236AC7BC6CD5A402F7269588F8819C0D5EC4F0FC7CD5A40915276479D8819C090E84464C7CD5A40CD49BFFA998819C03D32A1D0C6CD5A409BC9680F8C8819C0
511	4	A.1.11	0103000020E610000001000000050000008236AC7BC6CD5A402F7269588F8819C0C63AB726C6CD5A40C21A6AA1928819C019F15ABAC6CD5A40555B2D94A08819C0D5EC4F0FC7CD5A40915276479D8819C08236AC7BC6CD5A402F7269588F8819C0
512	4	A.1.12	0103000020E61000000100000005000000C63AB726C6CD5A40C21A6AA1928819C00B3FC2D1C5CD5A4055C36AEA958819C05EF56565C6CD5A401964E4E0A38819C019F15ABAC6CD5A40555B2D94A08819C0C63AB726C6CD5A40C21A6AA1928819C0
513	4	A.1.13	0103000020E610000001000000050000000B3FC2D1C5CD5A4055C36AEA958819C04F43CD7CC5CD5A40E96B6B33998819C0A2F97010C6CD5A40DD6C9B2DA78819C05EF56565C6CD5A401964E4E0A38819C00B3FC2D1C5CD5A4055C36AEA958819C0
514	4	A.1.14	0103000020E610000001000000050000004F43CD7CC5CD5A40E96B6B33998819C09447D827C5CD5A407C146C7C9C8819C0E7FD7BBBC5CD5A40A175527AAA8819C0A2F97010C6CD5A40DD6C9B2DA78819C04F43CD7CC5CD5A40E96B6B33998819C0
515	4	A.1.15	0103000020E610000001000000050000009447D827C5CD5A407C146C7C9C8819C0D94BE3D2C4CD5A400FBD6CC59F8819C02C028766C5CD5A40657E09C7AD8819C0E7FD7BBBC5CD5A40A175527AAA8819C09447D827C5CD5A407C146C7C9C8819C0
516	4	A.1.16	0103000020E61000000100000005000000D94BE3D2C4CD5A400FBD6CC59F8819C01D50EE7DC4CD5A40A2656D0EA38819C070069211C5CD5A402987C013B18819C02C028766C5CD5A40657E09C7AD8819C0D94BE3D2C4CD5A400FBD6CC59F8819C0
517	4	A.1.17	0103000020E610000001000000050000001D50EE7DC4CD5A40A2656D0EA38819C06254F928C4CD5A40360E6E57A68819C0B50A9DBCC4CD5A40ED8F7760B48819C070069211C5CD5A402987C013B18819C01D50EE7DC4CD5A40A2656D0EA38819C0
518	4	A.1.18	0103000020E610000001000000050000006254F928C4CD5A40360E6E57A68819C0A65804D4C3CD5A40C9B66EA0A98819C0F90EA867C4CD5A40B0982EADB78819C0B50A9DBCC4CD5A40ED8F7760B48819C06254F928C4CD5A40360E6E57A68819C0
519	4	A.1.19	0103000020E61000000100000005000000A65804D4C3CD5A40C9B66EA0A98819C0EB5C0F7FC3CD5A405C5F6FE9AC8819C03E13B312C4CD5A4074A1E5F9BA8819C0F90EA867C4CD5A40B0982EADB78819C0A65804D4C3CD5A40C9B66EA0A98819C0
520	4	A.1.20	0103000020E61000000100000005000000EB5C0F7FC3CD5A405C5F6FE9AC8819C02F611A2AC3CD5A40F0077032B08819C08217BEBDC3CD5A4038AA9C46BE8819C03E13B312C4CD5A4074A1E5F9BA8819C0EB5C0F7FC3CD5A405C5F6FE9AC8819C0
521	4	A.1.21	0103000020E610000001000000050000002F611A2AC3CD5A40F0077032B08819C0746525D5C2CD5A4083B0707BB38819C0C71BC968C3CD5A40FCB25393C18819C08217BEBDC3CD5A4038AA9C46BE8819C02F611A2AC3CD5A40F0077032B08819C0
522	4	A.1.22	0103000020E61000000100000005000000746525D5C2CD5A4083B0707BB38819C0B9693080C2CD5A40165971C4B68819C00C20D413C3CD5A40C0BB0AE0C48819C0C71BC968C3CD5A40FCB25393C18819C0746525D5C2CD5A4083B0707BB38819C0
523	4	A.1.23	0103000020E61000000100000005000000B9693080C2CD5A40165971C4B68819C0FD6D3B2BC2CD5A40A901720DBA8819C05024DFBEC2CD5A4084C4C12CC88819C00C20D413C3CD5A40C0BB0AE0C48819C0B9693080C2CD5A40165971C4B68819C0
524	4	A.1.24	0103000020E61000000100000005000000FD6D3B2BC2CD5A40A901720DBA8819C0427246D6C1CD5A403DAA7256BD8819C09528EA69C2CD5A4048CD7879CB8819C05024DFBEC2CD5A4084C4C12CC88819C0FD6D3B2BC2CD5A40A901720DBA8819C0
525	4	A.1.25	0103000020E61000000100000005000000427246D6C1CD5A403DAA7256BD8819C086765181C1CD5A40D052739FC08819C0D92CF514C2CD5A400CD62FC6CE8819C09528EA69C2CD5A4048CD7879CB8819C0427246D6C1CD5A403DAA7256BD8819C0
526	4	A.1.26	0103000020E6100000010000000500000086765181C1CD5A40D052739FC08819C0CB7A5C2CC1CD5A4063FB73E8C38819C01E3100C0C1CD5A40D0DEE612D28819C0D92CF514C2CD5A400CD62FC6CE8819C086765181C1CD5A40D052739FC08819C0
527	4	A.1.27	0103000020E61000000100000005000000CB7A5C2CC1CD5A4063FB73E8C38819C0107F67D7C0CD5A40F6A37431C78819C063350B6BC1CD5A4094E79D5FD58819C01E3100C0C1CD5A40D0DEE612D28819C0CB7A5C2CC1CD5A4063FB73E8C38819C0
528	4	A.1.28	0103000020E61000000100000005000000107F67D7C0CD5A40F6A37431C78819C054837282C0CD5A408A4C757ACA8819C0A7391616C1CD5A4058F054ACD88819C063350B6BC1CD5A4094E79D5FD58819C0107F67D7C0CD5A40F6A37431C78819C0
529	4	A.1.29	0103000020E6100000010000000500000054837282C0CD5A408A4C757ACA8819C099877D2DC0CD5A401DF575C3CD8819C0EC3D21C1C0CD5A401CF90BF9DB8819C0A7391616C1CD5A4058F054ACD88819C054837282C0CD5A408A4C757ACA8819C0
530	4	A.1.30	0103000020E6100000010000000500000099877D2DC0CD5A401DF575C3CD8819C0DD8B88D8BFCD5A40B09D760CD18819C030422C6CC0CD5A40DF01C345DF8819C0EC3D21C1C0CD5A401CF90BF9DB8819C099877D2DC0CD5A401DF575C3CD8819C0
531	4	A.1.31	0103000020E61000000100000005000000DD8B88D8BFCD5A40B09D760CD18819C022909383BFCD5A4044467755D48819C075463717C0CD5A40A30A7A92E28819C030422C6CC0CD5A40DF01C345DF8819C0DD8B88D8BFCD5A40B09D760CD18819C0
532	4	A.1.32	0103000020E6100000010000000500000022909383BFCD5A4044467755D48819C066949E2EBFCD5A40D7EE779ED78819C0B94A42C2BFCD5A40671331DFE58819C075463717C0CD5A40A30A7A92E28819C022909383BFCD5A4044467755D48819C0
533	4	A.1.33	0103000020E6100000010000000500000066949E2EBFCD5A40D7EE779ED78819C0AB98A9D9BECD5A406A9778E7DA8819C0FE4E4D6DBFCD5A402B1CE82BE98819C0B94A42C2BFCD5A40671331DFE58819C066949E2EBFCD5A40D7EE779ED78819C0
534	4	A.1.34	0103000020E61000000100000005000000AB98A9D9BECD5A406A9778E7DA8819C0F09CB484BECD5A40FD3F7930DE8819C043535818BFCD5A40EF249F78EC8819C0FE4E4D6DBFCD5A402B1CE82BE98819C0AB98A9D9BECD5A406A9778E7DA8819C0
535	4	A.1.35	0103000020E61000000100000005000000F09CB484BECD5A40FD3F7930DE8819C034A1BF2FBECD5A4091E87979E18819C0875763C3BECD5A40B32D56C5EF8819C043535818BFCD5A40EF249F78EC8819C0F09CB484BECD5A40FD3F7930DE8819C0
536	4	A.1.36	0103000020E6100000010000000500000034A1BF2FBECD5A4091E87979E18819C079A5CADABDCD5A4024917AC2E48819C0CC5B6E6EBECD5A4077360D12F38819C0875763C3BECD5A40B32D56C5EF8819C034A1BF2FBECD5A4091E87979E18819C0
537	4	A.1.37	0103000020E6100000010000000500000079A5CADABDCD5A4024917AC2E48819C0BDA9D585BDCD5A40B7397B0BE88819C010607919BECD5A403B3FC45EF68819C0CC5B6E6EBECD5A4077360D12F38819C079A5CADABDCD5A4024917AC2E48819C0
538	4	A.1.38	0103000020E61000000100000005000000BDA9D585BDCD5A40B7397B0BE88819C002AEE030BDCD5A404BE27B54EB8819C0556484C4BDCD5A40FF477BABF98819C010607919BECD5A403B3FC45EF68819C0BDA9D585BDCD5A40B7397B0BE88819C0
539	4	A.1.39	0103000020E6100000010000000500000002AEE030BDCD5A404BE27B54EB8819C046B2EBDBBCCD5A40DE8A7C9DEE8819C099688F6FBDCD5A40C35032F8FC8819C0556484C4BDCD5A40FF477BABF98819C002AEE030BDCD5A404BE27B54EB8819C0
540	4	A.1.40	0103000020E6100000010000000500000046B2EBDBBCCD5A40DE8A7C9DEE8819C08BB6F686BCCD5A4071337DE6F18819C0DE6C9A1ABDCD5A408759E944008919C099688F6FBDCD5A40C35032F8FC8819C046B2EBDBBCCD5A40DE8A7C9DEE8819C0
541	4	A.1.41	0103000020E610000001000000050000008BB6F686BCCD5A4071337DE6F18819C0D0BA0132BCCD5A4004DC7D2FF58819C02371A5C5BCCD5A404B62A091038919C0DE6C9A1ABDCD5A408759E944008919C08BB6F686BCCD5A4071337DE6F18819C0
542	4	A.1.42	0103000020E61000000100000005000000D0BA0132BCCD5A4004DC7D2FF58819C014BF0CDDBBCD5A4098847E78F88819C06775B070BCCD5A400E6B57DE068919C02371A5C5BCCD5A404B62A091038919C0D0BA0132BCCD5A4004DC7D2FF58819C0
543	4	A.1.43	0103000020E6100000010000000500000014BF0CDDBBCD5A4098847E78F88819C059C31788BBCD5A402B2D7FC1FB8819C0AC79BB1BBCCD5A40D2730E2B0A8919C06775B070BCCD5A400E6B57DE068919C014BF0CDDBBCD5A4098847E78F88819C0
544	4	A.1.44	0103000020E6100000010000000500000059C31788BBCD5A402B2D7FC1FB8819C09DC72233BBCD5A40BED57F0AFF8819C0F07DC6C6BBCD5A40967CC5770D8919C0AC79BB1BBCCD5A40D2730E2B0A8919C059C31788BBCD5A402B2D7FC1FB8819C0
545	4	A.1.45	0103000020E610000001000000050000009DC72233BBCD5A40BED57F0AFF8819C0E2CB2DDEBACD5A40517E8053028919C03582D171BBCD5A405A857CC4108919C0F07DC6C6BBCD5A40967CC5770D8919C09DC72233BBCD5A40BED57F0AFF8819C0
546	4	A.1.46	0103000020E61000000100000005000000E2CB2DDEBACD5A40517E8053028919C026D03889BACD5A40E526819C058919C07986DC1CBBCD5A401E8E3311148919C03582D171BBCD5A405A857CC4108919C0E2CB2DDEBACD5A40517E8053028919C0
547	4	A.1.47	0103000020E6100000010000000500000026D03889BACD5A40E526819C058919C06BD44334BACD5A4078CF81E5088919C0BE8AE7C7BACD5A40E296EA5D178919C07986DC1CBBCD5A401E8E3311148919C026D03889BACD5A40E526819C058919C0
548	4	A.2.1	0103000020E6100000010000000500000027C2E160CACD5A40EAFA4F487C8819C06CC6EC0BCACD5A40AE0307957F8819C0BF7C909FCACD5A405B82AA628D8819C07A7885F4CACD5A4066193D128A8819C027C2E160CACD5A40EAFA4F487C8819C0
549	4	A.2.2	0103000020E610000001000000050000006CC6EC0BCACD5A40AE0307957F8819C0B0CAF7B6C9CD5A40720CBEE1828819C003819B4ACACD5A404FEB17B3908819C0BF7C909FCACD5A405B82AA628D8819C06CC6EC0BCACD5A40AE0307957F8819C0
550	4	A.2.3	0103000020E61000000100000005000000B0CAF7B6C9CD5A40720CBEE1828819C0F5CE0262C9CD5A403615752E868819C04885A6F5C9CD5A4044548503948819C003819B4ACACD5A404FEB17B3908819C0B0CAF7B6C9CD5A40720CBEE1828819C0
551	4	A.2.4	0103000020E61000000100000005000000F5CE0262C9CD5A403615752E868819C039D30D0DC9CD5A40FA1D2C7B898819C08C89B1A0C9CD5A4038BDF253978819C04885A6F5C9CD5A4044548503948819C0F5CE0262C9CD5A403615752E868819C0
552	4	A.2.5	0103000020E6100000010000000500000039D30D0DC9CD5A40FA1D2C7B898819C07ED718B8C8CD5A40BE26E3C78C8819C0D18DBC4BC9CD5A402D2660A49A8819C08C89B1A0C9CD5A4038BDF253978819C039D30D0DC9CD5A40FA1D2C7B898819C0
553	4	A.2.6	0103000020E610000001000000050000007ED718B8C8CD5A40BE26E3C78C8819C0C2DB2363C8CD5A40812F9A14908819C01592C7F6C8CD5A40218FCDF49D8819C0D18DBC4BC9CD5A402D2660A49A8819C07ED718B8C8CD5A40BE26E3C78C8819C0
554	4	A.2.7	0103000020E61000000100000005000000C2DB2363C8CD5A40812F9A14908819C007E02E0EC8CD5A4045385161938819C05A96D2A1C8CD5A4016F83A45A18819C01592C7F6C8CD5A40218FCDF49D8819C0C2DB2363C8CD5A40812F9A14908819C0
555	4	A.2.8	0103000020E6100000010000000500000007E02E0EC8CD5A4045385161938819C04CE439B9C7CD5A40094108AE968819C09F9ADD4CC8CD5A400A61A895A48819C05A96D2A1C8CD5A4016F83A45A18819C007E02E0EC8CD5A4045385161938819C0
556	4	A.2.9	0103000020E610000001000000050000004CE439B9C7CD5A40094108AE968819C090E84464C7CD5A40CD49BFFA998819C0E39EE8F7C7CD5A40FFC915E6A78819C09F9ADD4CC8CD5A400A61A895A48819C04CE439B9C7CD5A40094108AE968819C0
557	4	A.2.10	0103000020E6100000010000000500000090E84464C7CD5A40CD49BFFA998819C0D5EC4F0FC7CD5A40915276479D8819C028A3F3A2C7CD5A40F4328336AB8819C0E39EE8F7C7CD5A40FFC915E6A78819C090E84464C7CD5A40CD49BFFA998819C0
558	4	A.2.11	0103000020E61000000100000005000000D5EC4F0FC7CD5A40915276479D8819C019F15ABAC6CD5A40555B2D94A08819C06CA7FE4DC7CD5A40E89BF086AE8819C028A3F3A2C7CD5A40F4328336AB8819C0D5EC4F0FC7CD5A40915276479D8819C0
559	4	A.2.12	0103000020E6100000010000000500000019F15ABAC6CD5A40555B2D94A08819C05EF56565C6CD5A401964E4E0A38819C0B1AB09F9C6CD5A40DD045ED7B18819C06CA7FE4DC7CD5A40E89BF086AE8819C019F15ABAC6CD5A40555B2D94A08819C0
560	4	A.2.13	0103000020E610000001000000050000005EF56565C6CD5A401964E4E0A38819C0A2F97010C6CD5A40DD6C9B2DA78819C0F5AF14A4C6CD5A40D16DCB27B58819C0B1AB09F9C6CD5A40DD045ED7B18819C05EF56565C6CD5A401964E4E0A38819C0
561	4	A.2.14	0103000020E61000000100000005000000A2F97010C6CD5A40DD6C9B2DA78819C0E7FD7BBBC5CD5A40A175527AAA8819C03AB41F4FC6CD5A40C6D63878B88819C0F5AF14A4C6CD5A40D16DCB27B58819C0A2F97010C6CD5A40DD6C9B2DA78819C0
562	4	A.2.15	0103000020E61000000100000005000000E7FD7BBBC5CD5A40A175527AAA8819C02C028766C5CD5A40657E09C7AD8819C07FB82AFAC5CD5A40BA3FA6C8BB8819C03AB41F4FC6CD5A40C6D63878B88819C0E7FD7BBBC5CD5A40A175527AAA8819C0
563	4	A.2.16	0103000020E610000001000000050000002C028766C5CD5A40657E09C7AD8819C070069211C5CD5A402987C013B18819C0C3BC35A5C5CD5A40AFA81319BF8819C07FB82AFAC5CD5A40BA3FA6C8BB8819C02C028766C5CD5A40657E09C7AD8819C0
564	4	A.2.17	0103000020E6100000010000000500000070069211C5CD5A402987C013B18819C0B50A9DBCC4CD5A40ED8F7760B48819C008C14050C5CD5A40A3118169C28819C0C3BC35A5C5CD5A40AFA81319BF8819C070069211C5CD5A402987C013B18819C0
565	4	A.2.18	0103000020E61000000100000005000000B50A9DBCC4CD5A40ED8F7760B48819C0F90EA867C4CD5A40B0982EADB78819C04CC54BFBC4CD5A40987AEEB9C58819C008C14050C5CD5A40A3118169C28819C0B50A9DBCC4CD5A40ED8F7760B48819C0
566	4	A.2.19	0103000020E61000000100000005000000F90EA867C4CD5A40B0982EADB78819C03E13B312C4CD5A4074A1E5F9BA8819C091C956A6C4CD5A408DE35B0AC98819C04CC54BFBC4CD5A40987AEEB9C58819C0F90EA867C4CD5A40B0982EADB78819C0
567	4	A.2.20	0103000020E610000001000000050000003E13B312C4CD5A4074A1E5F9BA8819C08217BEBDC3CD5A4038AA9C46BE8819C0D5CD6151C4CD5A40814CC95ACC8819C091C956A6C4CD5A408DE35B0AC98819C03E13B312C4CD5A4074A1E5F9BA8819C0
568	4	A.2.21	0103000020E610000001000000050000008217BEBDC3CD5A4038AA9C46BE8819C0C71BC968C3CD5A40FCB25393C18819C01AD26CFCC3CD5A4076B536ABCF8819C0D5CD6151C4CD5A40814CC95ACC8819C08217BEBDC3CD5A4038AA9C46BE8819C0
569	4	A.2.22	0103000020E61000000100000005000000C71BC968C3CD5A40FCB25393C18819C00C20D413C3CD5A40C0BB0AE0C48819C05FD677A7C3CD5A406A1EA4FBD28819C01AD26CFCC3CD5A4076B536ABCF8819C0C71BC968C3CD5A40FCB25393C18819C0
570	4	A.2.23	0103000020E610000001000000050000000C20D413C3CD5A40C0BB0AE0C48819C05024DFBEC2CD5A4084C4C12CC88819C0A3DA8252C3CD5A405F87114CD68819C05FD677A7C3CD5A406A1EA4FBD28819C00C20D413C3CD5A40C0BB0AE0C48819C0
571	4	A.2.24	0103000020E610000001000000050000005024DFBEC2CD5A4084C4C12CC88819C09528EA69C2CD5A4048CD7879CB8819C0E8DE8DFDC2CD5A4053F07E9CD98819C0A3DA8252C3CD5A405F87114CD68819C05024DFBEC2CD5A4084C4C12CC88819C0
572	4	A.2.25	0103000020E610000001000000050000009528EA69C2CD5A4048CD7879CB8819C0D92CF514C2CD5A400CD62FC6CE8819C02CE398A8C2CD5A404859ECECDC8819C0E8DE8DFDC2CD5A4053F07E9CD98819C09528EA69C2CD5A4048CD7879CB8819C0
573	4	A.2.26	0103000020E61000000100000005000000D92CF514C2CD5A400CD62FC6CE8819C01E3100C0C1CD5A40D0DEE612D28819C071E7A353C2CD5A403CC2593DE08819C02CE398A8C2CD5A404859ECECDC8819C0D92CF514C2CD5A400CD62FC6CE8819C0
574	4	A.2.27	0103000020E610000001000000050000001E3100C0C1CD5A40D0DEE612D28819C063350B6BC1CD5A4094E79D5FD58819C0B6EBAEFEC1CD5A40312BC78DE38819C071E7A353C2CD5A403CC2593DE08819C01E3100C0C1CD5A40D0DEE612D28819C0
575	4	A.2.28	0103000020E6100000010000000500000063350B6BC1CD5A4094E79D5FD58819C0A7391616C1CD5A4058F054ACD88819C0FAEFB9A9C1CD5A40259434DEE68819C0B6EBAEFEC1CD5A40312BC78DE38819C063350B6BC1CD5A4094E79D5FD58819C0
576	4	A.2.29	0103000020E61000000100000005000000A7391616C1CD5A4058F054ACD88819C0EC3D21C1C0CD5A401CF90BF9DB8819C03FF4C454C1CD5A401AFDA12EEA8819C0FAEFB9A9C1CD5A40259434DEE68819C0A7391616C1CD5A4058F054ACD88819C0
577	4	A.2.30	0103000020E61000000100000005000000EC3D21C1C0CD5A401CF90BF9DB8819C030422C6CC0CD5A40DF01C345DF8819C083F8CFFFC0CD5A400F660F7FED8819C03FF4C454C1CD5A401AFDA12EEA8819C0EC3D21C1C0CD5A401CF90BF9DB8819C0
578	4	A.2.31	0103000020E6100000010000000500000030422C6CC0CD5A40DF01C345DF8819C075463717C0CD5A40A30A7A92E28819C0C8FCDAAAC0CD5A4003CF7CCFF08819C083F8CFFFC0CD5A400F660F7FED8819C030422C6CC0CD5A40DF01C345DF8819C0
579	4	A.2.32	0103000020E6100000010000000500000075463717C0CD5A40A30A7A92E28819C0B94A42C2BFCD5A40671331DFE58819C00C01E655C0CD5A40F837EA1FF48819C0C8FCDAAAC0CD5A4003CF7CCFF08819C075463717C0CD5A40A30A7A92E28819C0
580	4	A.2.33	0103000020E61000000100000005000000B94A42C2BFCD5A40671331DFE58819C0FE4E4D6DBFCD5A402B1CE82BE98819C05105F100C0CD5A40ECA05770F78819C00C01E655C0CD5A40F837EA1FF48819C0B94A42C2BFCD5A40671331DFE58819C0
581	4	A.2.34	0103000020E61000000100000005000000FE4E4D6DBFCD5A402B1CE82BE98819C043535818BFCD5A40EF249F78EC8819C09609FCABBFCD5A40E109C5C0FA8819C05105F100C0CD5A40ECA05770F78819C0FE4E4D6DBFCD5A402B1CE82BE98819C0
582	4	A.2.35	0103000020E6100000010000000500000043535818BFCD5A40EF249F78EC8819C0875763C3BECD5A40B32D56C5EF8819C0DA0D0757BFCD5A40D5723211FE8819C09609FCABBFCD5A40E109C5C0FA8819C043535818BFCD5A40EF249F78EC8819C0
583	4	A.2.36	0103000020E61000000100000005000000875763C3BECD5A40B32D56C5EF8819C0CC5B6E6EBECD5A4077360D12F38819C01F121202BFCD5A40CADB9F61018919C0DA0D0757BFCD5A40D5723211FE8819C0875763C3BECD5A40B32D56C5EF8819C0
584	4	A.2.37	0103000020E61000000100000005000000CC5B6E6EBECD5A4077360D12F38819C010607919BECD5A403B3FC45EF68819C063161DADBECD5A40BE440DB2048919C01F121202BFCD5A40CADB9F61018919C0CC5B6E6EBECD5A4077360D12F38819C0
585	4	A.2.38	0103000020E6100000010000000500000010607919BECD5A403B3FC45EF68819C0556484C4BDCD5A40FF477BABF98819C0A81A2858BECD5A40B3AD7A02088919C063161DADBECD5A40BE440DB2048919C010607919BECD5A403B3FC45EF68819C0
586	4	A.2.39	0103000020E61000000100000005000000556484C4BDCD5A40FF477BABF98819C099688F6FBDCD5A40C35032F8FC8819C0EC1E3303BECD5A40A816E8520B8919C0A81A2858BECD5A40B3AD7A02088919C0556484C4BDCD5A40FF477BABF98819C0
587	4	A.2.40	0103000020E6100000010000000500000099688F6FBDCD5A40C35032F8FC8819C0DE6C9A1ABDCD5A408759E944008919C031233EAEBDCD5A409C7F55A30E8919C0EC1E3303BECD5A40A816E8520B8919C099688F6FBDCD5A40C35032F8FC8819C0
588	4	A.2.41	0103000020E61000000100000005000000DE6C9A1ABDCD5A408759E944008919C02371A5C5BCCD5A404B62A091038919C076274959BDCD5A4091E8C2F3118919C031233EAEBDCD5A409C7F55A30E8919C0DE6C9A1ABDCD5A408759E944008919C0
589	4	A.2.42	0103000020E610000001000000050000002371A5C5BCCD5A404B62A091038919C06775B070BCCD5A400E6B57DE068919C0BA2B5404BDCD5A4085513044158919C076274959BDCD5A4091E8C2F3118919C02371A5C5BCCD5A404B62A091038919C0
590	4	A.2.43	0103000020E610000001000000050000006775B070BCCD5A400E6B57DE068919C0AC79BB1BBCCD5A40D2730E2B0A8919C0FF2F5FAFBCCD5A407ABA9D94188919C0BA2B5404BDCD5A4085513044158919C06775B070BCCD5A400E6B57DE068919C0
591	4	A.2.44	0103000020E61000000100000005000000AC79BB1BBCCD5A40D2730E2B0A8919C0F07DC6C6BBCD5A40967CC5770D8919C043346A5ABCCD5A406E230BE51B8919C0FF2F5FAFBCCD5A407ABA9D94188919C0AC79BB1BBCCD5A40D2730E2B0A8919C0
592	4	A.2.45	0103000020E61000000100000005000000F07DC6C6BBCD5A40967CC5770D8919C03582D171BBCD5A405A857CC4108919C088387505BCCD5A40638C78351F8919C043346A5ABCCD5A406E230BE51B8919C0F07DC6C6BBCD5A40967CC5770D8919C0
593	4	A.2.46	0103000020E610000001000000050000003582D171BBCD5A405A857CC4108919C07986DC1CBBCD5A401E8E3311148919C0CC3C80B0BBCD5A4057F5E585228919C088387505BCCD5A40638C78351F8919C03582D171BBCD5A405A857CC4108919C0
594	4	A.2.47	0103000020E610000001000000050000007986DC1CBBCD5A401E8E3311148919C0BE8AE7C7BACD5A40E296EA5D178919C011418B5BBBCD5A404C5E53D6258919C0CC3C80B0BBCD5A4057F5E585228919C07986DC1CBBCD5A401E8E3311148919C0
595	4	A.3.1	0103000020E610000001000000050000007A7885F4CACD5A4066193D128A8819C0BF7C909FCACD5A405B82AA628D8819C012333433CBCD5A4007014E309B8819C0CD2E2988CBCD5A40E2372ADC978819C07A7885F4CACD5A4066193D128A8819C0
596	4	A.3.2	0103000020E61000000100000005000000BF7C909FCACD5A405B82AA628D8819C003819B4ACACD5A404FEB17B3908819C056373FDECACD5A402CCA71849E8819C012333433CBCD5A4007014E309B8819C0BF7C909FCACD5A405B82AA628D8819C0
597	4	A.3.3	0103000020E6100000010000000500000003819B4ACACD5A404FEB17B3908819C04885A6F5C9CD5A4044548503948819C09B3B4A89CACD5A40519395D8A18819C056373FDECACD5A402CCA71849E8819C003819B4ACACD5A404FEB17B3908819C0
598	4	A.3.4	0103000020E610000001000000050000004885A6F5C9CD5A4044548503948819C08C89B1A0C9CD5A4038BDF253978819C0DF3F5534CACD5A40765CB92CA58819C09B3B4A89CACD5A40519395D8A18819C04885A6F5C9CD5A4044548503948819C0
599	4	A.3.5	0103000020E610000001000000050000008C89B1A0C9CD5A4038BDF253978819C0D18DBC4BC9CD5A402D2660A49A8819C0244460DFC9CD5A409B25DD80A88819C0DF3F5534CACD5A40765CB92CA58819C08C89B1A0C9CD5A4038BDF253978819C0
600	4	A.3.6	0103000020E61000000100000005000000D18DBC4BC9CD5A402D2660A49A8819C01592C7F6C8CD5A40218FCDF49D8819C068486B8AC9CD5A40C0EE00D5AB8819C0244460DFC9CD5A409B25DD80A88819C0D18DBC4BC9CD5A402D2660A49A8819C0
601	4	A.3.7	0103000020E610000001000000050000001592C7F6C8CD5A40218FCDF49D8819C05A96D2A1C8CD5A4016F83A45A18819C0AD4C7635C9CD5A40E5B72429AF8819C068486B8AC9CD5A40C0EE00D5AB8819C01592C7F6C8CD5A40218FCDF49D8819C0
602	4	A.3.8	0103000020E610000001000000050000005A96D2A1C8CD5A4016F83A45A18819C09F9ADD4CC8CD5A400A61A895A48819C0F25081E0C8CD5A400981487DB28819C0AD4C7635C9CD5A40E5B72429AF8819C05A96D2A1C8CD5A4016F83A45A18819C0
603	4	A.3.9	0103000020E610000001000000050000009F9ADD4CC8CD5A400A61A895A48819C0E39EE8F7C7CD5A40FFC915E6A78819C036558C8BC8CD5A402E4A6CD1B58819C0F25081E0C8CD5A400981487DB28819C09F9ADD4CC8CD5A400A61A895A48819C0
604	4	A.3.10	0103000020E61000000100000005000000E39EE8F7C7CD5A40FFC915E6A78819C028A3F3A2C7CD5A40F4328336AB8819C07B599736C8CD5A4053139025B98819C036558C8BC8CD5A402E4A6CD1B58819C0E39EE8F7C7CD5A40FFC915E6A78819C0
605	4	A.3.11	0103000020E6100000010000000500000028A3F3A2C7CD5A40F4328336AB8819C06CA7FE4DC7CD5A40E89BF086AE8819C0BF5DA2E1C7CD5A4078DCB379BC8819C07B599736C8CD5A4053139025B98819C028A3F3A2C7CD5A40F4328336AB8819C0
606	4	A.3.12	0103000020E610000001000000050000006CA7FE4DC7CD5A40E89BF086AE8819C0B1AB09F9C6CD5A40DD045ED7B18819C00462AD8CC7CD5A409DA5D7CDBF8819C0BF5DA2E1C7CD5A4078DCB379BC8819C06CA7FE4DC7CD5A40E89BF086AE8819C0
607	4	A.3.13	0103000020E61000000100000005000000B1AB09F9C6CD5A40DD045ED7B18819C0F5AF14A4C6CD5A40D16DCB27B58819C04866B837C7CD5A40C26EFB21C38819C00462AD8CC7CD5A409DA5D7CDBF8819C0B1AB09F9C6CD5A40DD045ED7B18819C0
608	4	A.3.14	0103000020E61000000100000005000000F5AF14A4C6CD5A40D16DCB27B58819C03AB41F4FC6CD5A40C6D63878B88819C08D6AC3E2C6CD5A40E7371F76C68819C04866B837C7CD5A40C26EFB21C38819C0F5AF14A4C6CD5A40D16DCB27B58819C0
609	4	A.3.15	0103000020E610000001000000050000003AB41F4FC6CD5A40C6D63878B88819C07FB82AFAC5CD5A40BA3FA6C8BB8819C0D26ECE8DC6CD5A400C0143CAC98819C08D6AC3E2C6CD5A40E7371F76C68819C03AB41F4FC6CD5A40C6D63878B88819C0
610	4	A.3.16	0103000020E610000001000000050000007FB82AFAC5CD5A40BA3FA6C8BB8819C0C3BC35A5C5CD5A40AFA81319BF8819C01673D938C6CD5A4031CA661ECD8819C0D26ECE8DC6CD5A400C0143CAC98819C07FB82AFAC5CD5A40BA3FA6C8BB8819C0
611	4	A.3.17	0103000020E61000000100000005000000C3BC35A5C5CD5A40AFA81319BF8819C008C14050C5CD5A40A3118169C28819C05B77E4E3C5CD5A4056938A72D08819C01673D938C6CD5A4031CA661ECD8819C0C3BC35A5C5CD5A40AFA81319BF8819C0
612	4	A.3.18	0103000020E6100000010000000500000008C14050C5CD5A40A3118169C28819C04CC54BFBC4CD5A40987AEEB9C58819C09F7BEF8EC5CD5A407B5CAEC6D38819C05B77E4E3C5CD5A4056938A72D08819C008C14050C5CD5A40A3118169C28819C0
613	4	A.3.19	0103000020E610000001000000050000004CC54BFBC4CD5A40987AEEB9C58819C091C956A6C4CD5A408DE35B0AC98819C0E47FFA39C5CD5A40A025D21AD78819C09F7BEF8EC5CD5A407B5CAEC6D38819C04CC54BFBC4CD5A40987AEEB9C58819C0
614	4	A.3.20	0103000020E6100000010000000500000091C956A6C4CD5A408DE35B0AC98819C0D5CD6151C4CD5A40814CC95ACC8819C0288405E5C4CD5A40C5EEF56EDA8819C0E47FFA39C5CD5A40A025D21AD78819C091C956A6C4CD5A408DE35B0AC98819C0
615	4	A.3.21	0103000020E61000000100000005000000D5CD6151C4CD5A40814CC95ACC8819C01AD26CFCC3CD5A4076B536ABCF8819C06D881090C4CD5A40EAB719C3DD8819C0288405E5C4CD5A40C5EEF56EDA8819C0D5CD6151C4CD5A40814CC95ACC8819C0
616	4	A.3.22	0103000020E610000001000000050000001AD26CFCC3CD5A4076B536ABCF8819C05FD677A7C3CD5A406A1EA4FBD28819C0B28C1B3BC4CD5A400F813D17E18819C06D881090C4CD5A40EAB719C3DD8819C01AD26CFCC3CD5A4076B536ABCF8819C0
617	4	A.3.23	0103000020E610000001000000050000005FD677A7C3CD5A406A1EA4FBD28819C0A3DA8252C3CD5A405F87114CD68819C0F69026E6C3CD5A40344A616BE48819C0B28C1B3BC4CD5A400F813D17E18819C05FD677A7C3CD5A406A1EA4FBD28819C0
618	4	A.3.24	0103000020E61000000100000005000000A3DA8252C3CD5A405F87114CD68819C0E8DE8DFDC2CD5A4053F07E9CD98819C03B953191C3CD5A40581385BFE78819C0F69026E6C3CD5A40344A616BE48819C0A3DA8252C3CD5A405F87114CD68819C0
619	4	A.3.25	0103000020E61000000100000005000000E8DE8DFDC2CD5A4053F07E9CD98819C02CE398A8C2CD5A404859ECECDC8819C07F993C3CC3CD5A407DDCA813EB8819C03B953191C3CD5A40581385BFE78819C0E8DE8DFDC2CD5A4053F07E9CD98819C0
620	4	A.3.26	0103000020E610000001000000050000002CE398A8C2CD5A404859ECECDC8819C071E7A353C2CD5A403CC2593DE08819C0C49D47E7C2CD5A40A2A5CC67EE8819C07F993C3CC3CD5A407DDCA813EB8819C02CE398A8C2CD5A404859ECECDC8819C0
621	4	A.3.27	0103000020E6100000010000000500000071E7A353C2CD5A403CC2593DE08819C0B6EBAEFEC1CD5A40312BC78DE38819C009A25292C2CD5A40C76EF0BBF18819C0C49D47E7C2CD5A40A2A5CC67EE8819C071E7A353C2CD5A403CC2593DE08819C0
622	4	A.3.28	0103000020E61000000100000005000000B6EBAEFEC1CD5A40312BC78DE38819C0FAEFB9A9C1CD5A40259434DEE68819C04DA65D3DC2CD5A40EC371410F58819C009A25292C2CD5A40C76EF0BBF18819C0B6EBAEFEC1CD5A40312BC78DE38819C0
623	4	A.3.29	0103000020E61000000100000005000000FAEFB9A9C1CD5A40259434DEE68819C03FF4C454C1CD5A401AFDA12EEA8819C092AA68E8C1CD5A4011013864F88819C04DA65D3DC2CD5A40EC371410F58819C0FAEFB9A9C1CD5A40259434DEE68819C0
624	4	A.3.30	0103000020E610000001000000050000003FF4C454C1CD5A401AFDA12EEA8819C083F8CFFFC0CD5A400F660F7FED8819C0D6AE7393C1CD5A4036CA5BB8FB8819C092AA68E8C1CD5A4011013864F88819C03FF4C454C1CD5A401AFDA12EEA8819C0
625	4	A.3.31	0103000020E6100000010000000500000083F8CFFFC0CD5A400F660F7FED8819C0C8FCDAAAC0CD5A4003CF7CCFF08819C01BB37E3EC1CD5A405B937F0CFF8819C0D6AE7393C1CD5A4036CA5BB8FB8819C083F8CFFFC0CD5A400F660F7FED8819C0
626	4	A.3.32	0103000020E61000000100000005000000C8FCDAAAC0CD5A4003CF7CCFF08819C00C01E655C0CD5A40F837EA1FF48819C05FB789E9C0CD5A40805CA360028919C01BB37E3EC1CD5A405B937F0CFF8819C0C8FCDAAAC0CD5A4003CF7CCFF08819C0
627	4	A.3.33	0103000020E610000001000000050000000C01E655C0CD5A40F837EA1FF48819C05105F100C0CD5A40ECA05770F78819C0A4BB9494C0CD5A40A525C7B4058919C05FB789E9C0CD5A40805CA360028919C00C01E655C0CD5A40F837EA1FF48819C0
628	4	A.3.34	0103000020E610000001000000050000005105F100C0CD5A40ECA05770F78819C09609FCABBFCD5A40E109C5C0FA8819C0E9BF9F3FC0CD5A40CAEEEA08098919C0A4BB9494C0CD5A40A525C7B4058919C05105F100C0CD5A40ECA05770F78819C0
629	4	A.3.35	0103000020E610000001000000050000009609FCABBFCD5A40E109C5C0FA8819C0DA0D0757BFCD5A40D5723211FE8819C02DC4AAEABFCD5A40EFB70E5D0C8919C0E9BF9F3FC0CD5A40CAEEEA08098919C09609FCABBFCD5A40E109C5C0FA8819C0
630	4	A.3.36	0103000020E61000000100000005000000DA0D0757BFCD5A40D5723211FE8819C01F121202BFCD5A40CADB9F61018919C072C8B595BFCD5A40148132B10F8919C02DC4AAEABFCD5A40EFB70E5D0C8919C0DA0D0757BFCD5A40D5723211FE8819C0
631	4	A.3.37	0103000020E610000001000000050000001F121202BFCD5A40CADB9F61018919C063161DADBECD5A40BE440DB2048919C0B6CCC040BFCD5A40394A5605138919C072C8B595BFCD5A40148132B10F8919C01F121202BFCD5A40CADB9F61018919C0
632	4	A.3.38	0103000020E6100000010000000500000063161DADBECD5A40BE440DB2048919C0A81A2858BECD5A40B3AD7A02088919C0FBD0CBEBBECD5A405E137A59168919C0B6CCC040BFCD5A40394A5605138919C063161DADBECD5A40BE440DB2048919C0
633	4	A.3.39	0103000020E61000000100000005000000A81A2858BECD5A40B3AD7A02088919C0EC1E3303BECD5A40A816E8520B8919C03FD5D696BECD5A4083DC9DAD198919C0FBD0CBEBBECD5A405E137A59168919C0A81A2858BECD5A40B3AD7A02088919C0
634	4	A.3.40	0103000020E61000000100000005000000EC1E3303BECD5A40A816E8520B8919C031233EAEBDCD5A409C7F55A30E8919C084D9E141BECD5A40A7A5C1011D8919C03FD5D696BECD5A4083DC9DAD198919C0EC1E3303BECD5A40A816E8520B8919C0
635	4	A.3.41	0103000020E6100000010000000500000031233EAEBDCD5A409C7F55A30E8919C076274959BDCD5A4091E8C2F3118919C0C9DDECECBDCD5A40CC6EE555208919C084D9E141BECD5A40A7A5C1011D8919C031233EAEBDCD5A409C7F55A30E8919C0
636	4	A.3.42	0103000020E6100000010000000500000076274959BDCD5A4091E8C2F3118919C0BA2B5404BDCD5A4085513044158919C00DE2F797BDCD5A40F13709AA238919C0C9DDECECBDCD5A40CC6EE555208919C076274959BDCD5A4091E8C2F3118919C0
637	4	A.3.43	0103000020E61000000100000005000000BA2B5404BDCD5A4085513044158919C0FF2F5FAFBCCD5A407ABA9D94188919C052E60243BDCD5A4016012DFE268919C00DE2F797BDCD5A40F13709AA238919C0BA2B5404BDCD5A4085513044158919C0
638	4	A.3.44	0103000020E61000000100000005000000FF2F5FAFBCCD5A407ABA9D94188919C043346A5ABCCD5A406E230BE51B8919C096EA0DEEBCCD5A403BCA50522A8919C052E60243BDCD5A4016012DFE268919C0FF2F5FAFBCCD5A407ABA9D94188919C0
639	4	A.3.45	0103000020E6100000010000000500000043346A5ABCCD5A406E230BE51B8919C088387505BCCD5A40638C78351F8919C0DBEE1899BCCD5A40609374A62D8919C096EA0DEEBCCD5A403BCA50522A8919C043346A5ABCCD5A406E230BE51B8919C0
640	4	A.3.46	0103000020E6100000010000000500000088387505BCCD5A40638C78351F8919C0CC3C80B0BBCD5A4057F5E585228919C01FF32344BCCD5A40855C98FA308919C0DBEE1899BCCD5A40609374A62D8919C088387505BCCD5A40638C78351F8919C0
641	4	A.3.47	0103000020E61000000100000005000000CC3C80B0BBCD5A4057F5E585228919C011418B5BBBCD5A404C5E53D6258919C064F72EEFBBCD5A40AA25BC4E348919C01FF32344BCCD5A40855C98FA308919C0CC3C80B0BBCD5A4057F5E585228919C0
642	4	A.4.1	0103000020E61000000100000005000000CD2E2988CBCD5A40E2372ADC978819C012333433CBCD5A4007014E309B8819C066E9D7C6CBCD5A40B47FF1FDA88819C021E5CC1BCCCD5A405E5617A6A58819C0CD2E2988CBCD5A40E2372ADC978819C0
643	4	A.4.2	0103000020E6100000010000000500000012333433CBCD5A4007014E309B8819C056373FDECACD5A402CCA71849E8819C0AAEDE271CBCD5A400AA9CB55AC8819C066E9D7C6CBCD5A40B47FF1FDA88819C012333433CBCD5A4007014E309B8819C0
644	4	A.4.3	0103000020E6100000010000000500000056373FDECACD5A402CCA71849E8819C09B3B4A89CACD5A40519395D8A18819C0EFF1ED1CCBCD5A405FD2A5ADAF8819C0AAEDE271CBCD5A400AA9CB55AC8819C056373FDECACD5A402CCA71849E8819C0
645	4	A.4.4	0103000020E610000001000000050000009B3B4A89CACD5A40519395D8A18819C0DF3F5534CACD5A40765CB92CA58819C033F6F8C7CACD5A40B5FB7F05B38819C0EFF1ED1CCBCD5A405FD2A5ADAF8819C09B3B4A89CACD5A40519395D8A18819C0
646	4	A.4.5	0103000020E61000000100000005000000DF3F5534CACD5A40765CB92CA58819C0244460DFC9CD5A409B25DD80A88819C078FA0373CACD5A400B255A5DB68819C033F6F8C7CACD5A40B5FB7F05B38819C0DF3F5534CACD5A40765CB92CA58819C0
647	4	A.4.6	0103000020E61000000100000005000000244460DFC9CD5A409B25DD80A88819C068486B8AC9CD5A40C0EE00D5AB8819C0BCFE0E1ECACD5A40614E34B5B98819C078FA0373CACD5A400B255A5DB68819C0244460DFC9CD5A409B25DD80A88819C0
648	4	A.4.7	0103000020E6100000010000000500000068486B8AC9CD5A40C0EE00D5AB8819C0AD4C7635C9CD5A40E5B72429AF8819C001031AC9C9CD5A40B7770E0DBD8819C0BCFE0E1ECACD5A40614E34B5B98819C068486B8AC9CD5A40C0EE00D5AB8819C0
649	4	A.4.8	0103000020E61000000100000005000000AD4C7635C9CD5A40E5B72429AF8819C0F25081E0C8CD5A400981487DB28819C045072574C9CD5A400CA1E864C08819C001031AC9C9CD5A40B7770E0DBD8819C0AD4C7635C9CD5A40E5B72429AF8819C0
650	4	A.4.9	0103000020E61000000100000005000000F25081E0C8CD5A400981487DB28819C036558C8BC8CD5A402E4A6CD1B58819C08A0B301FC9CD5A4062CAC2BCC38819C045072574C9CD5A400CA1E864C08819C0F25081E0C8CD5A400981487DB28819C0
651	4	A.4.10	0103000020E6100000010000000500000036558C8BC8CD5A402E4A6CD1B58819C07B599736C8CD5A4053139025B98819C0CF0F3BCAC8CD5A40B8F39C14C78819C08A0B301FC9CD5A4062CAC2BCC38819C036558C8BC8CD5A402E4A6CD1B58819C0
652	4	A.4.11	0103000020E610000001000000050000007B599736C8CD5A4053139025B98819C0BF5DA2E1C7CD5A4078DCB379BC8819C013144675C8CD5A400E1D776CCA8819C0CF0F3BCAC8CD5A40B8F39C14C78819C07B599736C8CD5A4053139025B98819C0
653	4	A.4.12	0103000020E61000000100000005000000BF5DA2E1C7CD5A4078DCB379BC8819C00462AD8CC7CD5A409DA5D7CDBF8819C058185120C8CD5A40644651C4CD8819C013144675C8CD5A400E1D776CCA8819C0BF5DA2E1C7CD5A4078DCB379BC8819C0
654	4	A.4.13	0103000020E610000001000000050000000462AD8CC7CD5A409DA5D7CDBF8819C04866B837C7CD5A40C26EFB21C38819C09C1C5CCBC7CD5A40BA6F2B1CD18819C058185120C8CD5A40644651C4CD8819C00462AD8CC7CD5A409DA5D7CDBF8819C0
655	4	A.4.14	0103000020E610000001000000050000004866B837C7CD5A40C26EFB21C38819C08D6AC3E2C6CD5A40E7371F76C68819C0E1206776C7CD5A400F990574D48819C09C1C5CCBC7CD5A40BA6F2B1CD18819C04866B837C7CD5A40C26EFB21C38819C0
656	4	A.4.15	0103000020E610000001000000050000008D6AC3E2C6CD5A40E7371F76C68819C0D26ECE8DC6CD5A400C0143CAC98819C025257221C7CD5A4065C2DFCBD78819C0E1206776C7CD5A400F990574D48819C08D6AC3E2C6CD5A40E7371F76C68819C0
657	4	A.4.16	0103000020E61000000100000005000000D26ECE8DC6CD5A400C0143CAC98819C01673D938C6CD5A4031CA661ECD8819C06A297DCCC6CD5A40BBEBB923DB8819C025257221C7CD5A4065C2DFCBD78819C0D26ECE8DC6CD5A400C0143CAC98819C0
658	4	A.4.17	0103000020E610000001000000050000001673D938C6CD5A4031CA661ECD8819C05B77E4E3C5CD5A4056938A72D08819C0AE2D8877C6CD5A401115947BDE8819C06A297DCCC6CD5A40BBEBB923DB8819C01673D938C6CD5A4031CA661ECD8819C0
659	4	A.4.18	0103000020E610000001000000050000005B77E4E3C5CD5A4056938A72D08819C09F7BEF8EC5CD5A407B5CAEC6D38819C0F3319322C6CD5A40673E6ED3E18819C0AE2D8877C6CD5A401115947BDE8819C05B77E4E3C5CD5A4056938A72D08819C0
660	4	A.4.19	0103000020E610000001000000050000009F7BEF8EC5CD5A407B5CAEC6D38819C0E47FFA39C5CD5A40A025D21AD78819C038369ECDC5CD5A40BC67482BE58819C0F3319322C6CD5A40673E6ED3E18819C09F7BEF8EC5CD5A407B5CAEC6D38819C0
661	4	A.4.20	0103000020E61000000100000005000000E47FFA39C5CD5A40A025D21AD78819C0288405E5C4CD5A40C5EEF56EDA8819C07C3AA978C5CD5A4012912283E88819C038369ECDC5CD5A40BC67482BE58819C0E47FFA39C5CD5A40A025D21AD78819C0
662	4	A.4.21	0103000020E61000000100000005000000288405E5C4CD5A40C5EEF56EDA8819C06D881090C4CD5A40EAB719C3DD8819C0C13EB423C5CD5A4068BAFCDAEB8819C07C3AA978C5CD5A4012912283E88819C0288405E5C4CD5A40C5EEF56EDA8819C0
663	4	A.4.22	0103000020E610000001000000050000006D881090C4CD5A40EAB719C3DD8819C0B28C1B3BC4CD5A400F813D17E18819C00543BFCEC4CD5A40BEE3D632EF8819C0C13EB423C5CD5A4068BAFCDAEB8819C06D881090C4CD5A40EAB719C3DD8819C0
664	4	A.4.23	0103000020E61000000100000005000000B28C1B3BC4CD5A400F813D17E18819C0F69026E6C3CD5A40344A616BE48819C04A47CA79C4CD5A40140DB18AF28819C00543BFCEC4CD5A40BEE3D632EF8819C0B28C1B3BC4CD5A400F813D17E18819C0
665	4	A.4.24	0103000020E61000000100000005000000F69026E6C3CD5A40344A616BE48819C03B953191C3CD5A40581385BFE78819C08E4BD524C4CD5A4069368BE2F58819C04A47CA79C4CD5A40140DB18AF28819C0F69026E6C3CD5A40344A616BE48819C0
666	4	A.4.25	0103000020E610000001000000050000003B953191C3CD5A40581385BFE78819C07F993C3CC3CD5A407DDCA813EB8819C0D34FE0CFC3CD5A40BF5F653AF98819C08E4BD524C4CD5A4069368BE2F58819C03B953191C3CD5A40581385BFE78819C0
667	4	A.4.26	0103000020E610000001000000050000007F993C3CC3CD5A407DDCA813EB8819C0C49D47E7C2CD5A40A2A5CC67EE8819C01754EB7AC3CD5A4015893F92FC8819C0D34FE0CFC3CD5A40BF5F653AF98819C07F993C3CC3CD5A407DDCA813EB8819C0
668	4	A.4.27	0103000020E61000000100000005000000C49D47E7C2CD5A40A2A5CC67EE8819C009A25292C2CD5A40C76EF0BBF18819C05C58F625C3CD5A406BB219EAFF8819C01754EB7AC3CD5A4015893F92FC8819C0C49D47E7C2CD5A40A2A5CC67EE8819C0
669	4	A.4.28	0103000020E6100000010000000500000009A25292C2CD5A40C76EF0BBF18819C04DA65D3DC2CD5A40EC371410F58819C0A05C01D1C2CD5A40C1DBF341038919C05C58F625C3CD5A406BB219EAFF8819C009A25292C2CD5A40C76EF0BBF18819C0
670	4	A.4.29	0103000020E610000001000000050000004DA65D3DC2CD5A40EC371410F58819C092AA68E8C1CD5A4011013864F88819C0E5600C7CC2CD5A401605CE99068919C0A05C01D1C2CD5A40C1DBF341038919C04DA65D3DC2CD5A40EC371410F58819C0
671	4	A.4.30	0103000020E6100000010000000500000092AA68E8C1CD5A4011013864F88819C0D6AE7393C1CD5A4036CA5BB8FB8819C02A651727C2CD5A406C2EA8F1098919C0E5600C7CC2CD5A401605CE99068919C092AA68E8C1CD5A4011013864F88819C0
672	4	A.4.31	0103000020E61000000100000005000000D6AE7393C1CD5A4036CA5BB8FB8819C01BB37E3EC1CD5A405B937F0CFF8819C06E6922D2C1CD5A40C25782490D8919C02A651727C2CD5A406C2EA8F1098919C0D6AE7393C1CD5A4036CA5BB8FB8819C0
673	4	A.4.32	0103000020E610000001000000050000001BB37E3EC1CD5A405B937F0CFF8819C05FB789E9C0CD5A40805CA360028919C0B36D2D7DC1CD5A4018815CA1108919C06E6922D2C1CD5A40C25782490D8919C01BB37E3EC1CD5A405B937F0CFF8819C0
674	4	A.4.33	0103000020E610000001000000050000005FB789E9C0CD5A40805CA360028919C0A4BB9494C0CD5A40A525C7B4058919C0F7713828C1CD5A406EAA36F9138919C0B36D2D7DC1CD5A4018815CA1108919C05FB789E9C0CD5A40805CA360028919C0
675	4	A.4.34	0103000020E61000000100000005000000A4BB9494C0CD5A40A525C7B4058919C0E9BF9F3FC0CD5A40CAEEEA08098919C03C7643D3C0CD5A40C3D31051178919C0F7713828C1CD5A406EAA36F9138919C0A4BB9494C0CD5A40A525C7B4058919C0
676	4	A.4.35	0103000020E61000000100000005000000E9BF9F3FC0CD5A40CAEEEA08098919C02DC4AAEABFCD5A40EFB70E5D0C8919C0807A4E7EC0CD5A4019FDEAA81A8919C03C7643D3C0CD5A40C3D31051178919C0E9BF9F3FC0CD5A40CAEEEA08098919C0
677	4	A.4.36	0103000020E610000001000000050000002DC4AAEABFCD5A40EFB70E5D0C8919C072C8B595BFCD5A40148132B10F8919C0C57E5929C0CD5A406F26C5001E8919C0807A4E7EC0CD5A4019FDEAA81A8919C02DC4AAEABFCD5A40EFB70E5D0C8919C0
678	4	A.4.37	0103000020E6100000010000000500000072C8B595BFCD5A40148132B10F8919C0B6CCC040BFCD5A40394A5605138919C0098364D4BFCD5A40C54F9F58218919C0C57E5929C0CD5A406F26C5001E8919C072C8B595BFCD5A40148132B10F8919C0
679	4	A.4.38	0103000020E61000000100000005000000B6CCC040BFCD5A40394A5605138919C0FBD0CBEBBECD5A405E137A59168919C04E876F7FBFCD5A401B7979B0248919C0098364D4BFCD5A40C54F9F58218919C0B6CCC040BFCD5A40394A5605138919C0
680	4	A.4.39	0103000020E61000000100000005000000FBD0CBEBBECD5A405E137A59168919C03FD5D696BECD5A4083DC9DAD198919C0938B7A2ABFCD5A4071A25308288919C04E876F7FBFCD5A401B7979B0248919C0FBD0CBEBBECD5A405E137A59168919C0
681	4	A.4.40	0103000020E610000001000000050000003FD5D696BECD5A4083DC9DAD198919C084D9E141BECD5A40A7A5C1011D8919C0D78F85D5BECD5A40C6CB2D602B8919C0938B7A2ABFCD5A4071A25308288919C03FD5D696BECD5A4083DC9DAD198919C0
682	4	A.4.41	0103000020E6100000010000000500000084D9E141BECD5A40A7A5C1011D8919C0C9DDECECBDCD5A40CC6EE555208919C01C949080BECD5A401CF507B82E8919C0D78F85D5BECD5A40C6CB2D602B8919C084D9E141BECD5A40A7A5C1011D8919C0
683	4	A.4.42	0103000020E61000000100000005000000C9DDECECBDCD5A40CC6EE555208919C00DE2F797BDCD5A40F13709AA238919C060989B2BBECD5A40721EE20F328919C01C949080BECD5A401CF507B82E8919C0C9DDECECBDCD5A40CC6EE555208919C0
684	4	A.4.43	0103000020E610000001000000050000000DE2F797BDCD5A40F13709AA238919C052E60243BDCD5A4016012DFE268919C0A59CA6D6BDCD5A40C847BC67358919C060989B2BBECD5A40721EE20F328919C00DE2F797BDCD5A40F13709AA238919C0
685	4	A.4.44	0103000020E6100000010000000500000052E60243BDCD5A4016012DFE268919C096EA0DEEBCCD5A403BCA50522A8919C0E9A0B181BDCD5A401E7196BF388919C0A59CA6D6BDCD5A40C847BC67358919C052E60243BDCD5A4016012DFE268919C0
686	4	A.4.45	0103000020E6100000010000000500000096EA0DEEBCCD5A403BCA50522A8919C0DBEE1899BCCD5A40609374A62D8919C02EA5BC2CBDCD5A40739A70173C8919C0E9A0B181BDCD5A401E7196BF388919C096EA0DEEBCCD5A403BCA50522A8919C0
687	4	A.4.46	0103000020E61000000100000005000000DBEE1899BCCD5A40609374A62D8919C01FF32344BCCD5A40855C98FA308919C072A9C7D7BCCD5A40C9C34A6F3F8919C02EA5BC2CBDCD5A40739A70173C8919C0DBEE1899BCCD5A40609374A62D8919C0
688	4	A.4.47	0103000020E610000001000000050000001FF32344BCCD5A40855C98FA308919C064F72EEFBBCD5A40AA25BC4E348919C0B7ADD282BCCD5A401FED24C7428919C072A9C7D7BCCD5A40C9C34A6F3F8919C01FF32344BCCD5A40855C98FA308919C0
689	4	A.5.1	0103000020E6100000010000000500000021E5CC1BCCCD5A405E5617A6A58819C066E9D7C6CBCD5A40B47FF1FDA88819C0B99F7B5ACCCD5A4060FE94CBB68819C0749B70AFCCCD5A40DA740470B38819C021E5CC1BCCCD5A405E5617A6A58819C0
690	4	A.5.2	0103000020E6100000010000000500000066E9D7C6CBCD5A40B47FF1FDA88819C0AAEDE271CBCD5A400AA9CB55AC8819C0FDA38605CCCD5A40E7872527BA8819C0B99F7B5ACCCD5A4060FE94CBB68819C066E9D7C6CBCD5A40B47FF1FDA88819C0
691	4	A.5.3	0103000020E61000000100000005000000AAEDE271CBCD5A400AA9CB55AC8819C0EFF1ED1CCBCD5A405FD2A5ADAF8819C042A891B0CBCD5A406D11B682BD8819C0FDA38605CCCD5A40E7872527BA8819C0AAEDE271CBCD5A400AA9CB55AC8819C0
692	4	A.5.4	0103000020E61000000100000005000000EFF1ED1CCBCD5A405FD2A5ADAF8819C033F6F8C7CACD5A40B5FB7F05B38819C086AC9C5BCBCD5A40F49A46DEC08819C042A891B0CBCD5A406D11B682BD8819C0EFF1ED1CCBCD5A405FD2A5ADAF8819C0
693	4	A.5.5	0103000020E6100000010000000500000033F6F8C7CACD5A40B5FB7F05B38819C078FA0373CACD5A400B255A5DB68819C0CBB0A706CBCD5A407A24D739C48819C086AC9C5BCBCD5A40F49A46DEC08819C033F6F8C7CACD5A40B5FB7F05B38819C0
694	4	A.5.6	0103000020E6100000010000000500000078FA0373CACD5A400B255A5DB68819C0BCFE0E1ECACD5A40614E34B5B98819C00FB5B2B1CACD5A4001AE6795C78819C0CBB0A706CBCD5A407A24D739C48819C078FA0373CACD5A400B255A5DB68819C0
695	4	A.5.7	0103000020E61000000100000005000000BCFE0E1ECACD5A40614E34B5B98819C001031AC9C9CD5A40B7770E0DBD8819C054B9BD5CCACD5A408737F8F0CA8819C00FB5B2B1CACD5A4001AE6795C78819C0BCFE0E1ECACD5A40614E34B5B98819C0
696	4	A.5.8	0103000020E6100000010000000500000001031AC9C9CD5A40B7770E0DBD8819C045072574C9CD5A400CA1E864C08819C098BDC807CACD5A400EC1884CCE8819C054B9BD5CCACD5A408737F8F0CA8819C001031AC9C9CD5A40B7770E0DBD8819C0
697	4	A.5.9	0103000020E6100000010000000500000045072574C9CD5A400CA1E864C08819C08A0B301FC9CD5A4062CAC2BCC38819C0DDC1D3B2C9CD5A40944A19A8D18819C098BDC807CACD5A400EC1884CCE8819C045072574C9CD5A400CA1E864C08819C0
698	4	A.5.10	0103000020E610000001000000050000008A0B301FC9CD5A4062CAC2BCC38819C0CF0F3BCAC8CD5A40B8F39C14C78819C022C6DE5DC9CD5A401AD4A903D58819C0DDC1D3B2C9CD5A40944A19A8D18819C08A0B301FC9CD5A4062CAC2BCC38819C0
699	4	A.5.11	0103000020E61000000100000005000000CF0F3BCAC8CD5A40B8F39C14C78819C013144675C8CD5A400E1D776CCA8819C066CAE908C9CD5A40A15D3A5FD88819C022C6DE5DC9CD5A401AD4A903D58819C0CF0F3BCAC8CD5A40B8F39C14C78819C0
700	4	A.5.12	0103000020E6100000010000000500000013144675C8CD5A400E1D776CCA8819C058185120C8CD5A40644651C4CD8819C0ABCEF4B3C8CD5A4027E7CABADB8819C066CAE908C9CD5A40A15D3A5FD88819C013144675C8CD5A400E1D776CCA8819C0
701	4	A.5.13	0103000020E6100000010000000500000058185120C8CD5A40644651C4CD8819C09C1C5CCBC7CD5A40BA6F2B1CD18819C0EFD2FF5EC8CD5A40AE705B16DF8819C0ABCEF4B3C8CD5A4027E7CABADB8819C058185120C8CD5A40644651C4CD8819C0
702	4	A.5.14	0103000020E610000001000000050000009C1C5CCBC7CD5A40BA6F2B1CD18819C0E1206776C7CD5A400F990574D48819C034D70A0AC8CD5A4034FAEB71E28819C0EFD2FF5EC8CD5A40AE705B16DF8819C09C1C5CCBC7CD5A40BA6F2B1CD18819C0
703	4	A.5.15	0103000020E61000000100000005000000E1206776C7CD5A400F990574D48819C025257221C7CD5A4065C2DFCBD78819C078DB15B5C7CD5A40BB837CCDE58819C034D70A0AC8CD5A4034FAEB71E28819C0E1206776C7CD5A400F990574D48819C0
704	4	A.5.16	0103000020E6100000010000000500000025257221C7CD5A4065C2DFCBD78819C06A297DCCC6CD5A40BBEBB923DB8819C0BDDF2060C7CD5A40410D0D29E98819C078DB15B5C7CD5A40BB837CCDE58819C025257221C7CD5A4065C2DFCBD78819C0
705	4	A.5.17	0103000020E610000001000000050000006A297DCCC6CD5A40BBEBB923DB8819C0AE2D8877C6CD5A401115947BDE8819C001E42B0BC7CD5A40C8969D84EC8819C0BDDF2060C7CD5A40410D0D29E98819C06A297DCCC6CD5A40BBEBB923DB8819C0
706	4	A.5.18	0103000020E61000000100000005000000AE2D8877C6CD5A401115947BDE8819C0F3319322C6CD5A40673E6ED3E18819C046E836B6C6CD5A404E202EE0EF8819C001E42B0BC7CD5A40C8969D84EC8819C0AE2D8877C6CD5A401115947BDE8819C0
707	4	A.5.19	0103000020E61000000100000005000000F3319322C6CD5A40673E6ED3E18819C038369ECDC5CD5A40BC67482BE58819C08BEC4161C6CD5A40D4A9BE3BF38819C046E836B6C6CD5A404E202EE0EF8819C0F3319322C6CD5A40673E6ED3E18819C0
708	4	A.5.20	0103000020E6100000010000000500000038369ECDC5CD5A40BC67482BE58819C07C3AA978C5CD5A4012912283E88819C0CFF04C0CC6CD5A405B334F97F68819C08BEC4161C6CD5A40D4A9BE3BF38819C038369ECDC5CD5A40BC67482BE58819C0
709	4	A.5.21	0103000020E610000001000000050000007C3AA978C5CD5A4012912283E88819C0C13EB423C5CD5A4068BAFCDAEB8819C014F557B7C5CD5A40E1BCDFF2F98819C0CFF04C0CC6CD5A405B334F97F68819C07C3AA978C5CD5A4012912283E88819C0
710	4	A.5.22	0103000020E61000000100000005000000C13EB423C5CD5A4068BAFCDAEB8819C00543BFCEC4CD5A40BEE3D632EF8819C058F96262C5CD5A406846704EFD8819C014F557B7C5CD5A40E1BCDFF2F98819C0C13EB423C5CD5A4068BAFCDAEB8819C0
711	4	A.5.23	0103000020E610000001000000050000000543BFCEC4CD5A40BEE3D632EF8819C04A47CA79C4CD5A40140DB18AF28819C09DFD6D0DC5CD5A40EECF00AA008919C058F96262C5CD5A406846704EFD8819C00543BFCEC4CD5A40BEE3D632EF8819C0
712	4	A.5.24	0103000020E610000001000000050000004A47CA79C4CD5A40140DB18AF28819C08E4BD524C4CD5A4069368BE2F58819C0E10179B8C4CD5A4075599105048919C09DFD6D0DC5CD5A40EECF00AA008919C04A47CA79C4CD5A40140DB18AF28819C0
713	4	A.5.25	0103000020E610000001000000050000008E4BD524C4CD5A4069368BE2F58819C0D34FE0CFC3CD5A40BF5F653AF98819C026068463C4CD5A40FBE22161078919C0E10179B8C4CD5A4075599105048919C08E4BD524C4CD5A4069368BE2F58819C0
714	4	A.5.26	0103000020E61000000100000005000000D34FE0CFC3CD5A40BF5F653AF98819C01754EB7AC3CD5A4015893F92FC8819C06A0A8F0EC4CD5A40826CB2BC0A8919C026068463C4CD5A40FBE22161078919C0D34FE0CFC3CD5A40BF5F653AF98819C0
715	4	A.5.27	0103000020E610000001000000050000001754EB7AC3CD5A4015893F92FC8819C05C58F625C3CD5A406BB219EAFF8819C0AF0E9AB9C3CD5A4008F642180E8919C06A0A8F0EC4CD5A40826CB2BC0A8919C01754EB7AC3CD5A4015893F92FC8819C0
716	4	A.5.28	0103000020E610000001000000050000005C58F625C3CD5A406BB219EAFF8819C0A05C01D1C2CD5A40C1DBF341038919C0F312A564C3CD5A408F7FD373118919C0AF0E9AB9C3CD5A4008F642180E8919C05C58F625C3CD5A406BB219EAFF8819C0
717	4	A.5.29	0103000020E61000000100000005000000A05C01D1C2CD5A40C1DBF341038919C0E5600C7CC2CD5A401605CE99068919C03817B00FC3CD5A40150964CF148919C0F312A564C3CD5A408F7FD373118919C0A05C01D1C2CD5A40C1DBF341038919C0
718	4	A.5.30	0103000020E61000000100000005000000E5600C7CC2CD5A401605CE99068919C02A651727C2CD5A406C2EA8F1098919C07D1BBBBAC2CD5A409B92F42A188919C03817B00FC3CD5A40150964CF148919C0E5600C7CC2CD5A401605CE99068919C0
719	4	A.5.31	0103000020E610000001000000050000002A651727C2CD5A406C2EA8F1098919C06E6922D2C1CD5A40C25782490D8919C0C11FC665C2CD5A40221C85861B8919C07D1BBBBAC2CD5A409B92F42A188919C02A651727C2CD5A406C2EA8F1098919C0
720	4	A.5.32	0103000020E610000001000000050000006E6922D2C1CD5A40C25782490D8919C0B36D2D7DC1CD5A4018815CA1108919C00624D110C2CD5A40A8A515E21E8919C0C11FC665C2CD5A40221C85861B8919C06E6922D2C1CD5A40C25782490D8919C0
721	4	A.5.33	0103000020E61000000100000005000000B36D2D7DC1CD5A4018815CA1108919C0F7713828C1CD5A406EAA36F9138919C04A28DCBBC1CD5A402F2FA63D228919C00624D110C2CD5A40A8A515E21E8919C0B36D2D7DC1CD5A4018815CA1108919C0
722	4	A.5.34	0103000020E61000000100000005000000F7713828C1CD5A406EAA36F9138919C03C7643D3C0CD5A40C3D31051178919C08F2CE766C1CD5A40B5B83699258919C04A28DCBBC1CD5A402F2FA63D228919C0F7713828C1CD5A406EAA36F9138919C0
723	4	A.5.35	0103000020E610000001000000050000003C7643D3C0CD5A40C3D31051178919C0807A4E7EC0CD5A4019FDEAA81A8919C0D330F211C1CD5A403C42C7F4288919C08F2CE766C1CD5A40B5B83699258919C03C7643D3C0CD5A40C3D31051178919C0
724	4	A.5.36	0103000020E61000000100000005000000807A4E7EC0CD5A4019FDEAA81A8919C0C57E5929C0CD5A406F26C5001E8919C01835FDBCC0CD5A40C2CB57502C8919C0D330F211C1CD5A403C42C7F4288919C0807A4E7EC0CD5A4019FDEAA81A8919C0
725	4	A.5.37	0103000020E61000000100000005000000C57E5929C0CD5A406F26C5001E8919C0098364D4BFCD5A40C54F9F58218919C05C390868C0CD5A404955E8AB2F8919C01835FDBCC0CD5A40C2CB57502C8919C0C57E5929C0CD5A406F26C5001E8919C0
726	4	A.5.38	0103000020E61000000100000005000000098364D4BFCD5A40C54F9F58218919C04E876F7FBFCD5A401B7979B0248919C0A13D1313C0CD5A40CFDE7807338919C05C390868C0CD5A404955E8AB2F8919C0098364D4BFCD5A40C54F9F58218919C0
727	4	A.5.39	0103000020E610000001000000050000004E876F7FBFCD5A401B7979B0248919C0938B7A2ABFCD5A4071A25308288919C0E6411EBEBFCD5A4055680963368919C0A13D1313C0CD5A40CFDE7807338919C04E876F7FBFCD5A401B7979B0248919C0
728	4	A.5.40	0103000020E61000000100000005000000938B7A2ABFCD5A4071A25308288919C0D78F85D5BECD5A40C6CB2D602B8919C02A462969BFCD5A40DCF199BE398919C0E6411EBEBFCD5A4055680963368919C0938B7A2ABFCD5A4071A25308288919C0
729	4	A.5.41	0103000020E61000000100000005000000D78F85D5BECD5A40C6CB2D602B8919C01C949080BECD5A401CF507B82E8919C06F4A3414BFCD5A40627B2A1A3D8919C02A462969BFCD5A40DCF199BE398919C0D78F85D5BECD5A40C6CB2D602B8919C0
730	4	A.5.42	0103000020E610000001000000050000001C949080BECD5A401CF507B82E8919C060989B2BBECD5A40721EE20F328919C0B34E3FBFBECD5A40E904BB75408919C06F4A3414BFCD5A40627B2A1A3D8919C01C949080BECD5A401CF507B82E8919C0
731	4	A.5.43	0103000020E6100000010000000500000060989B2BBECD5A40721EE20F328919C0A59CA6D6BDCD5A40C847BC67358919C0F8524A6ABECD5A406F8E4BD1438919C0B34E3FBFBECD5A40E904BB75408919C060989B2BBECD5A40721EE20F328919C0
732	4	A.5.44	0103000020E61000000100000005000000A59CA6D6BDCD5A40C847BC67358919C0E9A0B181BDCD5A401E7196BF388919C03C575515BECD5A40F617DC2C478919C0F8524A6ABECD5A406F8E4BD1438919C0A59CA6D6BDCD5A40C847BC67358919C0
733	4	A.5.45	0103000020E61000000100000005000000E9A0B181BDCD5A401E7196BF388919C02EA5BC2CBDCD5A40739A70173C8919C0815B60C0BDCD5A407CA16C884A8919C03C575515BECD5A40F617DC2C478919C0E9A0B181BDCD5A401E7196BF388919C0
734	4	A.5.46	0103000020E610000001000000050000002EA5BC2CBDCD5A40739A70173C8919C072A9C7D7BCCD5A40C9C34A6F3F8919C0C55F6B6BBDCD5A40032BFDE34D8919C0815B60C0BDCD5A407CA16C884A8919C02EA5BC2CBDCD5A40739A70173C8919C0
735	4	A.5.47	0103000020E6100000010000000500000072A9C7D7BCCD5A40C9C34A6F3F8919C0B7ADD282BCCD5A401FED24C7428919C00A647616BDCD5A4089B48D3F518919C0C55F6B6BBDCD5A40032BFDE34D8919C072A9C7D7BCCD5A40C9C34A6F3F8919C0
1287	12	E.1.11	0103000020E61000000100000005000000EA7A134FBCCD5A407D8BBA308A8719C0FEA480FCBBCD5A4046117B5E8D8719C01AB33B87BBCD5A40570E6EED818719C07003AAD9BBCD5A40D95B89BE7E8719C0EA7A134FBCCD5A407D8BBA308A8719C0
1318	12	E.1.42	0103000020E610000001000000050000004C934B4FB2CD5A40C0BE0ABBEC8719C060BDB8FCB1CD5A408944CBE8EF8719C0BCF8DF8BB1CD5A4097AB1F9BE48719C012494EDEB1CD5A4019F93A6CE18719C04C934B4FB2CD5A40C0BE0ABBEC8719C0
1319	12	E.1.43	0103000020E6100000010000000500000060BDB8FCB1CD5A408944CBE8EF8719C074E725AAB1CD5A4051CA8B16F38719C067A87139B1CD5A40155E04CAE78719C0BCF8DF8BB1CD5A4097AB1F9BE48719C060BDB8FCB1CD5A408944CBE8EF8719C0
1320	12	E.1.44	0103000020E6100000010000000500000074E725AAB1CD5A4051CA8B16F38719C088119357B1CD5A4019504C44F68719C0115803E7B0CD5A409310E9F8EA8719C067A87139B1CD5A40155E04CAE78719C074E725AAB1CD5A4051CA8B16F38719C0
1321	12	E.1.45	0103000020E6100000010000000500000088119357B1CD5A4019504C44F68719C09B3B0005B1CD5A40E2D50C72F98719C0BB079594B0CD5A4011C3CD27EE8719C0115803E7B0CD5A409310E9F8EA8719C088119357B1CD5A4019504C44F68719C0
1322	12	E.1.46	0103000020E610000001000000050000009B3B0005B1CD5A40E2D50C72F98719C0AF656DB2B0CD5A40AA5BCD9FFC8719C066B72642B0CD5A408F75B256F18719C0BB079594B0CD5A4011C3CD27EE8719C09B3B0005B1CD5A40E2D50C72F98719C0
1323	12	E.1.47	0103000020E61000000100000005000000AF656DB2B0CD5A40AA5BCD9FFC8719C0C38FDA5FB0CD5A4072E18DCDFF8719C01067B8EFAFCD5A400D289785F48719C066B72642B0CD5A408F75B256F18719C0AF656DB2B0CD5A40AA5BCD9FFC8719C0
1324	12	E.1.48	0103000020E61000000100000005000000C38FDA5FB0CD5A4072E18DCDFF8719C0D6B9470DB0CD5A403B674EFB028819C0BB164A9DAFCD5A408BDA7BB4F78719C01067B8EFAFCD5A400D289785F48719C0C38FDA5FB0CD5A4072E18DCDFF8719C0
1325	12	E.1.49	0103000020E61000000100000005000000D6B9470DB0CD5A403B674EFB028819C0EAE3B4BAAFCD5A4003ED0E29068819C065C6DB4AAFCD5A40098D60E3FA8719C0BB164A9DAFCD5A408BDA7BB4F78719C0D6B9470DB0CD5A403B674EFB028819C0
\.


--
-- Data for Name: area_detail2; Type: TABLE DATA; Schema: poc_location; Owner: rnd_eagle
--

COPY poc_location.area_detail2 (id, area_id, description, geom) FROM stdin;
157	3	S0.1	0103000020E61000000100000005000000F64201DBC1CD5A4059FB3BDBA38719C018D1B787C1CD5A4095A14703A78719C052A70511C1CD5A408EDFD0869B8719C099932A64C1CD5A409C0CA15D988719C0F64201DBC1CD5A4059FB3BDBA38719C0
158	3	S0.2	0103000020E6100000010000000500000018D1B787C1CD5A4095A14703A78719C03A5F6E34C1CD5A40D247532BAA8719C00BBBE0BDC0CD5A4080B200B09E8719C052A70511C1CD5A408EDFD0869B8719C018D1B787C1CD5A4095A14703A78719C0
159	3	S0.3	0103000020E610000001000000050000003A5F6E34C1CD5A40D247532BAA8719C05DED24E1C0CD5A400EEE5E53AD8719C0C4CEBB6AC0CD5A40728530D9A18719C00BBBE0BDC0CD5A4080B200B09E8719C03A5F6E34C1CD5A40D247532BAA8719C0
160	3	S0.4	0103000020E610000001000000050000005DED24E1C0CD5A400EEE5E53AD8719C07F7BDB8DC0CD5A404A946A7BB08719C07DE29617C0CD5A4064586002A58719C0C4CEBB6AC0CD5A40728530D9A18719C05DED24E1C0CD5A400EEE5E53AD8719C0
161	3	S0.5	0103000020E610000001000000050000007F7BDB8DC0CD5A404A946A7BB08719C0A109923AC0CD5A40873A76A3B38719C035F671C4BFCD5A40562B902BA88719C07DE29617C0CD5A4064586002A58719C07F7BDB8DC0CD5A404A946A7BB08719C0
162	3	S0.6	0103000020E61000000100000005000000A109923AC0CD5A40873A76A3B38719C0C39748E7BFCD5A40C3E081CBB68719C0EE094D71BFCD5A4048FEBF54AB8719C035F671C4BFCD5A40562B902BA88719C0A109923AC0CD5A40873A76A3B38719C0
163	3	S0.7	0103000020E61000000100000005000000C39748E7BFCD5A40C3E081CBB68719C0E525FF93BFCD5A40FF868DF3B98719C0A71D281EBFCD5A403AD1EF7DAE8719C0EE094D71BFCD5A4048FEBF54AB8719C0C39748E7BFCD5A40C3E081CBB68719C0
164	3	S0.8	0103000020E61000000100000005000000E525FF93BFCD5A40FF868DF3B98719C007B4B540BFCD5A403C2D991BBD8719C0603103CBBECD5A402CA41FA7B18719C0A71D281EBFCD5A403AD1EF7DAE8719C0E525FF93BFCD5A40FF868DF3B98719C0
165	3	S0.9	0103000020E6100000010000000500000007B4B540BFCD5A403C2D991BBD8719C02A426CEDBECD5A4078D3A443C08719C01945DE77BECD5A401E774FD0B48719C0603103CBBECD5A402CA41FA7B18719C007B4B540BFCD5A403C2D991BBD8719C0
166	3	S0.10	0103000020E610000001000000050000002A426CEDBECD5A4078D3A443C08719C04CD0229ABECD5A40B479B06BC38719C0D258B924BECD5A40104A7FF9B78719C01945DE77BECD5A401E774FD0B48719C02A426CEDBECD5A4078D3A443C08719C0
167	3	S0.11	0103000020E610000001000000050000004CD0229ABECD5A40B479B06BC38719C06E5ED946BECD5A40F11FBC93C68719C08B6C94D1BDCD5A40021DAF22BB8719C0D258B924BECD5A40104A7FF9B78719C04CD0229ABECD5A40B479B06BC38719C0
168	3	S0.12	0103000020E610000001000000050000006E5ED946BECD5A40F11FBC93C68719C090EC8FF3BDCD5A402DC6C7BBC98719C044806F7EBDCD5A40F4EFDE4BBE8719C08B6C94D1BDCD5A40021DAF22BB8719C06E5ED946BECD5A40F11FBC93C68719C0
169	3	S0.13	0103000020E6100000010000000500000090EC8FF3BDCD5A402DC6C7BBC98719C0B27A46A0BDCD5A406A6CD3E3CC8719C0FC934A2BBDCD5A40E5C20E75C18719C044806F7EBDCD5A40F4EFDE4BBE8719C090EC8FF3BDCD5A402DC6C7BBC98719C0
170	3	S0.14	0103000020E61000000100000005000000B27A46A0BDCD5A406A6CD3E3CC8719C0D508FD4CBDCD5A40A612DF0BD08719C0B5A725D8BCCD5A40D7953E9EC48719C0FC934A2BBDCD5A40E5C20E75C18719C0B27A46A0BDCD5A406A6CD3E3CC8719C0
171	3	S0.15	0103000020E61000000100000005000000D508FD4CBDCD5A40A612DF0BD08719C0F796B3F9BCCD5A40E2B8EA33D38719C06EBB0085BCCD5A40C9686EC7C78719C0B5A725D8BCCD5A40D7953E9EC48719C0D508FD4CBDCD5A40A612DF0BD08719C0
172	3	S0.16	0103000020E61000000100000005000000F796B3F9BCCD5A40E2B8EA33D38719C019256AA6BCCD5A401F5FF65BD68719C027CFDB31BCCD5A40BB3B9EF0CA8719C06EBB0085BCCD5A40C9686EC7C78719C0F796B3F9BCCD5A40E2B8EA33D38719C0
173	3	S0.17	0103000020E6100000010000000500000019256AA6BCCD5A401F5FF65BD68719C03BB32053BCCD5A405B050284D98719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C027CFDB31BCCD5A40BB3B9EF0CA8719C019256AA6BCCD5A401F5FF65BD68719C0
174	3	S0.18	0103000020E610000001000000050000003BB32053BCCD5A405B050284D98719C05D41D7FFBBCD5A4097AB0DACDC8719C099F6918BBBCD5A409FE1FD42D18719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C03BB32053BCCD5A405B050284D98719C0
175	3	S0.19	0103000020E610000001000000050000005D41D7FFBBCD5A4097AB0DACDC8719C07FCF8DACBBCD5A40D45119D4DF8719C0520A6D38BBCD5A4091B42D6CD48719C099F6918BBBCD5A409FE1FD42D18719C05D41D7FFBBCD5A4097AB0DACDC8719C0
176	3	S0.20	0103000020E610000001000000050000007FCF8DACBBCD5A40D45119D4DF8719C0A25D4459BBCD5A4010F824FCE28719C00B1E48E5BACD5A4083875D95D78719C0520A6D38BBCD5A4091B42D6CD48719C07FCF8DACBBCD5A40D45119D4DF8719C0
177	3	S0.21	0103000020E61000000100000005000000A25D4459BBCD5A4010F824FCE28719C0C4EBFA05BBCD5A404C9E3024E68719C0C3312392BACD5A40755A8DBEDA8719C00B1E48E5BACD5A4083875D95D78719C0A25D4459BBCD5A4010F824FCE28719C0
178	3	S0.22	0103000020E61000000100000005000000C4EBFA05BBCD5A404C9E3024E68719C0E679B1B2BACD5A4089443C4CE98719C07C45FE3EBACD5A40672DBDE7DD8719C0C3312392BACD5A40755A8DBEDA8719C0C4EBFA05BBCD5A404C9E3024E68719C0
179	3	S0.23	0103000020E61000000100000005000000E679B1B2BACD5A4089443C4CE98719C00808685FBACD5A40C5EA4774EC8719C03559D9EBB9CD5A405900ED10E18719C07C45FE3EBACD5A40672DBDE7DD8719C0E679B1B2BACD5A4089443C4CE98719C0
180	3	S0.24	0103000020E610000001000000050000000808685FBACD5A40C5EA4774EC8719C02A961E0CBACD5A400191539CEF8719C0EE6CB498B9CD5A404BD31C3AE48719C03559D9EBB9CD5A405900ED10E18719C00808685FBACD5A40C5EA4774EC8719C0
181	3	S0.25	0103000020E610000001000000050000002A961E0CBACD5A400191539CEF8719C04D24D5B8B9CD5A403E375FC4F28719C0A7808F45B9CD5A403DA64C63E78719C0EE6CB498B9CD5A404BD31C3AE48719C02A961E0CBACD5A400191539CEF8719C0
182	3	S0.26	0103000020E610000001000000050000004D24D5B8B9CD5A403E375FC4F28719C06FB28B65B9CD5A407ADD6AECF58719C060946AF2B8CD5A402F797C8CEA8719C0A7808F45B9CD5A403DA64C63E78719C04D24D5B8B9CD5A403E375FC4F28719C0
183	3	S0.27	0103000020E610000001000000050000006FB28B65B9CD5A407ADD6AECF58719C091404212B9CD5A40B6837614F98719C019A8459FB8CD5A40214CACB5ED8719C060946AF2B8CD5A402F797C8CEA8719C06FB28B65B9CD5A407ADD6AECF58719C0
184	3	S0.28	0103000020E6100000010000000500000091404212B9CD5A40B6837614F98719C0B3CEF8BEB8CD5A40F329823CFC8719C0D2BB204CB8CD5A40131FDCDEF08719C019A8459FB8CD5A40214CACB5ED8719C091404212B9CD5A40B6837614F98719C0
185	3	S0.29	0103000020E61000000100000005000000B3CEF8BEB8CD5A40F329823CFC8719C0D55CAF6BB8CD5A402FD08D64FF8719C08ACFFBF8B7CD5A4005F20B08F48719C0D2BB204CB8CD5A40131FDCDEF08719C0B3CEF8BEB8CD5A40F329823CFC8719C0
186	3	S0.30	0103000020E61000000100000005000000D55CAF6BB8CD5A402FD08D64FF8719C0F8EA6518B8CD5A406B76998C028819C043E3D6A5B7CD5A40F7C43B31F78719C08ACFFBF8B7CD5A4005F20B08F48719C0D55CAF6BB8CD5A402FD08D64FF8719C0
187	3	S0.31	0103000020E61000000100000005000000F8EA6518B8CD5A406B76998C028819C01A791CC5B7CD5A40A81CA5B4058819C0FCF6B152B7CD5A40E9976B5AFA8719C043E3D6A5B7CD5A40F7C43B31F78719C0F8EA6518B8CD5A406B76998C028819C0
188	3	S0.32	0103000020E610000001000000050000001A791CC5B7CD5A40A81CA5B4058819C03C07D371B7CD5A40E4C2B0DC088819C0B50A8DFFB6CD5A40DB6A9B83FD8719C0FCF6B152B7CD5A40E9976B5AFA8719C01A791CC5B7CD5A40A81CA5B4058819C0
189	3	S0.33	0103000020E610000001000000050000003C07D371B7CD5A40E4C2B0DC088819C05E95891EB7CD5A402069BC040C8819C06E1E68ACB6CD5A40CD3DCBAC008819C0B50A8DFFB6CD5A40DB6A9B83FD8719C03C07D371B7CD5A40E4C2B0DC088819C0
190	3	S0.34	0103000020E610000001000000050000005E95891EB7CD5A402069BC040C8819C0802340CBB6CD5A405D0FC82C0F8819C027324359B6CD5A40BF10FBD5038819C06E1E68ACB6CD5A40CD3DCBAC008819C05E95891EB7CD5A402069BC040C8819C0
191	3	S0.35	0103000020E61000000100000005000000802340CBB6CD5A405D0FC82C0F8819C0A2B1F677B6CD5A4099B5D354128819C0E0451E06B6CD5A40B1E32AFF068819C027324359B6CD5A40BF10FBD5038819C0802340CBB6CD5A405D0FC82C0F8819C0
192	3	S0.36	0103000020E61000000100000005000000A2B1F677B6CD5A4099B5D354128819C0C53FAD24B6CD5A40D55BDF7C158819C09959F9B2B5CD5A40A3B65A280A8819C0E0451E06B6CD5A40B1E32AFF068819C0A2B1F677B6CD5A4099B5D354128819C0
193	3	S0.37	0103000020E61000000100000005000000C53FAD24B6CD5A40D55BDF7C158819C0E7CD63D1B5CD5A401202EBA4188819C0516DD45FB5CD5A4094898A510D8819C09959F9B2B5CD5A40A3B65A280A8819C0C53FAD24B6CD5A40D55BDF7C158819C0
194	3	S0.38	0103000020E61000000100000005000000E7CD63D1B5CD5A401202EBA4188819C0095C1A7EB5CD5A404EA8F6CC1B8819C00A81AF0CB5CD5A40865CBA7A108819C0516DD45FB5CD5A4094898A510D8819C0E7CD63D1B5CD5A401202EBA4188819C0
195	3	S0.39	0103000020E61000000100000005000000095C1A7EB5CD5A404EA8F6CC1B8819C02BEAD02AB5CD5A408B4E02F51E8819C0C3948AB9B4CD5A40782FEAA3138819C00A81AF0CB5CD5A40865CBA7A108819C0095C1A7EB5CD5A404EA8F6CC1B8819C0
196	3	S0.40	0103000020E610000001000000050000002BEAD02AB5CD5A408B4E02F51E8819C04D7887D7B4CD5A40C7F40D1D228819C07CA86566B4CD5A406A021ACD168819C0C3948AB9B4CD5A40782FEAA3138819C02BEAD02AB5CD5A408B4E02F51E8819C0
197	3	S0.41	0103000020E610000001000000050000004D7887D7B4CD5A40C7F40D1D228819C070063E84B4CD5A40039B1945258819C035BC4013B4CD5A405CD549F6198819C07CA86566B4CD5A406A021ACD168819C04D7887D7B4CD5A40C7F40D1D228819C0
198	3	S0.42	0103000020E6100000010000000500000070063E84B4CD5A40039B1945258819C09294F430B4CD5A404041256D288819C0EECF1BC0B3CD5A404EA8791F1D8819C035BC4013B4CD5A405CD549F6198819C070063E84B4CD5A40039B1945258819C0
199	3	S0.43	0103000020E610000001000000050000009294F430B4CD5A404041256D288819C0B422ABDDB3CD5A407CE730952B8819C0A7E3F66CB3CD5A40407BA948208819C0EECF1BC0B3CD5A404EA8791F1D8819C09294F430B4CD5A404041256D288819C0
200	3	S0.44	0103000020E61000000100000005000000B422ABDDB3CD5A407CE730952B8819C0D6B0618AB3CD5A40B88D3CBD2E8819C060F7D119B3CD5A40324ED971238819C0A7E3F66CB3CD5A40407BA948208819C0B422ABDDB3CD5A407CE730952B8819C0
201	3	S0.45	0103000020E61000000100000005000000D6B0618AB3CD5A40B88D3CBD2E8819C0F83E1837B3CD5A40F53348E5318819C0180BADC6B2CD5A402421099B268819C060F7D119B3CD5A40324ED971238819C0D6B0618AB3CD5A40B88D3CBD2E8819C0
202	3	S0.46	0103000020E61000000100000005000000F83E1837B3CD5A40F53348E5318819C01ACDCEE3B2CD5A4031DA530D358819C0D11E8873B2CD5A4016F438C4298819C0180BADC6B2CD5A402421099B268819C0F83E1837B3CD5A40F53348E5318819C0
203	3	S0.47	0103000020E610000001000000050000001ACDCEE3B2CD5A4031DA530D358819C03D5B8590B2CD5A406D805F35388819C08A326320B2CD5A4008C768ED2C8819C0D11E8873B2CD5A4016F438C4298819C01ACDCEE3B2CD5A4031DA530D358819C0
204	3	S0.48	0103000020E610000001000000050000003D5B8590B2CD5A406D805F35388819C05FE93B3DB2CD5A40AA266B5D3B8819C043463ECDB1CD5A40FA999816308819C08A326320B2CD5A4008C768ED2C8819C03D5B8590B2CD5A406D805F35388819C0
205	3	S0.49	0103000020E610000001000000050000005FE93B3DB2CD5A40AA266B5D3B8819C08177F2E9B1CD5A40E6CC76853E8819C0FC59197AB1CD5A40EC6CC83F338819C043463ECDB1CD5A40FA999816308819C05FE93B3DB2CD5A40AA266B5D3B8819C0
206	3	S0.50	0103000020E6100000010000000500000099932A64C1CD5A409C0CA15D988719C052A70511C1CD5A408EDFD0869B8719C08C7D539AC0CD5A40881D5A0A908719C03CE453EDC0CD5A40E01D06E08C8719C099932A64C1CD5A409C0CA15D988719C0
207	3	S0.51	0103000020E6100000010000000500000052A70511C1CD5A408EDFD0869B8719C00BBBE0BDC0CD5A4080B200B09E8719C0DB165347C0CD5A402F1DAE34938719C08C7D539AC0CD5A40881D5A0A908719C052A70511C1CD5A408EDFD0869B8719C0
208	3	S0.52	0103000020E610000001000000050000000BBBE0BDC0CD5A4080B200B09E8719C0C4CEBB6AC0CD5A40728530D9A18719C02BB052F4BFCD5A40D71C025F968719C0DB165347C0CD5A402F1DAE34938719C00BBBE0BDC0CD5A4080B200B09E8719C0
209	3	S0.53	0103000020E61000000100000005000000C4CEBB6AC0CD5A40728530D9A18719C07DE29617C0CD5A4064586002A58719C07A4952A1BFCD5A407E1C5689998719C02BB052F4BFCD5A40D71C025F968719C0C4CEBB6AC0CD5A40728530D9A18719C0
210	3	S0.54	0103000020E610000001000000050000007DE29617C0CD5A4064586002A58719C035F671C4BFCD5A40562B902BA88719C0CAE2514EBFCD5A40261CAAB39C8719C07A4952A1BFCD5A407E1C5689998719C07DE29617C0CD5A4064586002A58719C0
211	3	S0.55	0103000020E6100000010000000500000035F671C4BFCD5A40562B902BA88719C0EE094D71BFCD5A4048FEBF54AB8719C01A7C51FBBECD5A40CD1BFEDD9F8719C0CAE2514EBFCD5A40261CAAB39C8719C035F671C4BFCD5A40562B902BA88719C0
212	3	S0.56	0103000020E61000000100000005000000EE094D71BFCD5A4048FEBF54AB8719C0A71D281EBFCD5A403AD1EF7DAE8719C0691551A8BECD5A40751B5208A38719C01A7C51FBBECD5A40CD1BFEDD9F8719C0EE094D71BFCD5A4048FEBF54AB8719C0
213	3	S0.57	0103000020E61000000100000005000000A71D281EBFCD5A403AD1EF7DAE8719C0603103CBBECD5A402CA41FA7B18719C0B9AE5055BECD5A401C1BA632A68719C0691551A8BECD5A40751B5208A38719C0A71D281EBFCD5A403AD1EF7DAE8719C0
214	3	S0.58	0103000020E61000000100000005000000603103CBBECD5A402CA41FA7B18719C01945DE77BECD5A401E774FD0B48719C008485002BECD5A40C41AFA5CA98719C0B9AE5055BECD5A401C1BA632A68719C0603103CBBECD5A402CA41FA7B18719C0
215	3	S0.59	0103000020E610000001000000050000001945DE77BECD5A401E774FD0B48719C0D258B924BECD5A40104A7FF9B78719C058E14FAFBDCD5A406C1A4E87AC8719C008485002BECD5A40C41AFA5CA98719C01945DE77BECD5A401E774FD0B48719C0
216	3	S0.60	0103000020E61000000100000005000000D258B924BECD5A40104A7FF9B78719C08B6C94D1BDCD5A40021DAF22BB8719C0A87A4F5CBDCD5A40131AA2B1AF8719C058E14FAFBDCD5A406C1A4E87AC8719C0D258B924BECD5A40104A7FF9B78719C0
217	3	S0.61	0103000020E610000001000000050000008B6C94D1BDCD5A40021DAF22BB8719C044806F7EBDCD5A40F4EFDE4BBE8719C0F7134F09BDCD5A40BB19F6DBB28719C0A87A4F5CBDCD5A40131AA2B1AF8719C08B6C94D1BDCD5A40021DAF22BB8719C0
218	3	S0.62	0103000020E6100000010000000500000044806F7EBDCD5A40F4EFDE4BBE8719C0FC934A2BBDCD5A40E5C20E75C18719C047AD4EB6BCCD5A4062194A06B68719C0F7134F09BDCD5A40BB19F6DBB28719C044806F7EBDCD5A40F4EFDE4BBE8719C0
219	3	S0.63	0103000020E61000000100000005000000FC934A2BBDCD5A40E5C20E75C18719C0B5A725D8BCCD5A40D7953E9EC48719C096464E63BCCD5A400A199E30B98719C047AD4EB6BCCD5A4062194A06B68719C0FC934A2BBDCD5A40E5C20E75C18719C0
220	3	S0.64	0103000020E61000000100000005000000B5A725D8BCCD5A40D7953E9EC48719C06EBB0085BCCD5A40C9686EC7C78719C0E6DF4D10BCCD5A40B118F25ABC8719C096464E63BCCD5A400A199E30B98719C0B5A725D8BCCD5A40D7953E9EC48719C0
221	3	S0.65	0103000020E610000001000000050000006EBB0085BCCD5A40C9686EC7C78719C027CFDB31BCCD5A40BB3B9EF0CA8719C035794DBDBBCD5A4059184685BF8719C0E6DF4D10BCCD5A40B118F25ABC8719C06EBB0085BCCD5A40C9686EC7C78719C0
222	3	S0.66	0103000020E6100000010000000500000027CFDB31BCCD5A40BB3B9EF0CA8719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C085124D6ABBCD5A4000189AAFC28719C035794DBDBBCD5A4059184685BF8719C027CFDB31BCCD5A40BB3B9EF0CA8719C0
223	3	S0.67	0103000020E61000000100000005000000E0E2B6DEBBCD5A40AD0ECE19CE8719C099F6918BBBCD5A409FE1FD42D18719C0D5AB4C17BBCD5A40A817EED9C58719C085124D6ABBCD5A4000189AAFC28719C0E0E2B6DEBBCD5A40AD0ECE19CE8719C0
224	3	S0.68	0103000020E6100000010000000500000099F6918BBBCD5A409FE1FD42D18719C0520A6D38BBCD5A4091B42D6CD48719C024454CC4BACD5A404F174204C98719C0D5AB4C17BBCD5A40A817EED9C58719C099F6918BBBCD5A409FE1FD42D18719C0
225	3	S0.69	0103000020E61000000100000005000000520A6D38BBCD5A4091B42D6CD48719C00B1E48E5BACD5A4083875D95D78719C074DE4B71BACD5A40F716962ECC8719C024454CC4BACD5A404F174204C98719C0520A6D38BBCD5A4091B42D6CD48719C0
226	3	S0.70	0103000020E610000001000000050000000B1E48E5BACD5A4083875D95D78719C0C3312392BACD5A40755A8DBEDA8719C0C3774B1EBACD5A409F16EA58CF8719C074DE4B71BACD5A40F716962ECC8719C00B1E48E5BACD5A4083875D95D78719C0
227	3	S0.71	0103000020E61000000100000005000000C3312392BACD5A40755A8DBEDA8719C07C45FE3EBACD5A40672DBDE7DD8719C013114BCBB9CD5A4046163E83D28719C0C3774B1EBACD5A409F16EA58CF8719C0C3312392BACD5A40755A8DBEDA8719C0
228	3	S0.72	0103000020E610000001000000050000007C45FE3EBACD5A40672DBDE7DD8719C03559D9EBB9CD5A405900ED10E18719C063AA4A78B9CD5A40EE1592ADD58719C013114BCBB9CD5A4046163E83D28719C07C45FE3EBACD5A40672DBDE7DD8719C0
229	3	S0.73	0103000020E610000001000000050000003559D9EBB9CD5A405900ED10E18719C0EE6CB498B9CD5A404BD31C3AE48719C0B2434A25B9CD5A409515E6D7D88719C063AA4A78B9CD5A40EE1592ADD58719C03559D9EBB9CD5A405900ED10E18719C0
230	3	S0.74	0103000020E61000000100000005000000EE6CB498B9CD5A404BD31C3AE48719C0A7808F45B9CD5A403DA64C63E78719C002DD49D2B8CD5A403D153A02DC8719C0B2434A25B9CD5A409515E6D7D88719C0EE6CB498B9CD5A404BD31C3AE48719C0
231	3	S0.75	0103000020E61000000100000005000000A7808F45B9CD5A403DA64C63E78719C060946AF2B8CD5A402F797C8CEA8719C05176497FB8CD5A40E4148E2CDF8719C002DD49D2B8CD5A403D153A02DC8719C0A7808F45B9CD5A403DA64C63E78719C0
232	3	S0.76	0103000020E6100000010000000500000060946AF2B8CD5A402F797C8CEA8719C019A8459FB8CD5A40214CACB5ED8719C0A10F492CB8CD5A408C14E256E28719C05176497FB8CD5A40E4148E2CDF8719C060946AF2B8CD5A402F797C8CEA8719C0
233	3	S0.77	0103000020E6100000010000000500000019A8459FB8CD5A40214CACB5ED8719C0D2BB204CB8CD5A40131FDCDEF08719C0F1A848D9B7CD5A4033143681E58719C0A10F492CB8CD5A408C14E256E28719C019A8459FB8CD5A40214CACB5ED8719C0
234	3	S0.78	0103000020E61000000100000005000000D2BB204CB8CD5A40131FDCDEF08719C08ACFFBF8B7CD5A4005F20B08F48719C040424886B7CD5A40DB138AABE88719C0F1A848D9B7CD5A4033143681E58719C0D2BB204CB8CD5A40131FDCDEF08719C0
235	3	S0.79	0103000020E610000001000000050000008ACFFBF8B7CD5A4005F20B08F48719C043E3D6A5B7CD5A40F7C43B31F78719C090DB4733B7CD5A408313DED5EB8719C040424886B7CD5A40DB138AABE88719C08ACFFBF8B7CD5A4005F20B08F48719C0
236	3	S0.80	0103000020E6100000010000000500000043E3D6A5B7CD5A40F7C43B31F78719C0FCF6B152B7CD5A40E9976B5AFA8719C0DF7447E0B6CD5A402A133200EF8719C090DB4733B7CD5A408313DED5EB8719C043E3D6A5B7CD5A40F7C43B31F78719C0
237	3	S0.81	0103000020E61000000100000005000000FCF6B152B7CD5A40E9976B5AFA8719C0B50A8DFFB6CD5A40DB6A9B83FD8719C02F0E478DB6CD5A40D212862AF28719C0DF7447E0B6CD5A402A133200EF8719C0FCF6B152B7CD5A40E9976B5AFA8719C0
238	3	S0.82	0103000020E61000000100000005000000B50A8DFFB6CD5A40DB6A9B83FD8719C06E1E68ACB6CD5A40CD3DCBAC008819C07FA7463AB6CD5A407912DA54F58719C02F0E478DB6CD5A40D212862AF28719C0B50A8DFFB6CD5A40DB6A9B83FD8719C0
239	3	S0.83	0103000020E610000001000000050000006E1E68ACB6CD5A40CD3DCBAC008819C027324359B6CD5A40BF10FBD5038819C0CE4046E7B5CD5A4021122E7FF88719C07FA7463AB6CD5A407912DA54F58719C06E1E68ACB6CD5A40CD3DCBAC008819C0
240	3	S0.84	0103000020E6100000010000000500000027324359B6CD5A40BF10FBD5038819C0E0451E06B6CD5A40B1E32AFF068819C01EDA4594B5CD5A40C81182A9FB8719C0CE4046E7B5CD5A4021122E7FF88719C027324359B6CD5A40BF10FBD5038819C0
241	3	S0.85	0103000020E61000000100000005000000E0451E06B6CD5A40B1E32AFF068819C09959F9B2B5CD5A40A3B65A280A8819C06D734541B5CD5A407011D6D3FE8719C01EDA4594B5CD5A40C81182A9FB8719C0E0451E06B6CD5A40B1E32AFF068819C0
242	3	S0.86	0103000020E610000001000000050000009959F9B2B5CD5A40A3B65A280A8819C0516DD45FB5CD5A4094898A510D8819C0BD0C45EEB4CD5A4017112AFE018819C06D734541B5CD5A407011D6D3FE8719C09959F9B2B5CD5A40A3B65A280A8819C0
243	3	S0.87	0103000020E61000000100000005000000516DD45FB5CD5A4094898A510D8819C00A81AF0CB5CD5A40865CBA7A108819C00CA6449BB4CD5A40BF107E28058819C0BD0C45EEB4CD5A4017112AFE018819C0516DD45FB5CD5A4094898A510D8819C0
244	3	S0.88	0103000020E610000001000000050000000A81AF0CB5CD5A40865CBA7A108819C0C3948AB9B4CD5A40782FEAA3138819C05C3F4448B4CD5A406610D252088819C00CA6449BB4CD5A40BF107E28058819C00A81AF0CB5CD5A40865CBA7A108819C0
245	3	S0.89	0103000020E61000000100000005000000C3948AB9B4CD5A40782FEAA3138819C07CA86566B4CD5A406A021ACD168819C0ACD843F5B3CD5A400E10267D0B8819C05C3F4448B4CD5A406610D252088819C0C3948AB9B4CD5A40782FEAA3138819C0
246	3	S0.90	0103000020E610000001000000050000007CA86566B4CD5A406A021ACD168819C035BC4013B4CD5A405CD549F6198819C0FB7143A2B3CD5A40B60F7AA70E8819C0ACD843F5B3CD5A400E10267D0B8819C07CA86566B4CD5A406A021ACD168819C0
247	3	S0.91	0103000020E6100000010000000500000035BC4013B4CD5A405CD549F6198819C0EECF1BC0B3CD5A404EA8791F1D8819C04B0B434FB3CD5A405D0FCED1118819C0FB7143A2B3CD5A40B60F7AA70E8819C035BC4013B4CD5A405CD549F6198819C0
248	3	S0.92	0103000020E61000000100000005000000EECF1BC0B3CD5A404EA8791F1D8819C0A7E3F66CB3CD5A40407BA948208819C09AA442FCB2CD5A40050F22FC148819C04B0B434FB3CD5A405D0FCED1118819C0EECF1BC0B3CD5A404EA8791F1D8819C0
249	3	S0.93	0103000020E61000000100000005000000A7E3F66CB3CD5A40407BA948208819C060F7D119B3CD5A40324ED971238819C0EA3D42A9B2CD5A40AC0E7626188819C09AA442FCB2CD5A40050F22FC148819C0A7E3F66CB3CD5A40407BA948208819C0
250	3	S0.94	0103000020E6100000010000000500000060F7D119B3CD5A40324ED971238819C0180BADC6B2CD5A402421099B268819C03AD74156B2CD5A40540ECA501B8819C0EA3D42A9B2CD5A40AC0E7626188819C060F7D119B3CD5A40324ED971238819C0
251	3	S0.95	0103000020E61000000100000005000000180BADC6B2CD5A402421099B268819C0D11E8873B2CD5A4016F438C4298819C089704103B2CD5A40FB0D1E7B1E8819C03AD74156B2CD5A40540ECA501B8819C0180BADC6B2CD5A402421099B268819C0
252	3	S0.96	0103000020E61000000100000005000000D11E8873B2CD5A4016F438C4298819C08A326320B2CD5A4008C768ED2C8819C0D90941B0B1CD5A40A30D72A5218819C089704103B2CD5A40FB0D1E7B1E8819C0D11E8873B2CD5A4016F438C4298819C0
253	3	S0.97	0103000020E610000001000000050000008A326320B2CD5A4008C768ED2C8819C043463ECDB1CD5A40FA999816308819C028A3405DB1CD5A404A0DC6CF248819C0D90941B0B1CD5A40A30D72A5218819C08A326320B2CD5A4008C768ED2C8819C0
254	3	S0.98	0103000020E6100000010000000500000043463ECDB1CD5A40FA999816308819C0FC59197AB1CD5A40EC6CC83F338819C0783C400AB1CD5A40F20C1AFA278819C028A3405DB1CD5A404A0DC6CF248819C043463ECDB1CD5A40FA999816308819C0
255	3	S0.99	0103000020E610000001000000050000003CE453EDC0CD5A40E01D06E08C8719C08C7D539AC0CD5A40881D5A0A908719C0C553A123C0CD5A40805BE38D848719C0DF347D76C0CD5A40232F6B62818719C03CE453EDC0CD5A40E01D06E08C8719C0
256	3	S0.100	0103000020E610000001000000050000008C7D539AC0CD5A40881D5A0A908719C0DB165347C0CD5A402F1DAE34938719C0AC72C5D0BFCD5A40DD875BB9878719C0C553A123C0CD5A40805BE38D848719C08C7D539AC0CD5A40881D5A0A908719C0
257	3	S0.101	0103000020E61000000100000005000000DB165347C0CD5A402F1DAE34938719C02BB052F4BFCD5A40D71C025F968719C09291E97DBFCD5A403AB4D3E48A8719C0AC72C5D0BFCD5A40DD875BB9878719C0DB165347C0CD5A402F1DAE34938719C0
258	3	S0.102	0103000020E610000001000000050000002BB052F4BFCD5A40D71C025F968719C07A4952A1BFCD5A407E1C5689998719C078B00D2BBFCD5A4098E04B108E8719C09291E97DBFCD5A403AB4D3E48A8719C02BB052F4BFCD5A40D71C025F968719C0
259	3	S0.103	0103000020E610000001000000050000007A4952A1BFCD5A407E1C5689998719C0CAE2514EBFCD5A40261CAAB39C8719C05ECF31D8BECD5A40F50CC43B918719C078B00D2BBFCD5A4098E04B108E8719C07A4952A1BFCD5A407E1C5689998719C0
260	3	S0.104	0103000020E61000000100000005000000CAE2514EBFCD5A40261CAAB39C8719C01A7C51FBBECD5A40CD1BFEDD9F8719C045EE5585BECD5A4052393C67948719C05ECF31D8BECD5A40F50CC43B918719C0CAE2514EBFCD5A40261CAAB39C8719C0
261	3	S0.105	0103000020E610000001000000050000001A7C51FBBECD5A40CD1BFEDD9F8719C0691551A8BECD5A40751B5208A38719C02B0D7A32BECD5A40AF65B492978719C045EE5585BECD5A4052393C67948719C01A7C51FBBECD5A40CD1BFEDD9F8719C0
262	3	S0.106	0103000020E61000000100000005000000691551A8BECD5A40751B5208A38719C0B9AE5055BECD5A401C1BA632A68719C0112C9EDFBDCD5A400C922CBE9A8719C02B0D7A32BECD5A40AF65B492978719C0691551A8BECD5A40751B5208A38719C0
263	3	S0.107	0103000020E61000000100000005000000B9AE5055BECD5A401C1BA632A68719C008485002BECD5A40C41AFA5CA98719C0F84AC28CBDCD5A4069BEA4E99D8719C0112C9EDFBDCD5A400C922CBE9A8719C0B9AE5055BECD5A401C1BA632A68719C0
264	3	S0.108	0103000020E6100000010000000500000008485002BECD5A40C41AFA5CA98719C058E14FAFBDCD5A406C1A4E87AC8719C0DE69E639BDCD5A40C6EA1C15A18719C0F84AC28CBDCD5A4069BEA4E99D8719C008485002BECD5A40C41AFA5CA98719C0
265	3	S0.109	0103000020E6100000010000000500000058E14FAFBDCD5A406C1A4E87AC8719C0A87A4F5CBDCD5A40131AA2B1AF8719C0C4880AE7BCCD5A4024179540A48719C0DE69E639BDCD5A40C6EA1C15A18719C058E14FAFBDCD5A406C1A4E87AC8719C0
266	3	S0.110	0103000020E61000000100000005000000A87A4F5CBDCD5A40131AA2B1AF8719C0F7134F09BDCD5A40BB19F6DBB28719C0AAA72E94BCCD5A4081430D6CA78719C0C4880AE7BCCD5A4024179540A48719C0A87A4F5CBDCD5A40131AA2B1AF8719C0
267	3	S0.111	0103000020E61000000100000005000000F7134F09BDCD5A40BB19F6DBB28719C047AD4EB6BCCD5A4062194A06B68719C091C65241BCCD5A40DE6F8597AA8719C0AAA72E94BCCD5A4081430D6CA78719C0F7134F09BDCD5A40BB19F6DBB28719C0
268	3	S0.112	0103000020E6100000010000000500000047AD4EB6BCCD5A4062194A06B68719C096464E63BCCD5A400A199E30B98719C077E576EEBBCD5A403B9CFDC2AD8719C091C65241BCCD5A40DE6F8597AA8719C047AD4EB6BCCD5A4062194A06B68719C0
269	3	S0.113	0103000020E6100000010000000500000096464E63BCCD5A400A199E30B98719C0E6DF4D10BCCD5A40B118F25ABC8719C05D049B9BBBCD5A4098C875EEB08719C077E576EEBBCD5A403B9CFDC2AD8719C096464E63BCCD5A400A199E30B98719C0
270	3	S0.114	0103000020E61000000100000005000000E6DF4D10BCCD5A40B118F25ABC8719C035794DBDBBCD5A4059184685BF8719C04423BF48BBCD5A40F5F4ED19B48719C05D049B9BBBCD5A4098C875EEB08719C0E6DF4D10BCCD5A40B118F25ABC8719C0
271	3	S0.115	0103000020E6100000010000000500000035794DBDBBCD5A4059184685BF8719C085124D6ABBCD5A4000189AAFC28719C02A42E3F5BACD5A4052216645B78719C04423BF48BBCD5A40F5F4ED19B48719C035794DBDBBCD5A4059184685BF8719C0
272	3	S0.116	0103000020E6100000010000000500000085124D6ABBCD5A4000189AAFC28719C0D5AB4C17BBCD5A40A817EED9C58719C0106107A3BACD5A40B04DDE70BA8719C02A42E3F5BACD5A4052216645B78719C085124D6ABBCD5A4000189AAFC28719C0
273	3	S0.117	0103000020E61000000100000005000000D5AB4C17BBCD5A40A817EED9C58719C024454CC4BACD5A404F174204C98719C0F67F2B50BACD5A400D7A569CBD8719C0106107A3BACD5A40B04DDE70BA8719C0D5AB4C17BBCD5A40A817EED9C58719C0
274	3	S0.118	0103000020E6100000010000000500000024454CC4BACD5A404F174204C98719C074DE4B71BACD5A40F716962ECC8719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0F67F2B50BACD5A400D7A569CBD8719C024454CC4BACD5A404F174204C98719C0
275	3	S0.119	0103000020E6100000010000000500000074DE4B71BACD5A40F716962ECC8719C0C3774B1EBACD5A409F16EA58CF8719C0C3BD73AAB9CD5A40C7D246F3C38719C0DD9E4FFDB9CD5A406AA6CEC7C08719C074DE4B71BACD5A40F716962ECC8719C0
276	3	S0.120	0103000020E61000000100000005000000C3774B1EBACD5A409F16EA58CF8719C013114BCBB9CD5A4046163E83D28719C0A9DC9757B9CD5A4024FFBE1EC78719C0C3BD73AAB9CD5A40C7D246F3C38719C0C3774B1EBACD5A409F16EA58CF8719C0
277	3	S0.121	0103000020E6100000010000000500000013114BCBB9CD5A4046163E83D28719C063AA4A78B9CD5A40EE1592ADD58719C090FBBB04B9CD5A40812B374ACA8719C0A9DC9757B9CD5A4024FFBE1EC78719C013114BCBB9CD5A4046163E83D28719C0
278	3	S0.122	0103000020E6100000010000000500000063AA4A78B9CD5A40EE1592ADD58719C0B2434A25B9CD5A409515E6D7D88719C0761AE0B1B8CD5A40DE57AF75CD8719C090FBBB04B9CD5A40812B374ACA8719C063AA4A78B9CD5A40EE1592ADD58719C0
279	3	S0.123	0103000020E61000000100000005000000B2434A25B9CD5A409515E6D7D88719C002DD49D2B8CD5A403D153A02DC8719C05C39045FB8CD5A403C8427A1D08719C0761AE0B1B8CD5A40DE57AF75CD8719C0B2434A25B9CD5A409515E6D7D88719C0
280	3	S0.124	0103000020E6100000010000000500000002DD49D2B8CD5A403D153A02DC8719C05176497FB8CD5A40E4148E2CDF8719C04258280CB8CD5A4099B09FCCD38719C05C39045FB8CD5A403C8427A1D08719C002DD49D2B8CD5A403D153A02DC8719C0
281	3	S0.125	0103000020E610000001000000050000005176497FB8CD5A40E4148E2CDF8719C0A10F492CB8CD5A408C14E256E28719C029774CB9B7CD5A40F6DC17F8D68719C04258280CB8CD5A4099B09FCCD38719C05176497FB8CD5A40E4148E2CDF8719C0
282	3	S0.126	0103000020E61000000100000005000000A10F492CB8CD5A408C14E256E28719C0F1A848D9B7CD5A4033143681E58719C00F967066B7CD5A4053099023DA8719C029774CB9B7CD5A40F6DC17F8D68719C0A10F492CB8CD5A408C14E256E28719C0
283	3	S0.127	0103000020E61000000100000005000000F1A848D9B7CD5A4033143681E58719C040424886B7CD5A40DB138AABE88719C0F5B49413B7CD5A40B035084FDD8719C00F967066B7CD5A4053099023DA8719C0F1A848D9B7CD5A4033143681E58719C0
284	3	S0.128	0103000020E6100000010000000500000040424886B7CD5A40DB138AABE88719C090DB4733B7CD5A408313DED5EB8719C0DCD3B8C0B6CD5A400D62807AE08719C0F5B49413B7CD5A40B035084FDD8719C040424886B7CD5A40DB138AABE88719C0
285	3	S0.129	0103000020E6100000010000000500000090DB4733B7CD5A408313DED5EB8719C0DF7447E0B6CD5A402A133200EF8719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0DCD3B8C0B6CD5A400D62807AE08719C090DB4733B7CD5A408313DED5EB8719C0
286	3	S0.130	0103000020E61000000100000005000000DF7447E0B6CD5A402A133200EF8719C02F0E478DB6CD5A40D212862AF28719C0A811011BB6CD5A40C8BA70D1E68719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0DF7447E0B6CD5A402A133200EF8719C0
287	3	S0.131	0103000020E610000001000000050000002F0E478DB6CD5A40D212862AF28719C07FA7463AB6CD5A407912DA54F58719C08E3025C8B5CD5A4025E7E8FCE98719C0A811011BB6CD5A40C8BA70D1E68719C02F0E478DB6CD5A40D212862AF28719C0
288	3	S0.132	0103000020E610000001000000050000007FA7463AB6CD5A407912DA54F58719C0CE4046E7B5CD5A4021122E7FF88719C0754F4975B5CD5A4082136128ED8719C08E3025C8B5CD5A4025E7E8FCE98719C07FA7463AB6CD5A407912DA54F58719C0
289	3	S0.133	0103000020E61000000100000005000000CE4046E7B5CD5A4021122E7FF88719C01EDA4594B5CD5A40C81182A9FB8719C05B6E6D22B5CD5A40DF3FD953F08719C0754F4975B5CD5A4082136128ED8719C0CE4046E7B5CD5A4021122E7FF88719C0
290	3	S0.134	0103000020E610000001000000050000001EDA4594B5CD5A40C81182A9FB8719C06D734541B5CD5A407011D6D3FE8719C0418D91CFB4CD5A403C6C517FF38719C05B6E6D22B5CD5A40DF3FD953F08719C01EDA4594B5CD5A40C81182A9FB8719C0
291	3	S0.135	0103000020E610000001000000050000006D734541B5CD5A407011D6D3FE8719C0BD0C45EEB4CD5A4017112AFE018819C028ACB57CB4CD5A409998C9AAF68719C0418D91CFB4CD5A403C6C517FF38719C06D734541B5CD5A407011D6D3FE8719C0
292	3	S0.136	0103000020E61000000100000005000000BD0C45EEB4CD5A4017112AFE018819C00CA6449BB4CD5A40BF107E28058819C00ECBD929B4CD5A40F6C441D6F98719C028ACB57CB4CD5A409998C9AAF68719C0BD0C45EEB4CD5A4017112AFE018819C0
293	3	S0.137	0103000020E610000001000000050000000CA6449BB4CD5A40BF107E28058819C05C3F4448B4CD5A406610D252088819C0F4E9FDD6B3CD5A4054F1B901FD8719C00ECBD929B4CD5A40F6C441D6F98719C00CA6449BB4CD5A40BF107E28058819C0
294	3	S0.138	0103000020E610000001000000050000005C3F4448B4CD5A406610D252088819C0ACD843F5B3CD5A400E10267D0B8819C0DA082284B3CD5A40B11D322D008819C0F4E9FDD6B3CD5A4054F1B901FD8719C05C3F4448B4CD5A406610D252088819C0
295	3	S0.139	0103000020E61000000100000005000000ACD843F5B3CD5A400E10267D0B8819C0FB7143A2B3CD5A40B60F7AA70E8819C0C1274631B3CD5A400E4AAA58038819C0DA082284B3CD5A40B11D322D008819C0ACD843F5B3CD5A400E10267D0B8819C0
296	3	S0.140	0103000020E61000000100000005000000FB7143A2B3CD5A40B60F7AA70E8819C04B0B434FB3CD5A405D0FCED1118819C0A7466ADEB2CD5A406B762284068819C0C1274631B3CD5A400E4AAA58038819C0FB7143A2B3CD5A40B60F7AA70E8819C0
297	3	S0.141	0103000020E610000001000000050000004B0B434FB3CD5A405D0FCED1118819C09AA442FCB2CD5A40050F22FC148819C08D658E8BB2CD5A40C8A29AAF098819C0A7466ADEB2CD5A406B762284068819C04B0B434FB3CD5A405D0FCED1118819C0
298	3	S0.142	0103000020E610000001000000050000009AA442FCB2CD5A40050F22FC148819C0EA3D42A9B2CD5A40AC0E7626188819C07484B238B2CD5A4025CF12DB0C8819C08D658E8BB2CD5A40C8A29AAF098819C09AA442FCB2CD5A40050F22FC148819C0
299	3	S0.143	0103000020E61000000100000005000000EA3D42A9B2CD5A40AC0E7626188819C03AD74156B2CD5A40540ECA501B8819C05AA3D6E5B1CD5A4082FB8A06108819C07484B238B2CD5A4025CF12DB0C8819C0EA3D42A9B2CD5A40AC0E7626188819C0
300	3	S0.144	0103000020E610000001000000050000003AD74156B2CD5A40540ECA501B8819C089704103B2CD5A40FB0D1E7B1E8819C040C2FA92B1CD5A40E0270332138819C05AA3D6E5B1CD5A4082FB8A06108819C03AD74156B2CD5A40540ECA501B8819C0
301	3	S0.145	0103000020E6100000010000000500000089704103B2CD5A40FB0D1E7B1E8819C0D90941B0B1CD5A40A30D72A5218819C026E11E40B1CD5A403D547B5D168819C040C2FA92B1CD5A40E0270332138819C089704103B2CD5A40FB0D1E7B1E8819C0
302	3	S0.146	0103000020E61000000100000005000000D90941B0B1CD5A40A30D72A5218819C028A3405DB1CD5A404A0DC6CF248819C00D0043EDB0CD5A409A80F388198819C026E11E40B1CD5A403D547B5D168819C0D90941B0B1CD5A40A30D72A5218819C0
303	3	S0.147	0103000020E6100000010000000500000028A3405DB1CD5A404A0DC6CF248819C0783C400AB1CD5A40F20C1AFA278819C0F31E679AB0CD5A40F7AC6BB41C8819C00D0043EDB0CD5A409A80F388198819C028A3405DB1CD5A404A0DC6CF248819C0
304	3	S0.148	0103000020E61000000100000005000000DF347D76C0CD5A40232F6B62818719C0C553A123C0CD5A40805BE38D848719C0FF29EFACBFCD5A4079996C11798719C08285A6FFBFCD5A406640D0E4758719C0DF347D76C0CD5A40232F6B62818719C0
305	3	S0.149	0103000020E61000000100000005000000C553A123C0CD5A40805BE38D848719C0AC72C5D0BFCD5A40DD875BB9878719C07CCE375ABFCD5A408CF2083E7C8719C0FF29EFACBFCD5A4079996C11798719C0C553A123C0CD5A40805BE38D848719C0
306	3	S0.150	0103000020E61000000100000005000000AC72C5D0BFCD5A40DD875BB9878719C09291E97DBFCD5A403AB4D3E48A8719C0F9728007BFCD5A409E4BA56A7F8719C07CCE375ABFCD5A408CF2083E7C8719C0AC72C5D0BFCD5A40DD875BB9878719C0
307	3	S0.151	0103000020E610000001000000050000009291E97DBFCD5A403AB4D3E48A8719C078B00D2BBFCD5A4098E04B108E8719C07617C9B4BECD5A40B1A44197828719C0F9728007BFCD5A409E4BA56A7F8719C09291E97DBFCD5A403AB4D3E48A8719C0
308	3	S0.152	0103000020E6100000010000000500000078B00D2BBFCD5A4098E04B108E8719C05ECF31D8BECD5A40F50CC43B918719C0F3BB1162BECD5A40C4FDDDC3858719C07617C9B4BECD5A40B1A44197828719C078B00D2BBFCD5A4098E04B108E8719C0
309	3	S0.153	0103000020E610000001000000050000005ECF31D8BECD5A40F50CC43B918719C045EE5585BECD5A4052393C67948719C070605A0FBECD5A40D7567AF0888719C0F3BB1162BECD5A40C4FDDDC3858719C05ECF31D8BECD5A40F50CC43B918719C0
310	3	S0.154	0103000020E6100000010000000500000045EE5585BECD5A4052393C67948719C02B0D7A32BECD5A40AF65B492978719C0ED04A3BCBDCD5A40E9AF161D8C8719C070605A0FBECD5A40D7567AF0888719C045EE5585BECD5A4052393C67948719C0
311	3	S0.155	0103000020E610000001000000050000002B0D7A32BECD5A40AF65B492978719C0112C9EDFBDCD5A400C922CBE9A8719C06AA9EB69BDCD5A40FC08B3498F8719C0ED04A3BCBDCD5A40E9AF161D8C8719C02B0D7A32BECD5A40AF65B492978719C0
312	3	S0.156	0103000020E61000000100000005000000112C9EDFBDCD5A400C922CBE9A8719C0F84AC28CBDCD5A4069BEA4E99D8719C0E74D3417BDCD5A400F624F76928719C06AA9EB69BDCD5A40FC08B3498F8719C0112C9EDFBDCD5A400C922CBE9A8719C0
313	3	S0.157	0103000020E61000000100000005000000F84AC28CBDCD5A4069BEA4E99D8719C0DE69E639BDCD5A40C6EA1C15A18719C064F27CC4BCCD5A4022BBEBA2958719C0E74D3417BDCD5A400F624F76928719C0F84AC28CBDCD5A4069BEA4E99D8719C0
314	3	S0.158	0103000020E61000000100000005000000DE69E639BDCD5A40C6EA1C15A18719C0C4880AE7BCCD5A4024179540A48719C0E196C571BCCD5A40341488CF988719C064F27CC4BCCD5A4022BBEBA2958719C0DE69E639BDCD5A40C6EA1C15A18719C0
315	3	S0.159	0103000020E61000000100000005000000C4880AE7BCCD5A4024179540A48719C0AAA72E94BCCD5A4081430D6CA78719C05E3B0E1FBCCD5A40476D24FC9B8719C0E196C571BCCD5A40341488CF988719C0C4880AE7BCCD5A4024179540A48719C0
316	3	S0.160	0103000020E61000000100000005000000AAA72E94BCCD5A4081430D6CA78719C091C65241BCCD5A40DE6F8597AA8719C0DBDF56CCBBCD5A405AC6C0289F8719C05E3B0E1FBCCD5A40476D24FC9B8719C0AAA72E94BCCD5A4081430D6CA78719C0
317	3	S0.161	0103000020E6100000010000000500000091C65241BCCD5A40DE6F8597AA8719C077E576EEBBCD5A403B9CFDC2AD8719C058849F79BBCD5A406D1F5D55A28719C0DBDF56CCBBCD5A405AC6C0289F8719C091C65241BCCD5A40DE6F8597AA8719C0
318	3	S0.162	0103000020E6100000010000000500000077E576EEBBCD5A403B9CFDC2AD8719C05D049B9BBBCD5A4098C875EEB08719C0D528E826BBCD5A407F78F981A58719C058849F79BBCD5A406D1F5D55A28719C077E576EEBBCD5A403B9CFDC2AD8719C0
319	3	S0.163	0103000020E610000001000000050000005D049B9BBBCD5A4098C875EEB08719C04423BF48BBCD5A40F5F4ED19B48719C052CD30D4BACD5A4092D195AEA88719C0D528E826BBCD5A407F78F981A58719C05D049B9BBBCD5A4098C875EEB08719C0
320	3	S0.164	0103000020E610000001000000050000004423BF48BBCD5A40F5F4ED19B48719C02A42E3F5BACD5A4052216645B78719C0CF717981BACD5A40A52A32DBAB8719C052CD30D4BACD5A4092D195AEA88719C04423BF48BBCD5A40F5F4ED19B48719C0
321	3	S0.165	0103000020E610000001000000050000002A42E3F5BACD5A4052216645B78719C0106107A3BACD5A40B04DDE70BA8719C04C16C22EBACD5A40B883CE07AF8719C0CF717981BACD5A40A52A32DBAB8719C02A42E3F5BACD5A4052216645B78719C0
322	3	S0.166	0103000020E61000000100000005000000106107A3BACD5A40B04DDE70BA8719C0F67F2B50BACD5A400D7A569CBD8719C0C9BA0ADCB9CD5A40CADC6A34B28719C04C16C22EBACD5A40B883CE07AF8719C0106107A3BACD5A40B04DDE70BA8719C0
323	3	S0.167	0103000020E61000000100000005000000F67F2B50BACD5A400D7A569CBD8719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0465F5389B9CD5A40DD350761B58719C0C9BA0ADCB9CD5A40CADC6A34B28719C0F67F2B50BACD5A400D7A569CBD8719C0
324	3	S0.168	0103000020E61000000100000005000000DD9E4FFDB9CD5A406AA6CEC7C08719C0C3BD73AAB9CD5A40C7D246F3C38719C0C3039C36B9CD5A40F08EA38DB88719C0465F5389B9CD5A40DD350761B58719C0DD9E4FFDB9CD5A406AA6CEC7C08719C0
325	3	S0.169	0103000020E61000000100000005000000C3BD73AAB9CD5A40C7D246F3C38719C0A9DC9757B9CD5A4024FFBE1EC78719C040A8E4E3B8CD5A4003E83FBABB8719C0C3039C36B9CD5A40F08EA38DB88719C0C3BD73AAB9CD5A40C7D246F3C38719C0
326	3	S0.170	0103000020E61000000100000005000000A9DC9757B9CD5A4024FFBE1EC78719C090FBBB04B9CD5A40812B374ACA8719C0BD4C2D91B8CD5A401541DCE6BE8719C040A8E4E3B8CD5A4003E83FBABB8719C0A9DC9757B9CD5A4024FFBE1EC78719C0
327	3	S0.171	0103000020E6100000010000000500000090FBBB04B9CD5A40812B374ACA8719C0761AE0B1B8CD5A40DE57AF75CD8719C03AF1753EB8CD5A40289A7813C28719C0BD4C2D91B8CD5A401541DCE6BE8719C090FBBB04B9CD5A40812B374ACA8719C0
328	3	S0.172	0103000020E61000000100000005000000761AE0B1B8CD5A40DE57AF75CD8719C05C39045FB8CD5A403C8427A1D08719C0B695BEEBB7CD5A403BF31440C58719C03AF1753EB8CD5A40289A7813C28719C0761AE0B1B8CD5A40DE57AF75CD8719C0
329	3	S0.173	0103000020E610000001000000050000005C39045FB8CD5A403C8427A1D08719C04258280CB8CD5A4099B09FCCD38719C0333A0799B7CD5A404E4CB16CC88719C0B695BEEBB7CD5A403BF31440C58719C05C39045FB8CD5A403C8427A1D08719C0
330	3	S0.174	0103000020E610000001000000050000004258280CB8CD5A4099B09FCCD38719C029774CB9B7CD5A40F6DC17F8D68719C0B0DE4F46B7CD5A4060A54D99CB8719C0333A0799B7CD5A404E4CB16CC88719C04258280CB8CD5A4099B09FCCD38719C0
331	3	S0.175	0103000020E6100000010000000500000029774CB9B7CD5A40F6DC17F8D68719C00F967066B7CD5A4053099023DA8719C02D8398F3B6CD5A4073FEE9C5CE8719C0B0DE4F46B7CD5A4060A54D99CB8719C029774CB9B7CD5A40F6DC17F8D68719C0
332	3	S0.176	0103000020E610000001000000050000000F967066B7CD5A4053099023DA8719C0F5B49413B7CD5A40B035084FDD8719C0AA27E1A0B6CD5A40865786F2D18719C02D8398F3B6CD5A4073FEE9C5CE8719C00F967066B7CD5A4053099023DA8719C0
333	3	S0.177	0103000020E61000000100000005000000F5B49413B7CD5A40B035084FDD8719C0DCD3B8C0B6CD5A400D62807AE08719C027CC294EB6CD5A4099B0221FD58719C0AA27E1A0B6CD5A40865786F2D18719C0F5B49413B7CD5A40B035084FDD8719C0
334	3	S0.178	0103000020E61000000100000005000000DCD3B8C0B6CD5A400D62807AE08719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0A47072FBB5CD5A40AB09BF4BD88719C027CC294EB6CD5A4099B0221FD58719C0DCD3B8C0B6CD5A400D62807AE08719C0
335	3	S0.179	0103000020E61000000100000005000000C2F2DC6DB6CD5A406A8EF8A5E38719C0A811011BB6CD5A40C8BA70D1E68719C02115BBA8B5CD5A40BE625B78DB8719C0A47072FBB5CD5A40AB09BF4BD88719C0C2F2DC6DB6CD5A406A8EF8A5E38719C0
336	3	S0.180	0103000020E61000000100000005000000A811011BB6CD5A40C8BA70D1E68719C08E3025C8B5CD5A4025E7E8FCE98719C09EB90356B5CD5A40D1BBF7A4DE8719C02115BBA8B5CD5A40BE625B78DB8719C0A811011BB6CD5A40C8BA70D1E68719C0
337	3	S0.181	0103000020E610000001000000050000008E3025C8B5CD5A4025E7E8FCE98719C0754F4975B5CD5A4082136128ED8719C01B5E4C03B5CD5A40E41494D1E18719C09EB90356B5CD5A40D1BBF7A4DE8719C08E3025C8B5CD5A4025E7E8FCE98719C0
338	3	S0.182	0103000020E61000000100000005000000754F4975B5CD5A4082136128ED8719C05B6E6D22B5CD5A40DF3FD953F08719C0980295B0B4CD5A40F66D30FEE48719C01B5E4C03B5CD5A40E41494D1E18719C0754F4975B5CD5A4082136128ED8719C0
339	3	S0.183	0103000020E610000001000000050000005B6E6D22B5CD5A40DF3FD953F08719C0418D91CFB4CD5A403C6C517FF38719C015A7DD5DB4CD5A4009C7CC2AE88719C0980295B0B4CD5A40F66D30FEE48719C05B6E6D22B5CD5A40DF3FD953F08719C0
340	3	S0.184	0103000020E61000000100000005000000418D91CFB4CD5A403C6C517FF38719C028ACB57CB4CD5A409998C9AAF68719C0924B260BB4CD5A401C206957EB8719C015A7DD5DB4CD5A4009C7CC2AE88719C0418D91CFB4CD5A403C6C517FF38719C0
341	3	S0.185	0103000020E6100000010000000500000028ACB57CB4CD5A409998C9AAF68719C00ECBD929B4CD5A40F6C441D6F98719C00FF06EB8B3CD5A402F790584EE8719C0924B260BB4CD5A401C206957EB8719C028ACB57CB4CD5A409998C9AAF68719C0
342	3	S0.186	0103000020E610000001000000050000000ECBD929B4CD5A40F6C441D6F98719C0F4E9FDD6B3CD5A4054F1B901FD8719C08C94B765B3CD5A4041D2A1B0F18719C00FF06EB8B3CD5A402F790584EE8719C00ECBD929B4CD5A40F6C441D6F98719C0
343	3	S0.187	0103000020E61000000100000005000000F4E9FDD6B3CD5A4054F1B901FD8719C0DA082284B3CD5A40B11D322D008819C009390013B3CD5A40542B3EDDF48719C08C94B765B3CD5A4041D2A1B0F18719C0F4E9FDD6B3CD5A4054F1B901FD8719C0
344	3	S0.188	0103000020E61000000100000005000000DA082284B3CD5A40B11D322D008819C0C1274631B3CD5A400E4AAA58038819C086DD48C0B2CD5A406784DA09F88719C009390013B3CD5A40542B3EDDF48719C0DA082284B3CD5A40B11D322D008819C0
345	3	S0.189	0103000020E61000000100000005000000C1274631B3CD5A400E4AAA58038819C0A7466ADEB2CD5A406B762284068819C00382916DB2CD5A407ADD7636FB8719C086DD48C0B2CD5A406784DA09F88719C0C1274631B3CD5A400E4AAA58038819C0
346	3	S0.190	0103000020E61000000100000005000000A7466ADEB2CD5A406B762284068819C08D658E8BB2CD5A40C8A29AAF098819C08026DA1AB2CD5A408C361363FE8719C00382916DB2CD5A407ADD7636FB8719C0A7466ADEB2CD5A406B762284068819C0
347	3	S0.191	0103000020E610000001000000050000008D658E8BB2CD5A40C8A29AAF098819C07484B238B2CD5A4025CF12DB0C8819C0FDCA22C8B1CD5A409F8FAF8F018819C08026DA1AB2CD5A408C361363FE8719C08D658E8BB2CD5A40C8A29AAF098819C0
348	3	S0.192	0103000020E610000001000000050000007484B238B2CD5A4025CF12DB0C8819C05AA3D6E5B1CD5A4082FB8A06108819C07A6F6B75B1CD5A40B2E84BBC048819C0FDCA22C8B1CD5A409F8FAF8F018819C07484B238B2CD5A4025CF12DB0C8819C0
349	3	S0.193	0103000020E610000001000000050000005AA3D6E5B1CD5A4082FB8A06108819C040C2FA92B1CD5A40E0270332138819C0F713B422B1CD5A40C541E8E8078819C07A6F6B75B1CD5A40B2E84BBC048819C05AA3D6E5B1CD5A4082FB8A06108819C0
350	3	S0.194	0103000020E6100000010000000500000040C2FA92B1CD5A40E0270332138819C026E11E40B1CD5A403D547B5D168819C074B8FCCFB0CD5A40D79A84150B8819C0F713B422B1CD5A40C541E8E8078819C040C2FA92B1CD5A40E0270332138819C0
351	3	S0.195	0103000020E6100000010000000500000026E11E40B1CD5A403D547B5D168819C00D0043EDB0CD5A409A80F388198819C0F15C457DB0CD5A40EAF320420E8819C074B8FCCFB0CD5A40D79A84150B8819C026E11E40B1CD5A403D547B5D168819C0
352	3	S0.196	0103000020E610000001000000050000000D0043EDB0CD5A409A80F388198819C0F31E679AB0CD5A40F7AC6BB41C8819C06E018E2AB0CD5A40FD4CBD6E118819C0F15C457DB0CD5A40EAF320420E8819C00D0043EDB0CD5A409A80F388198819C0
353	3	S0.197	0103000020E610000001000000050000008285A6FFBFCD5A406640D0E4758719C0FF29EFACBFCD5A4079996C11798719C039003D36BFCD5A4072D7F5946D8719C025D6CF88BFCD5A40AA5135676A8719C08285A6FFBFCD5A406640D0E4758719C0
354	3	S0.198	0103000020E61000000100000005000000FF29EFACBFCD5A4079996C11798719C07CCE375ABFCD5A408CF2083E7C8719C04C2AAAE3BECD5A403B5DB6C2708719C039003D36BFCD5A4072D7F5946D8719C0FF29EFACBFCD5A4079996C11798719C0
355	3	S0.199	0103000020E610000001000000050000007CCE375ABFCD5A408CF2083E7C8719C0F9728007BFCD5A409E4BA56A7F8719C060541791BECD5A4003E376F0738719C04C2AAAE3BECD5A403B5DB6C2708719C07CCE375ABFCD5A408CF2083E7C8719C0
356	3	S0.200	0103000020E61000000100000005000000F9728007BFCD5A409E4BA56A7F8719C07617C9B4BECD5A40B1A44197828719C0747E843EBECD5A40CB68371E778719C060541791BECD5A4003E376F0738719C0F9728007BFCD5A409E4BA56A7F8719C0
357	3	S0.201	0103000020E610000001000000050000007617C9B4BECD5A40B1A44197828719C0F3BB1162BECD5A40C4FDDDC3858719C087A8F1EBBDCD5A4094EEF74B7A8719C0747E843EBECD5A40CB68371E778719C07617C9B4BECD5A40B1A44197828719C0
358	3	S0.202	0103000020E61000000100000005000000F3BB1162BECD5A40C4FDDDC3858719C070605A0FBECD5A40D7567AF0888719C09BD25E99BDCD5A405C74B8797D8719C087A8F1EBBDCD5A4094EEF74B7A8719C0F3BB1162BECD5A40C4FDDDC3858719C0
359	3	S0.203	0103000020E6100000010000000500000070605A0FBECD5A40D7567AF0888719C0ED04A3BCBDCD5A40E9AF161D8C8719C0AFFCCB46BDCD5A4024FA78A7808719C09BD25E99BDCD5A405C74B8797D8719C070605A0FBECD5A40D7567AF0888719C0
360	3	S0.204	0103000020E61000000100000005000000ED04A3BCBDCD5A40E9AF161D8C8719C06AA9EB69BDCD5A40FC08B3498F8719C0C32639F4BCCD5A40ED7F39D5838719C0AFFCCB46BDCD5A4024FA78A7808719C0ED04A3BCBDCD5A40E9AF161D8C8719C0
361	3	S0.205	0103000020E610000001000000050000006AA9EB69BDCD5A40FC08B3498F8719C0E74D3417BDCD5A400F624F76928719C0D650A6A1BCCD5A40B505FA02878719C0C32639F4BCCD5A40ED7F39D5838719C06AA9EB69BDCD5A40FC08B3498F8719C0
362	3	S0.206	0103000020E61000000100000005000000E74D3417BDCD5A400F624F76928719C064F27CC4BCCD5A4022BBEBA2958719C0EA7A134FBCCD5A407D8BBA308A8719C0D650A6A1BCCD5A40B505FA02878719C0E74D3417BDCD5A400F624F76928719C0
363	3	S0.207	0103000020E6100000010000000500000064F27CC4BCCD5A4022BBEBA2958719C0E196C571BCCD5A40341488CF988719C0FEA480FCBBCD5A4046117B5E8D8719C0EA7A134FBCCD5A407D8BBA308A8719C064F27CC4BCCD5A4022BBEBA2958719C0
364	3	S0.208	0103000020E61000000100000005000000E196C571BCCD5A40341488CF988719C05E3B0E1FBCCD5A40476D24FC9B8719C011CFEDA9BBCD5A400E973B8C908719C0FEA480FCBBCD5A4046117B5E8D8719C0E196C571BCCD5A40341488CF988719C0
365	3	S0.209	0103000020E610000001000000050000005E3B0E1FBCCD5A40476D24FC9B8719C0DBDF56CCBBCD5A405AC6C0289F8719C025F95A57BBCD5A40D71CFCB9938719C011CFEDA9BBCD5A400E973B8C908719C05E3B0E1FBCCD5A40476D24FC9B8719C0
366	3	S0.210	0103000020E61000000100000005000000DBDF56CCBBCD5A405AC6C0289F8719C058849F79BBCD5A406D1F5D55A28719C03923C804BBCD5A409FA2BCE7968719C025F95A57BBCD5A40D71CFCB9938719C0DBDF56CCBBCD5A405AC6C0289F8719C0
367	3	S0.211	0103000020E6100000010000000500000058849F79BBCD5A406D1F5D55A28719C0D528E826BBCD5A407F78F981A58719C04C4D35B2BACD5A4067287D159A8719C03923C804BBCD5A409FA2BCE7968719C058849F79BBCD5A406D1F5D55A28719C0
368	3	S0.212	0103000020E61000000100000005000000D528E826BBCD5A407F78F981A58719C052CD30D4BACD5A4092D195AEA88719C06077A25FBACD5A4030AE3D439D8719C04C4D35B2BACD5A4067287D159A8719C0D528E826BBCD5A407F78F981A58719C0
369	3	S0.213	0103000020E6100000010000000500000052CD30D4BACD5A4092D195AEA88719C0CF717981BACD5A40A52A32DBAB8719C074A10F0DBACD5A40F833FE70A08719C06077A25FBACD5A4030AE3D439D8719C052CD30D4BACD5A4092D195AEA88719C0
370	3	S0.214	0103000020E61000000100000005000000CF717981BACD5A40A52A32DBAB8719C04C16C22EBACD5A40B883CE07AF8719C087CB7CBAB9CD5A40C0B9BE9EA38719C074A10F0DBACD5A40F833FE70A08719C0CF717981BACD5A40A52A32DBAB8719C0
371	3	S0.215	0103000020E610000001000000050000004C16C22EBACD5A40B883CE07AF8719C0C9BA0ADCB9CD5A40CADC6A34B28719C09BF5E967B9CD5A40893F7FCCA68719C087CB7CBAB9CD5A40C0B9BE9EA38719C04C16C22EBACD5A40B883CE07AF8719C0
372	3	S0.216	0103000020E61000000100000005000000C9BA0ADCB9CD5A40CADC6A34B28719C0465F5389B9CD5A40DD350761B58719C0AF1F5715B9CD5A4051C53FFAA98719C09BF5E967B9CD5A40893F7FCCA68719C0C9BA0ADCB9CD5A40CADC6A34B28719C0
373	3	S0.217	0103000020E61000000100000005000000465F5389B9CD5A40DD350761B58719C0C3039C36B9CD5A40F08EA38DB88719C0C349C4C2B8CD5A40194B0028AD8719C0AF1F5715B9CD5A4051C53FFAA98719C0465F5389B9CD5A40DD350761B58719C0
374	3	S0.218	0103000020E61000000100000005000000C3039C36B9CD5A40F08EA38DB88719C040A8E4E3B8CD5A4003E83FBABB8719C0D6733170B8CD5A40E2D0C055B08719C0C349C4C2B8CD5A40194B0028AD8719C0C3039C36B9CD5A40F08EA38DB88719C0
375	3	S0.219	0103000020E6100000010000000500000040A8E4E3B8CD5A4003E83FBABB8719C0BD4C2D91B8CD5A401541DCE6BE8719C0EA9D9E1DB8CD5A40AA568183B38719C0D6733170B8CD5A40E2D0C055B08719C040A8E4E3B8CD5A4003E83FBABB8719C0
376	3	S0.220	0103000020E61000000100000005000000BD4C2D91B8CD5A401541DCE6BE8719C03AF1753EB8CD5A40289A7813C28719C0FEC70BCBB7CD5A4072DC41B1B68719C0EA9D9E1DB8CD5A40AA568183B38719C0BD4C2D91B8CD5A401541DCE6BE8719C0
377	3	S0.221	0103000020E610000001000000050000003AF1753EB8CD5A40289A7813C28719C0B695BEEBB7CD5A403BF31440C58719C011F27878B7CD5A403B6202DFB98719C0FEC70BCBB7CD5A4072DC41B1B68719C03AF1753EB8CD5A40289A7813C28719C0
378	3	S0.222	0103000020E61000000100000005000000B695BEEBB7CD5A403BF31440C58719C0333A0799B7CD5A404E4CB16CC88719C0251CE625B7CD5A4003E8C20CBD8719C011F27878B7CD5A403B6202DFB98719C0B695BEEBB7CD5A403BF31440C58719C0
379	3	S0.223	0103000020E61000000100000005000000333A0799B7CD5A404E4CB16CC88719C0B0DE4F46B7CD5A4060A54D99CB8719C0394653D3B6CD5A40CB6D833AC08719C0251CE625B7CD5A4003E8C20CBD8719C0333A0799B7CD5A404E4CB16CC88719C0
380	3	S0.224	0103000020E61000000100000005000000B0DE4F46B7CD5A4060A54D99CB8719C02D8398F3B6CD5A4073FEE9C5CE8719C04C70C080B6CD5A4094F34368C38719C0394653D3B6CD5A40CB6D833AC08719C0B0DE4F46B7CD5A4060A54D99CB8719C0
381	3	S0.225	0103000020E610000001000000050000002D8398F3B6CD5A4073FEE9C5CE8719C0AA27E1A0B6CD5A40865786F2D18719C0609A2D2EB6CD5A405C790496C68719C04C70C080B6CD5A4094F34368C38719C02D8398F3B6CD5A4073FEE9C5CE8719C0
382	3	S0.226	0103000020E61000000100000005000000AA27E1A0B6CD5A40865786F2D18719C027CC294EB6CD5A4099B0221FD58719C074C49ADBB5CD5A4024FFC4C3C98719C0609A2D2EB6CD5A405C790496C68719C0AA27E1A0B6CD5A40865786F2D18719C0
383	3	S0.227	0103000020E6100000010000000500000027CC294EB6CD5A4099B0221FD58719C0A47072FBB5CD5A40AB09BF4BD88719C088EE0789B5CD5A40ED8485F1CC8719C074C49ADBB5CD5A4024FFC4C3C98719C027CC294EB6CD5A4099B0221FD58719C0
384	3	S0.228	0103000020E61000000100000005000000A47072FBB5CD5A40AB09BF4BD88719C02115BBA8B5CD5A40BE625B78DB8719C09B187536B5CD5A40B50A461FD08719C088EE0789B5CD5A40ED8485F1CC8719C0A47072FBB5CD5A40AB09BF4BD88719C0
385	3	S0.229	0103000020E610000001000000050000002115BBA8B5CD5A40BE625B78DB8719C09EB90356B5CD5A40D1BBF7A4DE8719C0AF42E2E3B4CD5A407D90064DD38719C09B187536B5CD5A40B50A461FD08719C02115BBA8B5CD5A40BE625B78DB8719C0
386	3	S0.230	0103000020E610000001000000050000009EB90356B5CD5A40D1BBF7A4DE8719C01B5E4C03B5CD5A40E41494D1E18719C0C36C4F91B4CD5A404616C77AD68719C0AF42E2E3B4CD5A407D90064DD38719C09EB90356B5CD5A40D1BBF7A4DE8719C0
387	3	S0.231	0103000020E610000001000000050000001B5E4C03B5CD5A40E41494D1E18719C0980295B0B4CD5A40F66D30FEE48719C0D696BC3EB4CD5A400E9C87A8D98719C0C36C4F91B4CD5A404616C77AD68719C01B5E4C03B5CD5A40E41494D1E18719C0
388	3	S0.232	0103000020E61000000100000005000000980295B0B4CD5A40F66D30FEE48719C015A7DD5DB4CD5A4009C7CC2AE88719C0EAC029ECB3CD5A40D62148D6DC8719C0D696BC3EB4CD5A400E9C87A8D98719C0980295B0B4CD5A40F66D30FEE48719C0
389	3	S0.233	0103000020E6100000010000000500000015A7DD5DB4CD5A4009C7CC2AE88719C0924B260BB4CD5A401C206957EB8719C0FEEA9699B3CD5A409FA70804E08719C0EAC029ECB3CD5A40D62148D6DC8719C015A7DD5DB4CD5A4009C7CC2AE88719C0
390	3	S0.234	0103000020E61000000100000005000000924B260BB4CD5A401C206957EB8719C00FF06EB8B3CD5A402F790584EE8719C011150447B3CD5A40672DC931E38719C0FEEA9699B3CD5A409FA70804E08719C0924B260BB4CD5A401C206957EB8719C0
391	3	S0.235	0103000020E610000001000000050000000FF06EB8B3CD5A402F790584EE8719C08C94B765B3CD5A4041D2A1B0F18719C0253F71F4B2CD5A4030B3895FE68719C011150447B3CD5A40672DC931E38719C00FF06EB8B3CD5A402F790584EE8719C0
392	3	S0.236	0103000020E610000001000000050000008C94B765B3CD5A4041D2A1B0F18719C009390013B3CD5A40542B3EDDF48719C03969DEA1B2CD5A40F8384A8DE98719C0253F71F4B2CD5A4030B3895FE68719C08C94B765B3CD5A4041D2A1B0F18719C0
393	3	S0.237	0103000020E6100000010000000500000009390013B3CD5A40542B3EDDF48719C086DD48C0B2CD5A406784DA09F88719C04C934B4FB2CD5A40C0BE0ABBEC8719C03969DEA1B2CD5A40F8384A8DE98719C009390013B3CD5A40542B3EDDF48719C0
394	3	S0.238	0103000020E6100000010000000500000086DD48C0B2CD5A406784DA09F88719C00382916DB2CD5A407ADD7636FB8719C060BDB8FCB1CD5A408944CBE8EF8719C04C934B4FB2CD5A40C0BE0ABBEC8719C086DD48C0B2CD5A406784DA09F88719C0
395	3	S0.239	0103000020E610000001000000050000000382916DB2CD5A407ADD7636FB8719C08026DA1AB2CD5A408C361363FE8719C074E725AAB1CD5A4051CA8B16F38719C060BDB8FCB1CD5A408944CBE8EF8719C00382916DB2CD5A407ADD7636FB8719C0
396	3	S0.240	0103000020E610000001000000050000008026DA1AB2CD5A408C361363FE8719C0FDCA22C8B1CD5A409F8FAF8F018819C088119357B1CD5A4019504C44F68719C074E725AAB1CD5A4051CA8B16F38719C08026DA1AB2CD5A408C361363FE8719C0
397	3	S0.241	0103000020E61000000100000005000000FDCA22C8B1CD5A409F8FAF8F018819C07A6F6B75B1CD5A40B2E84BBC048819C09B3B0005B1CD5A40E2D50C72F98719C088119357B1CD5A4019504C44F68719C0FDCA22C8B1CD5A409F8FAF8F018819C0
398	3	S0.242	0103000020E610000001000000050000007A6F6B75B1CD5A40B2E84BBC048819C0F713B422B1CD5A40C541E8E8078819C0AF656DB2B0CD5A40AA5BCD9FFC8719C09B3B0005B1CD5A40E2D50C72F98719C07A6F6B75B1CD5A40B2E84BBC048819C0
399	3	S0.243	0103000020E61000000100000005000000F713B422B1CD5A40C541E8E8078819C074B8FCCFB0CD5A40D79A84150B8819C0C38FDA5FB0CD5A4072E18DCDFF8719C0AF656DB2B0CD5A40AA5BCD9FFC8719C0F713B422B1CD5A40C541E8E8078819C0
400	3	S0.244	0103000020E6100000010000000500000074B8FCCFB0CD5A40D79A84150B8819C0F15C457DB0CD5A40EAF320420E8819C0D6B9470DB0CD5A403B674EFB028819C0C38FDA5FB0CD5A4072E18DCDFF8719C074B8FCCFB0CD5A40D79A84150B8819C0
401	3	S0.245	0103000020E61000000100000005000000F15C457DB0CD5A40EAF320420E8819C06E018E2AB0CD5A40FD4CBD6E118819C0EAE3B4BAAFCD5A4003ED0E29068819C0D6B9470DB0CD5A403B674EFB028819C0F15C457DB0CD5A40EAF320420E8819C0
402	3	S0.246	0103000020E6100000010000000500000025D6CF88BFCD5A40AA5135676A8719C039003D36BFCD5A4072D7F5946D8719C072D68ABFBECD5A406B157F18628719C0C826F911BFCD5A40ED629AE95E8719C025D6CF88BFCD5A40AA5135676A8719C0
403	3	S0.247	0103000020E6100000010000000500000039003D36BFCD5A4072D7F5946D8719C04C2AAAE3BECD5A403B5DB6C2708719C01D861C6DBECD5A40E9C76347658719C072D68ABFBECD5A406B157F18628719C039003D36BFCD5A4072D7F5946D8719C0
404	3	S0.248	0103000020E610000001000000050000004C2AAAE3BECD5A403B5DB6C2708719C060541791BECD5A4003E376F0738719C0C735AE1ABECD5A40677A4876688719C01D861C6DBECD5A40E9C76347658719C04C2AAAE3BECD5A403B5DB6C2708719C0
405	3	S0.249	0103000020E6100000010000000500000060541791BECD5A4003E376F0738719C0747E843EBECD5A40CB68371E778719C072E53FC8BDCD5A40E52C2DA56B8719C0C735AE1ABECD5A40677A4876688719C060541791BECD5A4003E376F0738719C0
406	3	S0.250	0103000020E61000000100000005000000747E843EBECD5A40CB68371E778719C087A8F1EBBDCD5A4094EEF74B7A8719C01C95D175BDCD5A4063DF11D46E8719C072E53FC8BDCD5A40E52C2DA56B8719C0747E843EBECD5A40CB68371E778719C0
407	3	S0.251	0103000020E6100000010000000500000087A8F1EBBDCD5A4094EEF74B7A8719C09BD25E99BDCD5A405C74B8797D8719C0C6446323BDCD5A40E191F602728719C01C95D175BDCD5A4063DF11D46E8719C087A8F1EBBDCD5A4094EEF74B7A8719C0
408	3	S0.252	0103000020E610000001000000050000009BD25E99BDCD5A405C74B8797D8719C0AFFCCB46BDCD5A4024FA78A7808719C071F4F4D0BCCD5A405F44DB31758719C0C6446323BDCD5A40E191F602728719C09BD25E99BDCD5A405C74B8797D8719C0
409	3	S0.253	0103000020E61000000100000005000000AFFCCB46BDCD5A4024FA78A7808719C0C32639F4BCCD5A40ED7F39D5838719C01BA4867EBCCD5A40DDF6BF60788719C071F4F4D0BCCD5A405F44DB31758719C0AFFCCB46BDCD5A4024FA78A7808719C0
410	3	S0.254	0103000020E61000000100000005000000C32639F4BCCD5A40ED7F39D5838719C0D650A6A1BCCD5A40B505FA02878719C0C553182CBCCD5A405BA9A48F7B8719C01BA4867EBCCD5A40DDF6BF60788719C0C32639F4BCCD5A40ED7F39D5838719C0
411	3	S0.255	0103000020E61000000100000005000000D650A6A1BCCD5A40B505FA02878719C0EA7A134FBCCD5A407D8BBA308A8719C07003AAD9BBCD5A40D95B89BE7E8719C0C553182CBCCD5A405BA9A48F7B8719C0D650A6A1BCCD5A40B505FA02878719C0
412	3	S0.256	0103000020E61000000100000005000000EA7A134FBCCD5A407D8BBA308A8719C0FEA480FCBBCD5A4046117B5E8D8719C01AB33B87BBCD5A40570E6EED818719C07003AAD9BBCD5A40D95B89BE7E8719C0EA7A134FBCCD5A407D8BBA308A8719C0
413	3	S0.257	0103000020E61000000100000005000000FEA480FCBBCD5A4046117B5E8D8719C011CFEDA9BBCD5A400E973B8C908719C0C562CD34BBCD5A40D5C0521C858719C01AB33B87BBCD5A40570E6EED818719C0FEA480FCBBCD5A4046117B5E8D8719C0
414	3	S0.258	0103000020E6100000010000000500000011CFEDA9BBCD5A400E973B8C908719C025F95A57BBCD5A40D71CFCB9938719C06F125FE2BACD5A405273374B888719C0C562CD34BBCD5A40D5C0521C858719C011CFEDA9BBCD5A400E973B8C908719C0
415	3	S0.259	0103000020E6100000010000000500000025F95A57BBCD5A40D71CFCB9938719C03923C804BBCD5A409FA2BCE7968719C019C2F08FBACD5A40D0251C7A8B8719C06F125FE2BACD5A405273374B888719C025F95A57BBCD5A40D71CFCB9938719C0
416	3	S0.260	0103000020E610000001000000050000003923C804BBCD5A409FA2BCE7968719C04C4D35B2BACD5A4067287D159A8719C0C471823DBACD5A404ED800A98E8719C019C2F08FBACD5A40D0251C7A8B8719C03923C804BBCD5A409FA2BCE7968719C0
417	3	S0.261	0103000020E610000001000000050000004C4D35B2BACD5A4067287D159A8719C06077A25FBACD5A4030AE3D439D8719C06E2114EBB9CD5A40CC8AE5D7918719C0C471823DBACD5A404ED800A98E8719C04C4D35B2BACD5A4067287D159A8719C0
418	3	S0.262	0103000020E610000001000000050000006077A25FBACD5A4030AE3D439D8719C074A10F0DBACD5A40F833FE70A08719C019D1A598B9CD5A404A3DCA06958719C06E2114EBB9CD5A40CC8AE5D7918719C06077A25FBACD5A4030AE3D439D8719C0
419	3	S0.263	0103000020E6100000010000000500000074A10F0DBACD5A40F833FE70A08719C087CB7CBAB9CD5A40C0B9BE9EA38719C0C3803746B9CD5A40C8EFAE35988719C019D1A598B9CD5A404A3DCA06958719C074A10F0DBACD5A40F833FE70A08719C0
420	3	S0.264	0103000020E6100000010000000500000087CB7CBAB9CD5A40C0B9BE9EA38719C09BF5E967B9CD5A40893F7FCCA68719C06D30C9F3B8CD5A4046A293649B8719C0C3803746B9CD5A40C8EFAE35988719C087CB7CBAB9CD5A40C0B9BE9EA38719C0
421	3	S0.265	0103000020E610000001000000050000009BF5E967B9CD5A40893F7FCCA68719C0AF1F5715B9CD5A4051C53FFAA98719C018E05AA1B8CD5A40C45478939E8719C06D30C9F3B8CD5A4046A293649B8719C09BF5E967B9CD5A40893F7FCCA68719C0
422	3	S0.266	0103000020E61000000100000005000000AF1F5715B9CD5A4051C53FFAA98719C0C349C4C2B8CD5A40194B0028AD8719C0C28FEC4EB8CD5A4042075DC2A18719C018E05AA1B8CD5A40C45478939E8719C0AF1F5715B9CD5A4051C53FFAA98719C0
423	3	S0.267	0103000020E61000000100000005000000C349C4C2B8CD5A40194B0028AD8719C0D6733170B8CD5A40E2D0C055B08719C06D3F7EFCB7CD5A40C0B941F1A48719C0C28FEC4EB8CD5A4042075DC2A18719C0C349C4C2B8CD5A40194B0028AD8719C0
424	3	S0.268	0103000020E61000000100000005000000D6733170B8CD5A40E2D0C055B08719C0EA9D9E1DB8CD5A40AA568183B38719C017EF0FAAB7CD5A403E6C2620A88719C06D3F7EFCB7CD5A40C0B941F1A48719C0D6733170B8CD5A40E2D0C055B08719C0
425	3	S0.269	0103000020E61000000100000005000000EA9D9E1DB8CD5A40AA568183B38719C0FEC70BCBB7CD5A4072DC41B1B68719C0C19EA157B7CD5A40BC1E0B4FAB8719C017EF0FAAB7CD5A403E6C2620A88719C0EA9D9E1DB8CD5A40AA568183B38719C0
426	3	S0.270	0103000020E61000000100000005000000FEC70BCBB7CD5A4072DC41B1B68719C011F27878B7CD5A403B6202DFB98719C06C4E3305B7CD5A403AD1EF7DAE8719C0C19EA157B7CD5A40BC1E0B4FAB8719C0FEC70BCBB7CD5A4072DC41B1B68719C0
427	3	S0.271	0103000020E6100000010000000500000011F27878B7CD5A403B6202DFB98719C0251CE625B7CD5A4003E8C20CBD8719C016FEC4B2B6CD5A40B883D4ACB18719C06C4E3305B7CD5A403AD1EF7DAE8719C011F27878B7CD5A403B6202DFB98719C0
428	3	S0.272	0103000020E61000000100000005000000251CE625B7CD5A4003E8C20CBD8719C0394653D3B6CD5A40CB6D833AC08719C0C0AD5660B6CD5A403636B9DBB48719C016FEC4B2B6CD5A40B883D4ACB18719C0251CE625B7CD5A4003E8C20CBD8719C0
429	3	S0.273	0103000020E61000000100000005000000394653D3B6CD5A40CB6D833AC08719C04C70C080B6CD5A4094F34368C38719C06B5DE80DB6CD5A40B4E89D0AB88719C0C0AD5660B6CD5A403636B9DBB48719C0394653D3B6CD5A40CB6D833AC08719C0
430	3	S0.274	0103000020E610000001000000050000004C70C080B6CD5A4094F34368C38719C0609A2D2EB6CD5A405C790496C68719C0150D7ABBB5CD5A40329B8239BB8719C06B5DE80DB6CD5A40B4E89D0AB88719C04C70C080B6CD5A4094F34368C38719C0
431	3	S0.275	0103000020E61000000100000005000000609A2D2EB6CD5A405C790496C68719C074C49ADBB5CD5A4024FFC4C3C98719C0C0BC0B69B5CD5A40B04D6768BE8719C0150D7ABBB5CD5A40329B8239BB8719C0609A2D2EB6CD5A405C790496C68719C0
432	3	S0.276	0103000020E6100000010000000500000074C49ADBB5CD5A4024FFC4C3C98719C088EE0789B5CD5A40ED8485F1CC8719C06A6C9D16B5CD5A402E004C97C18719C0C0BC0B69B5CD5A40B04D6768BE8719C074C49ADBB5CD5A4024FFC4C3C98719C0
433	3	S0.277	0103000020E6100000010000000500000088EE0789B5CD5A40ED8485F1CC8719C09B187536B5CD5A40B50A461FD08719C0141C2FC4B4CD5A40ACB230C6C48719C06A6C9D16B5CD5A402E004C97C18719C088EE0789B5CD5A40ED8485F1CC8719C0
434	3	S0.278	0103000020E610000001000000050000009B187536B5CD5A40B50A461FD08719C0AF42E2E3B4CD5A407D90064DD38719C0BFCBC071B4CD5A402A6515F5C78719C0141C2FC4B4CD5A40ACB230C6C48719C09B187536B5CD5A40B50A461FD08719C0
435	3	S0.279	0103000020E61000000100000005000000AF42E2E3B4CD5A407D90064DD38719C0C36C4F91B4CD5A404616C77AD68719C0697B521FB4CD5A40A817FA23CB8719C0BFCBC071B4CD5A402A6515F5C78719C0AF42E2E3B4CD5A407D90064DD38719C0
436	3	S0.280	0103000020E61000000100000005000000C36C4F91B4CD5A404616C77AD68719C0D696BC3EB4CD5A400E9C87A8D98719C0142BE4CCB3CD5A4026CADE52CE8719C0697B521FB4CD5A40A817FA23CB8719C0C36C4F91B4CD5A404616C77AD68719C0
437	3	S0.281	0103000020E61000000100000005000000D696BC3EB4CD5A400E9C87A8D98719C0EAC029ECB3CD5A40D62148D6DC8719C0BEDA757AB3CD5A40A47CC381D18719C0142BE4CCB3CD5A4026CADE52CE8719C0D696BC3EB4CD5A400E9C87A8D98719C0
438	3	S0.282	0103000020E61000000100000005000000EAC029ECB3CD5A40D62148D6DC8719C0FEEA9699B3CD5A409FA70804E08719C0688A0728B3CD5A40212FA8B0D48719C0BEDA757AB3CD5A40A47CC381D18719C0EAC029ECB3CD5A40D62148D6DC8719C0
439	3	S0.283	0103000020E61000000100000005000000FEEA9699B3CD5A409FA70804E08719C011150447B3CD5A40672DC931E38719C0133A99D5B2CD5A409FE18CDFD78719C0688A0728B3CD5A40212FA8B0D48719C0FEEA9699B3CD5A409FA70804E08719C0
440	3	S0.284	0103000020E6100000010000000500000011150447B3CD5A40672DC931E38719C0253F71F4B2CD5A4030B3895FE68719C0BDE92A83B2CD5A401D94710EDB8719C0133A99D5B2CD5A409FE18CDFD78719C011150447B3CD5A40672DC931E38719C0
441	3	S0.285	0103000020E61000000100000005000000253F71F4B2CD5A4030B3895FE68719C03969DEA1B2CD5A40F8384A8DE98719C06899BC30B2CD5A409B46563DDE8719C0BDE92A83B2CD5A401D94710EDB8719C0253F71F4B2CD5A4030B3895FE68719C0
442	3	S0.286	0103000020E610000001000000050000003969DEA1B2CD5A40F8384A8DE98719C04C934B4FB2CD5A40C0BE0ABBEC8719C012494EDEB1CD5A4019F93A6CE18719C06899BC30B2CD5A409B46563DDE8719C03969DEA1B2CD5A40F8384A8DE98719C0
443	3	S0.287	0103000020E610000001000000050000004C934B4FB2CD5A40C0BE0ABBEC8719C060BDB8FCB1CD5A408944CBE8EF8719C0BCF8DF8BB1CD5A4097AB1F9BE48719C012494EDEB1CD5A4019F93A6CE18719C04C934B4FB2CD5A40C0BE0ABBEC8719C0
444	3	S0.288	0103000020E6100000010000000500000060BDB8FCB1CD5A408944CBE8EF8719C074E725AAB1CD5A4051CA8B16F38719C067A87139B1CD5A40155E04CAE78719C0BCF8DF8BB1CD5A4097AB1F9BE48719C060BDB8FCB1CD5A408944CBE8EF8719C0
445	3	S0.289	0103000020E6100000010000000500000074E725AAB1CD5A4051CA8B16F38719C088119357B1CD5A4019504C44F68719C0115803E7B0CD5A409310E9F8EA8719C067A87139B1CD5A40155E04CAE78719C074E725AAB1CD5A4051CA8B16F38719C0
446	3	S0.290	0103000020E6100000010000000500000088119357B1CD5A4019504C44F68719C09B3B0005B1CD5A40E2D50C72F98719C0BB079594B0CD5A4011C3CD27EE8719C0115803E7B0CD5A409310E9F8EA8719C088119357B1CD5A4019504C44F68719C0
447	3	S0.291	0103000020E610000001000000050000009B3B0005B1CD5A40E2D50C72F98719C0AF656DB2B0CD5A40AA5BCD9FFC8719C066B72642B0CD5A408F75B256F18719C0BB079594B0CD5A4011C3CD27EE8719C09B3B0005B1CD5A40E2D50C72F98719C0
448	3	S0.292	0103000020E61000000100000005000000AF656DB2B0CD5A40AA5BCD9FFC8719C0C38FDA5FB0CD5A4072E18DCDFF8719C01067B8EFAFCD5A400D289785F48719C066B72642B0CD5A408F75B256F18719C0AF656DB2B0CD5A40AA5BCD9FFC8719C0
449	3	S0.293	0103000020E61000000100000005000000C38FDA5FB0CD5A4072E18DCDFF8719C0D6B9470DB0CD5A403B674EFB028819C0BB164A9DAFCD5A408BDA7BB4F78719C01067B8EFAFCD5A400D289785F48719C0C38FDA5FB0CD5A4072E18DCDFF8719C0
450	3	S0.294	0103000020E61000000100000005000000D6B9470DB0CD5A403B674EFB028819C0EAE3B4BAAFCD5A4003ED0E29068819C065C6DB4AAFCD5A40098D60E3FA8719C0BB164A9DAFCD5A408BDA7BB4F78719C0D6B9470DB0CD5A403B674EFB028819C0
\.


--
-- Data for Name: line_points; Type: TABLE DATA; Schema: poc_location; Owner: rnd_eagle
--

COPY poc_location.line_points (id, name, geom, longitude, latitude) FROM stdin;
739	line B.1	0101000020E610000099932A64C1CD5A409C0CA15D988719C0	107.21492866666667	-6.3824171666666665
740	line B.2	0101000020E610000052A70511C1CD5A408EDFD0869B8719C0	107.21490884353742	-6.382429224489796
741	line B.3	0101000020E61000000BBBE0BDC0CD5A4080B200B09E8719C0	107.21488902040817	-6.382441282312925
742	line B.4	0101000020E6100000C4CEBB6AC0CD5A40728530D9A18719C0	107.21486919727892	-6.382453340136054
743	line B.5	0101000020E61000007DE29617C0CD5A4064586002A58719C0	107.21484937414967	-6.382465397959184
744	line B.6	0101000020E610000035F671C4BFCD5A40562B902BA88719C0	107.2148295510204	-6.382477455782313
745	line B.7	0101000020E6100000EE094D71BFCD5A4048FEBF54AB8719C0	107.21480972789115	-6.382489513605442
746	line B.8	0101000020E6100000A71D281EBFCD5A403AD1EF7DAE8719C0	107.2147899047619	-6.3825015714285716
747	line B.9	0101000020E6100000603103CBBECD5A402CA41FA7B18719C0	107.21477008163265	-6.382513629251701
748	line B.10	0101000020E61000001945DE77BECD5A401E774FD0B48719C0	107.2147502585034	-6.38252568707483
749	line B.11	0101000020E6100000D258B924BECD5A40104A7FF9B78719C0	107.21473043537415	-6.382537744897959
750	line B.12	0101000020E61000008B6C94D1BDCD5A40021DAF22BB8719C0	107.2147106122449	-6.382549802721089
751	line B.13	0101000020E610000044806F7EBDCD5A40F4EFDE4BBE8719C0	107.21469078911565	-6.382561860544218
752	line B.14	0101000020E6100000FC934A2BBDCD5A40E5C20E75C18719C0	107.21467096598639	-6.382573918367346
753	line B.15	0101000020E6100000B5A725D8BCCD5A40D7953E9EC48719C0	107.21465114285714	-6.382585976190476
754	line B.16	0101000020E61000006EBB0085BCCD5A40C9686EC7C78719C0	107.21463131972789	-6.382598034013605
755	line B.17	0101000020E610000027CFDB31BCCD5A40BB3B9EF0CA8719C0	107.21461149659864	-6.382610091836734
756	line B.18	0101000020E6100000E0E2B6DEBBCD5A40AD0ECE19CE8719C0	107.21459167346939	-6.382622149659864
757	line B.19	0101000020E610000099F6918BBBCD5A409FE1FD42D18719C0	107.21457185034014	-6.382634207482993
758	line B.20	0101000020E6100000520A6D38BBCD5A4091B42D6CD48719C0	107.21455202721089	-6.382646265306122
759	line B.21	0101000020E61000000B1E48E5BACD5A4083875D95D78719C0	107.21453220408164	-6.3826583231292515
760	line B.22	0101000020E6100000C3312392BACD5A40755A8DBEDA8719C0	107.21451238095237	-6.382670380952381
761	line B.23	0101000020E61000007C45FE3EBACD5A40672DBDE7DD8719C0	107.21449255782312	-6.38268243877551
762	line B.24	0101000020E61000003559D9EBB9CD5A405900ED10E18719C0	107.21447273469387	-6.382694496598639
763	line B.25	0101000020E6100000EE6CB498B9CD5A404BD31C3AE48719C0	107.21445291156462	-6.382706554421769
764	line B.26	0101000020E6100000A7808F45B9CD5A403DA64C63E78719C0	107.21443308843537	-6.382718612244898
765	line B.27	0101000020E610000060946AF2B8CD5A402F797C8CEA8719C0	107.21441326530612	-6.382730670068027
766	line B.28	0101000020E610000019A8459FB8CD5A40214CACB5ED8719C0	107.21439344217687	-6.382742727891157
767	line B.29	0101000020E6100000D2BB204CB8CD5A40131FDCDEF08719C0	107.21437361904762	-6.382754785714286
768	line B.30	0101000020E61000008ACFFBF8B7CD5A4005F20B08F48719C0	107.21435379591836	-6.382766843537415
769	line B.31	0101000020E610000043E3D6A5B7CD5A40F7C43B31F78719C0	107.2143339727891	-6.3827789013605445
770	line B.32	0101000020E6100000FCF6B152B7CD5A40E9976B5AFA8719C0	107.21431414965986	-6.382790959183674
771	line B.33	0101000020E6100000B50A8DFFB6CD5A40DB6A9B83FD8719C0	107.2142943265306	-6.382803017006803
772	line B.34	0101000020E61000006E1E68ACB6CD5A40CD3DCBAC008819C0	107.21427450340136	-6.382815074829932
773	line B.35	0101000020E610000027324359B6CD5A40BF10FBD5038819C0	107.2142546802721	-6.382827132653062
774	line B.36	0101000020E6100000E0451E06B6CD5A40B1E32AFF068819C0	107.21423485714286	-6.382839190476191
775	line B.37	0101000020E61000009959F9B2B5CD5A40A3B65A280A8819C0	107.2142150340136	-6.38285124829932
776	line B.38	0101000020E6100000516DD45FB5CD5A4094898A510D8819C0	107.21419521088434	-6.382863306122449
777	line B.39	0101000020E61000000A81AF0CB5CD5A40865CBA7A108819C0	107.21417538775509	-6.382875363945578
778	line B.40	0101000020E6100000C3948AB9B4CD5A40782FEAA3138819C0	107.21415556462584	-6.382887421768707
779	line B.41	0101000020E61000007CA86566B4CD5A406A021ACD168819C0	107.21413574149659	-6.382899479591837
780	line B.42	0101000020E610000035BC4013B4CD5A405CD549F6198819C0	107.21411591836734	-6.382911537414966
781	line B.43	0101000020E6100000EECF1BC0B3CD5A404EA8791F1D8819C0	107.21409609523809	-6.382923595238095
782	line B.44	0101000020E6100000A7E3F66CB3CD5A40407BA948208819C0	107.21407627210884	-6.3829356530612245
783	line B.45	0101000020E610000060F7D119B3CD5A40324ED971238819C0	107.21405644897959	-6.382947710884354
784	line B.46	0101000020E6100000180BADC6B2CD5A402421099B268819C0	107.21403662585033	-6.382959768707483
785	line B.47	0101000020E6100000D11E8873B2CD5A4016F438C4298819C0	107.21401680272108	-6.382971826530612
786	line B.48	0101000020E61000008A326320B2CD5A4008C768ED2C8819C0	107.21399697959183	-6.382983884353742
787	line B.49	0101000020E610000043463ECDB1CD5A40FA999816308819C0	107.21397715646258	-6.382995942176871
788	line B.50	0101000020E6100000FC59197AB1CD5A40EC6CC83F338819C0	107.21395733333333	-6.383008
789	line C.1	0101000020E61000003CE453EDC0CD5A40E01D06E08C8719C0	107.21490033333333	-6.382373333333334
790	line C.2	0101000020E61000008C7D539AC0CD5A40881D5A0A908719C0	107.21488054421769	-6.382385408163266
791	line C.3	0101000020E6100000DB165347C0CD5A402F1DAE34938719C0	107.21486075510204	-6.3823974829931975
792	line C.4	0101000020E61000002BB052F4BFCD5A40D71C025F968719C0	107.2148409659864	-6.38240955782313
793	line C.5	0101000020E61000007A4952A1BFCD5A407E1C5689998719C0	107.21482117687074	-6.382421632653061
794	line C.6	0101000020E6100000CAE2514EBFCD5A40261CAAB39C8719C0	107.2148013877551	-6.382433707482994
795	line C.7	0101000020E61000001A7C51FBBECD5A40CD1BFEDD9F8719C0	107.21478159863946	-6.382445782312925
796	line C.8	0101000020E6100000691551A8BECD5A40751B5208A38719C0	107.21476180952381	-6.382457857142858
797	line C.9	0101000020E6100000B9AE5055BECD5A401C1BA632A68719C0	107.21474202040817	-6.382469931972789
798	line C.10	0101000020E610000008485002BECD5A40C41AFA5CA98719C0	107.21472223129251	-6.3824820068027215
799	line C.11	0101000020E610000058E14FAFBDCD5A406C1A4E87AC8719C0	107.21470244217687	-6.382494081632654
800	line C.12	0101000020E6100000A87A4F5CBDCD5A40131AA2B1AF8719C0	107.21468265306123	-6.382506156462585
801	line C.13	0101000020E6100000F7134F09BDCD5A40BB19F6DBB28719C0	107.21466286394558	-6.382518231292518
802	line C.14	0101000020E610000047AD4EB6BCCD5A4062194A06B68719C0	107.21464307482994	-6.382530306122449
803	line C.15	0101000020E610000096464E63BCCD5A400A199E30B98719C0	107.21462328571428	-6.382542380952382
804	line C.16	0101000020E6100000E6DF4D10BCCD5A40B118F25ABC8719C0	107.21460349659864	-6.382554455782313
805	line C.17	0101000020E610000035794DBDBBCD5A4059184685BF8719C0	107.21458370748299	-6.382566530612245
806	line C.18	0101000020E610000085124D6ABBCD5A4000189AAFC28719C0	107.21456391836735	-6.382578605442177
807	line C.19	0101000020E6100000D5AB4C17BBCD5A40A817EED9C58719C0	107.2145441292517	-6.382590680272109
808	line C.20	0101000020E610000024454CC4BACD5A404F174204C98719C0	107.21452434013605	-6.382602755102041
809	line C.21	0101000020E610000074DE4B71BACD5A40F716962ECC8719C0	107.21450455102041	-6.382614829931973
810	line C.22	0101000020E6100000C3774B1EBACD5A409F16EA58CF8719C0	107.21448476190476	-6.3826269047619055
811	line C.23	0101000020E610000013114BCBB9CD5A4046163E83D28719C0	107.21446497278912	-6.382638979591837
812	line C.24	0101000020E610000063AA4A78B9CD5A40EE1592ADD58719C0	107.21444518367348	-6.382651054421769
813	line C.25	0101000020E6100000B2434A25B9CD5A409515E6D7D88719C0	107.21442539455782	-6.382663129251701
814	line C.26	0101000020E610000002DD49D2B8CD5A403D153A02DC8719C0	107.21440560544218	-6.382675204081633
815	line C.27	0101000020E61000005176497FB8CD5A40E4148E2CDF8719C0	107.21438581632653	-6.382687278911565
816	line C.28	0101000020E6100000A10F492CB8CD5A408C14E256E28719C0	107.21436602721089	-6.382699353741497
817	line C.29	0101000020E6100000F1A848D9B7CD5A4033143681E58719C0	107.21434623809525	-6.382711428571429
818	line C.30	0101000020E610000040424886B7CD5A40DB138AABE88719C0	107.21432644897959	-6.382723503401361
819	line C.31	0101000020E610000090DB4733B7CD5A408313DED5EB8719C0	107.21430665986395	-6.382735578231293
820	line C.32	0101000020E6100000DF7447E0B6CD5A402A133200EF8719C0	107.2142868707483	-6.382747653061225
821	line C.33	0101000020E61000002F0E478DB6CD5A40D212862AF28719C0	107.21426708163266	-6.382759727891157
822	line C.34	0101000020E61000007FA7463AB6CD5A407912DA54F58719C0	107.21424729251702	-6.382771802721089
823	line C.35	0101000020E6100000CE4046E7B5CD5A4021122E7FF88719C0	107.21422750340136	-6.382783877551021
824	line C.36	0101000020E61000001EDA4594B5CD5A40C81182A9FB8719C0	107.21420771428572	-6.3827959523809525
825	line C.37	0101000020E61000006D734541B5CD5A407011D6D3FE8719C0	107.21418792517007	-6.382808027210885
826	line C.38	0101000020E6100000BD0C45EEB4CD5A4017112AFE018819C0	107.21416813605443	-6.382820102040816
827	line C.39	0101000020E61000000CA6449BB4CD5A40BF107E28058819C0	107.21414834693877	-6.382832176870749
828	line C.40	0101000020E61000005C3F4448B4CD5A406610D252088819C0	107.21412855782313	-6.38284425170068
829	line C.41	0101000020E6100000ACD843F5B3CD5A400E10267D0B8819C0	107.21410876870749	-6.382856326530613
830	line C.42	0101000020E6100000FB7143A2B3CD5A40B60F7AA70E8819C0	107.21408897959184	-6.382868401360545
831	line C.43	0101000020E61000004B0B434FB3CD5A405D0FCED1118819C0	107.2140691904762	-6.3828804761904765
832	line C.44	0101000020E61000009AA442FCB2CD5A40050F22FC148819C0	107.21404940136054	-6.382892551020409
833	line C.45	0101000020E6100000EA3D42A9B2CD5A40AC0E7626188819C0	107.2140296122449	-6.38290462585034
834	line C.46	0101000020E61000003AD74156B2CD5A40540ECA501B8819C0	107.21400982312926	-6.382916700680273
835	line C.47	0101000020E610000089704103B2CD5A40FB0D1E7B1E8819C0	107.2139900340136	-6.382928775510204
836	line C.48	0101000020E6100000D90941B0B1CD5A40A30D72A5218819C0	107.21397024489796	-6.382940850340137
837	line C.49	0101000020E610000028A3405DB1CD5A404A0DC6CF248819C0	107.21395045578231	-6.382952925170068
838	line C.50	0101000020E6100000783C400AB1CD5A40F20C1AFA278819C0	107.21393066666667	-6.382965
839	line D.1	0101000020E6100000DF347D76C0CD5A40232F6B62818719C0	107.214872	-6.3823295
840	line D.2	0101000020E6100000C553A123C0CD5A40805BE38D848719C0	107.21485224489795	-6.3823415918367346
841	line D.3	0101000020E6100000AC72C5D0BFCD5A40DD875BB9878719C0	107.21483248979592	-6.382353683673469
842	line D.4	0101000020E61000009291E97DBFCD5A403AB4D3E48A8719C0	107.21481273469388	-6.382365775510204
843	line D.5	0101000020E610000078B00D2BBFCD5A4098E04B108E8719C0	107.21479297959183	-6.382377867346939
844	line D.6	0101000020E61000005ECF31D8BECD5A40F50CC43B918719C0	107.21477322448979	-6.382389959183674
845	line D.7	0101000020E610000045EE5585BECD5A4052393C67948719C0	107.21475346938776	-6.382402051020408
846	line D.8	0101000020E61000002B0D7A32BECD5A40AF65B492978719C0	107.21473371428571	-6.382414142857143
847	line D.9	0101000020E6100000112C9EDFBDCD5A400C922CBE9A8719C0	107.21471395918367	-6.382426234693877
848	line D.10	0101000020E6100000F84AC28CBDCD5A4069BEA4E99D8719C0	107.21469420408164	-6.382438326530612
849	line D.11	0101000020E6100000DE69E639BDCD5A40C6EA1C15A18719C0	107.2146744489796	-6.3824504183673465
850	line D.12	0101000020E6100000C4880AE7BCCD5A4024179540A48719C0	107.21465469387755	-6.382462510204082
851	line D.13	0101000020E6100000AAA72E94BCCD5A4081430D6CA78719C0	107.2146349387755	-6.3824746020408165
852	line D.14	0101000020E610000091C65241BCCD5A40DE6F8597AA8719C0	107.21461518367347	-6.382486693877551
853	line D.15	0101000020E610000077E576EEBBCD5A403B9CFDC2AD8719C0	107.21459542857143	-6.382498785714286
854	line D.16	0101000020E61000005D049B9BBBCD5A4098C875EEB08719C0	107.21457567346938	-6.38251087755102
855	line D.17	0101000020E61000004423BF48BBCD5A40F5F4ED19B48719C0	107.21455591836735	-6.382522969387755
856	line D.18	0101000020E61000002A42E3F5BACD5A4052216645B78719C0	107.21453616326531	-6.382535061224489
857	line D.19	0101000020E6100000106107A3BACD5A40B04DDE70BA8719C0	107.21451640816326	-6.382547153061225
858	line D.20	0101000020E6100000F67F2B50BACD5A400D7A569CBD8719C0	107.21449665306122	-6.382559244897959
859	line D.21	0101000020E6100000DD9E4FFDB9CD5A406AA6CEC7C08719C0	107.21447689795919	-6.382571336734694
860	line D.22	0101000020E6100000C3BD73AAB9CD5A40C7D246F3C38719C0	107.21445714285714	-6.3825834285714285
861	line D.23	0101000020E6100000A9DC9757B9CD5A4024FFBE1EC78719C0	107.2144373877551	-6.382595520408163
862	line D.24	0101000020E610000090FBBB04B9CD5A40812B374ACA8719C0	107.21441763265307	-6.382607612244898
863	line D.25	0101000020E6100000761AE0B1B8CD5A40DE57AF75CD8719C0	107.21439787755102	-6.382619704081632
864	line D.26	0101000020E61000005C39045FB8CD5A403C8427A1D08719C0	107.21437812244898	-6.382631795918368
865	line D.27	0101000020E61000004258280CB8CD5A4099B09FCCD38719C0	107.21435836734693	-6.382643887755102
866	line D.28	0101000020E610000029774CB9B7CD5A40F6DC17F8D68719C0	107.2143386122449	-6.382655979591837
867	line D.29	0101000020E61000000F967066B7CD5A4053099023DA8719C0	107.21431885714286	-6.382668071428571
868	line D.30	0101000020E6100000F5B49413B7CD5A40B035084FDD8719C0	107.21429910204081	-6.382680163265306
869	line D.31	0101000020E6100000DCD3B8C0B6CD5A400D62807AE08719C0	107.21427934693878	-6.38269225510204
870	line D.32	0101000020E6100000C2F2DC6DB6CD5A406A8EF8A5E38719C0	107.21425959183674	-6.382704346938775
871	line D.33	0101000020E6100000A811011BB6CD5A40C8BA70D1E68719C0	107.21423983673469	-6.38271643877551
872	line D.34	0101000020E61000008E3025C8B5CD5A4025E7E8FCE98719C0	107.21422008163265	-6.382728530612245
873	line D.35	0101000020E6100000754F4975B5CD5A4082136128ED8719C0	107.21420032653062	-6.3827406224489796
874	line D.36	0101000020E61000005B6E6D22B5CD5A40DF3FD953F08719C0	107.21418057142857	-6.382752714285714
875	line D.37	0101000020E6100000418D91CFB4CD5A403C6C517FF38719C0	107.21416081632653	-6.382764806122449
876	line D.38	0101000020E610000028ACB57CB4CD5A409998C9AAF68719C0	107.2141410612245	-6.382776897959183
877	line D.39	0101000020E61000000ECBD929B4CD5A40F6C441D6F98719C0	107.21412130612245	-6.382788989795918
878	line D.40	0101000020E6100000F4E9FDD6B3CD5A4054F1B901FD8719C0	107.2141015510204	-6.382801081632653
879	line D.41	0101000020E6100000DA082284B3CD5A40B11D322D008819C0	107.21408179591836	-6.382813173469388
880	line D.42	0101000020E6100000C1274631B3CD5A400E4AAA58038819C0	107.21406204081633	-6.382825265306122
881	line D.43	0101000020E6100000A7466ADEB2CD5A406B762284068819C0	107.21404228571429	-6.382837357142857
882	line D.44	0101000020E61000008D658E8BB2CD5A40C8A29AAF098819C0	107.21402253061224	-6.3828494489795915
883	line D.45	0101000020E61000007484B238B2CD5A4025CF12DB0C8819C0	107.21400277551021	-6.382861540816326
884	line D.46	0101000020E61000005AA3D6E5B1CD5A4082FB8A06108819C0	107.21398302040816	-6.382873632653061
885	line D.47	0101000020E610000040C2FA92B1CD5A40E0270332138819C0	107.21396326530612	-6.382885724489796
886	line D.48	0101000020E610000026E11E40B1CD5A403D547B5D168819C0	107.21394351020407	-6.382897816326531
887	line D.49	0101000020E61000000D0043EDB0CD5A409A80F388198819C0	107.21392375510204	-6.382909908163265
888	line D.50	0101000020E6100000F31E679AB0CD5A40F7AC6BB41C8819C0	107.213904	-6.382922
889	line E.1	0101000020E61000008285A6FFBFCD5A406640D0E4758719C0	107.21484366666667	-6.382285666666666
890	line E.2	0101000020E6100000FF29EFACBFCD5A4079996C11798719C0	107.21482394557823	-6.382297775510204
891	line E.3	0101000020E61000007CCE375ABFCD5A408CF2083E7C8719C0	107.2148042244898	-6.382309884353742
892	line E.4	0101000020E6100000F9728007BFCD5A409E4BA56A7F8719C0	107.21478450340136	-6.382321993197278
893	line E.5	0101000020E61000007617C9B4BECD5A40B1A44197828719C0	107.21476478231293	-6.382334102040816
894	line E.6	0101000020E6100000F3BB1162BECD5A40C4FDDDC3858719C0	107.21474506122449	-6.382346210884354
895	line E.7	0101000020E610000070605A0FBECD5A40D7567AF0888719C0	107.21472534013606	-6.382358319727891
896	line E.8	0101000020E6100000ED04A3BCBDCD5A40E9AF161D8C8719C0	107.21470561904762	-6.382370428571428
897	line E.9	0101000020E61000006AA9EB69BDCD5A40FC08B3498F8719C0	107.21468589795919	-6.382382537414966
898	line E.10	0101000020E6100000E74D3417BDCD5A400F624F76928719C0	107.21466617687075	-6.382394646258503
899	line E.11	0101000020E610000064F27CC4BCCD5A4022BBEBA2958719C0	107.21464645578232	-6.382406755102041
900	line E.12	0101000020E6100000E196C571BCCD5A40341488CF988719C0	107.21462673469388	-6.382418863945578
901	line E.13	0101000020E61000005E3B0E1FBCCD5A40476D24FC9B8719C0	107.21460701360544	-6.382430972789115
902	line E.14	0101000020E6100000DBDF56CCBBCD5A405AC6C0289F8719C0	107.21458729251701	-6.382443081632653
903	line E.15	0101000020E610000058849F79BBCD5A406D1F5D55A28719C0	107.21456757142857	-6.382455190476191
904	line E.16	0101000020E6100000D528E826BBCD5A407F78F981A58719C0	107.21454785034014	-6.382467299319727
905	line E.17	0101000020E610000052CD30D4BACD5A4092D195AEA88719C0	107.2145281292517	-6.382479408163265
906	line E.18	0101000020E6100000CF717981BACD5A40A52A32DBAB8719C0	107.21450840816327	-6.382491517006803
907	line E.19	0101000020E61000004C16C22EBACD5A40B883CE07AF8719C0	107.21448868707483	-6.38250362585034
908	line E.20	0101000020E6100000C9BA0ADCB9CD5A40CADC6A34B28719C0	107.2144689659864	-6.382515734693877
909	line E.21	0101000020E6100000465F5389B9CD5A40DD350761B58719C0	107.21444924489796	-6.382527843537415
910	line E.22	0101000020E6100000C3039C36B9CD5A40F08EA38DB88719C0	107.21442952380953	-6.382539952380952
911	line E.23	0101000020E610000040A8E4E3B8CD5A4003E83FBABB8719C0	107.2144098027211	-6.38255206122449
912	line E.24	0101000020E6100000BD4C2D91B8CD5A401541DCE6BE8719C0	107.21439008163266	-6.382564170068027
913	line E.25	0101000020E61000003AF1753EB8CD5A40289A7813C28719C0	107.21437036054422	-6.382576278911564
914	line E.26	0101000020E6100000B695BEEBB7CD5A403BF31440C58719C0	107.21435063945577	-6.382588387755102
915	line E.27	0101000020E6100000333A0799B7CD5A404E4CB16CC88719C0	107.21433091836734	-6.38260049659864
916	line E.28	0101000020E6100000B0DE4F46B7CD5A4060A54D99CB8719C0	107.2143111972789	-6.382612605442176
917	line E.29	0101000020E61000002D8398F3B6CD5A4073FEE9C5CE8719C0	107.21429147619047	-6.382624714285714
918	line E.30	0101000020E6100000AA27E1A0B6CD5A40865786F2D18719C0	107.21427175510203	-6.382636823129252
919	line E.31	0101000020E610000027CC294EB6CD5A4099B0221FD58719C0	107.2142520340136	-6.382648931972789
920	line E.32	0101000020E6100000A47072FBB5CD5A40AB09BF4BD88719C0	107.21423231292516	-6.382661040816326
921	line E.33	0101000020E61000002115BBA8B5CD5A40BE625B78DB8719C0	107.21421259183673	-6.382673149659864
922	line E.34	0101000020E61000009EB90356B5CD5A40D1BBF7A4DE8719C0	107.21419287074829	-6.382685258503401
923	line E.35	0101000020E61000001B5E4C03B5CD5A40E41494D1E18719C0	107.21417314965986	-6.382697367346939
924	line E.36	0101000020E6100000980295B0B4CD5A40F66D30FEE48719C0	107.21415342857142	-6.382709476190476
925	line E.37	0101000020E610000015A7DD5DB4CD5A4009C7CC2AE88719C0	107.21413370748299	-6.382721585034013
926	line E.38	0101000020E6100000924B260BB4CD5A401C206957EB8719C0	107.21411398639455	-6.382733693877551
927	line E.39	0101000020E61000000FF06EB8B3CD5A402F790584EE8719C0	107.21409426530612	-6.382745802721089
928	line E.40	0101000020E61000008C94B765B3CD5A4041D2A1B0F18719C0	107.21407454421768	-6.382757911564625
929	line E.41	0101000020E610000009390013B3CD5A40542B3EDDF48719C0	107.21405482312925	-6.382770020408163
930	line E.42	0101000020E610000086DD48C0B2CD5A406784DA09F88719C0	107.21403510204081	-6.382782129251701
931	line E.43	0101000020E61000000382916DB2CD5A407ADD7636FB8719C0	107.21401538095238	-6.382794238095238
932	line E.44	0101000020E61000008026DA1AB2CD5A408C361363FE8719C0	107.21399565986394	-6.382806346938775
933	line E.45	0101000020E6100000FDCA22C8B1CD5A409F8FAF8F018819C0	107.2139759387755	-6.382818455782313
934	line E.46	0101000020E61000007A6F6B75B1CD5A40B2E84BBC048819C0	107.21395621768707	-6.38283056462585
935	line E.47	0101000020E6100000F713B422B1CD5A40C541E8E8078819C0	107.21393649659863	-6.382842673469388
936	line E.48	0101000020E610000074B8FCCFB0CD5A40D79A84150B8819C0	107.2139167755102	-6.382854782312925
937	line E.49	0101000020E6100000F15C457DB0CD5A40EAF320420E8819C0	107.21389705442176	-6.382866891156462
938	line E.50	0101000020E61000006E018E2AB0CD5A40FD4CBD6E118819C0	107.21387733333333	-6.382879
939	line F.1	0101000020E610000025D6CF88BFCD5A40AA5135676A8719C0	107.21481533333333	-6.3822418333333335
940	line F.2	0101000020E610000039003D36BFCD5A4072D7F5946D8719C0	107.21479564625851	-6.382253959183673
941	line F.3	0101000020E61000004C2AAAE3BECD5A403B5DB6C2708719C0	107.21477595918367	-6.382266085034014
942	line F.4	0101000020E610000060541791BECD5A4003E376F0738719C0	107.21475627210884	-6.382278210884354
943	line F.5	0101000020E6100000747E843EBECD5A40CB68371E778719C0	107.21473658503402	-6.382290336734694
944	line F.6	0101000020E610000087A8F1EBBDCD5A4094EEF74B7A8719C0	107.21471689795918	-6.382302462585034
945	line F.7	0101000020E61000009BD25E99BDCD5A405C74B8797D8719C0	107.21469721088435	-6.382314588435374
946	line F.8	0101000020E6100000AFFCCB46BDCD5A4024FA78A7808719C0	107.21467752380953	-6.382326714285714
947	line F.9	0101000020E6100000C32639F4BCCD5A40ED7F39D5838719C0	107.2146578367347	-6.382338840136055
948	line F.10	0101000020E6100000D650A6A1BCCD5A40B505FA02878719C0	107.21463814965986	-6.382350965986395
949	line F.11	0101000020E6100000EA7A134FBCCD5A407D8BBA308A8719C0	107.21461846258504	-6.3823630918367344
950	line F.12	0101000020E6100000FEA480FCBBCD5A4046117B5E8D8719C0	107.21459877551021	-6.382375217687075
951	line F.13	0101000020E610000011CFEDA9BBCD5A400E973B8C908719C0	107.21457908843537	-6.382387343537415
952	line F.14	0101000020E610000025F95A57BBCD5A40D71CFCB9938719C0	107.21455940136055	-6.382399469387756
953	line F.15	0101000020E61000003923C804BBCD5A409FA2BCE7968719C0	107.21453971428572	-6.3824115952380955
954	line F.16	0101000020E61000004C4D35B2BACD5A4067287D159A8719C0	107.21452002721088	-6.382423721088435
955	line F.17	0101000020E61000006077A25FBACD5A4030AE3D439D8719C0	107.21450034013606	-6.382435846938776
956	line F.18	0101000020E610000074A10F0DBACD5A40F833FE70A08719C0	107.21448065306123	-6.382447972789116
957	line F.19	0101000020E610000087CB7CBAB9CD5A40C0B9BE9EA38719C0	107.21446096598639	-6.382460098639456
958	line F.20	0101000020E61000009BF5E967B9CD5A40893F7FCCA68719C0	107.21444127891156	-6.3824722244897965
959	line F.21	0101000020E6100000AF1F5715B9CD5A4051C53FFAA98719C0	107.21442159183674	-6.382484350340136
960	line F.22	0101000020E6100000C349C4C2B8CD5A40194B0028AD8719C0	107.21440190476191	-6.382496476190476
961	line F.23	0101000020E6100000D6733170B8CD5A40E2D0C055B08719C0	107.21438221768707	-6.382508602040817
962	line F.24	0101000020E6100000EA9D9E1DB8CD5A40AA568183B38719C0	107.21436253061225	-6.382520727891157
963	line F.25	0101000020E6100000FEC70BCBB7CD5A4072DC41B1B68719C0	107.21434284353742	-6.3825328537414965
964	line F.26	0101000020E610000011F27878B7CD5A403B6202DFB98719C0	107.21432315646258	-6.382544979591837
965	line F.27	0101000020E6100000251CE625B7CD5A4003E8C20CBD8719C0	107.21430346938776	-6.382557105442177
966	line F.28	0101000020E6100000394653D3B6CD5A40CB6D833AC08719C0	107.21428378231293	-6.382569231292517
967	line F.29	0101000020E61000004C70C080B6CD5A4094F34368C38719C0	107.2142640952381	-6.382581357142858
968	line F.30	0101000020E6100000609A2D2EB6CD5A405C790496C68719C0	107.21424440816327	-6.382593482993197
969	line F.31	0101000020E610000074C49ADBB5CD5A4024FFC4C3C98719C0	107.21422472108844	-6.382605608843537
970	line F.32	0101000020E610000088EE0789B5CD5A40ED8485F1CC8719C0	107.21420503401362	-6.382617734693878
971	line F.33	0101000020E61000009B187536B5CD5A40B50A461FD08719C0	107.21418534693878	-6.382629860544218
972	line F.34	0101000020E6100000AF42E2E3B4CD5A407D90064DD38719C0	107.21416565986395	-6.382641986394558
973	line F.35	0101000020E6100000C36C4F91B4CD5A404616C77AD68719C0	107.21414597278913	-6.382654112244898
974	line F.36	0101000020E6100000D696BC3EB4CD5A400E9C87A8D98719C0	107.21412628571429	-6.382666238095238
975	line F.37	0101000020E6100000EAC029ECB3CD5A40D62148D6DC8719C0	107.21410659863946	-6.382678363945578
976	line F.38	0101000020E6100000FEEA9699B3CD5A409FA70804E08719C0	107.21408691156464	-6.382690489795919
977	line F.39	0101000020E610000011150447B3CD5A40672DC931E38719C0	107.2140672244898	-6.3827026156462585
978	line F.40	0101000020E6100000253F71F4B2CD5A4030B3895FE68719C0	107.21404753741497	-6.382714741496599
979	line F.41	0101000020E61000003969DEA1B2CD5A40F8384A8DE98719C0	107.21402785034014	-6.382726867346939
980	line F.42	0101000020E61000004C934B4FB2CD5A40C0BE0ABBEC8719C0	107.2140081632653	-6.382738993197279
981	line F.43	0101000020E610000060BDB8FCB1CD5A408944CBE8EF8719C0	107.21398847619048	-6.38275111904762
982	line F.44	0101000020E610000074E725AAB1CD5A4051CA8B16F38719C0	107.21396878911565	-6.382763244897959
983	line F.45	0101000020E610000088119357B1CD5A4019504C44F68719C0	107.21394910204083	-6.382775370748299
984	line F.46	0101000020E61000009B3B0005B1CD5A40E2D50C72F98719C0	107.21392941496599	-6.38278749659864
985	line F.47	0101000020E6100000AF656DB2B0CD5A40AA5BCD9FFC8719C0	107.21390972789116	-6.38279962244898
986	line F.48	0101000020E6100000C38FDA5FB0CD5A4072E18DCDFF8719C0	107.21389004081634	-6.38281174829932
987	line F.49	0101000020E6100000D6B9470DB0CD5A403B674EFB028819C0	107.2138703537415	-6.38282387414966
988	line F.50	0101000020E6100000EAE3B4BAAFCD5A4003ED0E29068819C0	107.21385066666667	-6.382836
989	line G.1	0101000020E6100000C826F911BFCD5A40ED629AE95E8719C0	107.214787	-6.382198
990	line G.2	0101000020E610000072D68ABFBECD5A406B157F18628719C0	107.21476734693877	-6.382210142857143
991	line G.3	0101000020E61000001D861C6DBECD5A40E9C76347658719C0	107.21474769387756	-6.382222285714286
992	line G.4	0101000020E6100000C735AE1ABECD5A40677A4876688719C0	107.21472804081633	-6.3822344285714285
993	line G.5	0101000020E610000072E53FC8BDCD5A40E52C2DA56B8719C0	107.21470838775511	-6.382246571428571
994	line G.6	0101000020E61000001C95D175BDCD5A4063DF11D46E8719C0	107.21468873469388	-6.382258714285714
995	line G.7	0101000020E6100000C6446323BDCD5A40E191F602728719C0	107.21466908163265	-6.382270857142857
996	line G.8	0101000020E610000071F4F4D0BCCD5A405F44DB31758719C0	107.21464942857143	-6.382283
997	line G.9	0101000020E61000001BA4867EBCCD5A40DDF6BF60788719C0	107.2146297755102	-6.382295142857143
998	line G.10	0101000020E6100000C553182CBCCD5A405BA9A48F7B8719C0	107.21461012244897	-6.382307285714286
999	line G.11	0101000020E61000007003AAD9BBCD5A40D95B89BE7E8719C0	107.21459046938776	-6.382319428571429
1000	line G.12	0101000020E61000001AB33B87BBCD5A40570E6EED818719C0	107.21457081632653	-6.382331571428572
1001	line G.13	0101000020E6100000C562CD34BBCD5A40D5C0521C858719C0	107.21455116326531	-6.382343714285715
1002	line G.14	0101000020E61000006F125FE2BACD5A405273374B888719C0	107.21453151020408	-6.382355857142857
1003	line G.15	0101000020E610000019C2F08FBACD5A40D0251C7A8B8719C0	107.21451185714285	-6.382368
1004	line G.16	0101000020E6100000C471823DBACD5A404ED800A98E8719C0	107.21449220408164	-6.3823801428571425
1005	line G.17	0101000020E61000006E2114EBB9CD5A40CC8AE5D7918719C0	107.2144725510204	-6.382392285714285
1006	line G.18	0101000020E610000019D1A598B9CD5A404A3DCA06958719C0	107.21445289795919	-6.382404428571428
1007	line G.19	0101000020E6100000C3803746B9CD5A40C8EFAE35988719C0	107.21443324489796	-6.382416571428571
1008	line G.20	0101000020E61000006D30C9F3B8CD5A4046A293649B8719C0	107.21441359183673	-6.382428714285714
1009	line G.21	0101000020E610000018E05AA1B8CD5A40C45478939E8719C0	107.21439393877552	-6.382440857142857
1010	line G.22	0101000020E6100000C28FEC4EB8CD5A4042075DC2A18719C0	107.21437428571429	-6.382453
1011	line G.23	0101000020E61000006D3F7EFCB7CD5A40C0B941F1A48719C0	107.21435463265307	-6.382465142857143
1012	line G.24	0101000020E610000017EF0FAAB7CD5A403E6C2620A88719C0	107.21433497959184	-6.382477285714286
1013	line G.25	0101000020E6100000C19EA157B7CD5A40BC1E0B4FAB8719C0	107.21431532653061	-6.382489428571429
1014	line G.26	0101000020E61000006C4E3305B7CD5A403AD1EF7DAE8719C0	107.2142956734694	-6.3825015714285716
1015	line G.27	0101000020E610000016FEC4B2B6CD5A40B883D4ACB18719C0	107.21427602040816	-6.3825137142857145
1016	line G.28	0101000020E6100000C0AD5660B6CD5A403636B9DBB48719C0	107.21425636734693	-6.382525857142857
1017	line G.29	0101000020E61000006B5DE80DB6CD5A40B4E89D0AB88719C0	107.21423671428572	-6.382538
1018	line G.30	0101000020E6100000150D7ABBB5CD5A40329B8239BB8719C0	107.21421706122449	-6.382550142857143
1019	line G.31	0101000020E6100000C0BC0B69B5CD5A40B04D6768BE8719C0	107.21419740816327	-6.382562285714286
1020	line G.32	0101000020E61000006A6C9D16B5CD5A402E004C97C18719C0	107.21417775510204	-6.382574428571429
1021	line G.33	0101000020E6100000141C2FC4B4CD5A40ACB230C6C48719C0	107.21415810204081	-6.382586571428572
1022	line G.34	0101000020E6100000BFCBC071B4CD5A402A6515F5C78719C0	107.2141384489796	-6.382598714285715
1023	line G.35	0101000020E6100000697B521FB4CD5A40A817FA23CB8719C0	107.21411879591837	-6.382610857142858
1024	line G.36	0101000020E6100000142BE4CCB3CD5A4026CADE52CE8719C0	107.21409914285715	-6.382623000000001
1025	line G.37	0101000020E6100000BEDA757AB3CD5A40A47CC381D18719C0	107.21407948979592	-6.3826351428571435
1026	line G.38	0101000020E6100000688A0728B3CD5A40212FA8B0D48719C0	107.21405983673469	-6.3826472857142855
689	line A.1	0101000020E6100000F64201DBC1CD5A4059FB3BDBA38719C0	107.214957	-6.382461
690	line A.2	0101000020E610000018D1B787C1CD5A4095A14703A78719C0	107.21493714285714	-6.382473040816326
691	line A.3	0101000020E61000003A5F6E34C1CD5A40D247532BAA8719C0	107.21491728571428	-6.3824850816326535
692	line A.4	0101000020E61000005DED24E1C0CD5A400EEE5E53AD8719C0	107.21489742857143	-6.38249712244898
693	line A.5	0101000020E61000007F7BDB8DC0CD5A404A946A7BB08719C0	107.21487757142857	-6.382509163265306
694	line A.6	0101000020E6100000A109923AC0CD5A40873A76A3B38719C0	107.21485771428571	-6.382521204081633
695	line A.7	0101000020E6100000C39748E7BFCD5A40C3E081CBB68719C0	107.21483785714285	-6.382533244897959
696	line A.8	0101000020E6100000E525FF93BFCD5A40FF868DF3B98719C0	107.214818	-6.3825452857142855
697	line A.9	0101000020E610000007B4B540BFCD5A403C2D991BBD8719C0	107.21479814285713	-6.382557326530613
698	line A.10	0101000020E61000002A426CEDBECD5A4078D3A443C08719C0	107.21477828571429	-6.382569367346939
699	line A.11	0101000020E61000004CD0229ABECD5A40B479B06BC38719C0	107.21475842857143	-6.382581408163265
700	line A.12	0101000020E61000006E5ED946BECD5A40F11FBC93C68719C0	107.21473857142857	-6.382593448979592
701	line A.13	0101000020E610000090EC8FF3BDCD5A402DC6C7BBC98719C0	107.21471871428571	-6.382605489795918
702	line A.14	0101000020E6100000B27A46A0BDCD5A406A6CD3E3CC8719C0	107.21469885714285	-6.3826175306122455
703	line A.15	0101000020E6100000D508FD4CBDCD5A40A612DF0BD08719C0	107.214679	-6.382629571428572
704	line A.16	0101000020E6100000F796B3F9BCCD5A40E2B8EA33D38719C0	107.21465914285714	-6.382641612244898
705	line A.17	0101000020E610000019256AA6BCCD5A401F5FF65BD68719C0	107.21463928571428	-6.382653653061225
706	line A.18	0101000020E61000003BB32053BCCD5A405B050284D98719C0	107.21461942857142	-6.382665693877551
707	line A.19	0101000020E61000005D41D7FFBBCD5A4097AB0DACDC8719C0	107.21459957142856	-6.3826777346938774
708	line A.20	0101000020E61000007FCF8DACBBCD5A40D45119D4DF8719C0	107.2145797142857	-6.3826897755102046
709	line A.21	0101000020E6100000A25D4459BBCD5A4010F824FCE28719C0	107.21455985714286	-6.382701816326531
710	line A.22	0101000020E6100000C4EBFA05BBCD5A404C9E3024E68719C0	107.21454	-6.382713857142857
711	line A.23	0101000020E6100000E679B1B2BACD5A4089443C4CE98719C0	107.21452014285714	-6.382725897959184
712	line A.24	0101000020E61000000808685FBACD5A40C5EA4774EC8719C0	107.21450028571428	-6.38273793877551
713	line A.25	0101000020E61000002A961E0CBACD5A400191539CEF8719C0	107.21448042857142	-6.3827499795918365
714	line A.26	0101000020E61000004D24D5B8B9CD5A403E375FC4F28719C0	107.21446057142857	-6.382762020408164
715	line A.27	0101000020E61000006FB28B65B9CD5A407ADD6AECF58719C0	107.21444071428571	-6.38277406122449
716	line A.28	0101000020E610000091404212B9CD5A40B6837614F98719C0	107.21442085714285	-6.382786102040816
717	line A.29	0101000020E6100000B3CEF8BEB8CD5A40F329823CFC8719C0	107.214401	-6.382798142857143
718	line A.30	0101000020E6100000D55CAF6BB8CD5A402FD08D64FF8719C0	107.21438114285714	-6.382810183673469
719	line A.31	0101000020E6100000F8EA6518B8CD5A406B76998C028819C0	107.21436128571429	-6.382822224489796
720	line A.32	0101000020E61000001A791CC5B7CD5A40A81CA5B4058819C0	107.21434142857143	-6.382834265306123
721	line A.33	0101000020E61000003C07D371B7CD5A40E4C2B0DC088819C0	107.21432157142857	-6.382846306122449
722	line A.34	0101000020E61000005E95891EB7CD5A402069BC040C8819C0	107.21430171428571	-6.382858346938775
723	line A.35	0101000020E6100000802340CBB6CD5A405D0FC82C0F8819C0	107.21428185714285	-6.382870387755102
724	line A.36	0101000020E6100000A2B1F677B6CD5A4099B5D354128819C0	107.21426199999999	-6.3828824285714285
725	line A.37	0101000020E6100000C53FAD24B6CD5A40D55BDF7C158819C0	107.21424214285715	-6.382894469387755
726	line A.38	0101000020E6100000E7CD63D1B5CD5A401202EBA4188819C0	107.21422228571429	-6.382906510204082
727	line A.39	0101000020E6100000095C1A7EB5CD5A404EA8F6CC1B8819C0	107.21420242857143	-6.382918551020408
728	line A.40	0101000020E61000002BEAD02AB5CD5A408B4E02F51E8819C0	107.21418257142857	-6.382930591836735
729	line A.41	0101000020E61000004D7887D7B4CD5A40C7F40D1D228819C0	107.2141627142857	-6.382942632653061
730	line A.42	0101000020E610000070063E84B4CD5A40039B1945258819C0	107.21414285714286	-6.382954673469388
731	line A.43	0101000020E61000009294F430B4CD5A404041256D288819C0	107.214123	-6.382966714285715
732	line A.44	0101000020E6100000B422ABDDB3CD5A407CE730952B8819C0	107.21410314285714	-6.382978755102041
733	line A.45	0101000020E6100000D6B0618AB3CD5A40B88D3CBD2E8819C0	107.21408328571428	-6.382990795918367
734	line A.46	0101000020E6100000F83E1837B3CD5A40F53348E5318819C0	107.21406342857142	-6.383002836734694
735	line A.47	0101000020E61000001ACDCEE3B2CD5A4031DA530D358819C0	107.21404357142856	-6.3830148775510205
736	line A.48	0101000020E61000003D5B8590B2CD5A406D805F35388819C0	107.21402371428572	-6.383026918367347
737	line A.49	0101000020E61000005FE93B3DB2CD5A40AA266B5D3B8819C0	107.21400385714286	-6.383038959183674
738	line A.50	0101000020E61000008177F2E9B1CD5A40E6CC76853E8819C0	107.213984	-6.383051
1027	line G.39	0101000020E6100000133A99D5B2CD5A409FE18CDFD78719C0	107.21404018367348	-6.382659428571428
1028	line G.40	0101000020E6100000BDE92A83B2CD5A401D94710EDB8719C0	107.21402053061225	-6.382671571428571
1029	line G.41	0101000020E61000006899BC30B2CD5A409B46563DDE8719C0	107.21400087755103	-6.382683714285714
1030	line G.42	0101000020E610000012494EDEB1CD5A4019F93A6CE18719C0	107.2139812244898	-6.382695857142857
1031	line G.43	0101000020E6100000BCF8DF8BB1CD5A4097AB1F9BE48719C0	107.21396157142857	-6.382708
1032	line G.44	0101000020E610000067A87139B1CD5A40155E04CAE78719C0	107.21394191836735	-6.382720142857143
1033	line G.45	0101000020E6100000115803E7B0CD5A409310E9F8EA8719C0	107.21392226530612	-6.382732285714286
1034	line G.46	0101000020E6100000BB079594B0CD5A4011C3CD27EE8719C0	107.2139026122449	-6.382744428571429
1035	line G.47	0101000020E610000066B72642B0CD5A408F75B256F18719C0	107.21388295918368	-6.382756571428572
1036	line G.48	0101000020E61000001067B8EFAFCD5A400D289785F48719C0	107.21386330612245	-6.382768714285715
1037	line G.49	0101000020E6100000BB164A9DAFCD5A408BDA7BB4F78719C0	107.21384365306123	-6.3827808571428575
1038	line G.50	0101000020E610000065C6DB4AAFCD5A40098D60E3FA8719C0	107.213824	-6.382793
\.


--
-- Data for Name: line_points_temp; Type: TABLE DATA; Schema: poc_location; Owner: rnd_eagle
--

COPY poc_location.line_points_temp (id, name, geom, longitude, latitude) FROM stdin;
122	line AA.1	0101000020E6100000F64201DBC1CD5A4059FB3BDBA38719C0	107.214957	-6.382461
123	line AA.2	0101000020E610000099932A64C1CD5A409C0CA15D988719C0	107.21492866666667	-6.3824171666666665
124	line AA.3	0101000020E61000003CE453EDC0CD5A40E01D06E08C8719C0	107.21490033333333	-6.382373333333334
125	line AA.4	0101000020E6100000DF347D76C0CD5A40232F6B62818719C0	107.214872	-6.3823295
126	line AA.5	0101000020E61000008285A6FFBFCD5A406640D0E4758719C0	107.21484366666667	-6.382285666666666
127	line AA.6	0101000020E610000025D6CF88BFCD5A40AA5135676A8719C0	107.21481533333333	-6.3822418333333335
128	line AA.7	0101000020E6100000C826F911BFCD5A40ED629AE95E8719C0	107.214787	-6.382198
129	line BB.1	0101000020E61000008177F2E9B1CD5A40E6CC76853E8819C0	107.213984	-6.383051
130	line BB.2	0101000020E6100000FC59197AB1CD5A40EC6CC83F338819C0	107.21395733333333	-6.383008
131	line BB.3	0101000020E6100000783C400AB1CD5A40F20C1AFA278819C0	107.21393066666667	-6.382965
132	line BB.4	0101000020E6100000F31E679AB0CD5A40F7AC6BB41C8819C0	107.213904	-6.382922
133	line BB.5	0101000020E61000006E018E2AB0CD5A40FD4CBD6E118819C0	107.21387733333333	-6.382879
134	line BB.6	0101000020E6100000EAE3B4BAAFCD5A4003ED0E29068819C0	107.21385066666667	-6.382836
135	line BB.7	0101000020E610000065C6DB4AAFCD5A40098D60E3FA8719C0	107.213824	-6.382793
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: poc_location; Owner: BSI90894@bsi.co.id
--

COPY poc_location.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.access_id_seq', 1, false);


--
-- Name: access_menu_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.access_menu_id_seq', 1, false);


--
-- Name: access_role_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.access_role_id_seq', 1, false);


--
-- Name: case_detail_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.case_detail_id_seq', 1, false);


--
-- Name: case_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.case_id_seq', 11, true);


--
-- Name: case_status_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.case_status_id_seq', 1, false);


--
-- Name: detection_results_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.detection_results_id_seq', 106, true);


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.object_id_seq', 169, true);


--
-- Name: object_id_seq1; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.object_id_seq1', 27, true);


--
-- Name: task_id_sequence; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.task_id_sequence', 1026, true);


--
-- Name: taskset_id_sequence; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.taskset_id_sequence', 1, false);


--
-- Name: user_status_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.user_status_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: poc; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc.users_id_seq', 5, true);


--
-- Name: area_detail2_id_seq; Type: SEQUENCE SET; Schema: poc_location; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc_location.area_detail2_id_seq', 450, true);


--
-- Name: area_detail_id_seq; Type: SEQUENCE SET; Schema: poc_location; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc_location.area_detail_id_seq', 1325, true);


--
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: poc_location; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc_location.area_id_seq', 12, true);


--
-- Name: line_points_id_seq; Type: SEQUENCE SET; Schema: poc_location; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc_location.line_points_id_seq', 1038, true);


--
-- Name: line_points_temp_id_seq; Type: SEQUENCE SET; Schema: poc_location; Owner: rnd_eagle
--

SELECT pg_catalog.setval('poc_location.line_points_temp_id_seq', 135, true);


--
-- Name: access_menu access_menu_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access_menu
    ADD CONSTRAINT access_menu_pk PRIMARY KEY (id);


--
-- Name: access access_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access
    ADD CONSTRAINT access_pk PRIMARY KEY (id);


--
-- Name: access_role access_role_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.access_role
    ADD CONSTRAINT access_role_pk PRIMARY KEY (id);


--
-- Name: case_detail case_detail_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.case_detail
    ADD CONSTRAINT case_detail_pk PRIMARY KEY (id);


--
-- Name: case case_pkey; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc."case"
    ADD CONSTRAINT case_pkey PRIMARY KEY (id);


--
-- Name: case_status case_status_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.case_status
    ADD CONSTRAINT case_status_pk PRIMARY KEY (id);


--
-- Name: celery_taskmeta celery_taskmeta_pkey; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: detection_results detection_results_pkey; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.detection_results
    ADD CONSTRAINT detection_results_pkey PRIMARY KEY (id);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: users user_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.users
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: user_status user_status_pk; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.user_status
    ADD CONSTRAINT user_status_pk PRIMARY KEY (id);


--
-- Name: users users_unique; Type: CONSTRAINT; Schema: poc; Owner: rnd_eagle
--

ALTER TABLE ONLY poc.users
    ADD CONSTRAINT users_unique UNIQUE (email);


--
-- Name: area_detail2 area_detail2_pkey; Type: CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area_detail2
    ADD CONSTRAINT area_detail2_pkey PRIMARY KEY (id);


--
-- Name: area_detail area_detail_pkey; Type: CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area_detail
    ADD CONSTRAINT area_detail_pkey PRIMARY KEY (id);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: line_points line_points_pkey; Type: CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.line_points
    ADD CONSTRAINT line_points_pkey PRIMARY KEY (id);


--
-- Name: line_points_temp line_points_temp_pkey; Type: CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.line_points_temp
    ADD CONSTRAINT line_points_temp_pkey PRIMARY KEY (id);


--
-- Name: idx_object_location; Type: INDEX; Schema: poc; Owner: rnd_eagle
--

CREATE INDEX idx_object_location ON poc.object USING gist (location);


--
-- Name: ix_poc_detection_results_id; Type: INDEX; Schema: poc; Owner: rnd_eagle
--

CREATE INDEX ix_poc_detection_results_id ON poc.detection_results USING btree (id);


--
-- Name: ix_poc_detection_results_image_name; Type: INDEX; Schema: poc; Owner: rnd_eagle
--

CREATE INDEX ix_poc_detection_results_image_name ON poc.detection_results USING btree (image_name);


--
-- Name: ix_poc_detection_results_output_name; Type: INDEX; Schema: poc; Owner: rnd_eagle
--

CREATE INDEX ix_poc_detection_results_output_name ON poc.detection_results USING btree (output_name);


--
-- Name: idx_geom; Type: INDEX; Schema: poc_location; Owner: rnd_eagle
--

CREATE INDEX idx_geom ON poc_location.area_detail USING gist (geom);


--
-- Name: area_detail area_detail_area_id_fkey; Type: FK CONSTRAINT; Schema: poc_location; Owner: rnd_eagle
--

ALTER TABLE ONLY poc_location.area_detail
    ADD CONSTRAINT area_detail_area_id_fkey FOREIGN KEY (area_id) REFERENCES poc_location.area(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_pg_admin
--

GRANT ALL ON SCHEMA public TO rnd_eagle;
GRANT ALL ON SCHEMA public TO starai;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: TABLE spatial_ref_sys; Type: ACL; Schema: poc_location; Owner: BSI90894@bsi.co.id
--

GRANT ALL ON TABLE poc_location.spatial_ref_sys TO azure_pg_admin;


--
-- PostgreSQL database dump complete
--

