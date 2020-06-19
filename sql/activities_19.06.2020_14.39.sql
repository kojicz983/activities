--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

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
-- Name: activities_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_activities (
    id integer NOT NULL,
    project_name character varying(300) NOT NULL,
    portfolio character varying(50) NOT NULL,
    cluster character varying(50) NOT NULL,
    specific_activity character varying(300) NOT NULL,
    start_date character varying(50) NOT NULL,
    end_date character varying(50),
    activity_value character varying(50),
    beneficiaries character varying(50),
    donor_1_id integer,
    donor_2_id integer,
    donor_3_id integer,
    location_id integer NOT NULL,
    sdg_id integer NOT NULL,
    sublocation_id integer,
    topic_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.activities_activities OWNER TO postgres;

--
-- Name: activities_activities_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_activities_categories (
    id integer NOT NULL,
    activities_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.activities_activities_categories OWNER TO postgres;

--
-- Name: activities_activities_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_activities_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_activities_categories_id_seq OWNER TO postgres;

--
-- Name: activities_activities_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_activities_categories_id_seq OWNED BY public.activities_activities_categories.id;


--
-- Name: activities_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_activities_id_seq OWNER TO postgres;

--
-- Name: activities_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_activities_id_seq OWNED BY public.activities_activities.id;


--
-- Name: activities_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_category (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.activities_category OWNER TO postgres;

--
-- Name: activities_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_category_id_seq OWNER TO postgres;

--
-- Name: activities_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_category_id_seq OWNED BY public.activities_category.id;


--
-- Name: activities_donor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_donor (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.activities_donor OWNER TO postgres;

--
-- Name: activities_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_donor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_donor_id_seq OWNER TO postgres;

--
-- Name: activities_donor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_donor_id_seq OWNED BY public.activities_donor.id;


--
-- Name: activities_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_location (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    latitude numeric(30,15) NOT NULL,
    longitude numeric(30,15) NOT NULL
);


ALTER TABLE public.activities_location OWNER TO postgres;

--
-- Name: activities_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_location_id_seq OWNER TO postgres;

--
-- Name: activities_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_location_id_seq OWNED BY public.activities_location.id;


--
-- Name: activities_sdg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_sdg (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.activities_sdg OWNER TO postgres;

--
-- Name: activities_sdg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_sdg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_sdg_id_seq OWNER TO postgres;

--
-- Name: activities_sdg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_sdg_id_seq OWNED BY public.activities_sdg.id;


--
-- Name: activities_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_topic (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.activities_topic OWNER TO postgres;

--
-- Name: activities_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_topic_id_seq OWNER TO postgres;

--
-- Name: activities_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_topic_id_seq OWNED BY public.activities_topic.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: activities_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities ALTER COLUMN id SET DEFAULT nextval('public.activities_activities_id_seq'::regclass);


--
-- Name: activities_activities_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities_categories ALTER COLUMN id SET DEFAULT nextval('public.activities_activities_categories_id_seq'::regclass);


--
-- Name: activities_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_category ALTER COLUMN id SET DEFAULT nextval('public.activities_category_id_seq'::regclass);


--
-- Name: activities_donor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_donor ALTER COLUMN id SET DEFAULT nextval('public.activities_donor_id_seq'::regclass);


--
-- Name: activities_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_location ALTER COLUMN id SET DEFAULT nextval('public.activities_location_id_seq'::regclass);


--
-- Name: activities_sdg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_sdg ALTER COLUMN id SET DEFAULT nextval('public.activities_sdg_id_seq'::regclass);


--
-- Name: activities_topic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_topic ALTER COLUMN id SET DEFAULT nextval('public.activities_topic_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: activities_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_activities (id, project_name, portfolio, cluster, specific_activity, start_date, end_date, activity_value, beneficiaries, donor_1_id, donor_2_id, donor_3_id, location_id, sdg_id, sublocation_id, topic_id, owner_id) FROM stdin;
2	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	1	5	1	6	\N
32	Open Communities-Successful Communities	Local Development 	Resilient Development	Renovation and furbishing  of the Social Welfare Centre in Vozdovac 	1.11.2017	15.4.2018	100000.0		7	2	2	15	11	17	10	4
8	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	24.10.2017	13.02.2018			3	2	2	6	5	6	6	\N
9	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	6	5	6	6	\N
10	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	7	5	7	6	\N
13	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	9	10	9	5	\N
17	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	14.12.2017	01.02.2017			3	2	2	12	5	12	6	\N
18	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	12	5	12	6	\N
20	MEAs	ENV & NRM		Local Adaptation Activities and Measures	2018-09-01 00:00:00	2018-12-31 00:00:00	5000.0		1	2	2	13	13	13	8	\N
21	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	14	10	14	5	\N
26	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	2500.0	1	3	2	2	15	5	15	6	\N
27	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	2000.0	1	3	2	2	15	5	15	6	\N
28	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	15	5	15	6	\N
29	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to group Journalists against Violence	1.10.2017	Ongoing	10000.0	27	3	2	2	15	5	15	6	\N
33	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	18	10	18	5	\N
34	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	18000.0	5	5	2	2	15	10	15	5	\N
35	Autonomy, Voice and Participation of PWDs in Serbia	Social Inclusion	Social Inclusion	To train OPDs and CSOs on self-advocacy and employment of PWDs	01.06.2018.	ongoing	2000.0	20	8	2	2	15	10	15	5	\N
36	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	19	5	19	6	\N
174	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	2000.0	1	3	2	2	67	5	67	6	\N
31	Open Communities-Successful Communities	Local Development 	Resilient Development	Development of the Design for Building Premit for Reconstruction of the City of Belgrade Institute of Emergency Medical Assistance	22.7.2018	22.12.2018	94200.0	1000000	7	2	2	15	11	15	10	4
30	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	15	7	16	7	4
25	strenghtening local resilience	Local Resilience Development	Resilient Development	Procurement of pick-up vehicle for the Institute for Biocides and Medical Ecology in Belgrade	1.1.2016	31.12.2016	11734.0	980	6	2	2	15	11	15	10	4
24	strenghtening local resilience	Local Resilience Development	Resilient Development	Procurement of one vehicle for the Center for Social Work	1.1.2016.	31.12.2016.	12300.0	1683960	6	2	2	15	11	15	10	4
22	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of Waste Collection Truck - PUC "Komunalac"	4.12.2017	26.7.2018	74626.0	12135	7	2	2	14	11	14	10	4
19	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	13	7	13	7	4
16	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 170 m	14.7.2014	31.12.2015.	66767.56	27904	6	2	2	10	11	11	10	4
15	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 50 m	14.7.2014	31.12.2015.	29112.24	27904	6	2	2	10	11	11	10	4
14	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	10	7	11	7	4
12	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	9	7	9	7	4
11	BIOMASS	Energy	Resilient Development	Biomass/biogas combined heat and power (CHP) plants (3 plants, 1.95 MW total installed capacity)	13.11.2015.	01.12.2016; 13.12.2017.	826559.76		1	2	2	8	7	8	7	4
7	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	6	7	6	7	4
6	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	4	7	4	7	4
5	BIOMASS	Energy	Resilient Development	Biomass/biogas combined heat and power (CHP) plant (3.57 MW installed capacity)	13.11.2015.	01.07.2016.	275519.92		1	2	2	4	7	5	7	4
4	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	Ongoing			1	2	2	3	7	3	7	4
1	BIOMASS	Energy	Resilient Development	Biomass/biogas combined heat and power (CHP) plant (200 kW installed capacity)	13.11.2015.	02.03.2018.	222400.4		1	2	2	1	7	2	7	4
37	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	19	5	19	6	\N
38	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	19	5	19	6	\N
39	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	20	5	20	6	\N
40	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	20	5	20	6	\N
41	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	20	5	20	6	\N
48	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	1998.0	1	3	2	2	22	5	22	6	\N
53	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	23	10	23	5	\N
54	Integrated Response VaW	Social Inclusion	Social Inclusion	Piloting of the Law on Preventing Domsetic Violence	01.04.2017	01.06.2017			3	2	2	24	5	24	6	\N
55	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	25	5	25	6	\N
56	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	25	5	25	6	\N
57	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	25	5	25	6	\N
71	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction works on Fairgrounds 	18.10.2016	20.11.2016.	54536.0	9871	10	2	2	34	11	34	10	4
63	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	08.12.2018	14.03.2019			3	2	2	29	5	29	6	\N
64	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	29	5	29	6	\N
65	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	08.12.2019	14.03.2020			3	2	2	30	5	30	6	\N
66	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	30	5	30	6	\N
70	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Construction works on adaptation of the Red Cross building	17.3.2016.	17.8.2017.	69841.0	1930	9	2	2	34	11	34	10	4
69	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	33	7	33	7	4
68	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	32	7	32	7	4
67	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	31	7	31	7	4
61	Open Communities-Successful Communities	Local Development 	Resilient Development	Renovation of Social Welfare Centre	17.10.2017	31.1.2018	19759.47	1493	7	2	2	27	11	27	10	4
60	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Procurement of the garbage truck 	17.3.2016.	17.8.2017.	93140.0	6278	9	2	2	27	11	27	10	4
59	CSUD	Climate change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	04.06.2018	Ongoing	8000.0		1	6	11	26	13	26	8	4
58	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	26	7	26	7	4
52	Open Communities-Successful Communities	Local Development 	Resilient Development	Hydrogeologic Researches and Drilling of the Exploratory Well	25.10.2017	1.5.2018	24200.0	10000	7	2	2	23	11	23	10	4
51	Open Communities-Successful Communities	Local Development 	Resilient Development	Furnishing of multiethnic kindergartner "Nasa radost"	1.11.2018	10.12.2018	7075.99	266	7	2	2	23	11	23	10	4
50	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of waste containers - PUC "Komunalac"		8.10.2018	2376.56	38200	7	2	2	23	11	23	10	4
49	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of Waste Collection Truck - PUC "Komunalac"	15.01.2018	26.7.2018	74626.0	38000	7	2	2	23	11	23	10	4
47	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of waste containers - PUC "Usluga"		30.11.2017	3888.8	8129	7	2	2	21	11	21	10	4
46	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of Terrain Vehicle for Bosilegrad Municipality Emergency Responce Team 	20.11.2017	30.11.2017	15642.78	8129	7	2	2	21	11	21	10	4
45	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of equipment and furniture for Emergency Room	20.10.2017.	21.11.2017.	10000.0	2624	10	2	2	21	3	21	10	4
44	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction works on Upgrading Emergency Rooms 	1.6.2017.	20.10.2017.	109980.0	2624	10	2	2	21	3	21	10	4
42	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Preparation of the design for the construction permit and the design for the construction of an urban waste water treatement facility 	17.3.2016.	17.8.2017.	65000.0	2624	9	2	2	21	11	21	10	4
75	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	2000.0	1	3	2	2	35	5	35	6	\N
81	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	37	5	37	6	\N
82	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	37	5	37	6	\N
83	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	37	5	37	6	\N
84	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	14.12.2017	01.02.2017			3	2	2	38	5	38	6	\N
85	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	38	5	38	6	\N
94	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	43	10	43	5	\N
97	Autonomy, Voice and Participation of PWDs in Serbia	Social Inclusion	Social Inclusion	To train OPDs and CSOs on self-advocacy and employment of PWDs	01.06.2018.	ongoing	2000.0	20	8	2	2	44	10	44	5	\N
98	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	14.12.2017	01.02.2017			3	2	2	44	5	44	6	\N
99	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant to work with perpatrators programs and support to victims	1.11.2018	Ongoing	10000.0	2	3	2	2	44	5	44	6	\N
100	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	44	10	44	5	\N
130	EMIS	Energy	Resilient Development	Reconstruction of the heating system through installation of a pellet fired boiler with thermo-technical installations and improvement of thermal insulation including replacement of outer doors and windows of the Town Hall building	20.04.2017	23.02.2018	46895.0		1	12	15	54	7	54	7	4
96	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project design for partial regulation of Lepenica river 	1.3.2015	30.3.2016.	16800.0	92000	9	2	2	44	11	44	10	4
104	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	4500.0	1	3	2	2	45	5	45	6	\N
105	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	45	5	45	6	\N
101	ReLOaD	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs' projects that address the needs of local communities	1.02.2017	ongoing	900000.0	3000	7	6	2	44	16	44	4	3
95	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	12.3.2018.	ongoing			1	2	2	44	7	44	7	4
93	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 80 m	14.7.2014	31.12.2015.	56764.79	12743	6	2	2	42	11	42	10	4
92	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 179 m	14.7.2014	31.12.2015.	36964.02	12743	6	2	2	42	11	42	10	4
91	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 85 m	14.7.2014	31.12.2015.	46437.38	12743	6	2	2	42	11	42	10	4
90	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of landslide, wells in Đukovine 	1.3.2015	30.3.2016.	15100.0	343	9	2	2	40	11	40	10	4
88	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project designs for torrential dam construction and rived bad cleaning/regulation	1.3.2015	30.3.2016.	8000.0	210	9	2	2	40	11	41	10	4
87	EMIS	Energy	Resilient Development	Improvement of energy efficiency of the “Knjazevacka gimnazija” high school building	20.04.2017	08.12.2017	48663.0		1	12	13	39	7	39	7	4
86	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	39	7	39	7	4
80	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project designs for torrential dam construction and rived bad cleaning/regulation	1.3.2015	30.3.2016.	11000.0	212	9	2	2	37	11	37	10	4
79	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project designs for torrential dam construction and rived bad cleaning/regulation	1.3.2015	30.3.2016.	8000.0	465	9	2	2	37	11	37	10	4
78	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rain water collector in Brza Palanka sewerage (110m)	1.3.2015	30.3.2016.	23231.69	720	9	2	2	37	6	37	10	4
77	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	37	7	37	7	4
76	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of Septic Cleaning Truck 	4.12.2017	8.5.2018	70976.0	59453	7	2	2	35	6	35	10	4
74	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of Furniture for Kindergarden	20.7.2017.	31.7.2017.	5726.0	110	10	2	2	35	4	36	10	4
73	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Renovation works in Kindergarten 	5.5.2017.	19.7.2017.	33796.0	110	10	2	2	35	4	36	10	4
72	Open Communities-Successful Communities	Local Development 	Resilient Development	Reconstruction of the Fire Brigade Premises	15.8.2018	20.12.2018	117156.0	25000	7	2	2	34	11	34	10	4
118	Integrated Response VaW	Social Inclusion	Social Inclusion	Piloting of the Law on Preventing Domsetic Violence	01.04.2017	01.06.2017			3	2	2	49	5	49	6	\N
119	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	5000.0	1	3	2	2	49	5	49	6	\N
138	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	57	7	57	7	4
123	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	24.10.2017	13.02.2018			3	2	2	50	5	50	6	\N
124	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	50	5	50	6	\N
134	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	56	7	56	7	4
129	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	52	10	52	5	\N
131	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	54	5	54	6	\N
135	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	56	5	56	6	\N
136	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	56	5	56	6	\N
137	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	56	5	56	6	\N
122	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance 	Public Finance Managment	Support to LGs for more transparent financing of CSOs' projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	5000.0		2	4	2	49	16	49	4	3
133	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of the Study on Flood Risk Management in the Kolubara River Basin	1.3.2015	30.3.2016.	464250.0	1300000	9	2	2	55	11	55	10	4
132	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Reconstruction of bridge over Lukavica river in Šopići community	1.3.2015	30.3.2016.	72769.96	2619	9	2	2	55	6	55	10	4
128	Open Communities - Successful Communities 	Local Resilience Development	Resilient Development	Renovation and furbishing of  an Infirmary in Bogovadja village			60000.0	217	7	2	2	52	3	53	10	4
127	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction of multifunctional sports field	31.7.2017.	1.9.2017.	49902.0	1140	10	2	2	52	3	52	10	4
126	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Procurement and installation of children playground mobilier 	17.3.2016.	17.8.2017.	4161.0	423	9	2	2	52	3	52	10	4
121	CSUD	Climate Change	Resilient Development	Innovation award within Innovation Challenge. Introducing new business model for municipal energy management	27.04.2018.	ongoing	4000.0		1	6	11	49	13	49	8	4
120	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	04.06.2018	Ongoing	10000.0		1	6	11	49	13	49	8	4
117	EMIS	Energy	Resilient Development	Improvement of energy efficiency of the multi-purpose public building in Trmcare and conversion of the heating system from solid fuel to gas	20.04.2017	20.10.2018.	16114.52		1	12	14	49	7	49	7	4
116	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	49	7	49	7	4
115	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data	04.06.2018.	Ongoing	7000.0		1	6	11	46	13	46	8	4
114	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 100 m	14.7.2014	31.12.2015.	52791.66	18427	6	2	2	46	11	46	10	4
113	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	28707.45	18427	6	2	2	46	11	46	10	4
112	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 200 m	14.7.2014	31.12.2015.	42946.82	18427	6	2	2	46	11	46	10	4
111	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	29486.71	18427	6	2	2	46	11	48	10	4
110	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of landslide near elementary school in Likodra	1.3.2015	30.3.2016.	94849.47	842	9	2	2	46	11	47	10	4
109	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of the project design for rehabilitation of the tailing landfill next to mine Stolice, Krupanj municipality	1.3.2015	30.3.2016.	204300.0	15000	9	2	2	46	11	46	10	4
108	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Construction of the new bridge 	1.3.2015	30.3.2016.	102910.32	3000	9	2	2	46	11	46	10	4
107	CSUD	Climate Change	Resilient Development	Innovation award within Innovation Challenge. Improving detection of forest fires and establishing an early detection system 	27.4.2018.	Ongoing	5000.0		1	6	11	45	13	45	8	4
106	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	04.06.2018.	Ongoing	4000.0		1	6	11	45	13	45	8	4
102	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	4.6.2018	Ongoing	9000.0		1	6	11	44	13	44	8	4
139	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	1865.0	1	3	2	2	57	5	57	6	\N
140	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	57	5	57	6	\N
141	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	57	5	57	6	\N
169	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	67	7	67	7	4
143	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	57	5	57	6	\N
168	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	67	7	67	7	4
155	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	63	5	63	6	\N
156	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	63	5	63	6	\N
157	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	63	5	63	6	\N
161	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	65	5	65	6	\N
162	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	65	5	65	6	\N
163	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	65	5	65	6	\N
165	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	66	5	66	6	\N
166	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	66	5	66	6	\N
167	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	66	5	66	6	\N
170	Reintegration of Roma returnees	Social Inclusion	Social Inclusion	Ensuring access to housing and employment for Roma returnees	01.01.2016	30.06.2018	64100.0	142	6	2	2	67	1	67	5	\N
171	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	10800.0	3	5	2	2	67	10	67	5	\N
172	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	08.12.2017	14.03.2018			3	2	2	67	5	67	6	\N
173	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	67	5	67	6	\N
142	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	6000.0		4	2	2	57	16	57	4	3
164	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Construction of the torrential dam and cleaning of the river (350m) through Mala Kamenica village	1.3.2015	30.3.2016.	87507.4	604	9	2	2	66	9	66	10	4
160	EMIS	Energy	Resilient Development	First phase of the reconstruction and upgrade of the Town Hall (replacement of the heating system)\r\nMedvedja\r\n	20.04.2017	03.04.2018	28640.94		1	12	18	65	7	65	7	4
159	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	70259.98	13261	6	2	2	64	11	64	10	4
158	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	83749.8	13261	6	2	2	64	11	64	10	4
154	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of the landslide in Kapetanska street	1.3.2015	30.3.2016.	17300.0	5500	9	2	2	63	11	63	10	4
153	EMIS	Energy	Resilient Development	Design for adaptation and reconstruction of the Municipal Administration building	20.04.2017	28.03.2018	50000.0		1	12	17	62	7	62	7	4
152	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017	ongoing			1	2	2	62	7	62	7	4
150	Open Communities-Successful Communities	Local Development 	Resilient Development	Renovation of the School Plateau of "Vera Blagojevic" Elementary School	10.7.2018	3.9.2018	61009.0	478	7	2	2	59	11	60	10	4
149	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	44831.51	83915	6	2	2	59	11	61	10	4
148	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of landslide in Banja Koviljača	1.3.2015	30.3.2016.	104997.0	680	9	2	2	59	11	60	10	4
147	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 410 m	14.7.2014	31.12.2015.	37818.08	15285	6	2	2	58	11	58	10	4
146	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of landslide in Brcic	1.3.2015	30.3.2016.	14600.0	160	9	2	2	58	11	58	10	4
145	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Construction of the torrential dam on Ljuboviđa river	1.3.2015	30.3.2016.	160179.56	3000	9	2	2	58	9	58	10	4
144	EMIS	Energy	Resilient Development	Improvement of energy efficiency of the Town Hall	20.04.2017	18.07.2018	40959.48		1	12	16	58	7	58	7	4
175	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	4000.0	2	3	2	2	67	5	67	6	\N
176	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	67	5	67	6	\N
177	Autonomy, Voice and Participation of PWDs in Serbia	Social Inclusion	Social Inclusion	To train OPDs and CSOs on self-advocacy and employment of PWDs	01.06.2018.	ongoing	2000.0	20	8	2	2	67	10	67	5	\N
89	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project designs for torrential dam construction and rived bad cleaning/regulation	1.3.2015	30.3.2016.	8000.0	204	9	2	2	40	11	40	10	4
180	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	68	10	68	5	\N
181	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	69	5	69	6	\N
182	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	69	5	69	6	\N
183	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	69	5	69	6	\N
184	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	4500.0	1	3	2	2	70	5	70	6	\N
185	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	1000.0	1	3	2	2	70	5	70	6	\N
186	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	71	10	71	5	\N
189	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	4990.0	1	3	2	2	72	5	72	6	\N
190	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	72	5	72	6	\N
191	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant to work with perpatrators programs and support to victims	1.11.2018	Ongoing	10000.0	2	3	2	2	72	5	72	6	\N
192	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	7200.0	2	5	2	2	72	10	72	5	\N
193	Autonomy, Voice and Participation of PWDs in Serbia	Social Inclusion	Social Inclusion	To train OPDs and CSOs on self-advocacy and employment of PWDs	01.06.2018.	ongoing	2000.0	20	8	2	2	72	10	72	5	\N
198	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	76	10	76	5	\N
199	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	76	5	76	6	\N
204	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	2000.0	1	3	2	2	78	5	78	6	\N
206	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	78	10	78	5	\N
187	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	Ongoing	5000.0		2	2	2	71	16	71	4	3
179	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Managament	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	6000.0		4	2	2	67	16	67	4	3
207	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rain water collector in Zmić sewerage (770m)	1.3.2015	30.3.2016.	142562.9	10000	9	2	2	79	6	79	10	4
205	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	26.2.2018.	ongoing			1	2	2	78	7	78	7	4
203	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	9905.74	12921	6	2	2	77	11	77	10	4
202	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 150 m	14.7.2014	31.12.2015.	23683.9	12921	6	2	2	77	11	77	10	4
201	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Main water supply line from KIK reservoir to Osečina (685m)	1.3.2015	30.3.2016.	60529.75	1200	9	2	2	77	6	77	10	4
200	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Main water supply line in Karadjordjeva street (700m)	1.3.2015.	30.3.2016.	65816.88	1901-11-20 00:00:00	9	2	2	77	6	77	10	4
197	Open Communities-Successful Communities	Local Development 	Resilient Development	Modernization of the Water Treatement Plant "Zabrezje"	23.10.2017	28.2.2018	80753.0	71419	7	2	2	73	11	75	10	4
196	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of the Water Transportation Cistern - PUC "Waterworks and Sewage"Obrenovac	4.12.2017	16.5.2018	73700.0	71419	7	2	2	73	11	73	10	4
195	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Rehabilitation of landslide and road in Barič 	1.3.2015	30.3.2016.	16000.0	500	9	2	2	73	11	74	10	4
188	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	14.11.2018.	ongoing			1	2	2	72	7	72	7	4
178	Blockchain Based Remittances in the City of Nis								2	2	2	67	12	67	1	4
43	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Development of the technical design for Upgrading Emergency Rooms 	12.3.2017.	25.4.2017.	5910.0	2624	10	2	2	21	3	21	10	4
221	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	88	5	88	6	\N
222	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	88	5	88	6	\N
223	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	88	5	88	6	\N
224	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	89	5	89	6	\N
225	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	89	5	89	6	\N
226	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	89	5	89	6	\N
227	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	90	10	90	5	\N
228	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	91	5	91	6	\N
231	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	94	5	94	6	\N
234	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	1850.0	1	3	2	2	96	5	96	6	\N
212	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance 	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	6000.0		4	2	2	84	16	84	4	3
241	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Renovation of Sports Fields and Open gym construction 	30.8.2017.	1.10.2017.	72063.0	10740	10	2	2	97	3	97	10	4
240	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of 10 pieces of 5m3 metal containers	1.12.2016.	20.12.2016.	7142.0	2050	10	2	2	97	11	97	10	4
239	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of Septic truck (cistern)	15.11.2016.	31.12.2016.	73760.0	3560	10	2	2	97	11	97	10	4
238	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Reconstuction of sport fields in the elementary school in Adasevci 	17.3.2016.	17.8.2017.	49994.0	530	9	2	2	97	3	98	10	4
237	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	97	7	97	7	4
236	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data	04.06.2018.	Ongoing	5000.0		1	6	11	96	13	96	8	4
233	EMIS	Energy	Resilient Development	Installation of the biomass fired boiler and reconstruction of the boiler room of the “Stojan Novakovic” elementary school	20.04.2017	28.06.2018	50000.0		1	12	21	96	7	96	7	4
230	EMIS	Energy	Resilient Development	Augmentation of energy efficiency of “Sutjeska” elementary school building – replacement of boilers and external joinery	20.04.2017	09.01.2018	50000.0		1	12	20	92	7	93	7	4
229	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	92	7	92	7	4
220	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	88	7	88	7	4
219	Open Communities-Successful Communities	Local Development 	Resilient Development 	Hydrogeologic Research of Toplik Watersource 	24.10.2017	26.12.2018	25000.0	34000	7	2	2	85	11	87	10	4
218	Open Communities-Successful Communities	Local Development 	Resilient Development 	Construction and furnishing of the new Emergency Medicine Block 	25.4.2018	24.8.2018	218500.0	34000	7	2	2	85	11	85	10	4
217	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction of a new 1000m3 reservoir and renovation of existing 800m3 	9.10.2017.	24.11.2017.	308864.0	8400	10	2	2	85	6	85	10	4
216	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Design for construction of a new 1000m3 water reservoir 	1.8.2017.	28.9.2017.	23900.0	8400	10	2	2	85	6	85	10	4
215	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of 1,000 pieces of 120 l plastic waste bins 	1.12.2016.	19.12.2016.	16241.0	2320	10	2	2	85	11	86	10	4
214	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Complete overhaul of the PUC “Moravica” in Presevo	17.3.2016.	17.8.2017.	28000.0	9780	9	2	2	85	9	85	10	4
213	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Regeneration and reconstruction of five wells at Žujince water spring	17.3.2016.	17.8.2017.	36750.0	7630	9	2	2	85	6	85	10	4
211	Open Communities-Successful Communities	Local Development 	Resilient Development	Renovation and furnishing of the the "Dusan Radovic" Elementary School gymnasyium	20.11.2017	23.1.2018	54800.0	658	7	2	2	83	11	83	10	4
210	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	82	7	82	7	4
209	EMIS	Energy	Resilient Development	Maintenance of the structure, construction of thermal insulation of the façade, and replacement of the coal-fired boiler with a pellet boiler at “Slobodan Bajic Paja” elementary school	20.04.2017	Ongoing	29570.63		1	12	19	80	7	81	7	4
23	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	Procurement of the Septic truck for the PUC Belgrade	17.3.2016.	17.8.2017.	73760.0	1683960	3	2	2	15	11	15	10	4
246	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	102	10	102	5	\N
249	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	2000.0	1	3	2	2	103	5	103	6	\N
252	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	24.10.2017	13.02.2018			3	2	2	104	5	104	6	\N
253	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	104	5	104	6	\N
260	Reintegration of Roma returnees	Social Inclusion	Social Inclusion	Ensuring access to education and personal documentation for Roma retturnees 	01.01.2016	30.06.2018	20000.0	105	6	2	2	106	1	106	5	\N
261	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	106	10	106	5	\N
267	Integrated Response VaW			Support to the multisectoral teams to implement Law on Preventing Domestic Violence	08.12.2020	14.03.2021			3	2	2	110	5	110	6	\N
268	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	110	5	110	6	\N
269	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW					3	2	2	111	5	111	6	\N
275	Integrated Response VaW	Social Inclusion	Social Inclusion	Piloting of the Law on Preventing Domsetic Violence	01.04..2017	01.06.2017			3	2	2	115	5	115	6	\N
273	Open Communities-Successful Communities	Local Development 	Resilient Development	Extension and furnishing of Kindergarten "Maja"			65519.88	30770	7	2	2	113	11	113	10	4
272	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction o 200m3r reservoir 	16.9.2017.	9.11.2017.	68278.0	1890	10	2	2	113	3	113	10	4
271	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	River bank protection in the area of water source Prnjavor (construction of Gabion wall and reconstruction of torrential barrier)	1.3.2015	30.3.2016.	74846.23	13800	9	2	2	112	11	112	10	4
270	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	112	7	112	7	4
266	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Renovation of water source Perkićevo	1.3.2015	30.3.2016.	125747.27	15400	9	2	2	109	6	109	10	4
265	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Main water supply distribution line in Sedlari community (2563m)	1.3.2015	30.3.2016.	144460.05	1000	9	2	2	109	6	109	10	4
264	EMIS	Energy	Resilient Development	Conceptual design for maintenance of “KJP Morava” residential-commercial building	20.04.2017	03.11.2017	16656.83		1	12	22	109	7	109	7	4
263	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	109	7	109	7	4
262	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	108	7	108	7	4
259	Open Communities-Successful Communities	Local Resilience Development	Resilient Development	Replacement of Roof Cover on Subotica Social Welfare Centre 	20.11.2017	12.1.2018	116653.0	32000	7	2	2	106	11	106	10	4
258	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Construction works on the Social Welfare Centre 	3.9.2016.	20.12.2016.	69485.0	32000	10	2	2	106	11	106	10	4
257	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	Local Resilience Development	Resilient Development	 Reconstruction of the Basketball sport court and construction of open space gym at Palić 	17.3.2016.	17.8.2017.	49900.0	7770	9	2	2	106	3	107	10	4
256	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	4.6.2018	Ongoing	7000.0		1	6	11	105	13	105	8	4
255	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of vehicle for Pre-school Facility "Vera Gucunja", City of Sombor	15.11.2018	14.12.2018	16950.0	750	7	2	2	104	11	104	10	4
254				Upgrading of Sikara park - construction of children's playground	4.7.2018	30.10.2018	24371.0	85903	7	2	2	104	3	104	10	4
251	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Renovation of Sports Fields and Open Gym Construction 	1.8.2017.	1.11.2017.	58191.0	25600	10	2	2	104	3	104	10	4
250	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Procurement of 5 pieces of 5m3 waste containers	15.3.2017.	20.4.2017.	3590.0	13200	10	2	2	104	11	104	10	4
248	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Construction of new water well (30m depth) in Buline vode water source	1.3.2015	30.3.2016.	31847.01	10000	9	2	2	103	11	103	10	4
247	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Renovation of water source Buline vode	1.3.2015	30.3.2016.	39398.2	23600	9	2	2	103	11	103	10	4
245	Open Communities-Successful Communities	Local Development 	Resilient Development	Procurement of the Water Transportation Cistern - PUC "Vrela"	4.12.2017	27.4.2018	73700.0	26392	7	2	2	101	11	101	10	4
244	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	100	7	100	7	4
243	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Regeneration of two wells and increasing yield in the city pipeline	1.3.2015	30.3.2016.		10000	9	2	2	97	11	97	10	4
242	Open Communities-Successful Communities	Local Development 	Resilient Development	Renovation  and furbishing of "Sremski front" Elementary School branch	4.7.208	18.9.2018	84500.0	987	7	2	2	97	11	99	10	4
276	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.5.2017	20.12.2017	4921.0	1	3	2	2	115	5	115	6	\N
280	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	116	10	116	5	\N
287	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	120	10	120	5	\N
289	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity development of professionals to implement Law on Preventing Domestic Violence 	1.11.2018	Ongoing			3	2	2	121	5	121	6	\N
290	Integrated Response VaW	Social Inclusion	Social Inclusion	Support to the multisectoral teams to implement Law on Preventing Domestic Violence	17.10.2018	ongoing			3	2	2	121	5	121	6	\N
291	Integrated Response VaW	Social Inclusion	Social Inclusion	Capacity developemnt of the police to respond to VaW	7.11.2018	ongoing			3	2	2	121	5	121	6	\N
293	Reintegration of Roma returnees	Social Inclusion	Social Inclusion	Ensuring access to housing and employment for Roma returnees	01.01.2016	30.06.2018	44000.0	80	6	2	2	122	1	122	5	\N
294	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for marking 16 days of activism against VaW campaign	1.10.2017	20.12.2017	2000.0	1	3	2	2	122	5	122	6	\N
295	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	122	5	122	6	\N
297	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	122	10	122	5	\N
300	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	124	10	124	5	\N
306	Local initiatives for improved social inclusion of young Roma	Social Inclusion	Social Inclusion	To train and employ young Roma women and men in institutions and organizations at the local level	01.02.2018	ongoing	3600.0	1	5	2	2	127	10	127	5	\N
309	Integrated Response VaW	Social Inclusion	Social Inclusion	Grant for provision of SOS help-line service	1.11.2018	Ongoing	5000.0	1	3	2	2	128	5	128	6	\N
298	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	122	16	122	4	3
281	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	116	16	116	4	3
277	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	115	16	115	4	3
308	BIOMASS	Energy	Resilient Development	Biomass/biogas combined heat and power (CHP) plant (600 kW installed capacity)	13.11.2015.	01.07.2016.	275519.92		1	2	2	128	7	129	7	4
305	EMIS	Energy	Resilient Development	Energy recovery of the technical school building and reconstruction of the boiler room	20.04.2017	16.03.2018	50000.0		1	12	25	126	7	126	7	4
304	EMIS	Energy	Resilient Development	Conceptual design for maintenance of “Heroj Rosa Trifunovic” elementary school building	20.04.2017	12.01.2018	30698.53		1	12	24	125	7	125	7	4
303	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 0 m	14.7.2014	31.12.2015.	15082.09	30190	6	2	2	123	11	123	10	4
302	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	Construction of the Torrential Barrier - 0 m	14.7.2014	31.12.2015.	20772.86	30190	6	2	2	123	11	123	10	4
301	Post Floods Early Recovery 	Local Resilience Development	Resilient Development	River cleaning - 200 m	14.7.2014	31.12.2015.	21870.62	30190	6	2	2	123	11	123	10	4
299	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	123	7	123	7	4
296	Open Communities-Successful Communities	Local Development 	Resilient Development	Furnishing of Elementary School "Radoje Domanovic"		21.6.2018	24462.37	931	7	2	2	122	11	122	10	4
292	Enhancing Local resilience to the Migration Crisis	Local Resilience Development	Resilient Development	Garbage truck 16m3	1.4.2018.	1.5.2018.	93140.0	16500	10	2	2	122	11	122	10	4
288	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	121	7	121	7	4
286	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	120	7	120	7	4
285	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	119	7	119	7	4
284	EMIS	Energy	Resilient Development	Energy rehabilitation of the “JU CSK Masuka” building	20.04.2017	26.01.2018	35816.47		1	12	23	118	7	118	7	4
283	EMIS	Energy	Resilient Development	Capacity development of the EMS implementation	19.10.2017.	ongoing			1	2	2	118	7	118	7	4
282	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Main water supply distribution line in Varvarin (2150m)	1.3.2015	30.3.2016.	63751.77	2000	9	2	2	117	6	117	10	4
279	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Reconstruction of Foul water sewerage system in Valjevo	1.3.2015	30.3.2016.	29415.12	30000	9	2	2	116	9	116	10	4
278	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Construction of bridge over river Ub in Gola Glava community	1.3.2015	30.3.2016.	95589.03	564	9	2	2	116	9	116	10	4
337	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	E-parliament (DMS & e-voting) and Local Assembly Acountability Index, ROP amendmends, Public Hearings and Mobile Sessions					4	2	2	57	16	57	3	3
336	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Two-way communication with citizens, Local Assembly's Website and Local Assembly Acountability Index					4	2	2	45	16	45	3	3
335	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	7	16	7	3	3
334	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance	IT retrainings program	15.01.2018.	ongoing	45436.0		26	2	2	24	8	24	2	3
333	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance	IT retrainings program	26.12.2017.	ongoing	29600.0		26	2	2	116	8	116	2	3
332	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance	IT retrainings program	26.12.2017.	ongoing	27810.0		26	2	2	106	8	106	2	3
331	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance 	IT retrainings program	26.12.2017.	ongoing	27810.0		26	2	2	128	8	128	2	3
330	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance 	IT retrainings program	10.04.2017.	ongoing	182012.0		26	2	2	67	8	67	2	3
329	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance 	IT retrainings program 	10.04.2017.	ongoing	137040.0		26	2	2	72	8	72	2	3
328	Serbia at Your Fingertips- Digital Transformation for Development 	Innovation, Public Policy and Rule of Law	Good Governance	IT retrainings program 	10.04.2017.	ongoing	1007740.0		26	2	2	15	8	15	2	3
326	Accelerating Accountability Mechanisms in Public Finances	Public Finances	Accountable Governance	Improved management of Serbian Public Finances at multiple levels	15.07.2016.	31.12.2018.	2616368.0		3	2	2	15	16	15	4	3
325	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	Pilot for transport open data release, open data released on the National Open Data Portal, membership in the Open Data Working Group	2.2.2018.	Ongoing			26	27	2	15	16	15	2	3
324	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	Open Data released and updated on the National Open Data Portal	17.4.2018.	Ongoing			26	27	2	131	16	131	2	3
323	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	Pilot for transport open data release, open data released and updated on the National Open Data Portal	2.2.2018.	Ongoing			26	2	2	106	16	106	2	3
322	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, pilot for transport open data release and open data released and updated on the National Open Data Portal	26.7.2017.	Ongoing			6	26	2	72	16	72	2	3
321	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	Pilot for transport open data release, open data released and updated on the National Open Data Portal	2.2.2018.	Ongoing			26	2	2	116	16	116	2	3
320	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, data available on e-Information Directories webpage 	26.7.2017.	31.8.2017.			6	2	2	122	16	122	2	3
319	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, pilot for transport open data release and open data released and updated on the National Open Data Portal	2.2.2018.	Ongoing			6	26	2	78	16	78	2	3
318	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, data available on e-Information Directories webpage 	26.7.2017.	31.8.2017.			6	2	2	57	16	57	2	3
317	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, data available on e-Information Directories webpage 	26.7.2017.	31.8.2017.			6	2	2	115	16	115	2	3
316	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted and data available on the e-Information Directories webpage, pilot for transport open data release 	26.7.2017.	2.2.2018.			6	26	2	128	16	128	2	3
315	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, data available on e-information directories webpage 	26.7.2017.	31.8.2017.			6	2	2	71	16	71	2	3
314	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	e-Information Directories piloted, data available on e-Information Directories webpage 	26.7.2017.	31.8.2017.			6	2	2	13	16	13	2	3
313	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance	Pilot for transport open data release, open data released and updated on the National Open Data Portal	2.2.2018.	Ongoing			26	27	2	96	16	96	2	3
312	Open Data - Open Opportunities	Innovation, Public Policy and Rule of Law	Accountable Governance 	e-Information Directories piloted, pilot for transport open data release and open data released and updated on the National Open Data Portal	26.7.2017	Ongoing			6	26	27	67	16	67	2	3
310	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	128	16	128	4	3
311	CSUD	Climate Change	Resilient Development	Innovation award for innovative idea within Open Data Challenge, Improving management and opening of local climate change related data 	4.6.2018.	Ongoing	6000.0		1	6	11	130	13	130	8	4
372	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	14	16	14	3	3
371	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	58	16	58	3	3
370	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	92	16	92	3	3
369	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	137	16	137	3	3
368	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	136	16	136	3	3
367	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	69	16	69	3	3
366	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	83	16	83	3	3
365	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Budget portal					4	2	2	106	16	106	3	3
364	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	E-parliament (DMS & e-voting)					4	2	2	67	16	67	3	3
363	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	E-parliament (DMS & e-voting) and Conferences					4	2	2	72	16	72	3	3
362	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	46	16	46	3	3
361	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	77	16	77	3	3
360	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	79	16	79	3	3
359	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	3	16	3	3	3
358	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	84	16	84	3	3
357	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	51	16	51	3	3
356	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index and Mobile Committee Sessions					4	2	2	108	16	108	3	3
355	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	66	16	66	3	3
354	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	103	16	103	3	3
353	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	135	16	135	3	3
352	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	134	16	134	3	3
351	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	133	16	133	3	3
350	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	100	16	100	3	3
349	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	131	16	131	3	3
348	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	95	16	95	3	3
347	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	116	16	116	3	3
346	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Two-way communication with citizens and Local Assembly's Website  					4	2	2	13	16	13	3	3
345	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Public hearing trainings					4	2	2	6	16	6	3	3
344	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index, (E-parliament - DMS & e-voting)					4	2	2	71	16	71	3	3
343	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index					4	2	2	132	16	132	3	3
341	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index and Public Hearings					4	2	2	123	16	123	3	3
340	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Local Assembly Acountability Index, Assembly Office for Citizens Petitions					4	2	2	110	16	110	3	3
339	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	E-parliament (DMS & e-voting), ROP amendmends, Local Assembly Acountability Index and public hearings					4	2	2	78	16	78	3	3
342	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Public Hearings, Public budget portal, Two-way communication with citizens and Local Assembly Acountability Index					4	2	2	128	16	128	3	3
338	Strenghtening the Oversight Function and Transparency of the Parliament	Inclusive Political Processes	Good Governance	Citizens Petitions' and Conferences					4	2	2	72	16	72	3	3
327	Enhancement of Municipal Audit for Accountability and Efficienecny in Public Finance Managment	Public Finances	Accountable Governance	Enhancement of Serbian PFM throught strengthening of Internal and External Audit	01.11.2015.	31.10.2019.	1666666.0		4	2	2	15	16	15	4	3
307	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	127	16	127	4	3
235	ReLOaD	Accountable Governance 	Public Finance Management	Support to LGs for more transparent financing of CSOs' projects that address the needs of local communities	1.02.2017	ongoing	900000.0	3000	7	6	2	96	16	96	4	3
232	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance 	Public Finance Management	\r\nSupport to LGs for more transparent financing of CSOs projects that address the needs of local communities\r\n	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	95	16	95	4	3
208	ReLOaD	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs' projects that address the needs of local communities	1.02.2017	Ongoing	900000.0	3000	7	6	2	79	16	79	4	3
194	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accoutable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	5000.0		4	2	2	72	16	72	4	3
151	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance	Public Finance Management	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	2015-11-01 00:00:00	ongoing	6000.0		4	2	2	59	16	59	4	3
125	ReLOaD	Accountable Governance 	Public Finance Managment	Support to LGs for more transparent financing of CSOs projects that address the needs of local communities	1.02.2017	ongoing	900000.0	3000	7	6	2	51	16	51	4	3
103	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance 	Public Finance Managment	Enhancing cooperation of LGs, CSOs and media for more accoutable PFM	2015-11-01 00:00:00	Ongoing	5000.0		4	2	2	44	16	44	4	3
62	ReLOaD	Accountable Governance 	Public Finance Management 	Support to LGs for more transparent financing of CSOs' projects that address the needs of local communities	1.02.2017	ongoing	900000.0	3000	7	6	2	28	16	27	4	3
3	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	Accountable Governance 	Public Finance Management 	Enhancing cooperation of LGs, CSOs and media for more accoutable PFM	2015-11-01 00:00:00	Ongoing	6000.0		4	2	2	1	16	1	4	3
274	Increased Resilience to Respond to Emergency Situations	Local Resilience Development	Resilient Development	Preparation of project designs for torrential dam construction and rived bad cleaning/regulation	1.3.2015	30.3.2016.	18500.0	12450	9	2	2	114	11	114	10	4
\.


--
-- Data for Name: activities_activities_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_activities_categories (id, activities_id, category_id) FROM stdin;
1	1	3
2	2	7
3	2	8
4	3	7
5	4	7
6	5	3
7	6	7
8	7	7
9	8	7
10	8	8
11	9	7
12	9	8
13	10	7
14	10	8
15	11	3
16	12	7
17	13	4
18	13	10
19	14	7
20	15	3
21	16	3
22	17	7
23	17	8
24	18	7
25	18	8
26	19	7
27	20	7
28	21	4
29	21	10
30	22	3
31	23	3
32	24	6
33	25	3
34	26	7
35	26	8
36	27	7
37	27	8
38	28	7
39	28	8
40	29	7
41	30	7
42	31	1
43	31	3
44	32	3
45	33	4
46	33	10
47	34	4
48	34	10
49	35	7
50	36	9
51	36	7
52	37	9
53	37	7
54	38	9
55	38	7
56	39	9
57	39	7
58	40	9
59	40	7
60	41	9
61	41	7
62	42	3
63	43	1
64	44	3
65	45	3
66	46	3
67	47	3
68	48	7
69	48	8
70	49	3
71	50	3
72	51	3
73	52	2
74	52	3
75	53	4
76	53	10
77	54	9
78	54	8
79	55	9
80	55	7
81	56	9
82	56	7
83	57	9
84	57	7
85	58	7
86	59	10
87	59	8
88	60	6
89	61	3
90	62	7
91	62	9
92	63	7
93	63	8
94	64	7
95	64	8
96	65	7
97	65	8
98	66	7
99	66	8
100	67	7
101	68	7
102	69	7
103	70	3
104	71	3
105	72	3
106	73	3
107	74	3
108	75	7
109	75	8
110	76	3
111	77	7
112	78	3
113	79	1
114	80	1
115	81	9
116	81	7
117	82	9
118	82	7
119	83	9
120	83	7
121	84	7
122	84	8
123	85	7
124	85	8
125	86	7
126	87	3
127	88	1
128	89	1
129	90	1
130	91	3
131	92	3
132	93	3
133	94	4
134	94	10
135	95	7
136	96	1
137	97	7
138	98	7
139	98	8
140	99	10
141	99	7
142	100	4
143	100	10
144	101	7
145	101	9
146	102	10
147	102	8
148	103	7
149	104	7
150	104	8
151	105	7
152	105	8
153	106	10
154	106	8
155	107	10
156	107	8
157	108	3
158	109	1
159	110	3
160	111	3
161	112	3
162	113	3
163	114	3
164	115	10
165	115	8
166	116	7
167	117	3
168	118	9
169	118	8
170	119	7
171	119	8
172	120	10
173	120	8
174	121	10
175	121	8
176	122	7
177	123	7
178	123	8
179	124	7
180	124	8
181	125	7
182	125	9
183	126	3
184	127	3
185	128	3
186	129	4
187	129	10
188	130	3
189	131	7
190	131	8
191	132	3
192	133	1
193	134	7
194	135	9
195	135	7
196	136	9
197	136	7
198	137	9
199	137	7
200	138	7
201	139	7
202	139	8
203	140	9
204	140	7
205	141	9
206	141	7
207	142	7
208	143	9
209	143	7
210	144	3
211	145	3
212	146	1
213	147	3
214	148	3
215	149	3
216	150	3
217	151	7
218	152	7
219	153	1
220	154	1
221	155	9
222	155	7
223	156	9
224	156	7
225	157	9
226	157	7
227	158	3
228	159	3
229	160	3
230	161	9
231	161	7
232	162	9
233	162	7
234	163	9
235	163	7
236	164	3
237	165	9
238	165	7
239	166	9
240	166	7
241	167	9
242	167	7
243	168	7
244	169	7
245	170	10
246	170	4
247	171	4
248	171	10
249	172	7
250	172	8
251	173	7
252	173	8
253	174	7
254	174	8
255	175	7
256	175	8
257	176	7
258	176	8
259	177	7
260	178	10
261	179	7
262	180	4
263	180	10
264	181	9
265	181	7
266	182	9
267	182	7
268	183	9
269	183	7
270	184	7
271	184	8
272	185	7
273	185	8
274	186	4
275	186	10
276	187	7
277	188	7
278	189	7
279	189	8
280	190	7
281	190	8
282	191	10
283	191	7
284	192	4
285	192	10
286	193	7
287	194	7
288	195	1
289	196	3
290	197	3
291	198	4
292	198	10
293	199	7
294	199	8
295	200	3
296	201	3
297	202	3
298	203	3
299	204	7
300	204	8
301	205	7
302	206	4
303	206	10
304	207	3
305	208	7
306	208	9
307	209	3
308	210	7
309	211	3
310	212	7
311	213	3
312	214	3
313	215	3
314	216	1
315	217	3
316	218	3
317	219	2
318	219	3
319	220	7
320	221	9
321	221	7
322	222	9
323	222	7
324	223	9
325	223	7
326	224	9
327	224	7
328	225	9
329	225	7
330	226	9
331	226	7
332	227	4
333	227	10
334	228	7
335	228	8
336	229	7
337	230	3
338	231	7
339	231	8
340	232	7
341	233	3
342	234	7
343	234	8
344	235	7
345	235	9
346	236	10
347	236	8
348	237	7
349	238	3
350	239	6
351	240	3
352	241	3
353	242	3
354	243	3
355	244	7
356	245	3
357	246	4
358	246	10
359	247	3
360	248	3
361	249	7
362	249	8
363	250	3
364	251	3
365	252	7
366	252	8
367	253	7
368	253	8
369	254	3
370	255	3
371	256	10
372	256	8
373	257	3
374	258	3
375	259	3
376	260	4
377	261	4
378	261	10
379	262	7
380	263	7
381	264	1
382	265	3
383	266	3
384	267	7
385	267	8
386	268	7
387	268	8
388	269	7
389	269	8
390	270	7
391	271	3
392	272	3
393	273	3
394	274	1
395	275	9
396	275	8
397	276	7
398	276	8
399	277	7
400	278	3
401	279	3
402	280	4
403	280	10
404	281	7
405	282	3
406	283	7
407	284	3
408	285	7
409	286	7
410	287	4
411	287	10
412	288	7
413	289	9
414	289	7
415	290	9
416	290	7
417	291	9
418	291	7
419	292	6
420	293	10
421	293	4
422	294	7
423	294	8
424	295	7
425	295	8
426	296	3
427	297	4
428	297	10
429	298	7
430	299	7
431	300	4
432	300	10
433	301	3
434	302	3
435	303	3
436	304	1
437	305	3
438	306	4
439	306	10
440	307	7
441	308	3
442	309	7
443	309	8
444	310	7
445	311	10
446	311	8
447	312	10
448	313	10
449	314	10
450	315	10
451	316	10
452	317	10
453	318	10
454	319	10
455	320	10
456	321	10
457	322	10
458	323	10
459	324	10
460	325	10
461	326	6
462	326	7
463	327	6
464	327	7
465	328	4
466	328	7
467	329	4
468	329	7
469	330	4
470	330	7
471	331	4
472	331	7
473	332	4
474	332	7
475	333	4
476	333	7
477	334	4
478	334	7
479	335	6
480	335	7
481	336	6
482	336	10
483	337	6
484	337	10
485	338	6
486	338	7
487	339	6
488	339	10
489	340	7
490	340	11
491	341	6
492	341	7
493	342	6
494	342	10
495	343	6
496	343	7
497	344	6
498	344	7
499	345	7
500	345	11
501	346	6
502	346	10
503	347	6
504	347	7
505	348	6
506	348	7
507	349	6
508	349	7
509	350	6
510	350	7
511	351	6
512	351	7
513	352	6
514	352	7
515	353	6
516	353	7
517	354	6
518	354	7
519	355	6
520	355	7
521	356	6
522	356	7
523	357	6
524	357	7
525	358	6
526	358	7
527	359	6
528	359	7
529	360	6
530	360	7
531	361	6
532	361	7
533	362	6
534	362	7
535	363	6
536	363	10
537	364	6
538	364	10
539	365	6
540	365	10
541	366	6
542	366	10
543	367	6
544	367	10
545	368	6
546	368	10
547	369	6
548	369	10
549	370	6
550	370	10
551	371	6
552	371	10
553	372	6
554	372	10
\.


--
-- Data for Name: activities_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_category (id, name) FROM stdin;
1	Technical Documentation
2	Research
3	Infrastructure works
4	Employment
5	Private Sector support
6	Institution Building
7	Capacity development
8	Expert support
9	Normative support
10	Innovative solutions
11	Equipment
\.


--
-- Data for Name: activities_donor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_donor (id, name) FROM stdin;
1	GEFTrustee
2	
3	SIDA
4	SDC
5	UNHCR
6	UNDP
7	EU
8	UN
9	JPN
10	USAID
11	SRB MoE
12	SRB MoME
13	Knjaževac
14	Kruševac
15	Lapovo
16	Ljubovija
17	Lučani
18	Medvedja
19	Pećinci
20	Raška
21	Šabac
22	Svilajnac
23	Velika Plana
24	Žabari
25	Žagubica
26	Serbia
27	DFID
\.


--
-- Data for Name: activities_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_location (id, name, latitude, longitude) FROM stdin;
1	Aleksinac	43.541666999999997	21.707778000000001
2	Gornje Suhotno	43.475208000000002	21.645489999999999
3	Aleksandrovac	43.458710000000004	21.053160999999999
4	Alibunar	45.079841000000002	20.966332999999999
5	Ilandza	45.168317999999999	20.921313000000001
6	Apatin	45.671760999999996	18.981750000000002
7	Arandjelovac	44.307461000000004	20.557240000000000
8	Bac	45.390920999999999	19.239097999999998
9	Backa Palanka	45.250250000000001	19.396083999999998
10	Bajina Basta	43.971403000000002	19.565950000000001
11	Bajina Basta	43.971403000000002	19.565950000000001
12	Batocina	44.154744000000001	21.079792999999999
13	Becej	45.619222999999998	20.048496000000000
14	Bela Palanka	43.218572999999999	22.314261999999999
15	Belgrade	44.817813000000001	20.456897000000001
16	Savski Venac	44.784689999999998	20.448577000000000
17	Vozdovac	39.783729999999998	-100.445881999999997
18	Beocin	45.209059000000003	19.721112999999999
19	Bojnik	43.014083999999997	21.721133999999999
20	Bor	44.074446999999999	22.099190000000000
21	Bosilegrad	42.499656000000002	22.473268999999998
22	Brus	43.385084999999997	21.032149000000000
23	Bujanovac	42.459167000000001	21.766667000000002
24	Cacak	43.888827999999997	20.344732000000000
25	Crna Trava	42.809939000000000	22.298995999999999
26	Cuprija	43.927500000000002	21.370000000000001
27	Dimitrovgrad	43.014473000000002	22.775710000000000
28	Dimtrovgrad	39.783729999999998	-100.445881999999997
29	Doljevac	43.197038999999997	21.830824000000000
30	Gadzin Han	43.225178999999997	22.032722000000000
31	Gornji Milanovac	44.024161999999997	20.459280000000000
32	Indjija	45.047825000000003	20.080853000000001
33	Ivanjica	43.581668000000001	20.230454999999999
34	Kanjiza	46.064444999999999	20.051648000000000
35	Kikinda	45.825443999999997	20.462738999999999
36	Basaid	45.639156000000000	20.413665000000002
37	Kladovo	44.609397999999999	22.613651999999998
38	Knic	43.925291000000001	20.720229000000000
39	Knjazevac	43.567515999999998	22.255655000000001
40	Koceljeva	44.468204000000000	19.815504000000001
41	Kozarica	44.508938999999998	19.704684000000000
42	Kosjeric	43.998111999999999	19.908021999999999
43	Kostolac	44.714942000000001	21.171091000000001
44	Kragujevac	44.008248000000002	20.914047000000000
45	Kraljevo	43.723579999999998	20.687600000000000
46	Krupanj	44.367500000000000	19.363333000000001
47	Likodra	44.397221999999999	19.431944000000001
48	Krzava	44.353889000000002	19.346111000000001
49	Krusevac	43.582565000000002	21.326599000000002
50	Kula	45.608837999999999	19.532775999999998
51	Kursumlija	43.138413000000000	21.274964000000001
53	Bogovadja	44.316426000000000	20.185794999999999
54	Lapovo	44.185459999999999	21.104921999999998
55	Lazarevac	44.381518000000000	20.261033000000001
57	Leskovac	42.996257000000000	21.948086000000000
58	Ljubovija	44.186788999999997	19.369816000000000
59	Loznica	44.537753000000002	19.225040000000000
61	Stira	44.531055000000002	19.209409999999998
62	Lucani	43.857781000000003	20.137651999999999
64	Mali Zvornik	44.375121000000000	19.105215000000001
65	Medvedja	42.842458999999998	21.584731000000001
67	Nis	43.321503999999997	21.895730000000000
68	Nova Crnja	45.667833999999999	20.607053000000001
70	Novi Becej	45.595931000000000	20.143749000000000
71	Novi Pazar	43.136667000000003	20.512222000000001
73	Obrenovac	44.657437000000002	20.198388000000001
74	Baric	44.653331000000001	20.260636000000002
76	Odzaci	45.508282000000001	19.263672000000000
77	Osecina	44.373103999999998	19.602246000000001
78	Pancevo	44.870232000000001	20.640941000000002
80	Pecinci	44.908921999999997	19.966090000000001
81	Donji Tovarnik	44.813253000000003	19.944884999999999
83	Pirot	43.156458000000001	22.587102000000002
84	Pozega	43.846049000000001	20.045493000000000
85	Presevo	42.309167000000002	21.649166999999998
87	Toplik	43.908264000000003	21.503840000000000
88	Priboj	43.583610999999998	19.525832999999999
90	Prokuplje	43.233452999999997	21.585470000000001
91	Raca	43.012594999999997	21.313858000000000
92	Raska	43.160975999999998	20.533928000000000
94	Razanj	43.674424999999999	21.549205000000001
95	Ruma	45.008290000000002	19.815728000000000
97	Sid	45.128110999999997	19.229700999999999
99	Berkasovo	45.148896000000001	19.259923000000001
100	Senta	45.921632000000002	20.082003000000000
101	Sjenica	43.272835000000001	19.998998000000000
103	Smederevska Palanka	44.366176000000003	20.956700999999999
104	Sombor	45.772655000000000	19.114481000000001
106	Subotica	46.100012999999997	19.664097000000002
107	Palic	46.102285000000002	19.763453999999999
109	Svilajnac	44.233308999999998	21.194727000000000
110	Svrljig	43.414707999999997	22.122160999999998
111	Topola	44.254134999999998	20.678276000000000
113	Tutin	42.990341999999998	20.336704000000001
114	Ub	44.456203000000002	20.073777000000000
116	Valjevo	44.270798999999997	19.886555999999999
117	Varvarin	43.725442000000001	21.368127999999999
119	Veliko Gradiste	44.762810999999999	21.516748000000000
120	Vladicin Han	42.708202000000000	22.066365000000001
122	Vranje	42.553252999999998	21.899338000000000
123	Vrnjacka Banja	43.624153000000000	20.895893000000001
125	Zabari	44.356741000000000	21.214670999999999
126	Zagubica	44.196053999999997	21.786539000000001
127	Zajecar	43.902835000000003	22.278936000000002
129	Botos	45.309561000000002	20.638273999999999
130	Zvezdara	44.801664000000002	20.496109000000001
132	Backi Petrovac	45.360314000000002	19.595217999999999
133	Secanj	45.368487999999999	20.773430999999999
135	Sokobanja	43.644050999999997	21.873072000000001
136	Veliko Gradište	44.762810999999999	21.516748000000000
52	Lajkovac	44.369410999999999	20.165486999999999
56	Lebane	42.922044999999997	21.736951999999999
60	Banja Koviljaca	44.514426999999998	19.158308000000002
63	Majdanpek	44.422311000000001	21.935725999999999
66	Negotin	44.227077999999999	22.530854999999999
69	Nova Varos	43.459705000000000	19.815449000000001
72	Novi Sad	45.255133999999998	19.845175999999999
75	Zabrezje	44.682499999999997	20.202500000000001
79	Paracin	43.860833000000000	21.407778000000000
82	Petrovac na Mlavi	44.378261000000002	21.417075000000001
86	Miratovac	42.256056999999998	21.647008000000000
89	Prijepolje	43.387850999999998	19.647203999999999
93	Supnje	43.274053000000002	20.623166999999999
96	Sabac	44.751862000000003	19.691707000000001
98	Adasevci	45.083168000000001	19.220479000000001
102	Smederevo	44.666215999999999	20.926746999999999
105	Sremska Mitrovica	44.971603999999999	19.616868000000000
108	Surdulica	42.691932999999999	22.170147000000000
112	Trstenik	43.620213999999997	20.998445000000000
115	Uzice	43.856496000000000	19.840273000000000
118	Velika Plana	44.334138000000003	21.076483000000000
121	Vlasotince	42.966656000000000	22.127935999999998
124	Vrnjacka banja	43.624153000000000	20.895893000000001
128	Zrenjanin	45.380268000000001	20.390761000000001
131	Vrbas	45.571328000000001	19.642807999999999
134	Kovin	44.743960000000001	20.976289000000001
137	Blace	43.296373000000003	21.290469000000002
\.


--
-- Data for Name: activities_sdg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_sdg (id, name) FROM stdin;
1	GOAL 1: No Poverty
2	GOAL 2: Zero Hunger
3	GOAL 3: Good Health and Well-being
4	GOAL 4: Quality Education
5	GOAL 5: Gender Equality
6	GOAL 6: Clean Water and Sanitation
7	GOAL 7: Affordable and Clean Energy
8	GOAL 8: Decent Work and Economic Growth
9	GOAL 9: Industry, Innovation and Infrastructure
10	GOAL 10: Reduced Inequality
11	GOAL 11: Sustainable Cities and Communities
12	GOAL 12: Responsible Consumption and Production
13	GOAL 13: Climate Action
14	GOAL 14: Life Below Water
15	GOAL 15: Life on Land
16	GOAL 16: Peace and Justice Strong Institutions
17	GOAL 17: Partnerships to achieve the Goal
\.


--
-- Data for Name: activities_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities_topic (id, name) FROM stdin;
1	Poverty Reduction
2	E-Governance
3	Parliamentary Development
4	Public Finance Management
5	Vulnerable groups
6	Gender Equality
7	Energy Efficiency and Renewable Energy
8	Climate Change
9	Environment
10	Local Municipal Resilience and Disaster Risk Reduction
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add activities	7	add_activities
26	Can change activities	7	change_activities
27	Can delete activities	7	delete_activities
28	Can view activities	7	view_activities
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add donor	9	add_donor
34	Can change donor	9	change_donor
35	Can delete donor	9	delete_donor
36	Can view donor	9	view_donor
37	Can add location	10	add_location
38	Can change location	10	change_location
39	Can delete location	10	delete_location
40	Can view location	10	view_location
41	Can add sdg	11	add_sdg
42	Can change sdg	11	change_sdg
43	Can delete sdg	11	delete_sdg
44	Can view sdg	11	view_sdg
45	Can add topic	12	add_topic
46	Can change topic	12	change_topic
47	Can delete topic	12	delete_topic
48	Can view topic	12	view_topic
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$120000$728jaoMNdhCR$xQzPFHAte/LaatJ9Bng6T8ZBbP40vV2h9nrrIW2RKiw=	2020-01-14 12:41:10.591893+00	t	jelena_macura	Jelena	Macura	jelena.macura@undp.org	t	t	2019-12-19 10:33:55+00
1	pbkdf2_sha256$120000$9q2u29CM6fOG$dzifA1Hr+d5kqvcnyRU3l16He4pTHpXPPw2yG63PFBI=	2020-01-16 10:21:12.080616+00	t	admin			admin@example.com	t	t	2019-03-14 15:08:50.048203+00
2	pbkdf2_sha256$120000$8BBUwAuD463z$7e0gI+XaCNymkgWc5fOLdTruUTLqCSAwRZhJA3oQfI4=	2020-01-23 09:19:55.818553+00	t	undpAdmin				t	t	2019-06-20 09:26:11+00
4	pbkdf2_sha256$120000$CZT3QSMQzjex$ofpQRKgJtW1NHRnXaAV59Us7FQwzRLMrfbtQhprHnf8=	2020-01-23 17:41:06.412962+00	t	aleksandar	Aleksandar	Jovanovic	aleksandar.jovanovic@undp.org	t	t	2019-12-19 10:37:56+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-06-20 09:26:11.749313+00	2	undpAdmin	1	[{"added": {}}]	4	1
2	2019-06-20 09:26:54.53808+00	2	undpAdmin	2	[{"changed": {"fields": ["is_superuser"]}}]	4	1
3	2019-06-20 09:27:05.487101+00	2	undpAdmin	2	[{"changed": {"fields": ["is_staff"]}}]	4	1
4	2019-06-20 09:28:14.364478+00	1	admin	2	[{"changed": {"fields": ["password"]}}]	4	1
5	2019-12-19 10:33:56.110065+00	3	jelena_macura	1	[{"added": {}}]	4	1
6	2019-12-19 10:35:30.840481+00	3	jelena_macura	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser"]}}]	4	1
7	2019-12-19 10:37:57.056162+00	4	aleksandar	1	[{"added": {}}]	4	1
8	2019-12-19 10:39:17.725579+00	4	aleksandar	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser"]}}]	4	1
9	2020-01-16 10:32:53.443541+00	372	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
10	2020-01-16 10:36:30.845058+00	371	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
11	2020-01-16 10:36:30.866932+00	370	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
12	2020-01-16 10:36:30.882904+00	369	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
13	2020-01-16 10:36:30.897439+00	368	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
14	2020-01-16 10:36:30.914279+00	367	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
15	2020-01-16 10:36:30.92819+00	366	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
16	2020-01-16 10:36:30.954139+00	365	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
17	2020-01-16 10:36:30.97648+00	364	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
18	2020-01-16 10:36:30.994853+00	363	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
19	2020-01-16 10:36:31.016318+00	362	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
20	2020-01-16 10:36:31.030027+00	361	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
21	2020-01-16 10:36:31.043551+00	360	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
22	2020-01-16 10:36:31.05681+00	359	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
23	2020-01-16 10:36:31.072892+00	358	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
24	2020-01-16 10:36:31.086163+00	357	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
25	2020-01-16 10:36:31.099883+00	356	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
26	2020-01-16 10:36:31.113156+00	355	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
27	2020-01-16 10:36:31.126574+00	354	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
28	2020-01-16 10:36:31.150608+00	353	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
29	2020-01-16 10:36:31.175064+00	352	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
30	2020-01-16 10:36:31.188377+00	351	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
31	2020-01-16 10:36:31.20178+00	350	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
32	2020-01-16 10:36:31.229891+00	349	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
33	2020-01-16 10:36:31.245719+00	348	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
34	2020-01-16 10:36:31.259185+00	347	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
35	2020-01-16 10:36:31.283943+00	346	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
36	2020-01-16 10:36:31.298072+00	345	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
37	2020-01-16 10:36:31.311403+00	344	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
38	2020-01-16 10:36:31.324852+00	343	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
39	2020-01-16 10:36:31.373919+00	342	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
40	2020-01-16 10:36:31.38891+00	341	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
41	2020-01-16 10:36:31.402977+00	340	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
42	2020-01-16 10:36:31.416581+00	339	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
43	2020-01-16 10:36:31.430719+00	338	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
44	2020-01-16 10:36:31.446554+00	337	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
45	2020-01-16 10:36:31.461372+00	336	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
46	2020-01-16 10:36:31.477598+00	335	Strenghtening the Oversight Function and Transparency of the Parliament	2	[{"changed": {"fields": ["owner"]}}]	7	3
47	2020-01-16 10:36:31.491178+00	334	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
48	2020-01-16 10:36:31.531234+00	333	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
49	2020-01-16 10:36:31.575936+00	332	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
50	2020-01-16 10:36:31.591648+00	331	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
51	2020-01-16 10:36:31.605599+00	330	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
52	2020-01-16 10:36:31.635449+00	329	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
53	2020-01-16 10:36:31.649519+00	328	Serbia at Your Fingertips- Digital Transformation for Development 	2	[{"changed": {"fields": ["owner"]}}]	7	3
54	2020-01-16 10:36:31.687313+00	327	Enhancement of Municipal Audit for Accountability and Efficienecny in Public Finance Managment	2	[{"changed": {"fields": ["owner"]}}]	7	3
55	2020-01-16 10:36:31.703586+00	326	Accelerating Accountability Mechanisms in Public Finances	2	[{"changed": {"fields": ["owner"]}}]	7	3
56	2020-01-16 10:36:31.720867+00	325	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
57	2020-01-16 10:36:31.739954+00	324	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
58	2020-01-16 10:36:31.761181+00	323	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
59	2020-01-16 10:36:31.797383+00	322	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
60	2020-01-16 10:36:31.810717+00	321	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
61	2020-01-16 10:36:31.828472+00	320	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
62	2020-01-16 10:36:31.858708+00	319	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
63	2020-01-16 10:36:31.876548+00	318	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
64	2020-01-16 10:36:31.900412+00	317	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
65	2020-01-16 10:36:31.91921+00	316	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
66	2020-01-16 10:36:31.938294+00	315	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
67	2020-01-16 10:36:31.969928+00	314	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
68	2020-01-16 10:36:31.985804+00	313	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
69	2020-01-16 10:36:32.005569+00	312	Open Data - Open Opportunities	2	[{"changed": {"fields": ["owner"]}}]	7	3
70	2020-01-16 10:36:32.02081+00	310	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
71	2020-01-16 10:39:24.558046+00	307	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
72	2020-01-16 10:39:24.588828+00	298	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
73	2020-01-16 10:39:24.602197+00	281	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
74	2020-01-16 10:39:24.615909+00	277	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
75	2020-01-16 10:39:24.664373+00	235	ReLOaD	2	[{"changed": {"fields": ["owner"]}}]	7	3
76	2020-01-16 10:39:24.681863+00	232	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
77	2020-01-16 10:39:24.698035+00	212	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
78	2020-01-16 10:39:24.711329+00	208	ReLOaD	2	[{"changed": {"fields": ["owner"]}}]	7	3
79	2020-01-16 10:39:24.725993+00	194	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
80	2020-01-16 10:39:24.739515+00	187	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
81	2020-01-16 10:39:24.752873+00	179	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
82	2020-01-16 10:39:24.771044+00	151	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
83	2020-01-16 10:39:24.784828+00	142	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
84	2020-01-16 10:39:24.79989+00	125	ReLOaD	2	[{"changed": {"fields": ["owner"]}}]	7	3
85	2020-01-16 10:39:24.813759+00	122	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
86	2020-01-16 10:39:24.827344+00	103	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
87	2020-01-16 10:39:24.856566+00	101	ReLOaD	2	[{"changed": {"fields": ["owner"]}}]	7	3
88	2020-01-16 10:39:24.870381+00	62	ReLOaD	2	[{"changed": {"fields": ["owner"]}}]	7	3
89	2020-01-16 10:39:24.883768+00	3	Enhancement of Municipal Audit for Accountability and Efficiency in Public Finance Management	2	[{"changed": {"fields": ["owner"]}}]	7	3
90	2020-01-23 17:45:46.101611+00	311	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
91	2020-01-23 17:45:46.128327+00	308	BIOMASS	2	[{"changed": {"fields": ["owner"]}}]	7	4
92	2020-01-23 17:45:46.141683+00	305	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
93	2020-01-23 17:45:46.155036+00	304	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
94	2020-01-23 17:45:46.191115+00	303	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
95	2020-01-23 17:45:46.207205+00	302	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
96	2020-01-23 17:45:46.23198+00	301	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
97	2020-01-23 17:45:46.247793+00	299	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
98	2020-01-23 17:45:46.264027+00	296	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
99	2020-01-23 17:45:46.280678+00	292	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
100	2020-01-23 17:45:46.298364+00	288	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
101	2020-01-23 17:45:46.31287+00	286	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
102	2020-01-23 17:45:46.326934+00	285	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
103	2020-01-23 17:45:46.340985+00	284	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
104	2020-01-23 17:45:46.35468+00	283	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
105	2020-01-23 17:45:46.369653+00	282	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
106	2020-01-23 17:45:46.382784+00	279	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
107	2020-01-23 17:45:46.400578+00	278	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
108	2020-01-23 17:45:46.413813+00	274	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
109	2020-01-23 17:45:46.427337+00	273	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
110	2020-01-23 17:49:37.654268+00	272	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
111	2020-01-23 17:49:37.671071+00	271	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
112	2020-01-23 17:49:37.684487+00	270	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
113	2020-01-23 17:49:37.697906+00	266	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
114	2020-01-23 17:49:37.713218+00	265	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
115	2020-01-23 17:49:37.756408+00	264	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
116	2020-01-23 17:49:37.77295+00	263	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
117	2020-01-23 17:49:37.786299+00	262	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
118	2020-01-23 17:49:37.799968+00	259	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
119	2020-01-23 17:49:37.815433+00	258	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
120	2020-01-23 17:49:37.849182+00	257	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
121	2020-01-23 17:49:37.86307+00	256	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
122	2020-01-23 17:49:37.876331+00	255	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
123	2020-01-23 17:49:37.889634+00	254		2	[{"changed": {"fields": ["owner"]}}]	7	4
124	2020-01-23 17:49:37.90498+00	251	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
125	2020-01-23 17:49:37.919757+00	250	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
126	2020-01-23 17:49:37.937565+00	248	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
127	2020-01-23 17:49:37.950893+00	247	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
128	2020-01-23 17:49:37.964086+00	245	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
129	2020-01-23 17:49:37.9801+00	244	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
130	2020-01-23 17:49:38.005297+00	243	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
131	2020-01-23 17:49:38.019196+00	242	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
132	2020-01-23 17:49:38.032378+00	241	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
133	2020-01-23 17:49:38.050107+00	240	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
134	2020-01-23 17:49:38.065646+00	239	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
135	2020-01-23 17:49:38.079073+00	238	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
136	2020-01-23 17:49:38.092496+00	237	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
137	2020-01-23 17:49:38.105757+00	236	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
138	2020-01-23 17:49:38.124968+00	233	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
139	2020-01-23 17:49:38.14064+00	230	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
140	2020-01-23 17:49:38.153953+00	229	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
141	2020-01-23 17:49:38.167721+00	220	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
142	2020-01-23 17:49:38.181586+00	219	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
143	2020-01-23 17:49:38.194864+00	218	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
144	2020-01-23 17:49:38.210391+00	217	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
145	2020-01-23 17:49:38.223575+00	216	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
146	2020-01-23 17:49:38.237058+00	215	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
147	2020-01-23 17:49:38.250416+00	214	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
148	2020-01-23 17:49:38.264033+00	213	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
149	2020-01-23 17:49:38.285728+00	211	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
150	2020-01-23 17:49:38.30102+00	210	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
151	2020-01-23 17:49:38.315098+00	209	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
152	2020-01-23 17:49:38.371791+00	207	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
153	2020-01-23 17:49:38.418956+00	205	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
154	2020-01-23 17:49:38.434332+00	203	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
155	2020-01-23 17:49:38.448396+00	202	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
156	2020-01-23 17:49:38.465559+00	201	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
157	2020-01-23 17:49:38.478693+00	200	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
158	2020-01-23 17:49:38.496877+00	197	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
159	2020-01-23 17:49:38.52102+00	196	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
160	2020-01-23 17:49:38.535521+00	195	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
161	2020-01-23 17:49:38.550181+00	188	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
162	2020-01-23 17:49:38.582706+00	178	Blockchain Based Remittances in the City of Nis	2	[{"changed": {"fields": ["owner"]}}]	7	4
163	2020-01-23 17:53:49.526749+00	169	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
164	2020-01-23 17:53:49.560165+00	168	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
165	2020-01-23 17:53:49.573793+00	164	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
166	2020-01-23 17:53:49.595378+00	160	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
167	2020-01-23 17:53:49.614488+00	159	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
168	2020-01-23 17:53:49.63+00	158	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
169	2020-01-23 17:53:49.643466+00	154	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
170	2020-01-23 17:53:49.657317+00	153	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
171	2020-01-23 17:53:49.670653+00	152	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
172	2020-01-23 17:53:49.683828+00	150	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
173	2020-01-23 17:53:49.700412+00	149	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
174	2020-01-23 17:53:49.713724+00	148	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
175	2020-01-23 17:53:49.727049+00	147	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
176	2020-01-23 17:53:49.740765+00	146	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
177	2020-01-23 17:53:49.770176+00	145	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
178	2020-01-23 17:53:49.785791+00	144	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
179	2020-01-23 17:53:49.822237+00	138	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
180	2020-01-23 17:53:49.835943+00	134	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
181	2020-01-23 17:53:49.849811+00	133	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
182	2020-01-23 17:53:49.863457+00	132	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
183	2020-01-23 17:53:49.894528+00	130	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
184	2020-01-23 17:53:49.907831+00	128	Open Communities - Successful Communities 	2	[{"changed": {"fields": ["owner"]}}]	7	4
185	2020-01-23 17:53:49.921421+00	127	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
186	2020-01-23 17:53:49.934841+00	126	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
187	2020-01-23 17:53:49.948956+00	121	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
188	2020-01-23 17:53:49.965247+00	120	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
189	2020-01-23 17:53:49.97882+00	117	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
190	2020-01-23 17:53:49.992212+00	116	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
191	2020-01-23 17:53:50.005443+00	115	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
192	2020-01-23 17:53:50.032833+00	114	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
193	2020-01-23 17:53:50.048846+00	113	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
194	2020-01-23 17:53:50.06277+00	112	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
195	2020-01-23 17:53:50.092846+00	111	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
196	2020-01-23 17:53:50.10647+00	110	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
197	2020-01-23 17:53:50.120083+00	109	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
198	2020-01-23 17:53:50.133658+00	108	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
199	2020-01-23 17:53:50.149929+00	107	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
200	2020-01-23 17:53:50.163301+00	106	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
201	2020-01-23 17:53:50.18706+00	102	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
202	2020-01-23 17:53:50.20151+00	96	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
203	2020-01-23 17:53:50.217116+00	95	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
204	2020-01-23 17:53:50.230885+00	93	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
205	2020-01-23 17:53:50.244167+00	92	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
206	2020-01-23 17:53:50.257511+00	91	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
207	2020-01-23 17:53:50.281474+00	90	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
208	2020-01-23 17:53:50.304012+00	89	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
209	2020-01-23 17:53:50.321085+00	88	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
210	2020-01-23 17:53:50.35646+00	87	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
211	2020-01-23 17:53:50.384301+00	86	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
212	2020-01-23 17:53:50.408905+00	80	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
213	2020-01-23 17:53:50.433091+00	79	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
214	2020-01-23 17:53:50.447341+00	78	Increased Resilience to Respond to Emergency Situations	2	[{"changed": {"fields": ["owner"]}}]	7	4
215	2020-01-23 17:53:50.460731+00	77	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
216	2020-01-23 17:53:50.474578+00	76	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
217	2020-01-23 17:53:50.487816+00	74	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
218	2020-01-23 17:53:50.503191+00	73	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
219	2020-01-23 17:56:44.926161+00	72	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
220	2020-01-23 17:56:45.001543+00	71	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
221	2020-01-23 17:56:45.019168+00	70	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
222	2020-01-23 17:56:45.035088+00	69	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
223	2020-01-23 17:56:45.04884+00	68	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
224	2020-01-23 17:56:45.066702+00	67	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
225	2020-01-23 17:56:45.090884+00	61	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
226	2020-01-23 17:56:45.104354+00	60	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
227	2020-01-23 17:56:45.120191+00	59	CSUD	2	[{"changed": {"fields": ["owner"]}}]	7	4
228	2020-01-23 17:56:45.133762+00	58	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
229	2020-01-23 17:56:45.14761+00	52	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
230	2020-01-23 17:56:45.161087+00	51	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
231	2020-01-23 17:56:45.174442+00	50	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
232	2020-01-23 17:56:45.189772+00	49	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
233	2020-01-23 17:56:45.20587+00	47	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
234	2020-01-23 17:56:45.219211+00	46	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
235	2020-01-23 17:56:45.233299+00	45	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
236	2020-01-23 17:56:45.246638+00	44	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
237	2020-01-23 17:56:45.262314+00	43	Enhancing Local resilience to the Migration Crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
238	2020-01-23 17:56:45.275898+00	42	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
239	2020-01-23 17:56:45.290386+00	32	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
240	2020-01-23 17:56:45.30367+00	31	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
241	2020-01-23 17:56:45.332192+00	30	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
242	2020-01-23 17:56:45.345875+00	25	strenghtening local resilience	2	[{"changed": {"fields": ["owner"]}}]	7	4
243	2020-01-23 17:56:45.361292+00	24	strenghtening local resilience	2	[{"changed": {"fields": ["owner"]}}]	7	4
244	2020-01-23 17:56:45.374554+00	23	Strengthening local resilience in Serbia: Mitigating the impact of the migration crisis	2	[{"changed": {"fields": ["owner"]}}]	7	4
245	2020-01-23 17:56:45.388249+00	22	Open Communities-Successful Communities	2	[{"changed": {"fields": ["owner"]}}]	7	4
246	2020-01-23 17:56:45.417135+00	19	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
247	2020-01-23 17:56:45.430566+00	16	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
248	2020-01-23 17:56:45.446626+00	15	Post Floods Early Recovery 	2	[{"changed": {"fields": ["owner"]}}]	7	4
249	2020-01-23 17:56:45.459981+00	14	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
250	2020-01-23 17:56:45.47351+00	12	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
251	2020-01-23 17:56:45.486659+00	11	BIOMASS	2	[{"changed": {"fields": ["owner"]}}]	7	4
252	2020-01-23 17:56:45.499929+00	7	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
253	2020-01-23 17:56:45.515391+00	6	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
254	2020-01-23 17:56:45.529375+00	5	BIOMASS	2	[{"changed": {"fields": ["owner"]}}]	7	4
255	2020-01-23 17:56:45.542867+00	4	EMIS	2	[{"changed": {"fields": ["owner"]}}]	7	4
256	2020-01-23 17:56:45.556935+00	1	BIOMASS	2	[{"changed": {"fields": ["owner"]}}]	7	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	activities	activities
8	activities	category
9	activities	donor
10	activities	location
11	activities	sdg
12	activities	topic
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	activities	0001_initial	2019-03-14 15:08:17.386253+00
2	contenttypes	0001_initial	2019-03-14 15:08:17.443308+00
3	auth	0001_initial	2019-03-14 15:08:17.898756+00
4	admin	0001_initial	2019-03-14 15:08:18.008453+00
5	admin	0002_logentry_remove_auto_add	2019-03-14 15:08:18.040296+00
6	admin	0003_logentry_add_action_flag_choices	2019-03-14 15:08:18.071379+00
7	contenttypes	0002_remove_content_type_name	2019-03-14 15:08:18.147183+00
8	auth	0002_alter_permission_name_max_length	2019-03-14 15:08:18.187835+00
9	auth	0003_alter_user_email_max_length	2019-03-14 15:08:18.228146+00
10	auth	0004_alter_user_username_opts	2019-03-14 15:08:18.270492+00
11	auth	0005_alter_user_last_login_null	2019-03-14 15:08:18.340056+00
12	auth	0006_require_contenttypes_0002	2019-03-14 15:08:18.352712+00
13	auth	0007_alter_validators_add_error_messages	2019-03-14 15:08:18.428879+00
14	auth	0008_alter_user_username_max_length	2019-03-14 15:08:18.536555+00
15	auth	0009_alter_user_last_name_max_length	2019-03-14 15:08:18.599295+00
16	sessions	0001_initial	2019-03-14 15:08:18.739714+00
17	activities	0002_activities_owner	2019-12-16 11:36:30.410401+00
18	activities	0003_auto_20191213_1227	2019-12-16 11:36:30.775484+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l1t41cwrjm8e0k0c374qjcrrzggmh939	MWNhOTJjMGMyMTY3MDM2NzMxY2Q3NmEwZGM2YWJhZjExZWQ1ZmFhNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjVmZTQ2M2RhMDY3NzdkNjY5ZTQyYjY0NjYwNzIzZGFhMjg5ZGRmIn0=	2019-07-04 09:29:59.036062+00
ww4ftg98nl5zko7womgq17tnaaoaoak6	MWNhOTJjMGMyMTY3MDM2NzMxY2Q3NmEwZGM2YWJhZjExZWQ1ZmFhNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjVmZTQ2M2RhMDY3NzdkNjY5ZTQyYjY0NjYwNzIzZGFhMjg5ZGRmIn0=	2020-01-30 10:21:12.08862+00
k3aj2acwrm1xi0g5t5gec7ust5eyq2bk	YWY0NThmYzk1ODkxNTk0YzlkYTE1ZGM2ZjgwNzg4OTE0MmJkNzA5MDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwYTk5OGUwZjFiYzM0MTI4MmE3ZGZjYzA4NGM1Yzk3MmVlMTYwNzg3In0=	2020-02-06 09:19:55.828166+00
8p2j48f3ompnmjs5r0qvkhix0xgxurtd	NTRkY2I2N2Y3ZmVhMDNkODhkZGNiZmZhMzIzYmQwYThhYjQ4ZTI1OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5N2QzZTQxMzExNjhmMDE3ZTAwMTU2OTkwYWYxOWExYWQ3ODI0NjYyIn0=	2020-02-06 17:41:06.425955+00
\.


--
-- Name: activities_activities_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_activities_categories_id_seq', 554, true);


--
-- Name: activities_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_activities_id_seq', 372, true);


--
-- Name: activities_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_category_id_seq', 11, true);


--
-- Name: activities_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_donor_id_seq', 27, true);


--
-- Name: activities_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_location_id_seq', 137, true);


--
-- Name: activities_sdg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_sdg_id_seq', 17, true);


--
-- Name: activities_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_topic_id_seq', 10, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 256, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: activities_activities_categories activities_activities_ca_activities_id_category_i_2a1cd037_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities_categories
    ADD CONSTRAINT activities_activities_ca_activities_id_category_i_2a1cd037_uniq UNIQUE (activities_id, category_id);


--
-- Name: activities_activities_categories activities_activities_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities_categories
    ADD CONSTRAINT activities_activities_categories_pkey PRIMARY KEY (id);


--
-- Name: activities_activities activities_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activities_pkey PRIMARY KEY (id);


--
-- Name: activities_category activities_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_category
    ADD CONSTRAINT activities_category_name_key UNIQUE (name);


--
-- Name: activities_category activities_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_category
    ADD CONSTRAINT activities_category_pkey PRIMARY KEY (id);


--
-- Name: activities_donor activities_donor_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_donor
    ADD CONSTRAINT activities_donor_name_key UNIQUE (name);


--
-- Name: activities_donor activities_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_donor
    ADD CONSTRAINT activities_donor_pkey PRIMARY KEY (id);


--
-- Name: activities_location activities_location_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_location
    ADD CONSTRAINT activities_location_name_key UNIQUE (name);


--
-- Name: activities_location activities_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_location
    ADD CONSTRAINT activities_location_pkey PRIMARY KEY (id);


--
-- Name: activities_sdg activities_sdg_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_sdg
    ADD CONSTRAINT activities_sdg_name_key UNIQUE (name);


--
-- Name: activities_sdg activities_sdg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_sdg
    ADD CONSTRAINT activities_sdg_pkey PRIMARY KEY (id);


--
-- Name: activities_topic activities_topic_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_topic
    ADD CONSTRAINT activities_topic_name_key UNIQUE (name);


--
-- Name: activities_topic activities_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_topic
    ADD CONSTRAINT activities_topic_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: activities_activities_categories_activities_id_de3c4929; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_categories_activities_id_de3c4929 ON public.activities_activities_categories USING btree (activities_id);


--
-- Name: activities_activities_categories_category_id_b19b2932; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_categories_category_id_b19b2932 ON public.activities_activities_categories USING btree (category_id);


--
-- Name: activities_activities_donor_1_id_c3a2c216; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_donor_1_id_c3a2c216 ON public.activities_activities USING btree (donor_1_id);


--
-- Name: activities_activities_donor_2_id_63a7711d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_donor_2_id_63a7711d ON public.activities_activities USING btree (donor_2_id);


--
-- Name: activities_activities_donor_3_id_5803b57a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_donor_3_id_5803b57a ON public.activities_activities USING btree (donor_3_id);


--
-- Name: activities_activities_location_id_e7c311c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_location_id_e7c311c3 ON public.activities_activities USING btree (location_id);


--
-- Name: activities_activities_owner_id_38ce4f5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_owner_id_38ce4f5f ON public.activities_activities USING btree (owner_id);


--
-- Name: activities_activities_sdg_id_7f35a230; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_sdg_id_7f35a230 ON public.activities_activities USING btree (sdg_id);


--
-- Name: activities_activities_sublocation_id_7f8364fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_sublocation_id_7f8364fd ON public.activities_activities USING btree (sublocation_id);


--
-- Name: activities_activities_topic_id_c7226839; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_activities_topic_id_c7226839 ON public.activities_activities USING btree (topic_id);


--
-- Name: activities_category_name_67adfab2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_category_name_67adfab2_like ON public.activities_category USING btree (name varchar_pattern_ops);


--
-- Name: activities_donor_name_4ddffe96_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_donor_name_4ddffe96_like ON public.activities_donor USING btree (name varchar_pattern_ops);


--
-- Name: activities_location_name_e05b24f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_location_name_e05b24f8_like ON public.activities_location USING btree (name varchar_pattern_ops);


--
-- Name: activities_sdg_name_faa13669_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_sdg_name_faa13669_like ON public.activities_sdg USING btree (name varchar_pattern_ops);


--
-- Name: activities_topic_name_2f162436_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activities_topic_name_2f162436_like ON public.activities_topic USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: activities_activities_categories activities_activitie_activities_id_de3c4929_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities_categories
    ADD CONSTRAINT activities_activitie_activities_id_de3c4929_fk_activitie FOREIGN KEY (activities_id) REFERENCES public.activities_activities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities_categories activities_activitie_category_id_b19b2932_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities_categories
    ADD CONSTRAINT activities_activitie_category_id_b19b2932_fk_activitie FOREIGN KEY (category_id) REFERENCES public.activities_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activitie_donor_1_id_c3a2c216_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activitie_donor_1_id_c3a2c216_fk_activitie FOREIGN KEY (donor_1_id) REFERENCES public.activities_donor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activitie_donor_2_id_63a7711d_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activitie_donor_2_id_63a7711d_fk_activitie FOREIGN KEY (donor_2_id) REFERENCES public.activities_donor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activitie_donor_3_id_5803b57a_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activitie_donor_3_id_5803b57a_fk_activitie FOREIGN KEY (donor_3_id) REFERENCES public.activities_donor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activitie_location_id_e7c311c3_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activitie_location_id_e7c311c3_fk_activitie FOREIGN KEY (location_id) REFERENCES public.activities_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activitie_sublocation_id_7f8364fd_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activitie_sublocation_id_7f8364fd_fk_activitie FOREIGN KEY (sublocation_id) REFERENCES public.activities_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activities_owner_id_38ce4f5f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activities_owner_id_38ce4f5f_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activities_sdg_id_7f35a230_fk_activities_sdg_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activities_sdg_id_7f35a230_fk_activities_sdg_id FOREIGN KEY (sdg_id) REFERENCES public.activities_sdg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_activities activities_activities_topic_id_c7226839_fk_activities_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_activities
    ADD CONSTRAINT activities_activities_topic_id_c7226839_fk_activities_topic_id FOREIGN KEY (topic_id) REFERENCES public.activities_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

