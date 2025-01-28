--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

ALTER TABLE IF EXISTS ONLY "public"."django_admin_log" DROP CONSTRAINT IF EXISTS "django_admin_log_user_id_c564eba6_fk_auth_user_id";
ALTER TABLE IF EXISTS ONLY "public"."django_admin_log" DROP CONSTRAINT IF EXISTS "django_admin_log_content_type_id_c4bce8eb_fk_django_co";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT IF EXISTS "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT IF EXISTS "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_groups" DROP CONSTRAINT IF EXISTS "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_groups" DROP CONSTRAINT IF EXISTS "auth_user_groups_group_id_97559544_fk_auth_group_id";
ALTER TABLE IF EXISTS ONLY "public"."auth_permission" DROP CONSTRAINT IF EXISTS "auth_permission_content_type_id_2f476e4b_fk_django_co";
ALTER TABLE IF EXISTS ONLY "public"."auth_group_permissions" DROP CONSTRAINT IF EXISTS "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id";
ALTER TABLE IF EXISTS ONLY "public"."auth_group_permissions" DROP CONSTRAINT IF EXISTS "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_patient_id_b2db55d3_fk_patients_id";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_doctor_id_96635781_fk_doctors_id";
DROP INDEX IF EXISTS "public"."django_session_session_key_c0390e0f_like";
DROP INDEX IF EXISTS "public"."django_session_expire_date_a5c62663";
DROP INDEX IF EXISTS "public"."django_admin_log_user_id_c564eba6";
DROP INDEX IF EXISTS "public"."django_admin_log_content_type_id_c4bce8eb";
DROP INDEX IF EXISTS "public"."auth_user_username_6821ab7c_like";
DROP INDEX IF EXISTS "public"."auth_user_user_permissions_user_id_a95ead1b";
DROP INDEX IF EXISTS "public"."auth_user_user_permissions_permission_id_1fbb5f2c";
DROP INDEX IF EXISTS "public"."auth_user_groups_user_id_6a12ed8b";
DROP INDEX IF EXISTS "public"."auth_user_groups_group_id_97559544";
DROP INDEX IF EXISTS "public"."auth_permission_content_type_id_2f476e4b";
DROP INDEX IF EXISTS "public"."auth_group_permissions_permission_id_84c5c92e";
DROP INDEX IF EXISTS "public"."auth_group_permissions_group_id_b120cbf9";
DROP INDEX IF EXISTS "public"."auth_group_name_a6ea08ec_like";
DROP INDEX IF EXISTS "public"."appointments_patient_id_b2db55d3";
DROP INDEX IF EXISTS "public"."appointments_doctor_id_96635781";
ALTER TABLE IF EXISTS ONLY "public"."patients" DROP CONSTRAINT IF EXISTS "patients_pkey";
ALTER TABLE IF EXISTS ONLY "public"."doctors" DROP CONSTRAINT IF EXISTS "doctors_pkey";
ALTER TABLE IF EXISTS ONLY "public"."django_session" DROP CONSTRAINT IF EXISTS "django_session_pkey";
ALTER TABLE IF EXISTS ONLY "public"."django_migrations" DROP CONSTRAINT IF EXISTS "django_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "public"."django_content_type" DROP CONSTRAINT IF EXISTS "django_content_type_pkey";
ALTER TABLE IF EXISTS ONLY "public"."django_content_type" DROP CONSTRAINT IF EXISTS "django_content_type_app_label_model_76bd3d3b_uniq";
ALTER TABLE IF EXISTS ONLY "public"."django_admin_log" DROP CONSTRAINT IF EXISTS "django_admin_log_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_user" DROP CONSTRAINT IF EXISTS "auth_user_username_key";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT IF EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_user_permissions" DROP CONSTRAINT IF EXISTS "auth_user_user_permissions_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_user" DROP CONSTRAINT IF EXISTS "auth_user_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_groups" DROP CONSTRAINT IF EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq";
ALTER TABLE IF EXISTS ONLY "public"."auth_user_groups" DROP CONSTRAINT IF EXISTS "auth_user_groups_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_permission" DROP CONSTRAINT IF EXISTS "auth_permission_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_permission" DROP CONSTRAINT IF EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq";
ALTER TABLE IF EXISTS ONLY "public"."auth_group" DROP CONSTRAINT IF EXISTS "auth_group_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_group_permissions" DROP CONSTRAINT IF EXISTS "auth_group_permissions_pkey";
ALTER TABLE IF EXISTS ONLY "public"."auth_group_permissions" DROP CONSTRAINT IF EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
ALTER TABLE IF EXISTS ONLY "public"."auth_group" DROP CONSTRAINT IF EXISTS "auth_group_name_key";
ALTER TABLE IF EXISTS ONLY "public"."appointments" DROP CONSTRAINT IF EXISTS "appointments_pkey";
DROP TABLE IF EXISTS "public"."patients";
DROP TABLE IF EXISTS "public"."doctors";
DROP TABLE IF EXISTS "public"."django_session";
DROP TABLE IF EXISTS "public"."django_migrations";
DROP TABLE IF EXISTS "public"."django_content_type";
DROP TABLE IF EXISTS "public"."django_admin_log";
DROP TABLE IF EXISTS "public"."auth_user_user_permissions";
DROP TABLE IF EXISTS "public"."auth_user_groups";
DROP TABLE IF EXISTS "public"."auth_user";
DROP TABLE IF EXISTS "public"."auth_permission";
DROP TABLE IF EXISTS "public"."auth_group_permissions";
DROP TABLE IF EXISTS "public"."auth_group";
DROP TABLE IF EXISTS "public"."appointments";
--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: appointments; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."appointments" (
    "id" bigint NOT NULL,
    "description" "text" NOT NULL,
    "appointment_date" "date" NOT NULL,
    "start_time" time without time zone NOT NULL,
    "end_time" time without time zone NOT NULL,
    "doctor_id" bigint NOT NULL,
    "patient_id" bigint NOT NULL
);


