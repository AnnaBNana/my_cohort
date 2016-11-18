--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO apropas;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO apropas;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO apropas;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO apropas;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO apropas;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO apropas;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO apropas;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO apropas;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO apropas;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO apropas;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO apropas;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO apropas;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO apropas;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO apropas;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO apropas;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO apropas;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO apropas;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO apropas;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO apropas;

--
-- Name: students_cohort; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE students_cohort (
    id integer NOT NULL,
    start_date date NOT NULL,
    stack character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE students_cohort OWNER TO apropas;

--
-- Name: students_cohort_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE students_cohort_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_cohort_id_seq OWNER TO apropas;

--
-- Name: students_cohort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE students_cohort_id_seq OWNED BY students_cohort.id;


--
-- Name: students_instructor; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE students_instructor (
    id integer NOT NULL,
    name character varying(350) NOT NULL,
    email character varying(350) NOT NULL,
    role character varying(350) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE students_instructor OWNER TO apropas;

--
-- Name: students_instructor_cohort; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE students_instructor_cohort (
    id integer NOT NULL,
    instructor_id integer NOT NULL,
    cohort_id integer NOT NULL
);


ALTER TABLE students_instructor_cohort OWNER TO apropas;

--
-- Name: students_instructor_cohort_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE students_instructor_cohort_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_instructor_cohort_id_seq OWNER TO apropas;

--
-- Name: students_instructor_cohort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE students_instructor_cohort_id_seq OWNED BY students_instructor_cohort.id;


--
-- Name: students_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE students_instructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_instructor_id_seq OWNER TO apropas;

--
-- Name: students_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE students_instructor_id_seq OWNED BY students_instructor.id;


--
-- Name: students_student; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE students_student (
    id integer NOT NULL,
    name character varying(350) NOT NULL,
    email character varying(350) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    four_person integer,
    half_class integer,
    pairs integer,
    three_person integer
);


ALTER TABLE students_student OWNER TO apropas;

--
-- Name: students_student_cohort; Type: TABLE; Schema: public; Owner: apropas
--

CREATE TABLE students_student_cohort (
    id integer NOT NULL,
    student_id integer NOT NULL,
    cohort_id integer NOT NULL
);


ALTER TABLE students_student_cohort OWNER TO apropas;

--
-- Name: students_student_cohort_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE students_student_cohort_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_student_cohort_id_seq OWNER TO apropas;

--
-- Name: students_student_cohort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE students_student_cohort_id_seq OWNED BY students_student_cohort.id;


--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: apropas
--

CREATE SEQUENCE students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_student_id_seq OWNER TO apropas;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: apropas
--

ALTER SEQUENCE students_student_id_seq OWNED BY students_student.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_cohort ALTER COLUMN id SET DEFAULT nextval('students_cohort_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor ALTER COLUMN id SET DEFAULT nextval('students_instructor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor_cohort ALTER COLUMN id SET DEFAULT nextval('students_instructor_cohort_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student ALTER COLUMN id SET DEFAULT nextval('students_student_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student_cohort ALTER COLUMN id SET DEFAULT nextval('students_student_cohort_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cohort	1	add_cohort
2	Can change cohort	1	change_cohort
3	Can delete cohort	1	delete_cohort
4	Can add student	2	add_student
5	Can change student	2	change_student
6	Can delete student	2	delete_student
7	Can add instructor	3	add_instructor
8	Can change instructor	3	change_instructor
9	Can delete instructor	3	delete_instructor
10	Can add log entry	4	add_logentry
11	Can change log entry	4	change_logentry
12	Can delete log entry	4	delete_logentry
13	Can add permission	5	add_permission
14	Can change permission	5	change_permission
15	Can delete permission	5	delete_permission
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add group	7	add_group
20	Can change group	7	change_group
21	Can delete group	7	delete_group
22	Can add content type	8	add_contenttype
23	Can change content type	8	change_contenttype
24	Can delete content type	8	delete_contenttype
25	Can add session	9	add_session
26	Can change session	9	change_session
27	Can delete session	9	delete_session
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	students	cohort
2	students	student
3	students	instructor
4	admin	logentry
5	auth	permission
6	auth	user
7	auth	group
8	contenttypes	contenttype
9	sessions	session
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-10-25 09:24:17.164879-07
2	auth	0001_initial	2016-10-25 09:24:17.257559-07
3	admin	0001_initial	2016-10-25 09:24:17.330004-07
4	admin	0002_logentry_remove_auto_add	2016-10-25 09:24:17.354877-07
5	contenttypes	0002_remove_content_type_name	2016-10-25 09:24:17.410811-07
6	auth	0002_alter_permission_name_max_length	2016-10-25 09:24:17.429778-07
7	auth	0003_alter_user_email_max_length	2016-10-25 09:24:17.449494-07
8	auth	0004_alter_user_username_opts	2016-10-25 09:24:17.468448-07
9	auth	0005_alter_user_last_login_null	2016-10-25 09:24:17.488097-07
10	auth	0006_require_contenttypes_0002	2016-10-25 09:24:17.491282-07
11	auth	0007_alter_validators_add_error_messages	2016-10-25 09:24:17.514083-07
12	auth	0008_alter_user_username_max_length	2016-10-25 09:24:17.536926-07
13	sessions	0001_initial	2016-10-25 09:24:17.548677-07
14	students	0001_initial	2016-10-25 09:24:17.626421-07
15	students	0002_auto_20161025_0540	2016-10-25 09:24:17.659109-07
16	students	0003_auto_20161027_1723	2016-10-27 10:23:22.590359-07
17	students	0004_remove_student_nickname	2016-10-27 10:24:41.804605-07
18	students	0005_auto_20161102_0245	2016-11-01 19:46:06.80207-07
19	students	0006_auto_20161103_0517	2016-11-02 22:17:53.965428-07
20	students	0007_auto_20161105_0334	2016-11-04 20:47:10.926244-07
21	students	0008_auto_20161105_0334	2016-11-04 20:47:10.975278-07
22	students	0009_auto_20161105_0336	2016-11-04 20:47:11.025985-07
23	students	0010_auto_20161105_0338	2016-11-04 20:47:11.073394-07
24	students	0011_auto_20161105_0341	2016-11-04 20:47:11.117525-07
25	students	0012_auto_20161105_0344	2016-11-04 20:47:11.172576-07
26	students	0013_auto_20161105_0345	2016-11-04 20:47:11.245879-07
27	students	0014_auto_20161105_0511	2016-11-04 22:11:32.657936-07
28	students	0015_auto_20161105_0514	2016-11-04 22:14:03.518141-07
29	students	0016_auto_20161105_0515	2016-11-04 22:16:01.220822-07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: students_cohort; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY students_cohort (id, start_date, stack, created_at, updated_at) FROM stdin;
26	2016-10-31	Python	2016-11-04 22:07:13.14164-07	2016-11-04 22:07:13.141939-07
\.


--
-- Name: students_cohort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('students_cohort_id_seq', 27, true);


--
-- Data for Name: students_instructor; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY students_instructor (id, name, email, role, created_at, updated_at) FROM stdin;
6	Brendan Stanton	bstanton@codingdojo.com	lead	2016-10-27 23:59:40.026409-07	2016-10-27 23:59:40.026479-07
7	Jay Patel	kpatel@codingdojo.com	lead	2016-10-28 00:02:15.896369-07	2016-10-28 00:02:15.896418-07
9	Howard Jiang	hjiang@codingdojo.com	apprentice	2016-10-28 00:05:30.324714-07	2016-10-28 00:05:30.324858-07
8	Oscar Vazquez	ovazquez@codingdojo.com	lead	2016-10-28 00:02:15.908007-07	2016-10-28 00:02:15.908041-07
1	Anna Propas	apropas@codingdojo.com	lead	2016-10-25 20:33:23.511561-07	2016-10-25 20:33:23.511607-07
10	Pariece McKinney	pmckinney@codingdojo.com	lead	2016-10-28 00:05:30.329341-07	2016-10-28 00:05:30.329376-07
11	Eli Byers	ebyers@codingdojo.com	apprentice	2016-11-01 19:33:22.002352-07	2016-11-01 19:33:22.002461-07
5	Amy Giver	agiver@codingdojo.com	apprentice	2016-10-26 19:21:45.280339-07	2016-10-26 19:21:45.280939-07
\.


--
-- Data for Name: students_instructor_cohort; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY students_instructor_cohort (id, instructor_id, cohort_id) FROM stdin;
19	1	26
20	11	26
\.


--
-- Name: students_instructor_cohort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('students_instructor_cohort_id_seq', 20, true);


--
-- Name: students_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('students_instructor_id_seq', 11, true);


--
-- Data for Name: students_student; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY students_student (id, name, email, created_at, updated_at, four_person, half_class, pairs, three_person) FROM stdin;
47	Romklao Chainuwong	rk120879@gmail.com	2016-11-04 22:34:07.052214-07	2016-11-05 19:13:54.751374-07	1	1	1	1
51	Yue Wah Wong	ywong84@gmail.com	2016-11-04 22:34:07.082724-07	2016-11-05 19:13:54.752648-07	1	1	1	1
61	Kevin Tran	kvnmtrn@gmail.com	2016-11-04 22:34:07.163894-07	2016-11-05 19:13:54.753915-07	1	1	2	1
42	Calvin Nguyen	imcalv@gmail.com	2016-11-04 22:16:15.253173-07	2016-11-05 19:13:54.755208-07	1	1	2	2
45	Nick Piazza	neekpizza@gmail.com	2016-11-04 22:34:07.030991-07	2016-11-05 19:13:54.756509-07	2	1	3	2
44	Clare Lee	clarelee0106@gmail.com	2016-11-04 22:17:30.495461-07	2016-11-05 19:13:54.758084-07	2	1	3	2
62	Garrett Katashima	gkatashima@gmail.com	2016-11-04 22:56:08.035472-07	2016-11-05 19:13:54.759696-07	2	1	4	3
46	Michael Imgrund	michael.imgrund@gmail.com	2016-11-04 22:34:07.045266-07	2016-11-05 19:13:54.761019-07	2	1	4	3
56	Jerome Ortega	jportega87@gmail.com	2016-11-04 22:34:07.115559-07	2016-11-05 19:13:54.76228-07	3	1	5	3
50	Sheldon Bazzell	sheldon.bazzell@gmail.com	2016-11-04 22:34:07.076218-07	2016-11-05 19:13:54.763791-07	3	1	5	4
54	Ivo Dachev	dachevivo@gmail.com	2016-11-04 22:34:07.103213-07	2016-11-05 19:13:54.765525-07	3	2	6	4
55	Grace Shieh	shieh.gracek@gmail.com	2016-11-04 22:34:07.109407-07	2016-11-05 19:13:54.766913-07	3	2	6	4
52	Thomas Fowler	tkfowler@ucdavis.edu	2016-11-04 22:34:07.08907-07	2016-11-05 19:13:54.768324-07	4	2	7	5
57	James Bruno	jeiji@me.com	2016-11-04 22:34:07.121668-07	2016-11-05 19:13:54.769699-07	4	2	7	5
53	Zekai Liu	zekailiu1993@gmail.com	2016-11-04 22:34:07.09672-07	2016-11-05 19:13:54.771062-07	4	2	8	5
59	June Yoshii	juney37@gmail.com	2016-11-04 22:34:07.133138-07	2016-11-05 19:13:54.772782-07	4	2	8	6
49	Steve Parker	831parkersc@gmail.com	2016-11-04 22:34:07.068601-07	2016-11-05 19:13:54.774922-07	5	2	9	6
58	Jyoti Kaloya	jyotikaloya@gmail.com	2016-11-04 22:34:07.126754-07	2016-11-05 19:13:54.77677-07	5	2	9	6
60	Michael Canter	mjcanter11@gmail.com	2016-11-04 22:34:07.139235-07	2016-11-05 19:13:54.77819-07	5	2	10	7
48	Rich Hampton	rhamptonjunk@gmail.com	2016-11-04 22:34:07.061485-07	2016-11-05 19:13:54.779628-07	5	2	10	7
43	Cassy Mach	cassymach@yahoo.com	2016-11-04 22:17:30.487067-07	2016-11-05 19:13:54.781467-07	6	3	11	7
\.


--
-- Data for Name: students_student_cohort; Type: TABLE DATA; Schema: public; Owner: apropas
--

COPY students_student_cohort (id, student_id, cohort_id) FROM stdin;
46	42	26
47	43	26
48	44	26
49	45	26
50	46	26
51	47	26
52	48	26
53	49	26
54	50	26
55	51	26
56	52	26
57	53	26
58	54	26
59	55	26
60	56	26
61	57	26
62	58	26
63	59	26
64	60	26
65	61	26
66	62	26
\.


--
-- Name: students_student_cohort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('students_student_cohort_id_seq', 66, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: apropas
--

SELECT pg_catalog.setval('students_student_id_seq', 62, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: students_cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_cohort
    ADD CONSTRAINT students_cohort_pkey PRIMARY KEY (id);


--
-- Name: students_cohort_start_date_28373e4f_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_cohort
    ADD CONSTRAINT students_cohort_start_date_28373e4f_uniq UNIQUE (start_date, stack);


--
-- Name: students_instructor_cohort_instructor_id_cd4ddf4f_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor_cohort
    ADD CONSTRAINT students_instructor_cohort_instructor_id_cd4ddf4f_uniq UNIQUE (instructor_id, cohort_id);


--
-- Name: students_instructor_cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor_cohort
    ADD CONSTRAINT students_instructor_cohort_pkey PRIMARY KEY (id);


--
-- Name: students_instructor_email_b94ee599_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor
    ADD CONSTRAINT students_instructor_email_b94ee599_uniq UNIQUE (email);


--
-- Name: students_instructor_name_3abe785b_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor
    ADD CONSTRAINT students_instructor_name_3abe785b_uniq UNIQUE (name, email);


--
-- Name: students_instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor
    ADD CONSTRAINT students_instructor_pkey PRIMARY KEY (id);


--
-- Name: students_student_cohort_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student_cohort
    ADD CONSTRAINT students_student_cohort_pkey PRIMARY KEY (id);


--
-- Name: students_student_cohort_student_id_fd03257e_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student_cohort
    ADD CONSTRAINT students_student_cohort_student_id_fd03257e_uniq UNIQUE (student_id, cohort_id);


--
-- Name: students_student_email_8e692028_uniq; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_student_email_8e692028_uniq UNIQUE (email);


--
-- Name: students_student_pkey; Type: CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_student_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: students_instructor_cohort_06aab9f3; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_instructor_cohort_06aab9f3 ON students_instructor_cohort USING btree (instructor_id);


--
-- Name: students_instructor_cohort_68b226f5; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_instructor_cohort_68b226f5 ON students_instructor_cohort USING btree (cohort_id);


--
-- Name: students_instructor_email_b94ee599_like; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_instructor_email_b94ee599_like ON students_instructor USING btree (email varchar_pattern_ops);


--
-- Name: students_student_cohort_30a811f6; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_student_cohort_30a811f6 ON students_student_cohort USING btree (student_id);


--
-- Name: students_student_cohort_68b226f5; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_student_cohort_68b226f5 ON students_student_cohort USING btree (cohort_id);


--
-- Name: students_student_email_8e692028_like; Type: INDEX; Schema: public; Owner: apropas
--

CREATE INDEX students_student_email_8e692028_like ON students_student USING btree (email varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_instr_instructor_id_14499bfb_fk_students_instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor_cohort
    ADD CONSTRAINT students_instr_instructor_id_14499bfb_fk_students_instructor_id FOREIGN KEY (instructor_id) REFERENCES students_instructor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_instructor_co_cohort_id_58ab7311_fk_students_cohort_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_instructor_cohort
    ADD CONSTRAINT students_instructor_co_cohort_id_58ab7311_fk_students_cohort_id FOREIGN KEY (cohort_id) REFERENCES students_cohort(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_student_coh_student_id_f0b3d601_fk_students_student_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student_cohort
    ADD CONSTRAINT students_student_coh_student_id_f0b3d601_fk_students_student_id FOREIGN KEY (student_id) REFERENCES students_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_student_cohor_cohort_id_d7c36e94_fk_students_cohort_id; Type: FK CONSTRAINT; Schema: public; Owner: apropas
--

ALTER TABLE ONLY students_student_cohort
    ADD CONSTRAINT students_student_cohor_cohort_id_d7c36e94_fk_students_cohort_id FOREIGN KEY (cohort_id) REFERENCES students_cohort(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: apropas
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM apropas;
GRANT ALL ON SCHEMA public TO apropas;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

