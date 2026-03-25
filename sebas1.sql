--
-- PostgreSQL database dump
--

\restrict Mf6zBGKt4dIXEGlvnyfzBcDTk43L4sXg9OmhmRBbanioZYP0w3lZadO9b7uWjho

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-25 14:41:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 890 (class 1247 OID 16880)
-- Name: order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status AS ENUM (
    'PENDIENTE',
    'EN_PREPARACION',
    'LISTO',
    'EN_CAMINO',
    'ENTREGADO',
    'CANCELADO'
);


ALTER TYPE public.order_status OWNER TO postgres;

--
-- TOC entry 887 (class 1247 OID 16869)
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'ADMIN',
    'CLIENTE',
    'COCINA',
    'DOMICILIARIO',
    'MESERO'
);


ALTER TYPE public.user_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 17055)
-- Name: access_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_logs (
    id integer NOT NULL,
    user_id integer,
    camera_id integer,
    access_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50),
    confidence double precision
);


ALTER TABLE public.access_logs OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17054)
-- Name: access_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.access_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 237
-- Name: access_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_logs_id_seq OWNED BY public.access_logs.id;


--
-- TOC entry 254 (class 1259 OID 17176)
-- Name: asistencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencias (
    id_asistencia integer NOT NULL,
    id_estudiante_materia integer,
    fecha date,
    asistio boolean
);


ALTER TABLE public.asistencias OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17175)
-- Name: asistencias_id_asistencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asistencias_id_asistencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asistencias_id_asistencia_seq OWNER TO postgres;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 253
-- Name: asistencias_id_asistencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencias_id_asistencia_seq OWNED BY public.asistencias.id_asistencia;


--
-- TOC entry 236 (class 1259 OID 17046)
-- Name: cameras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cameras (
    id integer NOT NULL,
    name character varying(100),
    location character varying(150),
    ip_address character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cameras OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17045)
-- Name: cameras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cameras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cameras_id_seq OWNER TO postgres;

--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 235
-- Name: cameras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cameras_id_seq OWNED BY public.cameras.id;


--
-- TOC entry 226 (class 1259 OID 16950)
-- Name: detalle_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedido (
    id integer NOT NULL,
    pedido_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT detalle_pedido_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.detalle_pedido OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16949)
-- Name: detalle_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_pedido_id_seq OWNED BY public.detalle_pedido.id;


--
-- TOC entry 250 (class 1259 OID 17140)
-- Name: estudiante_materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante_materia (
    id_estudiante_materia integer NOT NULL,
    id_estudiante integer,
    id_materia integer,
    id_semestre integer
);


ALTER TABLE public.estudiante_materia OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17139)
-- Name: estudiante_materia_id_estudiante_materia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_materia_id_estudiante_materia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_materia_id_estudiante_materia_seq OWNER TO postgres;

--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 249
-- Name: estudiante_materia_id_estudiante_materia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_materia_id_estudiante_materia_seq OWNED BY public.estudiante_materia.id_estudiante_materia;


--
-- TOC entry 248 (class 1259 OID 17122)
-- Name: estudiante_semestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante_semestre (
    id_estudiante_semestre integer NOT NULL,
    id_estudiante integer,
    id_semestre integer
);


ALTER TABLE public.estudiante_semestre OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17121)
-- Name: estudiante_semestre_id_estudiante_semestre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_semestre_id_estudiante_semestre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_semestre_id_estudiante_semestre_seq OWNER TO postgres;

--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 247
-- Name: estudiante_semestre_id_estudiante_semestre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_semestre_id_estudiante_semestre_seq OWNED BY public.estudiante_semestre.id_estudiante_semestre;


--
-- TOC entry 242 (class 1259 OID 17092)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    correo character varying(150),
    fecha_nacimiento date
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17091)
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNER TO postgres;

--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 241
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;


--
-- TOC entry 234 (class 1259 OID 17030)
-- Name: face_embeddings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_embeddings (
    id integer NOT NULL,
    user_id integer,
    embedding_vector double precision[],
    image_path text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.face_embeddings OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17029)
-- Name: face_embeddings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_embeddings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.face_embeddings_id_seq OWNER TO postgres;

--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 233
-- Name: face_embeddings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_embeddings_id_seq OWNED BY public.face_embeddings.id;


--
-- TOC entry 240 (class 1259 OID 17074)
-- Name: face_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_images (
    id integer NOT NULL,
    user_id integer,
    image_path text NOT NULL,
    captured_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.face_images OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17073)
-- Name: face_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.face_images_id_seq OWNER TO postgres;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 239
-- Name: face_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_images_id_seq OWNED BY public.face_images.id;