ALTER TABLE "public"."appointments" OWNER TO "james";

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."appointments" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."appointments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_group" (
    "id" integer NOT NULL,
    "name" character varying(150) NOT NULL
);


ALTER TABLE "public"."auth_group" OWNER TO "james";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_group" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_group_permissions" (
    "id" bigint NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "public"."auth_group_permissions" OWNER TO "james";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_group_permissions" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_group_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);


ALTER TABLE "public"."auth_permission" OWNER TO "james";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_permission" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_permission_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_user" (
    "id" integer NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamp with time zone,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamp with time zone NOT NULL
);


ALTER TABLE "public"."auth_user" OWNER TO "james";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_user_groups" (
    "id" bigint NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL
);


ALTER TABLE "public"."auth_user_groups" OWNER TO "james";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_user_groups" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_user_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_user" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" bigint NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


ALTER TABLE "public"."auth_user_user_permissions" OWNER TO "james";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."auth_user_user_permissions" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auth_user_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);


ALTER TABLE "public"."django_admin_log" OWNER TO "james";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."django_admin_log" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."django_admin_log_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);


ALTER TABLE "public"."django_content_type" OWNER TO "james";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."django_content_type" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."django_content_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."django_migrations" (
    "id" bigint NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);


ALTER TABLE "public"."django_migrations" OWNER TO "james";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."django_migrations" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."django_migrations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);


ALTER TABLE "public"."django_session" OWNER TO "james";

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."doctors" (
    "id" bigint NOT NULL,
    "first_name" character varying(100) NOT NULL,
    "last_name" character varying(100) NOT NULL,
    "specialty" "text" NOT NULL
);


ALTER TABLE "public"."doctors" OWNER TO "james";

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."doctors" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."doctors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: james
--

CREATE TABLE "public"."patients" (
    "id" bigint NOT NULL,
    "first_name" character varying(100) NOT NULL,
    "last_name" character varying(100) NOT NULL,
    "gender" character varying(100) NOT NULL,
    "date_of_birth" "date" NOT NULL,
    "diagnosis" character varying NOT NULL
);


ALTER TABLE "public"."patients" OWNER TO "james";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: james
--

