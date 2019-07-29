--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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
-- Name: funny; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.funny (
    user_name character varying,
    content character varying,
    "time" time without time zone,
    id integer NOT NULL
);


ALTER TABLE public.funny OWNER TO "Guest";

--
-- Name: funny_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.funny_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funny_id_seq OWNER TO "Guest";

--
-- Name: funny_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.funny_id_seq OWNED BY public.funny.id;


--
-- Name: general; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.general (
    user_name character varying,
    content character varying,
    "time" time without time zone,
    id integer DEFAULT nextval('public.funny_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.general OWNER TO "Guest";

--
-- Name: messages; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.messages (
    username character varying,
    content character varying,
    "time" timestamp without time zone,
    id integer NOT NULL,
    boardid integer
);


ALTER TABLE public.messages OWNER TO "Guest";

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO "Guest";

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.movies (
    user_name character varying,
    content character varying,
    "time" time without time zone,
    id integer DEFAULT nextval('public.funny_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.movies OWNER TO "Guest";

--
-- Name: music; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.music (
    user_name character varying,
    content character varying,
    "time" time without time zone,
    id integer DEFAULT nextval('public.funny_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.music OWNER TO "Guest";

--
-- Name: not_funny; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.not_funny (
    user_name character varying,
    content character varying,
    "time" time without time zone,
    id integer DEFAULT nextval('public.funny_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.not_funny OWNER TO "Guest";

--
-- Name: funny id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.funny ALTER COLUMN id SET DEFAULT nextval('public.funny_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Data for Name: funny; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.funny (user_name, content, "time", id) FROM stdin;
bob ross	watch him paint robotic cattle	14:46:19	1
donkin doughnuts	its better than vodoo, trust us!	14:46:19	2
the hunk	this is a test of our new post	15:22:45	3
the hunk	s/o to all my big green dudes out there	15:23:08	4
the hunk	this is a test of our new post	15:42:53	7
luke bramlett	see topic, brah	15:43:11	8
\.


--
-- Data for Name: general; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.general (user_name, content, "time", id) FROM stdin;
Cord "like a plugin" Walsh	Hank Hill is my spirit animal	15:24:38	6
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.messages (username, content, "time", id, boardid) FROM stdin;
hsdonkin	I hate this	2019-07-29 00:00:00	1	\N
420_josh_420	I love blazin it	2019-07-29 00:00:00	2	\N
thor ragnorgak	is pretty sweet	2019-07-29 13:45:49	3	\N
iron maiden man	banananananana	2019-07-29 13:51:44	4	\N
the hunk	blaaaah	2019-07-29 14:13:15	5	\N
luke bramlett	yoooooooo	2019-07-29 14:24:17	6	\N
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.movies (user_name, content, "time", id) FROM stdin;
\.


--
-- Data for Name: music; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.music (user_name, content, "time", id) FROM stdin;
david bowie	DB is not dead yet!!!	15:23:30	5
\.


--
-- Data for Name: not_funny; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.not_funny (user_name, content, "time", id) FROM stdin;
\.


--
-- Name: funny_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.funny_id_seq', 8, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.messages_id_seq', 6, true);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