--
-- TOC entry 246 (class 1259 OID 17113)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    id_materia integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos integer
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17112)
-- Name: materias_id_materia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_id_materia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materias_id_materia_seq OWNER TO postgres;

--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 245
-- Name: materias_id_materia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_id_materia_seq OWNED BY public.materias.id_materia;


--
-- TOC entry 252 (class 1259 OID 17163)
-- Name: notas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas (
    id_nota integer NOT NULL,
    id_estudiante_materia integer,
    nota numeric(5,2),
    tipo character varying(50)
);


ALTER TABLE public.notas OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17162)
-- Name: notas_id_nota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_id_nota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_id_nota_seq OWNER TO postgres;

--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 251
-- Name: notas_id_nota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_id_nota_seq OWNED BY public.notas.id_nota;


--
-- TOC entry 224 (class 1259 OID 16927)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    domiciliario_id integer,
    estado public.order_status DEFAULT 'PENDIENTE'::public.order_status,
    total numeric(10,2) NOT NULL,
    token_entrega character varying(10),
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pedido_total_check CHECK ((total >= (0)::numeric))
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16926)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedido_id_seq OWNER TO postgres;

--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 223
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 222 (class 1259 OID 16912)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    imagen_url text,
    disponible boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT producto_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16911)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 230 (class 1259 OID 16995)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16994)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 229
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 244 (class 1259 OID 17104)
-- Name: semestres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semestres (
    id_semestre integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fecha_inicio date,
    fecha_fin date
);


ALTER TABLE public.semestres OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17103)
-- Name: semestres_id_semestre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semestres_id_semestre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semestres_id_semestre_seq OWNER TO postgres;

--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 243
-- Name: semestres_id_semestre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semestres_id_semestre_seq OWNED BY public.semestres.id_semestre;


--
-- TOC entry 228 (class 1259 OID 16972)
-- Name: ubicacion_domiciliario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion_domiciliario (
    id integer NOT NULL,
    domiciliario_id integer NOT NULL,
    latitud numeric(9,6) NOT NULL,
    longitud numeric(9,6) NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ubicacion_domiciliario OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16971)
-- Name: ubicacion_domiciliario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubicacion_domiciliario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ubicacion_domiciliario_id_seq OWNER TO postgres;

--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 227
-- Name: ubicacion_domiciliario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ubicacion_domiciliario_id_seq OWNED BY public.ubicacion_domiciliario.id;


--
-- TOC entry 232 (class 1259 OID 17008)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role_id integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17007)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 220 (class 1259 OID 16894)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    rol public.user_role NOT NULL,
    activo boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16893)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4967 (class 2604 OID 17058)