ALTER TABLE "public"."patients" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."patients_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."appointments" ("id", "description", "appointment_date", "start_time", "end_time", "doctor_id", "patient_id") FROM stdin;
1	The patient presents with chest pain and shortness of breath, with findings of elevated blood pressure. I recommend antihypertensive therapy and scheduling a follow-up in two weeks.	2024-12-24	09:00:00	10:00:00	1	1
2	The patient presents with right knee pain following a fall, with findings of mild swelling, tenderness over the medial joint line, and MRI-confirmed meniscal tear, and the plan includes physical therapy, and consideration of arthroscopic surgery if symptoms persist.	2025-01-06	11:00:00	12:00:00	4	2
3	The patient has fever, cough, and fatigue, with findings of positive PCR test for influenza, elevated white blood cell count, and clear chest X-ray, and the plan includes antiviral therapy, supportive care, and close monitoring for complications.	2025-01-07	13:00:00	14:00:00	3	3
4	The pathology report shows a 1.5 cm malignant tumor, with findings of no spread to surrounding tissues and clear removal margins, and the plan includes regular follow-ups and additional treatment if needed.	2025-01-15	10:00:00	11:00:00	5	4
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_group" ("id", "name") FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_group_permissions" ("id", "group_id", "permission_id") FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_permission" ("id", "name", "content_type_id", "codename") FROM stdin;
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
25	Can add doctor	7	add_doctor
26	Can change doctor	7	change_doctor
27	Can delete doctor	7	delete_doctor
28	Can view doctor	7	view_doctor
29	Can add patient	8	add_patient
30	Can change patient	8	change_patient
31	Can delete patient	8	delete_patient
32	Can view patient	8	view_patient
33	Can add appointment	9	add_appointment
34	Can change appointment	9	change_appointment
35	Can delete appointment	9	delete_appointment
36	Can view appointment	9	view_appointment
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") FROM stdin;
1	pbkdf2_sha256$870000$RyAajndpc2OiSttZS7Op9o$12eDpFwqPLcA20YYI1cunTFmdTjc1D9CatM4bGWUHO4=	2024-12-17 19:07:07.143245+03	t	james	James	Andere		t	t	2024-12-16 09:16:39+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_user_groups" ("id", "user_id", "group_id") FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."auth_user_user_permissions" ("id", "user_id", "permission_id") FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") FROM stdin;
1	2024-12-16 09:44:23.942153+03	1	james	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
2	2024-12-17 19:07:22.6559+03	1	Doctor object (1)	1	[{"added": {}}]	7	1
3	2024-12-17 19:07:33.309984+03	2	Doctor object (2)	1	[{"added": {}}]	7	1
4	2024-12-17 19:07:57.337283+03	3	Doctor object (3)	1	[{"added": {}}]	7	1
5	2024-12-17 19:08:16.708211+03	4	Doctor object (4)	1	[{"added": {}}]	7	1
6	2024-12-17 19:08:30.146217+03	5	Doctor object (5)	1	[{"added": {}}]	7	1
7	2024-12-23 20:04:38.551259+03	5	Gunturu Revathi	2	[{"changed": {"fields": ["Specialty"]}}]	7	1
8	2024-12-23 20:05:48.001033+03	6	Rajpreet Bal	1	[{"added": {}}]	7	1
9	2024-12-23 20:06:42.096045+03	2	Adina Rihab	2	[{"changed": {"fields": ["Specialty"]}}]	7	1
10	2024-12-23 20:07:56.337031+03	1	Sayed Ali	2	[{"changed": {"fields": ["Specialty"]}}]	7	1
11	2024-12-23 20:08:27.23482+03	4	Saumu Akhtar	2	[{"changed": {"fields": ["Specialty"]}}]	7	1
12	2024-12-23 20:09:15.856644+03	3	Farhana Sonawala	2	[{"changed": {"fields": ["Specialty"]}}]	7	1
13	2024-12-23 20:17:34.762715+03	1	Appointment object (1)	2	[{"changed": {"fields": ["Description"]}}]	9	1
14	2024-12-23 20:17:58.862519+03	1	Appointment object (1)	2	[{"changed": {"fields": ["Description"]}}]	9	1
15	2024-12-23 20:27:40.311621+03	2	Appointment object (2)	1	[{"added": {}}]	9	1
16	2024-12-23 20:42:51.870847+03	3	Appointment object (3)	1	[{"added": {}}]	9	1
17	2024-12-23 20:45:23.576259+03	4	Appointment object (4)	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."django_content_type" ("id", "app_label", "model") FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	doctor
8	api	patient
9	api	appointment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."django_migrations" ("id", "app", "name", "applied") FROM stdin;
1	contenttypes	0001_initial	2024-12-16 09:15:58.514835+03
2	auth	0001_initial	2024-12-16 09:15:59.74871+03
3	admin	0001_initial	2024-12-16 09:15:59.954546+03
4	admin	0002_logentry_remove_auto_add	2024-12-16 09:15:59.962542+03
5	admin	0003_logentry_add_action_flag_choices	2024-12-16 09:15:59.975535+03
6	contenttypes	0002_remove_content_type_name	2024-12-16 09:15:59.99852+03
7	auth	0002_alter_permission_name_max_length	2024-12-16 09:16:00.010515+03
8	auth	0003_alter_user_email_max_length	2024-12-16 09:16:00.024507+03
9	auth	0004_alter_user_username_opts	2024-12-16 09:16:00.0355+03
10	auth	0005_alter_user_last_login_null	2024-12-16 09:16:00.046805+03
11	auth	0006_require_contenttypes_0002	2024-12-16 09:16:00.048805+03
12	auth	0007_alter_validators_add_error_messages	2024-12-16 09:16:00.061798+03
13	auth	0008_alter_user_username_max_length	2024-12-16 09:16:00.14281+03
14	auth	0009_alter_user_last_name_max_length	2024-12-16 09:16:00.152803+03
15	auth	0010_alter_group_name_max_length	2024-12-16 09:16:00.165797+03
16	auth	0011_update_proxy_permissions	2024-12-16 09:16:00.173794+03
17	auth	0012_alter_user_first_name_max_length	2024-12-16 09:16:00.186385+03
18	sessions	0001_initial	2024-12-16 09:16:00.480046+03
19	api	0001_initial	2024-12-17 19:00:43.302338+03
20	api	0002_doctor_specialty	2024-12-19 20:21:39.558046+03
21	api	0003_patient_alter_doctor_options_remove_doctor_created_and_more	2024-12-23 19:12:10.018469+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."django_session" ("session_key", "session_data", "expire_date") FROM stdin;
bf2xda5fj8wf9rz3ysb3pko5ue2ryg2l	.eJxVjDsOwjAQBe_iGlneXeIPJT1nsPxZ4wBypDipEHcnkVJA-2bevIUP61L92nn2YxYXAeL0u8WQntx2kB-h3SeZprbMY5S7Ig_a5W3K_Loe7l-ghl63t2FjWTMBQgAqSgEiales1bFANCpTMEbz4AYGk-lMsMWjQmchoSPx-QK-Zzbb:1tN4Pj:7bj-tAyRJ5ypne_vD2EQ1lyZ13fhis30PsLhAgWF6yY	2024-12-30 09:17:07.678836+03
abw521b780bn1gux7qpqg07fk77dpgo5	.eJxVjDsOwjAQBe_iGlneXeIPJT1nsPxZ4wBypDipEHcnkVJA-2bevIUP61L92nn2YxYXAeL0u8WQntx2kB-h3SeZprbMY5S7Ig_a5W3K_Loe7l-ghl63t2FjWTMBQgAqSgEiales1bFANCpTMEbz4AYGk-lMsMWjQmchoSPx-QK-Zzbb:1tNa6F:pg-9c9TKNcKOlvaZ54OF4ZU1iPbV40O2O9CXr9hDfqc	2024-12-31 19:07:07.302327+03
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."doctors" ("id", "first_name", "last_name", "specialty") FROM stdin;
5	Gunturu	Revathi	Pathology
6	Rajpreet	Bal	Anaesthesia & Pain Management
2	Adina	Rihab	Paediatrician
1	Sayed	Ali	Cardiologist
4	Saumu	Akhtar	Orthopaedic Surgery
3	Farhana	Sonawala	Infectious Diseases
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: james
--

