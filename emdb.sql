--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: album; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.album (
    album_id character varying(26) NOT NULL,
    user_id character varying(26) NOT NULL,
    create_time timestamp without time zone NOT NULL
);


ALTER TABLE public.album OWNER TO nwillo;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO nwillo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO nwillo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO nwillo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO nwillo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO nwillo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO nwillo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_user (
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


ALTER TABLE public.auth_user OWNER TO nwillo;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO nwillo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO nwillo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO nwillo;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO nwillo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO nwillo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: contribute; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.contribute (
    contribute_id character varying(32) NOT NULL,
    location_name character varying(100) NOT NULL,
    location_type character varying(100) NOT NULL,
    season character varying(100),
    attractions character varying(1000),
    photo character varying(100),
    video character varying(100),
    username character varying(200) NOT NULL
);


ALTER TABLE public.contribute OWNER TO nwillo;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO nwillo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO nwillo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO nwillo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO nwillo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO nwillo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO nwillo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO nwillo;

--
-- Name: emergency; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.emergency (
    emergency_id character varying(26) NOT NULL,
    emergency_requestor character varying(26) NOT NULL,
    emergency_respondor character varying(26) NOT NULL,
    emergency_status integer NOT NULL
);


ALTER TABLE public.emergency OWNER TO nwillo;

--
-- Name: emergency_info; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.emergency_info (
    emergency_id character varying(32) NOT NULL,
    nature character varying(15) NOT NULL,
    loi character varying(200) NOT NULL,
    contact character varying(15) NOT NULL,
    description character varying(500),
    username character varying(200) NOT NULL,
    personnel character varying(100) NOT NULL
);


ALTER TABLE public.emergency_info OWNER TO nwillo;

--
-- Name: event; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event (
    event_id character varying(32) NOT NULL,
    event_privacy character varying(20) NOT NULL,
    title character varying(50),
    description character varying(160),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    deadline timestamp without time zone,
    location character varying(10),
    venue_name character varying(100),
    street_address character varying(100),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    pincode character varying(100),
    logo character varying(100),
    cover character varying(100),
    category character varying(50),
    activity character varying(50),
    gender character varying(8),
    age character varying(20),
    participants character varying(32),
    fees double precision,
    created_on timestamp without time zone NOT NULL,
    username character varying(50) NOT NULL,
    vacancy integer,
    ownership character varying(15) NOT NULL
);


ALTER TABLE public.event OWNER TO nwillo;

--
-- Name: event_basics; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_basics (
    event_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(160) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    deadline timestamp without time zone NOT NULL
);


ALTER TABLE public.event_basics OWNER TO nwillo;

--
-- Name: event_location; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_location (
    event_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    location integer NOT NULL,
    venue_name character varying(100),
    street_address character varying(100),
    city character varying(30),
    state character varying(30),
    country character varying(30),
    pincode character varying(10)
);


ALTER TABLE public.event_location OWNER TO nwillo;

--
-- Name: event_misc; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_misc (
    event_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    segment character varying(30) NOT NULL,
    category character varying(30) NOT NULL,
    activity character varying(30) NOT NULL,
    gender integer,
    age character varying(30),
    participants integer,
    fees double precision
);


ALTER TABLE public.event_misc OWNER TO nwillo;

--
-- Name: event_participants; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_participants (
    part_id character varying(32) NOT NULL,
    event_id character varying(32) NOT NULL,
    username character varying(200) NOT NULL,
    ownership character varying(15) NOT NULL
);


ALTER TABLE public.event_participants OWNER TO nwillo;

--
-- Name: event_photo; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_photo (
    event_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    logo bytea,
    cover bytea
);


ALTER TABLE public.event_photo OWNER TO nwillo;

--
-- Name: event_request; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.event_request (
    event_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    requesting_user character varying(26) NOT NULL,
    request_status integer
);


ALTER TABLE public.event_request OWNER TO nwillo;

--
-- Name: feedback; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.feedback (
    feedback_id character varying(32) NOT NULL,
    liked_using character varying(30) NOT NULL,
    assist character varying(30) NOT NULL,
    recommend character varying(30) NOT NULL,
    improvement character varying(30) NOT NULL,
    use_again character varying(30) NOT NULL,
    overall character varying(30) NOT NULL,
    description character varying(160),
    liked_most character varying(30),
    username character varying(200) NOT NULL
);


ALTER TABLE public.feedback OWNER TO nwillo;

--
-- Name: friends; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.friends (
    user_one character varying(26) NOT NULL,
    user_two character varying(26) NOT NULL,
    status integer NOT NULL,
    actions integer NOT NULL
);


ALTER TABLE public.friends OWNER TO nwillo;

--
-- Name: login; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.login (
    user_id character varying(26) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    passw character varying(30) NOT NULL,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.login OWNER TO nwillo;

--
-- Name: misc; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.misc (
    flog integer NOT NULL,
    username character varying(200) NOT NULL,
    misc_id character varying(32) NOT NULL
);


ALTER TABLE public.misc OWNER TO nwillo;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.notification (
    notification_id character varying(26) NOT NULL,
    sender character varying(26) NOT NULL,
    receiver character varying(26) NOT NULL,
    url character varying(100) NOT NULL,
    "time" timestamp without time zone NOT NULL,
    type integer NOT NULL,
    status integer NOT NULL,
    read integer NOT NULL
);


ALTER TABLE public.notification OWNER TO nwillo;

--
-- Name: photo; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.photo (
    photo_id character varying(26) NOT NULL,
    album_id character varying(26) NOT NULL,
    user_id character varying(26) NOT NULL,
    photo bytea NOT NULL,
    url character varying(100) NOT NULL,
    likes character varying(26),
    comment character varying(26)
);


ALTER TABLE public.photo OWNER TO nwillo;

--
-- Name: pi; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.pi (
    username character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    aboutme character varying(160),
    doj timestamp without time zone NOT NULL,
    dob timestamp without time zone NOT NULL,
    birthplace character varying(100),
    profilepic character varying(200),
    coverpic character varying(200),
    livesin character varying(100),
    occupation character varying(100),
    website character varying(200),
    mobile character varying(20),
    facebook character varying(100),
    twitter character varying(100),
    instagram character varying(100),
    travelledplaces character varying(1000),
    dreamplaces character varying(1000),
    favtravplaces character varying(1000),
    favtravseasons character varying(1000),
    favtravmoto character varying(1000),
    favtravmode character varying(1000),
    school character varying(1000),
    college character varying(1000),
    aded character varying(1000),
    currwork character varying(1000),
    prevwork character varying(1000),
    workskills character varying(1000),
    hobbies character varying(1000),
    skills character varying(1000),
    interests character varying(1000),
    pi_id character varying(100) NOT NULL,
    relationstatus character varying(20),
    gender character varying(7)
);


ALTER TABLE public.pi OWNER TO nwillo;

--
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.polls_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.polls_choice OWNER TO nwillo;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.polls_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_choice_id_seq OWNER TO nwillo;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.polls_choice_id_seq OWNED BY public.polls_choice.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.polls_question OWNER TO nwillo;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: nwillo
--

CREATE SEQUENCE public.polls_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_question_id_seq OWNER TO nwillo;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nwillo
--

ALTER SEQUENCE public.polls_question_id_seq OWNED BY public.polls_question.id;


--
-- Name: privacy_setting; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.privacy_setting (
    timeline character varying(20) NOT NULL,
    friends_list character varying(20) NOT NULL,
    album character varying(20) NOT NULL,
    username character varying(200) NOT NULL,
    privacy_id character varying(32) NOT NULL
);


ALTER TABLE public.privacy_setting OWNER TO nwillo;

--
-- Name: simply; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.simply (
    id integer NOT NULL,
    votes character varying(100),
    username character varying
);


ALTER TABLE public.simply OWNER TO nwillo;

--
-- Name: story; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.story (
    story_id character varying(26) NOT NULL,
    album character varying(26),
    comments character varying(26),
    likes character varying(26),
    "time" timestamp without time zone NOT NULL,
    description character varying(160),
    share character varying(50) NOT NULL,
    type integer NOT NULL,
    username character varying(100)
);


ALTER TABLE public.story OWNER TO nwillo;

--
-- Name: stupid; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.stupid (
    username character varying(150)
);


ALTER TABLE public.stupid OWNER TO nwillo;

--
-- Name: trip; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip (
    company character varying(5),
    moto character varying(20),
    fuel double precision,
    vehicle double precision,
    hotel double precision,
    total double precision,
    start_date timestamp without time zone,
    gender character varying(10),
    age_group character varying(20),
    participants integer,
    title character varying(50),
    description character varying(160),
    trip_group character varying(32) NOT NULL,
    username character varying(50) NOT NULL,
    pitstops integer,
    pitstops_time integer,
    source character varying(100),
    destination character varying(100),
    timeperpit integer,
    distance character varying(50),
    duration character varying(50),
    is_published integer,
    trip_privacy character varying(32),
    trip_link character varying(32),
    trip_id character varying(32) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    mode character varying(10),
    ownership character varying(15) NOT NULL,
    status character varying(30)
);


ALTER TABLE public.trip OWNER TO nwillo;

--
-- Name: trip_basic; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_basic (
    trip_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    company integer NOT NULL,
    moto integer NOT NULL,
    occasion integer NOT NULL
);


ALTER TABLE public.trip_basic OWNER TO nwillo;

--
-- Name: trip_cost; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_cost (
    trip_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    fuel double precision,
    vehicle double precision,
    hotel double precision,
    total double precision
);


ALTER TABLE public.trip_cost OWNER TO nwillo;

--
-- Name: trip_date; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_date (
    trip_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    gender integer,
    age character varying(20),
    participants integer,
    title character varying(50),
    description character varying(160)
);


ALTER TABLE public.trip_date OWNER TO nwillo;

--
-- Name: trip_participants; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_participants (
    part_id character varying(32) NOT NULL,
    trip_id character varying(32) NOT NULL,
    username character varying(200) NOT NULL,
    ownership character varying(15) NOT NULL
);


ALTER TABLE public.trip_participants OWNER TO nwillo;

--
-- Name: trip_request; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_request (
    trip_id character varying(30) NOT NULL,
    trip_admin character varying(26) NOT NULL,
    requesting_user character varying(26) NOT NULL,
    request_status integer NOT NULL
);


ALTER TABLE public.trip_request OWNER TO nwillo;

--
-- Name: trip_route; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.trip_route (
    trip_id character varying(30) NOT NULL,
    user_id character varying(26) NOT NULL,
    source character varying(100) NOT NULL,
    destination character varying(100) NOT NULL,
    mode integer NOT NULL,
    pitstops integer NOT NULL,
    pitstop_duration timestamp without time zone NOT NULL,
    pitstop_distance double precision NOT NULL,
    total_time timestamp without time zone NOT NULL,
    total_distance double precision NOT NULL
);


ALTER TABLE public.trip_route OWNER TO nwillo;

--
-- Name: video; Type: TABLE; Schema: public; Owner: nwillo
--

CREATE TABLE public.video (
    video_id character varying(26) NOT NULL,
    album_id character varying(26) NOT NULL,
    user_id character varying(26) NOT NULL,
    video bytea NOT NULL,
    url character varying(100) NOT NULL,
    likes character varying(26),
    comment character varying(26)
);


ALTER TABLE public.video OWNER TO nwillo;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: polls_choice id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.polls_choice ALTER COLUMN id SET DEFAULT nextval('public.polls_choice_id_seq'::regclass);


--
-- Name: polls_question id; Type: DEFAULT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.polls_question ALTER COLUMN id SET DEFAULT nextval('public.polls_question_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.album (album_id, user_id, create_time) FROM stdin;
A-101	101	2018-03-22 07:31:46
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_group (id, name) FROM stdin;
1	em_users
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
4	1	48
5	1	26
6	1	27
7	1	46
8	1	47
9	1	25
10	1	61
11	1	62
12	1	63
13	1	64
14	1	65
15	1	66
16	1	67
17	1	68
18	1	69
19	1	70
20	1	71
21	1	72
22	1	73
23	1	74
24	1	75
25	1	76
26	1	77
27	1	78
28	1	79
29	1	80
30	1	81
31	1	82
32	1	83
33	1	84
34	1	85
35	1	86
36	1	87
37	1	88
38	1	89
39	1	90
40	1	91
41	1	92
42	1	93
43	1	94
44	1	95
45	1	96
46	1	97
47	1	98
48	1	99
49	1	100
50	1	101
51	1	102
52	1	103
53	1	104
54	1	105
55	1	106
56	1	107
57	1	108
58	1	115
59	1	116
60	1	117
61	1	118
62	1	119
63	1	120
64	1	121
65	1	122
66	1	123
67	1	124
68	1	125
69	1	126
70	1	127
71	1	128
72	1	129
73	1	130
74	1	131
75	1	132
76	1	133
77	1	134
78	1	135
79	1	136
80	1	137
81	1	138
82	1	139
83	1	140
84	1	141
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 84, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add question	7	add_question
20	Can change question	7	change_question
21	Can delete question	7	delete_question
22	Can add choice	8	add_choice
23	Can change choice	8	change_choice
24	Can delete choice	8	delete_choice
25	Can add album	9	add_album
26	Can change album	9	change_album
27	Can delete album	9	delete_album
28	Can add auth group	10	add_authgroup
29	Can change auth group	10	change_authgroup
30	Can delete auth group	10	delete_authgroup
31	Can add auth group permissions	11	add_authgrouppermissions
32	Can change auth group permissions	11	change_authgrouppermissions
33	Can delete auth group permissions	11	delete_authgrouppermissions
34	Can add auth permission	12	add_authpermission
35	Can change auth permission	12	change_authpermission
36	Can delete auth permission	12	delete_authpermission
37	Can add auth user	13	add_authuser
38	Can change auth user	13	change_authuser
39	Can delete auth user	13	delete_authuser
40	Can add auth user groups	14	add_authusergroups
41	Can change auth user groups	14	change_authusergroups
42	Can delete auth user groups	14	delete_authusergroups
43	Can add auth user user permissions	15	add_authuseruserpermissions
44	Can change auth user user permissions	15	change_authuseruserpermissions
45	Can delete auth user user permissions	15	delete_authuseruserpermissions
46	Can add contribute	16	add_contribute
47	Can change contribute	16	change_contribute
48	Can delete contribute	16	delete_contribute
49	Can add django admin log	17	add_djangoadminlog
50	Can change django admin log	17	change_djangoadminlog
51	Can delete django admin log	17	delete_djangoadminlog
52	Can add django content type	18	add_djangocontenttype
53	Can change django content type	18	change_djangocontenttype
54	Can delete django content type	18	delete_djangocontenttype
55	Can add django migrations	19	add_djangomigrations
56	Can change django migrations	19	change_djangomigrations
57	Can delete django migrations	19	delete_djangomigrations
58	Can add django session	20	add_djangosession
59	Can change django session	20	change_djangosession
60	Can delete django session	20	delete_djangosession
61	Can add ee	21	add_ee
62	Can change ee	21	change_ee
63	Can delete ee	21	delete_ee
64	Can add emergency	22	add_emergency
65	Can change emergency	22	change_emergency
66	Can delete emergency	22	delete_emergency
67	Can add event	23	add_event
68	Can change event	23	change_event
69	Can delete event	23	delete_event
70	Can add event basics	24	add_eventbasics
71	Can change event basics	24	change_eventbasics
72	Can delete event basics	24	delete_eventbasics
73	Can add event location	25	add_eventlocation
74	Can change event location	25	change_eventlocation
75	Can delete event location	25	delete_eventlocation
76	Can add event misc	26	add_eventmisc
77	Can change event misc	26	change_eventmisc
78	Can delete event misc	26	delete_eventmisc
79	Can add event photo	27	add_eventphoto
80	Can change event photo	27	change_eventphoto
81	Can delete event photo	27	delete_eventphoto
82	Can add event request	28	add_eventrequest
83	Can change event request	28	change_eventrequest
84	Can delete event request	28	delete_eventrequest
85	Can add feedback	29	add_feedback
86	Can change feedback	29	change_feedback
87	Can delete feedback	29	delete_feedback
88	Can add friends	30	add_friends
89	Can change friends	30	change_friends
90	Can delete friends	30	delete_friends
91	Can add hi	31	add_hi
92	Can change hi	31	change_hi
93	Can delete hi	31	delete_hi
94	Can add login	32	add_login
95	Can change login	32	change_login
96	Can delete login	32	delete_login
97	Can add misc	33	add_misc
98	Can change misc	33	change_misc
99	Can delete misc	33	delete_misc
100	Can add notification	34	add_notification
101	Can change notification	34	change_notification
102	Can delete notification	34	delete_notification
103	Can add photo	35	add_photo
104	Can change photo	35	change_photo
105	Can delete photo	35	delete_photo
106	Can add pi	36	add_pi
107	Can change pi	36	change_pi
108	Can delete pi	36	delete_pi
109	Can add polls choice	37	add_pollschoice
110	Can change polls choice	37	change_pollschoice
111	Can delete polls choice	37	delete_pollschoice
112	Can add polls question	38	add_pollsquestion
113	Can change polls question	38	change_pollsquestion
114	Can delete polls question	38	delete_pollsquestion
115	Can add privacy setting	39	add_privacysetting
116	Can change privacy setting	39	change_privacysetting
117	Can delete privacy setting	39	delete_privacysetting
118	Can add story	40	add_story
119	Can change story	40	change_story
120	Can delete story	40	delete_story
121	Can add travel portfolio	41	add_travelportfolio
122	Can change travel portfolio	41	change_travelportfolio
123	Can delete travel portfolio	41	delete_travelportfolio
124	Can add trip	42	add_trip
125	Can change trip	42	change_trip
126	Can delete trip	42	delete_trip
127	Can add trip basic	43	add_tripbasic
128	Can change trip basic	43	change_tripbasic
129	Can delete trip basic	43	delete_tripbasic
130	Can add trip cost	44	add_tripcost
131	Can change trip cost	44	change_tripcost
132	Can delete trip cost	44	delete_tripcost
133	Can add trip date	45	add_tripdate
134	Can change trip date	45	change_tripdate
135	Can delete trip date	45	delete_tripdate
136	Can add trip request	46	add_triprequest
137	Can change trip request	46	change_triprequest
138	Can delete trip request	46	delete_triprequest
139	Can add trip route	47	add_triproute
140	Can change trip route	47	change_triproute
141	Can delete trip route	47	delete_triproute
142	Can add video	48	add_video
143	Can change video	48	change_video
144	Can delete video	48	delete_video
145	Can add simply	49	add_simply
146	Can change simply	49	change_simply
147	Can delete simply	49	delete_simply
148	Can add stupid	50	add_stupid
149	Can change stupid	50	change_stupid
150	Can delete stupid	50	delete_stupid
151	Can add trip participants	51	add_tripparticipants
152	Can change trip participants	51	change_tripparticipants
153	Can delete trip participants	51	delete_tripparticipants
154	Can add event participants	52	add_eventparticipants
155	Can change event participants	52	change_eventparticipants
156	Can delete event participants	52	delete_eventparticipants
157	Can add emergency info	53	add_emergencyinfo
158	Can change emergency info	53	change_emergencyinfo
159	Can delete emergency info	53	delete_emergencyinfo
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 159, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
50	pbkdf2_sha256$36000$BSeCxnMnnvfG$IATBNnJetFyytf4NRXc39+gelDLLweLjBHGrNESMKEY=	2018-05-05 10:39:15.892948+05:30	t	nwillo	Willo	Walker	mastermindjim@gmail.com	t	t	2018-04-10 19:39:15+05:30
59	pbkdf2_sha256$36000$LWxWrBYayxiX$O1dvm5IKAyaJ1ZIU06BElnHwOQel7IoV/yEvsdXc8eM=	2018-05-19 15:52:02.546171+05:30	f	sahils			sahils@gmail.com	f	t	2018-04-23 12:28:47.797191+05:30
56	pbkdf2_sha256$36000$IxQYL5wQItts$Hq9jzVtfneow0mTr46PnWuITTVRkiXOLoL17qONLFRc=	2018-04-11 20:12:51.055385+05:30	f	nana			nana@gmail.com	f	t	2018-04-11 18:09:36.94923+05:30
53	pbkdf2_sha256$36000$U2kc1B1NviQ9$z2jYNNf0brRFDcf4IsZaGVn4uKH1UwnwmAZkrGKVBu0=	2018-04-18 10:31:31.868846+05:30	f	rani		Rani	rani@gmail.com	f	t	2018-04-10 19:51:13.071103+05:30
57	pbkdf2_sha256$36000$85MKsoEs2WHZ$n1E9V6krEwE8E683hMK3mB8Pv+E+ImUieoym04h/84M=	2018-04-18 12:28:06.106342+05:30	f	tester			tester@gmail.co	f	t	2018-04-18 02:01:52.031811+05:30
58	pbkdf2_sha256$36000$vlwKRaywmekN$15BmNqZHaHjjWZbSS9tKQeX1VuMaWdaS4K59q60LEUA=	\N	f	sahil			sahil@gmail.com	f	t	2018-04-23 12:28:02.882081+05:30
55	pbkdf2_sha256$36000$Cj9LR0Zfathy$61NAiMK6hOODBvnLABv+DZRbKfMN4b0DN2b4zNqVYhg=	\N	f	nawaaz			nawaaz@gmail.com	f	t	2018-04-11 17:52:09.328153+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 59, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: contribute; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.contribute (contribute_id, location_name, location_type, season, attractions, photo, video, username) FROM stdin;
e0b10707210c212524d68bb36c6409ac	Daman	Family	Any	Sight Seeing,Romance	contribute/phone-call_beixe26.svg	contribute/Ennja_-_Lets_Go_NHK6ZRL.mp4	nwillo
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
59	2018-04-10 19:39:41.219179+05:30	50	nwillo	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	4	50
60	2018-04-10 19:42:03.386027+05:30	51	parvati	3		4	50
61	2018-04-10 19:50:05.689962+05:30	10	adil	3		4	50
62	2018-04-10 19:50:05.695324+05:30	21	asdadasd	3		4	50
63	2018-04-10 19:50:05.69915+05:30	15	dilraj	3		4	50
64	2018-04-10 19:50:05.702429+05:30	52	parvati	3		4	50
65	2018-04-10 19:50:05.705606+05:30	17	rani	3		4	50
66	2018-04-10 19:50:05.70881+05:30	8	waheed	3		4	50
67	2018-04-11 17:48:03.819157+05:30	54	nawaaz	3		4	50
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 67, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	polls	question
8	polls	choice
9	em	album
10	em	authgroup
11	em	authgrouppermissions
12	em	authpermission
13	em	authuser
14	em	authusergroups
15	em	authuseruserpermissions
16	em	contribute
17	em	djangoadminlog
18	em	djangocontenttype
19	em	djangomigrations
20	em	djangosession
21	em	ee
22	em	emergency
23	em	event
24	em	eventbasics
25	em	eventlocation
26	em	eventmisc
27	em	eventphoto
28	em	eventrequest
29	em	feedback
30	em	friends
31	em	hi
32	em	login
33	em	misc
34	em	notification
35	em	photo
36	em	pi
37	em	pollschoice
38	em	pollsquestion
39	em	privacysetting
40	em	story
41	em	travelportfolio
42	em	trip
43	em	tripbasic
44	em	tripcost
45	em	tripdate
46	em	triprequest
47	em	triproute
48	em	video
49	em	simply
50	em	stupid
51	em	tripparticipants
52	em	eventparticipants
53	em	emergencyinfo
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 53, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
15	contenttypes	0001_initial	2018-03-21 21:30:11.561607+05:30
16	auth	0001_initial	2018-03-21 21:30:11.568869+05:30
17	admin	0001_initial	2018-03-21 21:30:11.572867+05:30
18	admin	0002_logentry_remove_auto_add	2018-03-21 21:30:11.576516+05:30
19	contenttypes	0002_remove_content_type_name	2018-03-21 21:30:11.580356+05:30
20	auth	0002_alter_permission_name_max_length	2018-03-21 21:30:11.584573+05:30
21	auth	0003_alter_user_email_max_length	2018-03-21 21:30:11.588718+05:30
22	auth	0004_alter_user_username_opts	2018-03-21 21:30:11.592964+05:30
23	auth	0005_alter_user_last_login_null	2018-03-21 21:30:11.597295+05:30
24	auth	0006_require_contenttypes_0002	2018-03-21 21:30:11.601543+05:30
25	auth	0007_alter_validators_add_error_messages	2018-03-21 21:30:11.605327+05:30
26	auth	0008_alter_user_username_max_length	2018-03-21 21:30:11.609747+05:30
27	sessions	0001_initial	2018-03-21 21:30:11.620911+05:30
28	em	0001_initial	2018-03-27 20:09:19.36275+05:30
29	em	0002_simply	2018-03-31 17:08:20.277655+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
q6mnelnx2o694r8d08b4u8z5aw0t1b5z	OGZkZDgxNzA3NzEyMWQwZDZhNTJkNmI4Y2M2MWY0MmI5YTMzYTAyMDp7InVzZXJuYW1lIjoibndpbGxvIn0=	2018-04-12 10:48:33.669783+05:30
3gw5syjbb0x64bnogzc3f60x641yt3ck	NGIxMjMyYTFlMGJjNWU5ZTJjZmRiYTdhNzljMDE0ZjU5ODdjZDMxYTp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk0YWY5NWE5MTNlNzg3ODAyOWY0MWMxMGQzYTJhMzU3NDUwYmI5YSIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXJzIiwiX3Nlc3Npb25fZXhwaXJ5IjozNjAwfQ==	2018-04-17 10:08:07.27329+05:30
1b0eb8lhuyge6yp1byrte85z0u2y3r95	NGIxMjMyYTFlMGJjNWU5ZTJjZmRiYTdhNzljMDE0ZjU5ODdjZDMxYTp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk0YWY5NWE5MTNlNzg3ODAyOWY0MWMxMGQzYTJhMzU3NDUwYmI5YSIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXJzIiwiX3Nlc3Npb25fZXhwaXJ5IjozNjAwfQ==	2018-04-17 14:01:38.489188+05:30
d4tu4vd85m98j6gxcjbxolr14kirk2jy	NGIxMjMyYTFlMGJjNWU5ZTJjZmRiYTdhNzljMDE0ZjU5ODdjZDMxYTp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk0YWY5NWE5MTNlNzg3ODAyOWY0MWMxMGQzYTJhMzU3NDUwYmI5YSIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXJzIiwiX3Nlc3Npb25fZXhwaXJ5IjozNjAwfQ==	2018-04-17 15:02:23.559785+05:30
sfmr11odb93yel82ojub6lagi27hpmus	NWY1OWZkYzkwNGZjNzZhY2NlMmU0YzE2OWU5OWQ3MmZhZjIwNGI4Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk0YWY5NWE5MTNlNzg3ODAyOWY0MWMxMGQzYTJhMzU3NDUwYmI5YSIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-17 16:18:14.071618+05:30
n55fmg9ymab1ygs05ge00gm89cpb85g7	N2MyMzYyMzk4NTQwNGY0NzViN2JmODAxODExM2NmZmEyOGEyNjZkMjp7fQ==	2018-04-11 21:41:39.150152+05:30
lggo6ghuqcblhussrkn5o9el73vmdyl7	N2MyMzYyMzk4NTQwNGY0NzViN2JmODAxODExM2NmZmEyOGEyNjZkMjp7fQ==	2018-04-11 21:47:45.461186+05:30
n5d3rfv3vo5i8ci4tatltwt2xkrya5r6	N2MyMzYyMzk4NTQwNGY0NzViN2JmODAxODExM2NmZmEyOGEyNjZkMjp7fQ==	2018-04-11 21:49:13.294885+05:30
99a8oosnezoc205sfp59imbiy09eaaai	N2MyMzYyMzk4NTQwNGY0NzViN2JmODAxODExM2NmZmEyOGEyNjZkMjp7fQ==	2018-04-11 21:50:11.262374+05:30
kcro9ydjubkr9i34k9h762l6jayvnpre	NWY1OWZkYzkwNGZjNzZhY2NlMmU0YzE2OWU5OWQ3MmZhZjIwNGI4Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk0YWY5NWE5MTNlNzg3ODAyOWY0MWMxMGQzYTJhMzU3NDUwYmI5YSIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-18 00:42:22.849515+05:30
346opzaluqtj7rg8j6obnyttuhf4i53b	N2MyMzYyMzk4NTQwNGY0NzViN2JmODAxODExM2NmZmEyOGEyNjZkMjp7fQ==	2018-04-11 22:55:56.357572+05:30
6txxtruwkd4uaue7mb0uqf1uwj747kdg	N2YyMDBkYzA0M2Q5ODk2OGE4YjE4YzE5MzgyMzBhNmFkZjc5OGU2NTp7InVzZXJuYW1lIjoibndpbGxvIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwY2E0MDdjZjUwZTllOTVjZmY5ZmNmYzk0NTJkY2EyZThkZWY2OTMifQ==	2018-04-16 03:57:41.761468+05:30
dnjebtsq02rdidx2q1kftw00nrh1svnl	N2YyMDBkYzA0M2Q5ODk2OGE4YjE4YzE5MzgyMzBhNmFkZjc5OGU2NTp7InVzZXJuYW1lIjoibndpbGxvIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEwY2E0MDdjZjUwZTllOTVjZmY5ZmNmYzk0NTJkY2EyZThkZWY2OTMifQ==	2018-04-19 21:11:31.766088+05:30
yji3uxmhppmyp7ix76k5gkbcttsvlkta	NmQ5MDhiOGJkYWMyMmM4MTA1YjJlYzJiMTQwNDM4MDI2MTYwMDk1NTp7Il9hdXRoX3VzZXJfaWQiOiI1NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDJjZTJhNzQ3MDA3Y2RhZTdlY2VkNTQwNGY4NWRkZWNmNmEyZCIsInVzZXJuYW1lIjoidGVzdGVyIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuX1JDSzVoOEQuanBlZyIsImZpcnN0bmFtZSI6IiIsImxhc3RuYW1lIjoiIiwiX3Nlc3Npb25fZXhwaXJ5IjozNjAwfQ==	2018-04-18 03:24:12.068807+05:30
qmt3i0nd7rro0z4grdykavsppb1jsbvp	OGZkZDgxNzA3NzEyMWQwZDZhNTJkNmI4Y2M2MWY0MmI5YTMzYTAyMDp7InVzZXJuYW1lIjoibndpbGxvIn0=	2018-04-12 23:30:08.115558+05:30
wcuokw4s6oxohizwz73jzizc1mz0xhd3	MGYyM2I5ZmM5MTk4MjBjNmU0ZDhhYTE1ZTNjYTQ2NDEwZjE4M2UyNDp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjYjQ1ZTQ2NTVlNDQ5NTk4MzFiN2Q5Mzc1MWJiYWEyMmMxN2YwOSIsInVzZXJuYW1lIjoic2FoaWxzIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvc2l4X0s0VXR5STQuanBnIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-23 13:58:53.687224+05:30
rphlizfi8jvc3dri0vyi5gnfj2x1oz7i	MGYyM2I5ZmM5MTk4MjBjNmU0ZDhhYTE1ZTNjYTQ2NDEwZjE4M2UyNDp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjYjQ1ZTQ2NTVlNDQ5NTk4MzFiN2Q5Mzc1MWJiYWEyMmMxN2YwOSIsInVzZXJuYW1lIjoic2FoaWxzIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvc2l4X0s0VXR5STQuanBnIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-24 12:21:07.262469+05:30
7lawf6l24yvh287k41hf65ypvxcxm1p5	ODVkOTE0OWIzNmY4Yzk4NTEzMTgxMzJjNzhmNDk2MTFmNjQ0ZmE5OTp7InVzZXJuYW1lIjoicmFuaSJ9	2018-04-24 19:49:24.81861+05:30
uf414mslvjdd6cbg46rc3sf1l6fbtbu7	MGYyM2I5ZmM5MTk4MjBjNmU0ZDhhYTE1ZTNjYTQ2NDEwZjE4M2UyNDp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjYjQ1ZTQ2NTVlNDQ5NTk4MzFiN2Q5Mzc1MWJiYWEyMmMxN2YwOSIsInVzZXJuYW1lIjoic2FoaWxzIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvc2l4X0s0VXR5STQuanBnIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-26 22:58:53.73472+05:30
wjwsbpdo05rfonye968j59bfuz0bu1ml	ODVkOTE0OWIzNmY4Yzk4NTEzMTgxMzJjNzhmNDk2MTFmNjQ0ZmE5OTp7InVzZXJuYW1lIjoicmFuaSJ9	2018-04-24 19:51:28.04783+05:30
rfj2pq12jbaw0t3kd1mlfz3sxfhrtboe	ODVkOTE0OWIzNmY4Yzk4NTEzMTgxMzJjNzhmNDk2MTFmNjQ0ZmE5OTp7InVzZXJuYW1lIjoicmFuaSJ9	2018-04-24 19:52:09.113118+05:30
ugmgpb9krtqrz2rlllrfl3twyz77y320	ODVkOTE0OWIzNmY4Yzk4NTEzMTgxMzJjNzhmNDk2MTFmNjQ0ZmE5OTp7InVzZXJuYW1lIjoicmFuaSJ9	2018-04-24 19:53:51.864578+05:30
loup5dytydmka4r89fy9mza517xvqwhi	MWVhMWI4MzhkMTE3ODgwYThhNzE2MjQ5Y2I5YjM3MGYwYjRmZDE3ZTp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjVmNzE4NjU2NTlkOGQ0ODk3NDA3ZmE1ZDE5MTdlMjQ4MzZiNDQ3OCIsInVzZXJuYW1lIjoicmFuaSIsInVzZXJwaWMiOiJwcm9maWxlcGljL2ZpdmVfSnBJb3RJWC5qcGciLCJmaXJzdG5hbWUiOiIiLCJsYXN0bmFtZSI6IiIsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=	2018-04-15 21:34:24.374361+05:30
6vdptmcojone0w1kuhvk9nprbfxkypxd	NWQ0YWQ2OWZkN2NlOGQ5YmJkNmQ0OGMyZGMwZDI3YzUzNmU5ZTk3OTp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDA5NTJhZTJiY2ZmYmExODNjMWY0YmMyNGE2MjMwYWJkNjBkNDA5YyIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-04-16 09:26:21.116473+05:30
o4sl4u6tyf89b3dny5e7opagoank8s8f	MGYyM2I5ZmM5MTk4MjBjNmU0ZDhhYTE1ZTNjYTQ2NDEwZjE4M2UyNDp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjYjQ1ZTQ2NTVlNDQ5NTk4MzFiN2Q5Mzc1MWJiYWEyMmMxN2YwOSIsInVzZXJuYW1lIjoic2FoaWxzIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvc2l4X0s0VXR5STQuanBnIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-05-04 09:34:24.659585+05:30
tuq5pquqadbq0m7r418k4dbfprjg6wt3	MTg4YzNkZjNkMTNmYTg1MmMwNzliNTRhMWJkNWQ5ZGI3OTg3ZDU1ODp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDdlYWU2ZDdlZjQ1NDk4YTZhYTc3ODIxYjkyZWFlOTQ3YmM5ZTY0MiIsInVzZXJuYW1lIjoibndpbGxvIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvdGVuXzVBeHc1MTkuanBlZyIsImZpcnN0bmFtZSI6IldpbGxvIiwibGFzdG5hbWUiOiJXYWxrZXIiLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9	2018-05-05 10:33:02.387543+05:30
4uu514fqcz6g5t87oeztqphukb7voitt	NGQ0MzY0OTZhNzQ1Y2QwNzQzMDdlZGY3YWU5YWJiMGVhNzQ5ZTU5Yjp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjYjQ1ZTQ2NTVlNDQ5NTk4MzFiN2Q5Mzc1MWJiYWEyMmMxN2YwOSIsInVzZXJuYW1lIjoic2FoaWxzIiwidXNlcnBpYyI6InByb2ZpbGVwaWMvc2l4X0s0VXR5STQuanBnIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJ2aXNpdCI6InNhaGlscyIsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=	2018-05-19 16:52:02.560952+05:30
\.


--
-- Data for Name: emergency; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.emergency (emergency_id, emergency_requestor, emergency_respondor, emergency_status) FROM stdin;
\.


--
-- Data for Name: emergency_info; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.emergency_info (emergency_id, nature, loi, contact, description, username, personnel) FROM stdin;
db2aff00c20b47bd2b9c7077dd01fc11	Medical	18.4530741, 73.8200848	+91 9737177329	Please Help. Fallen sick on a mountain during hiking. 	nwillo	Police
8478ae2f4019d14393c336f2410abeaa	Crime	18.4531076, 73.82007279999999	+91 9292929292	I got robbed. Please help me.	nwillo	Police
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event (event_id, event_privacy, title, description, start_date, end_date, deadline, location, venue_name, street_address, city, state, country, pincode, logo, cover, category, activity, gender, age, participants, fees, created_on, username, vacancy, ownership) FROM stdin;
1d991d66f702cc2e963c92cc2f8a96d5	private	An Event of a Lifetime	Organizing the best event of all time.....\r\nJoin us for more..!!!!!!!!!!!!!!!!!!	2018-01-01 12:00:00	2018-05-05 18:00:00	2018-04-16 12:00:00	Venue	The Great Daman Jetty	\N	Daman	Daman & Diu	India	396210	logo/ten_wZBTInf.jpeg	cover/nine_WCytN0N.jpg	Entertainment	Live Concerts	Any	50-50	1000	2500	2018-04-06 13:15:02.569576	nwillo	\N	admin
018fbc6f21606aed266899ea9af86836	public	Another Event	Event are just so good that you cannot stop making 'em!	2018-06-01 12:00:00	2018-07-01 12:00:00	2018-06-09 12:00:00	Venue	Some good place	\N	Pune	Maharashtra	India	9090909090	logo/four.jpg	cover/two.jpg	Talks	Spiritual	Any	30-50	50	100	2018-04-06 13:37:06.340949	nwillo	\N	admin
abf7bd13d62a371e1cb0158674ea6676	public	My favorite event	This is going to be my most favorite event. Please come and join me in it.	2018-06-06 12:00:00	2018-06-09 22:00:00	2018-06-07 12:00:00	Venue	Bhuj Khalifia	\N	Daman	Daman and Diu	India	392610	logo/six.jpg	cover/two_SlEcmgL.jpg	Adventure	Skydiving	Male	30-50	10	1000	2018-04-15 14:46:24.002714	rani	\N	admin
c51617559ae2a6b99d7f455b4b084171	public	A bibliographic event	Come and experience bibliology	2019-03-04 12:00:00	2022-05-04 12:00:00	2020-01-01 12:00:00	Venue		\N	Pune	Maharashtra	India	411041	logo/nine.jpg	cover/four.jpg	Talks	Psychological	Female	30-50	200	200	2018-04-16 07:14:03.001176	nwillo	\N	admin
ebbeca2c85bb0b2539ab8a9adc811431	public	A bibliographic event	Come and experience bibliology	2019-03-04 12:00:00	2022-05-04 12:00:00	2020-01-01 12:00:00	Venue	Pahshah	Ruby Industrial Estate, Narhe	Pune	Maharashtra	India	411041	logo/eight.jpg	cover/one.jpg	Talks	Psychological	Male	30-50	100	1000	2018-04-16 07:20:15.782241	nwillo	\N	admin
a8af64d57bec1d987e8c12e2a96a008e	public	Testing a event	Just here testing if it works	2019-08-16 12:00:00	2019-09-15 16:00:00	2019-08-18 12:00:00	Venue	The venue	Ruby Industrial Estate, Narhe	Pune	Maharashtra	India	411041	logo/seven.jpg	cover/one_3UQtYQP.jpg	Entertainment	Stand-up Comedy	Male	30-50	100	1222	2018-04-17 21:07:47.779595	tester	\N	admin
c5b794d1df17e71c3dd7616aa8a308c4	public	Title	Description	2018-08-01 12:00:00	2018-10-01 12:00:00	2018-09-01 12:00:00	Venue	The Venue	29/44, Pune - Bengaluru Highway, Dhankawadi	Pune	Maharashtra	India	411043	logo/eight_XvBtX1H.jpg	cover/three.jpg	Entertainment	Live Concerts	Male	30-50	200	500	2018-04-18 02:39:23.613922	rani	\N	admin
\.


--
-- Data for Name: event_basics; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_basics (event_id, user_id, title, description, start_date, end_date, deadline) FROM stdin;
\.


--
-- Data for Name: event_location; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_location (event_id, user_id, location, venue_name, street_address, city, state, country, pincode) FROM stdin;
\.


--
-- Data for Name: event_misc; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_misc (event_id, user_id, segment, category, activity, gender, age, participants, fees) FROM stdin;
\.


--
-- Data for Name: event_participants; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_participants (part_id, event_id, username, ownership) FROM stdin;
a123	1d991d66f702cc2e963c92cc2f8a96d5	nwillo	created
b123	018fbc6f21606aed266899ea9af86836	nwillo	created
ad02d3b7395ac19eef5233db59f09007	c51617559ae2a6b99d7f455b4b084171	nwillo	created
3ac5457c790915c4413fb7730bc50489	ebbeca2c85bb0b2539ab8a9adc811431	nwillo	created
a55fde1e2700d9795b4cb04897f39f67	7de7c8ee95e3a5a0668aaf207a443378	nwillo	joined
dc60409901fa2312cbee233e221f8b49	abf7bd13d62a371e1cb0158674ea6676	nwillo	joined
0b39cd37b2adb26fe15a78539595c9cb	a8af64d57bec1d987e8c12e2a96a008e	tester	created
7cea881c7df7e82ffd09594d2ee4e0b3	1d991d66f702cc2e963c92cc2f8a96d5	tester	joined
ceb87dc2da64e30dc475c7051632be64	018fbc6f21606aed266899ea9af86836	tester	joined
f3a5087d49ad59d4bc2c8d0b360eda4a	c5b794d1df17e71c3dd7616aa8a308c4	rani	created
61dc0cc3e105a6c5ca879d2e5a7ac6f3	018fbc6f21606aed266899ea9af86836	rani	joined
\.


--
-- Data for Name: event_photo; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_photo (event_id, user_id, logo, cover) FROM stdin;
\.


--
-- Data for Name: event_request; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.event_request (event_id, user_id, requesting_user, request_status) FROM stdin;
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.feedback (feedback_id, liked_using, assist, recommend, improvement, use_again, overall, description, liked_most, username) FROM stdin;
8cf150eeb19e44fafbb23c7f7ccc3e74	Super Yes	Super Yes	Super Yes	Look and Feel,Look and Feel	Very Frequent	Amazing	asdasda	Look and Feel,Look and Feel	nwillo
1f6c53c89471512960c68557750a1daa	Super Yes	Super Yes	Super Yes	Look and Feel,Look and Feel	Very Frequent	Amazing	asdasda	Look and Feel,Look and Feel	nwillo
63c23dc61fc00f89e5bd41d9bb14a647	Super Yes	Super Yes	Super Yes	Look and Feel,Look and Feel	Very Frequent	Amazing	asdas	Look and Feel,Look and Feel	nwillo
e0e8f91b06970704651ad27ba90fc84d	Super Yes	Alot	50-50	Everything,Other	Frequent	Okay-Okay	Nice	Everything,Other	nwillo
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.friends (user_one, user_two, status, actions) FROM stdin;
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.login (user_id, username, email, passw, first_name, last_name) FROM stdin;
101	nwillo	mastermindjim@gmail.com	n12345	nawaaz	will
102	nwillo	nwillo@gmail.com	n00009658	willo	walker
100	adilshaikh	adilshaikh@gmail.com	pacho1	Adil	Shaikh
\.


--
-- Data for Name: misc; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.misc (flog, username, misc_id) FROM stdin;
1	nwillo	1
0	parvati	23f4efb754b13da2a3bf171aebfad61b
0	nawaaz	a53821be89931d97d0f58a9c3a3ffc7e
1	nana	e4fc0e63d13c7bd8eef3eea51f74fe95
1	tester	9a8018444b682f00070d12dc136a39bc
1	rani	1fafa52df1d6690668dd09ce124ec4f9
0	sahil	5dd6c5742d55a47a05efebee2f4013d2
1	sahils	2e0448b10eb95189c4c972808f0087aa
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.notification (notification_id, sender, receiver, url, "time", type, status, read) FROM stdin;
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.photo (photo_id, album_id, user_id, photo, url, likes, comment) FROM stdin;
\.


--
-- Data for Name: pi; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.pi (username, email, aboutme, doj, dob, birthplace, profilepic, coverpic, livesin, occupation, website, mobile, facebook, twitter, instagram, travelledplaces, dreamplaces, favtravplaces, favtravseasons, favtravmoto, favtravmode, school, college, aded, currwork, prevwork, workskills, hobbies, skills, interests, pi_id, relationstatus, gender) FROM stdin;
sahil	sahil@gmail.com	\N	2018-04-23 06:58:02.919676	1994-03-06 00:00:00	\N	dummy/user-gusta.png	dummy/cover.jpg	\N	\N	\N	9898989898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	82917cf308accd59aba3b996bdab1404	\N	Male
nwillo	mastermindjim@gmail.com	I rock like solid rock solid	2018-03-31 14:31:00	2003-01-01 00:00:00	Daman	profilepic/ten.jpeg	coverpic/three_obHB83W.jpg	Pune	Programmer	https://nwillo.blogspot.com	9737177329	https/www.facebook.com/nawaazwill11	https/www.twitter.com/nawaazwill11	https/www.instagram.com/nawaazwill11	Many	Many	Many	Autumn	Many	Many	IOLF	SSR	MCA	Home	In-Head	Many	Many	Many	Many	nwillo	relation	male
nana	nana@gmail.com	This is my profileasda	2018-04-11 12:39:36.992277	2003-01-01 00:00:00	Daman	dummy/user-gusta.png	dummy/cover.jpg	Pune	Programmer	Somesite	9090909090	asda	asdasd	asdasd																ed581248e7086472d95ec62aa7958fc2	relation	male
sahils	sahils@gmail.com	Hey this is sahil!!!!!!!!!!!1	2018-04-23 06:58:47.842456	1994-03-06 00:00:00	Daman	profilepic/050-staypositive-2560x1440-A.jpg	coverpic/nine_X4AxO8Y.jpg	Daman	Programmer		9898989898																			fda1cc9201c763b99ce4772a93bd0aa1	single	male
tester	tester@gmail.co	I am just a testing guy	2018-04-17 20:31:52.068311	1995-09-07 00:00:00	Daman	profilepic/ten_RCK5h8D.jpeg	coverpic/one_kyaki6A.jpg	Pune	Programmer		9898989898																			d433cc11f1f8ffb0d27a4677f109fd2b	relation	male
nawaaz	nawaaz@gmail.com	\N	2018-04-11 12:22:09.368933	1993-11-24 00:00:00	\N	dummy/user-gusta.png	dummy/cover.jpg	\N	\N	\N	9090909090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	293c570d508cfa974054f04085607642	\N	male
rani	some@gmail.com	I am here to explore the world	2018-04-10 14:21:13.071103	2003-01-01 00:00:00	asda	profilepic/six_piklhx8.jpg	coverpic/eight_y3zpqq9.jpg	asdasd	adsa	asdasd	9292929292																			rani	none	female
\.


--
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.polls_choice (id, choice_text, votes, question_id) FROM stdin;
1	Not much	0	1
2	The Sky	0	1
3	Just hacking again	0	1
4	Just hacking again	0	1
\.


--
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.polls_choice_id_seq', 4, true);


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.polls_question (id, question_text, pub_date) FROM stdin;
1	What's new?	2018-03-20 20:12:41.615813+05:30
2	What's up?	2018-03-21 10:20:20+05:30
\.


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nwillo
--

SELECT pg_catalog.setval('public.polls_question_id_seq', 2, true);


--
-- Data for Name: privacy_setting; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.privacy_setting (timeline, friends_list, album, username, privacy_id) FROM stdin;
Friends	Everyone	Friends of Friends	nwillo	fa21ad3d3c0f6ffc0db3a5a4e551e0df
Friends	Everyone	Everyone	rani	e462d17cbcdcb9ebf1dd9f4790f616cc
Everyone	Everyone	Everyone	sahils	b482872eb2d1ddb68fd6dd139562f0b7
\.


--
-- Data for Name: simply; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.simply (id, votes, username) FROM stdin;
\.


--
-- Data for Name: story; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.story (story_id, album, comments, likes, "time", description, share, type, username) FROM stdin;
\.


--
-- Data for Name: stupid; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.stupid (username) FROM stdin;
waheed
nwillo
\.


--
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip (company, moto, fuel, vehicle, hotel, total, start_date, gender, age_group, participants, title, description, trip_group, username, pitstops, pitstops_time, source, destination, timeperpit, distance, duration, is_published, trip_privacy, trip_link, trip_id, created_on, mode, ownership, status) FROM stdin;
Solo	Exploring	1350	10000	20000	31350	2019-02-03 23:00:00	male	Under 18,18-30	12	An awesome trip	This is simply and awesome trip	ac457adb169fe464d66929f4414260fd	nwillo	3	30	Daman	Pune	10	310	8	\N	\N	\N	d59a17efa0d5c86c045af209cfa90fd4	2018-04-06 14:17:36.879812	Car	admin	\N
Solo	Exploring	1050	10000	20202	31252	2019-02-03 23:00:00	male	['Under 18']	12	An awesome trip	This is simply and awesome trip	823cd95b8fa42845d791e4bdb7a3f21c	nwillo	0	0	Daman	Pune	0	310	9	\N	\N	\N	396bbaa5ec5bfd430518aa64053815b6	2018-04-06 14:19:01.246947	Car	admin	\N
Solo	Exploring	1155	10000	20202	31357	2019-02-03 23:00:00	male	Under 18	12	An awesome trip	This is simply and awesome trip	d489cd48cf0f9ad38e667bf7e69c1dd2	nwillo	0	0	Daman	Pune	0	310	9	\N	\N	\N	4b19207babc5f5cd6477f094b8422486	2018-04-06 14:20:21.886403	Car	admin	\N
Solo	Fitness	1155	10000	20202	31357	2019-02-03 23:00:00	male		12	An awesome trip	This is simply and awesome trip	cae2ddf16b9cd5e819b2a1d2c05bda19	nwillo	0	0	Daman	Pune	0	310	9	\N	\N	\N	6678b659f35823484b63673465a7bce0	2018-04-06 14:22:53.474454	Car	admin	\N
Group	Photography	1155	10000	20202	31357	2019-02-03 23:00:00	male	Under 18	12	An awesome trip	This is simply and awesome trip	79ab7810e12563d2ac0d681673b0607d	nwillo	0	0	Daman	Pune	0	310	9	\N	\N	\N	434bdcee24cab6058a8d3383ed43a8f0	2018-04-06 14:32:48.157087	Car	admin	\N
Solo	Exploring	1155	10000	20202	31357	2019-02-03 23:00:00	male	Under 18	12	An awesome trip	This is simply and awesome trip	94d10f14a525828614c76357751b8f72	nwillo	0	0	Daman	Pune	0	310	9	\N	\N	\N	fcb818d8dd21d3b17f9ab0eb19d55c47	2018-04-06 14:34:19.241618	Car	admin	\N
Group	Adventure	960	6000	9000	15960	2018-07-07 22:00:00	female	18-30	17	Just a trip	Trip a demo	0161abc52cac658711f53639c3a0c482	nwillo	3	45	Daman	Pune	15	310	9	\N	\N	\N	d90042ac58e99fa5d0bfff4660980642	2018-04-06 18:05:29.104829	Motorbike	joined	\N
Group	Exploring	960	4500	5000	10460	2018-05-07 07:00:00	any	['18-30']	5	Go Goa Golgappa	Exploring all the golgappas in Goa :P	5fca25e242c8d1a830a58c7b3e4160aa	nwillo	4	60	Pune	Goa	15	310	9	\N	\N	\N	cc3eb0bb49fb744ad7b08cf801390616	2018-04-04 16:52:14.421567	Motorbike	joined	\N
Group	Adventure	2229	1000	35000	38229	2019-02-01 12:00:00	others	18-30	20	From G to A	Goa to Daman ki trip hai. Join it if you are travelling from these coords.	619c145d3c29109f34e30b3d443817dc	nwillo	4	40	Goa, India	Daman, Daman and Diu, India	10	743	13	\N	\N	\N	a3e61f2cc5df99d59e0a0e3648cf7cd3	2018-04-15 14:07:36.436213			\N
Group	Exploring	1776	9900	10000	21676	2019-04-05 22:00:00	male	18-30	10	Bling Bling Blong	Lets roll and rock and roll and buzzzz!!!	113b27b69e0bf98899ff0eea664f42de	tester	2	20	Pune, Maharashtra, India	Goa, India	10	444	8	\N	\N	\N	851e2986273d4b818ac78eb203be555d	2018-04-17 20:51:55.564626	Driving		\N
Group	Exploring	1228	2000	10000	13228	2019-04-04 11:00:00	male	18-30	100	Blah Blah journey	This is just a dummy trip plan	a8734df2b1ea12dcc11bd2c2ca7d2fd1	sahils	3	45	Daman, Daman and Diu, India	Pune, Maharashtra, India	15	307	6	\N	\N	\N	b0d9526c356abfdcf52a5bda9d288281	2018-04-23 07:07:35.614408	Driving		\N
\.


--
-- Data for Name: trip_basic; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_basic (trip_id, user_id, company, moto, occasion) FROM stdin;
\.


--
-- Data for Name: trip_cost; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_cost (trip_id, user_id, fuel, vehicle, hotel, total) FROM stdin;
\.


--
-- Data for Name: trip_date; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_date (trip_id, user_id, start_date, end_date, gender, age, participants, title, description) FROM stdin;
\.


--
-- Data for Name: trip_participants; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_participants (part_id, trip_id, username, ownership) FROM stdin;
a123	d59a17efa0d5c86c045af209cfa90fd4	nwillo	created
b123	d90042ac58e99fa5d0bfff4660980642	nwillo	joined
c123	d59a17efa0d5c86c045af209cfa90fd4	rani	joined
d123	d59a17efa0d5c86c045af209cfa90fd4	nana	joined
e123	asdasdasdadadas	nawaaz	joined
eb4a9a07f76475360c71ba439f0fb89a	a3e61f2cc5df99d59e0a0e3648cf7cd3	nwillo	created
f1373bd6450f69825f00bcd7806d6c14	1824320a6b8ccc0c1bbf2b88b5fa4b3e	nwillo	joined
25de15033f8d03dba188ee79266c7b68	cc3eb0bb49fb744ad7b08cf801390616	nwillo	joined
8e688b3ea7b490eab03ae036ea0b0196	851e2986273d4b818ac78eb203be555d	tester	created
aa0091eb0bf18af6d98b219661141d51	4b19207babc5f5cd6477f094b8422486	tester	joined
71de08dcf99528678485067755980521	cc3eb0bb49fb744ad7b08cf801390616	tester	joined
73e1d015e4f32fb440835ef49afe5aaf	b0d9526c356abfdcf52a5bda9d288281	sahils	created
b2dd9762c8645b05e2edd2d426f14948	cc3eb0bb49fb744ad7b08cf801390616	sahils	joined
\.


--
-- Data for Name: trip_request; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_request (trip_id, trip_admin, requesting_user, request_status) FROM stdin;
\.


--
-- Data for Name: trip_route; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.trip_route (trip_id, user_id, source, destination, mode, pitstops, pitstop_duration, pitstop_distance, total_time, total_distance) FROM stdin;
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: nwillo
--

COPY public.video (video_id, album_id, user_id, video, url, likes, comment) FROM stdin;
\.


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: contribute contribute_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.contribute
    ADD CONSTRAINT contribute_pkey PRIMARY KEY (contribute_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: emergency_info emergency_info_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.emergency_info
    ADD CONSTRAINT emergency_info_pkey PRIMARY KEY (emergency_id);


--
-- Name: event_basics event_basics_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_basics
    ADD CONSTRAINT event_basics_pkey PRIMARY KEY (event_id);


--
-- Name: event_location event_location_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_location
    ADD CONSTRAINT event_location_pkey PRIMARY KEY (event_id);


--
-- Name: event_misc event_misc_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_misc
    ADD CONSTRAINT event_misc_pkey PRIMARY KEY (event_id);


--
-- Name: event_participants event_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_participants
    ADD CONSTRAINT event_participants_pkey PRIMARY KEY (part_id);


--
-- Name: event_photo event_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_photo
    ADD CONSTRAINT event_photo_pkey PRIMARY KEY (event_id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- Name: event_request event_request_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_request
    ADD CONSTRAINT event_request_pkey PRIMARY KEY (event_id);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (user_id);


--
-- Name: misc misc_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.misc
    ADD CONSTRAINT misc_pkey PRIMARY KEY (misc_id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (photo_id);


--
-- Name: pi pi_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.pi
    ADD CONSTRAINT pi_pkey PRIMARY KEY (pi_id);


--
-- Name: pi pi_username_key; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.pi
    ADD CONSTRAINT pi_username_key UNIQUE (username);


--
-- Name: polls_choice polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- Name: polls_question polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: privacy_setting privacy_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.privacy_setting
    ADD CONSTRAINT privacy_setting_pkey PRIMARY KEY (privacy_id);


--
-- Name: simply simply_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.simply
    ADD CONSTRAINT simply_pkey PRIMARY KEY (id);


--
-- Name: story story_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.story
    ADD CONSTRAINT story_pkey PRIMARY KEY (story_id);


--
-- Name: stupid stupid_username_key; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.stupid
    ADD CONSTRAINT stupid_username_key UNIQUE (username);


--
-- Name: trip_basic trip_basic_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_basic
    ADD CONSTRAINT trip_basic_pkey PRIMARY KEY (trip_id);


--
-- Name: trip_cost trip_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_cost
    ADD CONSTRAINT trip_cost_pkey PRIMARY KEY (trip_id);


--
-- Name: trip_date trip_date_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_date
    ADD CONSTRAINT trip_date_pkey PRIMARY KEY (trip_id);


--
-- Name: trip_participants trip_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_participants
    ADD CONSTRAINT trip_participants_pkey PRIMARY KEY (part_id);


--
-- Name: trip trip_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (trip_id);


--
-- Name: trip_request trip_request_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_request
    ADD CONSTRAINT trip_request_pkey PRIMARY KEY (trip_id);


--
-- Name: trip_route trip_route_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_route
    ADD CONSTRAINT trip_route_pkey PRIMARY KEY (trip_id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (video_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_choice_question_id_c5b4b260; Type: INDEX; Schema: public; Owner: nwillo
--

CREATE INDEX polls_choice_question_id_c5b4b260 ON public.polls_choice USING btree (question_id);


--
-- Name: album album_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_basics event_basics_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_basics
    ADD CONSTRAINT event_basics_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: event_basics event_basics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_basics
    ADD CONSTRAINT event_basics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: event_location event_location_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_location
    ADD CONSTRAINT event_location_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: event_location event_location_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_location
    ADD CONSTRAINT event_location_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: event_misc event_misc_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_misc
    ADD CONSTRAINT event_misc_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: event_misc event_misc_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_misc
    ADD CONSTRAINT event_misc_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: event_photo event_photo_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_photo
    ADD CONSTRAINT event_photo_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: event_photo event_photo_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_photo
    ADD CONSTRAINT event_photo_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: event_request event_request_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_request
    ADD CONSTRAINT event_request_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: event_request event_request_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.event_request
    ADD CONSTRAINT event_request_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: photo photo_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id);


--
-- Name: photo photo_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: polls_choice polls_choice_question_id_c5b4b260_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_question_id_c5b4b260_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: simply simply_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.simply
    ADD CONSTRAINT simply_username_fkey FOREIGN KEY (username) REFERENCES public.stupid(username);


--
-- Name: story story_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.story
    ADD CONSTRAINT story_username_fkey FOREIGN KEY (username) REFERENCES public.auth_user(username);


--
-- Name: trip_basic trip_basic_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_basic
    ADD CONSTRAINT trip_basic_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: trip_cost trip_cost_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_cost
    ADD CONSTRAINT trip_cost_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: trip_date trip_date_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_date
    ADD CONSTRAINT trip_date_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: trip_request trip_request_trip_admin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_request
    ADD CONSTRAINT trip_request_trip_admin_fkey FOREIGN KEY (trip_admin) REFERENCES public.login(user_id);


--
-- Name: trip_route trip_route_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.trip_route
    ADD CONSTRAINT trip_route_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- Name: video video_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id);


--
-- Name: video video_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nwillo
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login(user_id);


--
-- PostgreSQL database dump complete
--