-- Name: access_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_logs ALTER COLUMN id SET DEFAULT nextval('public.access_logs_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 17179)
-- Name: asistencias id_asistencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias ALTER COLUMN id_asistencia SET DEFAULT nextval('public.asistencias_id_asistencia_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 17049)
-- Name: cameras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras ALTER COLUMN id SET DEFAULT nextval('public.cameras_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 16953)
-- Name: detalle_pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido ALTER COLUMN id SET DEFAULT nextval('public.detalle_pedido_id_seq'::regclass);


--
-- TOC entry 4975 (class 2604 OID 17143)
-- Name: estudiante_materia id_estudiante_materia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_materia ALTER COLUMN id_estudiante_materia SET DEFAULT nextval('public.estudiante_materia_id_estudiante_materia_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 17125)
-- Name: estudiante_semestre id_estudiante_semestre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_semestre ALTER COLUMN id_estudiante_semestre SET DEFAULT nextval('public.estudiante_semestre_id_estudiante_semestre_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 17095)
-- Name: estudiantes id_estudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 17033)
-- Name: face_embeddings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_embeddings ALTER COLUMN id SET DEFAULT nextval('public.face_embeddings_id_seq'::regclass);


--
-- TOC entry 4969 (class 2604 OID 17077)
-- Name: face_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_images ALTER COLUMN id SET DEFAULT nextval('public.face_images_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 17116)
-- Name: materias id_materia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias ALTER COLUMN id_materia SET DEFAULT nextval('public.materias_id_materia_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 17166)
-- Name: notas id_nota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas ALTER COLUMN id_nota SET DEFAULT nextval('public.notas_id_nota_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 16930)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 16915)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 16998)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 17107)
-- Name: semestres id_semestre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestres ALTER COLUMN id_semestre SET DEFAULT nextval('public.semestres_id_semestre_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 16975)
-- Name: ubicacion_domiciliario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_domiciliario ALTER COLUMN id SET DEFAULT nextval('public.ubicacion_domiciliario_id_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 17011)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 16897)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 5212 (class 0 OID 17055)
-- Dependencies: 238
-- Data for Name: access_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_logs (id, user_id, camera_id, access_time, status, confidence) FROM stdin;
\.


--
-- TOC entry 5228 (class 0 OID 17176)
-- Dependencies: 254
-- Data for Name: asistencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asistencias (id_asistencia, id_estudiante_materia, fecha, asistio) FROM stdin;
\.


--
-- TOC entry 5210 (class 0 OID 17046)
-- Dependencies: 236
-- Data for Name: cameras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cameras (id, name, location, ip_address, created_at) FROM stdin;
\.


--
-- TOC entry 5200 (class 0 OID 16950)
-- Dependencies: 226
-- Data for Name: detalle_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_pedido (id, pedido_id, producto_id, cantidad) FROM stdin;
1	1	1	1
2	1	2	1
3	1	3	1
\.


--
-- TOC entry 5224 (class 0 OID 17140)
-- Dependencies: 250
-- Data for Name: estudiante_materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante_materia (id_estudiante_materia, id_estudiante, id_materia, id_semestre) FROM stdin;
\.


--
-- TOC entry 5222 (class 0 OID 17122)
-- Dependencies: 248
-- Data for Name: estudiante_semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante_semestre (id_estudiante_semestre, id_estudiante, id_semestre) FROM stdin;
\.


--
-- TOC entry 5216 (class 0 OID 17092)
-- Dependencies: 242
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id_estudiante, nombre, apellido, correo, fecha_nacimiento) FROM stdin;
1	Juan	Perez	juan1@mail.com	2000-01-10
2	Maria	Gomez	maria2@mail.com	2001-02-12
3	Carlos	Lopez	carlos3@mail.com	1999-03-15
4	Ana	Martinez	ana4@mail.com	2000-04-20
5	Luis	Rodriguez	luis5@mail.com	2001-05-25
6	Sofia	Hernandez	sofia6@mail.com	2002-06-18
7	Pedro	Diaz	pedro7@mail.com	1998-07-22
8	Laura	Torres	laura8@mail.com	2000-08-30
9	Diego	Ramirez	diego9@mail.com	2001-09-14
10	Valentina	Cruz	valentina10@mail.com	2002-10-05
11	Andres	Vargas	andres11@mail.com	1999-11-11
12	Camila	Castro	camila12@mail.com	2000-12-09
13	Jorge	Rios	jorge13@mail.com	1998-01-17
14	Daniela	Morales	daniela14@mail.com	2001-02-28
15	Felipe	Ortiz	felipe15@mail.com	2002-03-03
16	Paula	Silva	paula16@mail.com	2000-04-07
17	Santiago	Mendez	santiago17@mail.com	1999-05-19
18	Natalia	Reyes	natalia18@mail.com	2001-06-23
19	Ricardo	Navarro	ricardo19@mail.com	2002-07-29
20	Juliana	Pardo	juliana20@mail.com	2000-08-11
\.


--
-- TOC entry 5208 (class 0 OID 17030)
-- Dependencies: 234
-- Data for Name: face_embeddings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.face_embeddings (id, user_id, embedding_vector, image_path, created_at) FROM stdin;
\.


--
-- TOC entry 5214 (class 0 OID 17074)
-- Dependencies: 240
-- Data for Name: face_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.face_images (id, user_id, image_path, captured_at) FROM stdin;
\.


--
-- TOC entry 5220 (class 0 OID 17113)
-- Dependencies: 246
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias (id_materia, nombre, creditos) FROM stdin;
1	Matematicas	3
2	Programacion	4
3	Bases de Datos	3
4	IA	3
5	Estadistica	2
6	Fisica	3
\.


--
-- TOC entry 5226 (class 0 OID 17163)
-- Dependencies: 252
-- Data for Name: notas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas (id_nota, id_estudiante_materia, nota, tipo) FROM stdin;
\.


--
-- TOC entry 5198 (class 0 OID 16927)
-- Dependencies: 224
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (id, cliente_id, domiciliario_id, estado, total, token_entrega, fecha) FROM stdin;
1	1	2	EN_PREPARACION	73000.00	\N	2026-03-03 16:39:26.985802
\.


--
-- TOC entry 5196 (class 0 OID 16912)
-- Dependencies: 222
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, descripcion, precio, imagen_url, disponible, created_at) FROM stdin;
1	Hamburguesa	Hamburguesa doble carne	25000.00	\N	t	2026-03-03 16:39:26.985802
2	Pizza	Pizza grande pepperoni	40000.00	\N	t	2026-03-03 16:39:26.985802
3	Gaseosa	Gaseosa 1.5L	8000.00	\N	t	2026-03-03 16:39:26.985802
\.


--
-- TOC entry 5204 (class 0 OID 16995)
-- Dependencies: 230
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description) FROM stdin;
1	admin	\N
2	usuario	\N
\.


--
-- TOC entry 5218 (class 0 OID 17104)
-- Dependencies: 244
-- Data for Name: semestres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semestres (id_semestre, nombre, fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- TOC entry 5202 (class 0 OID 16972)
-- Dependencies: 228
-- Data for Name: ubicacion_domiciliario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion_domiciliario (id, domiciliario_id, latitud, longitud, fecha) FROM stdin;
\.


--
-- TOC entry 5206 (class 0 OID 17008)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password_hash, role_id, active, created_at) FROM stdin;
3	Juan Perez	juan@email.com	123456	2	t	2026-03-16 11:03:44.404628
\.


--
-- TOC entry 5194 (class 0 OID 16894)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombre, email, password, rol, activo, created_at) FROM stdin;
1	Sebastian Cliente	cliente@test.com	1234	CLIENTE	t	2026-03-03 16:39:26.985802
2	Carlos Domiciliario	domi@test.com	1234	DOMICILIARIO	t	2026-03-03 16:39:26.985802
3	Laura Cocina	cocina@test.com	1234	COCINA	t	2026-03-03 16:39:26.985802
\.


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 237
-- Name: access_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_logs_id_seq', 1, false);


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 253
-- Name: asistencias_id_asistencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asistencias_id_asistencia_seq', 20, true);


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 235
-- Name: cameras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cameras_id_seq', 1, false);


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pedido_id_seq', 3, true);


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 249
-- Name: estudiante_materia_id_estudiante_materia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_materia_id_estudiante_materia_seq', 40, true);


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 247
-- Name: estudiante_semestre_id_estudiante_semestre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_semestre_id_estudiante_semestre_seq', 1, false);


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 241
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 20, true);


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 233
-- Name: face_embeddings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_embeddings_id_seq', 1, false);


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 239
-- Name: face_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_images_id_seq', 1, false);


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 245
-- Name: materias_id_materia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_id_materia_seq', 6, true);


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 251
-- Name: notas_id_nota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_id_nota_seq', 20, true);


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 223
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 1, true);


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 221
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 3, true);


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 229
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 243
-- Name: semestres_id_semestre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semestres_id_semestre_seq', 1, false);


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 227
-- Name: ubicacion_domiciliario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubicacion_domiciliario_id_seq', 1, false);


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 3, true);


--
-- TOC entry 5010 (class 2606 OID 17062)
-- Name: access_logs access_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 5028 (class 2606 OID 17182)
-- Name: asistencias asistencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_pkey PRIMARY KEY (id_asistencia);


--
-- TOC entry 5008 (class 2606 OID 17053)
-- Name: cameras cameras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 16960)
-- Name: detalle_pedido detalle_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 5024 (class 2606 OID 17146)
-- Name: estudiante_materia estudiante_materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_materia
    ADD CONSTRAINT estudiante_materia_pkey PRIMARY KEY (id_estudiante_materia);