COPY "public"."patients" ("id", "first_name", "last_name", "gender", "date_of_birth", "diagnosis") FROM stdin;
1	Lisa	Oduor	Female	1994-04-18	
2	Mercy	Mwende	Female	1996-08-31	
3	Austin	Otieno	Male	1994-02-18	
4	Roy	Oloo	Male	1994-05-13	
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."appointments_id_seq"', 4, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_group_id_seq"', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_group_permissions_id_seq"', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_permission_id_seq"', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_user_groups_id_seq"', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_user_id_seq"', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."auth_user_user_permissions_id_seq"', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."django_admin_log_id_seq"', 17, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."django_content_type_id_seq"', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."django_migrations_id_seq"', 21, true);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."doctors_id_seq"', 6, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: james
--

SELECT pg_catalog.setval('"public"."patients_id_seq"', 4, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_pkey" PRIMARY KEY ("id");


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name");


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id");


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id");


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id");


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename");


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id");


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id");


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user"
    ADD CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id");


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id");


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id");


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user"
    ADD CONSTRAINT "auth_user_username_key" UNIQUE ("username");


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model");


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."doctors"
    ADD CONSTRAINT "doctors_pkey" PRIMARY KEY ("id");


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."patients"
    ADD CONSTRAINT "patients_pkey" PRIMARY KEY ("id");


--
-- Name: appointments_doctor_id_96635781; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "appointments_doctor_id_96635781" ON "public"."appointments" USING "btree" ("doctor_id");


--
-- Name: appointments_patient_id_b2db55d3; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "appointments_patient_id_b2db55d3" ON "public"."appointments" USING "btree" ("patient_id");


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING "btree" ("name" "varchar_pattern_ops");


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING "btree" ("group_id");


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING "btree" ("permission_id");


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING "btree" ("content_type_id");


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING "btree" ("group_id");


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING "btree" ("user_id");


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING "btree" ("permission_id");


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING "btree" ("user_id");


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING "btree" ("username" "varchar_pattern_ops");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING "btree" ("content_type_id");


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING "btree" ("user_id");


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING "btree" ("expire_date");


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: james
--

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING "btree" ("session_key" "varchar_pattern_ops");


--
-- Name: appointments appointments_doctor_id_96635781_fk_doctors_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_doctor_id_96635781_fk_doctors_id" FOREIGN KEY ("doctor_id") REFERENCES "public"."doctors"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: appointments appointments_patient_id_b2db55d3_fk_patients_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."appointments"
    ADD CONSTRAINT "appointments_patient_id_b2db55d3_fk_patients_id" FOREIGN KEY ("patient_id") REFERENCES "public"."patients"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_groups"
    ADD CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."auth_user_user_permissions"
    ADD CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: james
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