--
-- TOC entry 5022 (class 2606 OID 17128)
-- Name: estudiante_semestre estudiante_semestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_semestre
    ADD CONSTRAINT estudiante_semestre_pkey PRIMARY KEY (id_estudiante_semestre);


--
-- TOC entry 5014 (class 2606 OID 17102)
-- Name: estudiantes estudiantes_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_correo_key UNIQUE (correo);


--
-- TOC entry 5016 (class 2606 OID 17100)
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- TOC entry 5006 (class 2606 OID 17039)
-- Name: face_embeddings face_embeddings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_embeddings
    ADD CONSTRAINT face_embeddings_pkey PRIMARY KEY (id);


--
-- TOC entry 5012 (class 2606 OID 17084)
-- Name: face_images face_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_images
    ADD CONSTRAINT face_images_pkey PRIMARY KEY (id);


--
-- TOC entry 5020 (class 2606 OID 17120)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id_materia);


--
-- TOC entry 5026 (class 2606 OID 17169)
-- Name: notas notas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas
    ADD CONSTRAINT notas_pkey PRIMARY KEY (id_nota);


--
-- TOC entry 4990 (class 2606 OID 16938)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 2606 OID 16925)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4998 (class 2606 OID 17006)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 5000 (class 2606 OID 17004)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5018 (class 2606 OID 17111)
-- Name: semestres semestres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestres
    ADD CONSTRAINT semestres_pkey PRIMARY KEY (id_semestre);


--
-- TOC entry 4996 (class 2606 OID 16982)
-- Name: ubicacion_domiciliario ubicacion_domiciliario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_domiciliario
    ADD CONSTRAINT ubicacion_domiciliario_pkey PRIMARY KEY (id);


--
-- TOC entry 5002 (class 2606 OID 17023)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5004 (class 2606 OID 17021)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4982 (class 2606 OID 16910)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4984 (class 2606 OID 16908)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 1259 OID 16990)
-- Name: idx_detalle_pedido; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detalle_pedido ON public.detalle_pedido USING btree (pedido_id);


--
-- TOC entry 4987 (class 1259 OID 16988)
-- Name: idx_pedido_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pedido_cliente ON public.pedido USING btree (cliente_id);


--
-- TOC entry 4988 (class 1259 OID 16989)
-- Name: idx_pedido_domiciliario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pedido_domiciliario ON public.pedido USING btree (domiciliario_id);


--
-- TOC entry 4994 (class 1259 OID 16991)
-- Name: idx_ubicacion_domiciliario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ubicacion_domiciliario ON public.ubicacion_domiciliario USING btree (domiciliario_id);


--
-- TOC entry 5036 (class 2606 OID 17068)
-- Name: access_logs access_logs_camera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_camera_id_fkey FOREIGN KEY (camera_id) REFERENCES public.cameras(id);


--
-- TOC entry 5037 (class 2606 OID 17063)
-- Name: access_logs access_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5045 (class 2606 OID 17183)
-- Name: asistencias asistencias_id_estudiante_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_id_estudiante_materia_fkey FOREIGN KEY (id_estudiante_materia) REFERENCES public.estudiante_materia(id_estudiante_materia);


--
-- TOC entry 5041 (class 2606 OID 17147)
-- Name: estudiante_materia estudiante_materia_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_materia
    ADD CONSTRAINT estudiante_materia_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- TOC entry 5042 (class 2606 OID 17152)
-- Name: estudiante_materia estudiante_materia_id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_materia
    ADD CONSTRAINT estudiante_materia_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES public.materias(id_materia);


--
-- TOC entry 5043 (class 2606 OID 17157)
-- Name: estudiante_materia estudiante_materia_id_semestre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_materia
    ADD CONSTRAINT estudiante_materia_id_semestre_fkey FOREIGN KEY (id_semestre) REFERENCES public.semestres(id_semestre);


--
-- TOC entry 5039 (class 2606 OID 17129)
-- Name: estudiante_semestre estudiante_semestre_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_semestre
    ADD CONSTRAINT estudiante_semestre_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- TOC entry 5040 (class 2606 OID 17134)
-- Name: estudiante_semestre estudiante_semestre_id_semestre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante_semestre
    ADD CONSTRAINT estudiante_semestre_id_semestre_fkey FOREIGN KEY (id_semestre) REFERENCES public.semestres(id_semestre);


--
-- TOC entry 5035 (class 2606 OID 17040)
-- Name: face_embeddings face_embeddings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_embeddings
    ADD CONSTRAINT face_embeddings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5038 (class 2606 OID 17085)
-- Name: face_images face_images_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_images
    ADD CONSTRAINT face_images_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5029 (class 2606 OID 16939)
-- Name: pedido fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5030 (class 2606 OID 16944)
-- Name: pedido fk_domiciliario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_domiciliario FOREIGN KEY (domiciliario_id) REFERENCES public.usuario(id) ON DELETE SET NULL;


--
-- TOC entry 5033 (class 2606 OID 16983)
-- Name: ubicacion_domiciliario fk_domiciliario_ubicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_domiciliario
    ADD CONSTRAINT fk_domiciliario_ubicacion FOREIGN KEY (domiciliario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5031 (class 2606 OID 16961)
-- Name: detalle_pedido fk_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT fk_pedido FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) ON DELETE CASCADE;


--
-- TOC entry 5032 (class 2606 OID 16966)
-- Name: detalle_pedido fk_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON DELETE CASCADE;


--
-- TOC entry 5044 (class 2606 OID 17170)
-- Name: notas notas_id_estudiante_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas
    ADD CONSTRAINT notas_id_estudiante_materia_fkey FOREIGN KEY (id_estudiante_materia) REFERENCES public.estudiante_materia(id_estudiante_materia);


--
-- TOC entry 5034 (class 2606 OID 17024)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2026-03-25 14:41:55

--
-- PostgreSQL database dump complete
--

\unrestrict Mf6zBGKt4dIXEGlvnyfzBcDTk43L4sXg9OmhmRBbanioZYP0w3lZadO9b7uWjho

