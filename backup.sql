--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

-- Started on 2024-03-17 11:25:17 IST

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
-- TOC entry 2 (class 3079 OID 82618)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 82772)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id bigint NOT NULL,
    name character varying(255),
    text character varying(255),
    example character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    elem text,
    label text,
    body text
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 82771)
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_id_seq OWNER TO postgres;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 225
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;


--
-- TOC entry 224 (class 1259 OID 82763)
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id bigint NOT NULL,
    place character varying(255),
    state character varying(255),
    latitude double precision,
    longitude double precision,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.places OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 82762)
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO postgres;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 223
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- TOC entry 230 (class 1259 OID 99016)
-- Name: relationship_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relationship_types (
    id bigint NOT NULL,
    name character varying(255),
    type character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.relationship_types OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 99015)
-- Name: relationship_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relationship_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.relationship_types_id_seq OWNER TO postgres;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 229
-- Name: relationship_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relationship_types_id_seq OWNED BY public.relationship_types.id;


--
-- TOC entry 228 (class 1259 OID 98996)
-- Name: relationships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relationships (
    id bigint NOT NULL,
    follower_id bigint,
    followed_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    relationship_type_id bigint
);


ALTER TABLE public.relationships OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 98995)
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.relationships_id_seq OWNER TO postgres;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 227
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relationships_id_seq OWNED BY public.relationships.id;


--
-- TOC entry 216 (class 1259 OID 82606)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 82743)
-- Name: uploads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uploads (
    id bigint NOT NULL,
    filename character varying(255),
    size bigint,
    content_type character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    content bytea,
    user_id bigint
);


ALTER TABLE public.uploads OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 82742)
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uploads_id_seq OWNER TO postgres;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 221
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;


--
-- TOC entry 218 (class 1259 OID 82612)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    email public.citext,
    hashed_password character varying(255),
    confirmed_at timestamp(0) without time zone,
    is_admin boolean,
    avatar bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 82611)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 220 (class 1259 OID 82727)
-- Name: users_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_tokens (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token bytea NOT NULL,
    context character varying(255) NOT NULL,
    sent_to character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.users_tokens OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 82726)
-- Name: users_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_tokens_id_seq OWNED BY public.users_tokens.id;


--
-- TOC entry 3347 (class 2604 OID 82775)
-- Name: class id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 82766)
-- Name: places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 99019)
-- Name: relationship_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship_types ALTER COLUMN id SET DEFAULT nextval('public.relationship_types_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 98999)
-- Name: relationships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationships ALTER COLUMN id SET DEFAULT nextval('public.relationships_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 82746)
-- Name: uploads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 82615)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 82730)
-- Name: users_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens ALTER COLUMN id SET DEFAULT nextval('public.users_tokens_id_seq'::regclass);


--
-- TOC entry 3531 (class 0 OID 82772)
-- Dependencies: 226
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1305, '.text-pink-700', 'classes/text-color/text-pink-700', NULL, '2024-03-06 04:55:48', '2024-03-06 04:55:48', '.text-pink-700 { color: #b83280; }', '<div class="text-pink-700">Text</div>', '<div>
  <div class="text-pink-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1318, '.origin-center+%25_F+.origin-*', 'classes/transform/origin-center+%25_F+.origin-*', NULL, '2024-03-06 04:55:53', '2024-03-06 04:55:53', '.origin-center { transform-origin: center; }
.origin-top { transform-origin: top; }
.origin-top-right { transform-origin: top right; }
.origin-right { transform-origin: right; }
.origin-bottom-right { transform-origin: bottom right; }
.origin-bottom { transform-origin: bottom; }
.origin-bottom-left { transform-origin: bottom left; }
.origin-left { transform-origin: left; }
.origin-top-left { transform-origin: top left; }', '<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-center transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-top transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-top-right transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-right transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-bottom-right transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-bottom transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-bottom-left transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-left transform scale-50 bg-teal-400 w-full h-full"></div>
</div>
<div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
  <div class="origin-top-left transform scale-50 bg-teal-400 w-full h-full"></div>
</div>', '<div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-center transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-top transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-top-right transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-right transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-bottom-right transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-bottom transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-bottom-left transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-left transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
  <div class="bg-gray-300 w-24 h-24 m-2 inline-flex justify-center">
    <div class="origin-top-left transform scale-50 bg-teal-400 w-full h-full">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1326, '.translate-x-8', 'classes/transform/translate-x-8', NULL, '2024-03-06 04:55:56', '2024-03-06 04:55:56', '.translate-x-8 { --transform-translate-x: 2rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-8 transform bg-teal-400 h-6 w-6 text-center">8</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-8 transform bg-teal-400 h-6 w-6 text-center">
      8
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1334, '.translate-x-48', 'classes/transform/translate-x-48', NULL, '2024-03-06 04:55:59', '2024-03-06 04:55:59', '.translate-x-48 { --transform-translate-x: 12rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-48 transform bg-teal-400 h-6 w-6 text-center">48</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-48 transform bg-teal-400 h-6 w-6 text-center">
      48
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1346, '.translate-y-6', 'classes/transform/translate-y-6', NULL, '2024-03-06 04:56:04', '2024-03-06 04:56:04', '.translate-y-6 { --transform-translate-y: 1.5rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-6 transform bg-teal-400 h-6 w-6 text-center">6</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-6 transform bg-teal-400 h-6 w-6 text-center">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1355, '.translate-y-48', 'classes/transform/translate-y-48', NULL, '2024-03-06 04:56:07', '2024-03-06 04:56:07', '.translate-y-48 { --transform-translate-y: 12rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-48 transform bg-teal-400 h-6 w-6 text-center">48</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-48 transform bg-teal-400 h-6 w-6 text-center">
      48
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (13, '.-ml-8', 'classes/margins/-ml-8', NULL, '2024-03-05 18:59:47', '2024-03-05 18:59:47', '.-ml-8 { margin-left: -2rem; }', '<span class="-ml-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (14, '.ease-linear+%25_F+.ease-*', 'classes/animation/ease-linear+%25_F+.ease-*', NULL, '2024-03-05 19:02:17', '2024-03-05 19:02:17', '.ease-linear { 
    transition-timing-function: linear; 
}
.ease-in { 
    transition-timing-function: cubic-bezier(0.4, 0, 1, 1);
}
.ease-out { 
    transition-timing-function: cubic-bezier(0, 0, 0.2, 1); 
}
.ease-in-out { 
    transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}', '<button class="ease-linear transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">Hover linear</button>
<button class="ease-in transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">Hover in</button>
<button class="ease-out transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">Hover out</button>
<button class="ease-in-out transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">Hover in out</button>', '<div>
  <button class="ease-linear transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">
    Hover linear
  </button>
  <button class="ease-in transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">
    Hover in
  </button>
  <button class="ease-out transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">
    Hover out
  </button>
  <button class="ease-in-out transform hover:scale-125 transition duration-500 bg-teal-400 px-6 py-2 m-6 inline">
    Hover in out
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (15, '.duration-75', 'classes/animation/duration-75', NULL, '2024-03-05 19:02:17', '2024-03-05 19:02:17', '.duration-75 { transition-duration: 75ms; }', '<button class="duration-75 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">75</button>', '<div>
  <button class="duration-75 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    75
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (16, '.duration-100', 'classes/animation/duration-100', NULL, '2024-03-05 19:02:18', '2024-03-05 19:02:18', '.duration-100 { transition-duration: 100ms; }', '<button class="duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">100</button>', '<div>
  <button class="duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    100
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (17, '.duration-150', 'classes/animation/duration-150', NULL, '2024-03-05 19:02:18', '2024-03-05 19:02:18', '.duration-150 { transition-duration: 150ms; }', '<button class="duration-150 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">150</button>', '<div>
  <button class="duration-150 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    150
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (18, '.duration-200', 'classes/animation/duration-200', NULL, '2024-03-05 19:02:19', '2024-03-05 19:02:19', '.duration-200 { transition-duration: 200ms; }', '<button class="duration-200 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">200</button>', '<div>
  <button class="duration-200 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    200
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (19, '.duration-300', 'classes/animation/duration-300', NULL, '2024-03-05 19:02:19', '2024-03-05 19:02:19', '.duration-300 { transition-duration: 300ms; }', '<button class="duration-300 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">300</button>', '<div>
  <button class="duration-300 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    300
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (20, '.duration-500', 'classes/animation/duration-500', NULL, '2024-03-05 19:02:19', '2024-03-05 19:02:19', '.duration-500 { transition-duration: 500ms; }', '<button class="duration-500 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">500</button>', '<div>
  <button class="duration-500 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    500
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (21, '.duration-700', 'classes/animation/duration-700', NULL, '2024-03-05 19:02:20', '2024-03-05 19:02:20', '.duration-700 { transition-duration: 700ms; }', '<button class="duration-700 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">700</button>', '<div>
  <button class="duration-700 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    700
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (63, '.bg-none', 'classes/background/bg-none', NULL, '2024-03-05 19:02:35', '2024-03-05 19:02:35', NULL, '    <div class="p-6 bg-none border"></div>', '<div>
  <div class="p-6 bg-none border">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (22, '.duration-1000', 'classes/animation/duration-1000', NULL, '2024-03-05 19:02:20', '2024-03-05 19:02:20', '.duration-1000 { transition-duration: 1000ms; }', '<button class="duration-1000 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">1000</button>', '<div>
  <button class="duration-1000 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    1000
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (35, '.animate-pulse', 'classes/animations/animate-pulse', NULL, '2024-03-05 19:02:25', '2024-03-05 19:02:25', NULL, '    <span class="inline-block animate-pulse rounded-full p-2 bg-teal-400 text-white text-sm">animate-pulse
        <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7" />
        </svg>
    </span>', '<div>
  <span class="inline-block animate-pulse rounded-full p-2 bg-teal-400 text-white text-sm">
    animate-pulse
    <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7">
      </path>
    </svg>
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (75, '.bg-gray-400', 'classes/background-color/bg-gray-400', NULL, '2024-03-05 19:02:40', '2024-03-05 19:02:40', '.bg-gray-400 { background-color: #cbd5e0; }', '<div class="bg-gray-400 h-5"></div>', '<div>
  <div class="bg-gray-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (82, '.bg-red-200', 'classes/background-color/bg-red-200', NULL, '2024-03-05 19:02:42', '2024-03-05 19:02:42', '.bg-red-200 { background-color: #fed7d7; }', '<div class="bg-red-200 h-5"></div>', '<div>
  <div class="bg-red-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (90, '.bg-orange-100', 'classes/background-color/bg-orange-100', NULL, '2024-03-05 19:02:45', '2024-03-05 19:02:45', '.bg-orange-100 { background-color: #fffaf0; }', '<div class="bg-orange-100 h-5"></div>', '<div>
  <div class="bg-orange-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (103, '.bg-yellow-500', 'classes/background-color/bg-yellow-500', NULL, '2024-03-05 19:02:50', '2024-03-05 19:02:50', '.bg-yellow-500 { background-color: #ecc94b; }', '<div class="bg-yellow-500 h-5"></div>', '<div>
  <div class="bg-yellow-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (110, '.bg-green-300', 'classes/background-color/bg-green-300', NULL, '2024-03-05 19:02:53', '2024-03-05 19:02:53', '.bg-green-300 { background-color: #9ae6b4; }', '<div class="bg-green-300 h-5"></div>', '<div>
  <div class="bg-green-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (123, '.bg-teal-700', 'classes/background-color/bg-teal-700', NULL, '2024-03-05 19:02:58', '2024-03-05 19:02:58', '.bg-teal-700 { background-color: #2c7a7b; }', '<div class="bg-teal-700 h-5"></div>', '<div>
  <div class="bg-teal-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (127, '.bg-blue-200', 'classes/background-color/bg-blue-200', NULL, '2024-03-05 19:03:00', '2024-03-05 19:03:00', '.bg-blue-200 { background-color: #bee3f8; }', '<div class="bg-blue-200 h-5"></div>', '<div>
  <div class="bg-blue-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (140, '.bg-indigo-600', 'classes/background-color/bg-indigo-600', NULL, '2024-03-05 19:03:05', '2024-03-05 19:03:05', '.bg-indigo-600 { background-color: #5a67d8; }', '<div class="bg-indigo-600 h-5"></div>', '<div>
  <div class="bg-indigo-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1306, '.text-pink-900', 'classes/text-color/text-pink-900', NULL, '2024-03-06 04:55:49', '2024-03-06 04:55:49', '.text-pink-900 { color: #702459; }', '<div class="text-pink-900">Text</div>', '<div>
  <div class="text-pink-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1315, '.text-red-50', 'classes/text-color/text-red-50', NULL, '2024-03-06 04:55:52', '2024-03-06 04:55:52', NULL, '    <p class="text-2xl text-red-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-red-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1323, '.translate-x-4', 'classes/transform/translate-x-4', NULL, '2024-03-06 04:55:55', '2024-03-06 04:55:55', '.translate-x-4 { --transform-translate-x: 1rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-4 transform bg-teal-400 h-6 w-6 text-center">4</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-4 transform bg-teal-400 h-6 w-6 text-center">
      4
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1336, '.translate-x-64', 'classes/transform/translate-x-64', NULL, '2024-03-06 04:56:00', '2024-03-06 04:56:00', '.translate-x-64 { --transform-translate-x: 16rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-64 transform bg-teal-400 h-6 w-6 text-center">64</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-64 transform bg-teal-400 h-6 w-6 text-center">
      64
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1343, '.translate-y-3', 'classes/transform/translate-y-3', NULL, '2024-03-06 04:56:03', '2024-03-06 04:56:03', '.translate-y-3 { --transform-translate-y: 0.75rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-3 transform bg-teal-400 h-6 w-6 text-center">3</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-3 transform bg-teal-400 h-6 w-6 text-center">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1352, '.translate-y-24', 'classes/transform/translate-y-24', NULL, '2024-03-06 04:56:06', '2024-03-06 04:56:06', '.translate-y-24 { --transform-translate-y: 6rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-24 transform bg-teal-400 h-6 w-6 text-center">24</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-24 transform bg-teal-400 h-6 w-6 text-center">
      24
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1369, '.-translate-x-12', 'classes/transform/-translate-x-12', NULL, '2024-03-06 04:56:13', '2024-03-06 04:56:13', '.-translate-x-12 { --transform-translate-x: -3rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-12 transform bg-teal-400 h-6 w-8 ml-auto text-center">-12</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-12 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -12
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1373, '.-translate-x-32', 'classes/transform/-translate-x-32', NULL, '2024-03-06 04:56:14', '2024-03-06 04:56:14', '.-translate-x-32 { --transform-translate-x: -8rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-32 transform bg-teal-400 h-6 w-8 ml-auto text-center">-32</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-32 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -32
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (56, '.bg-repeat-round', 'classes/background/bg-repeat-round', NULL, '2024-03-05 19:02:33', '2024-03-09 18:03:46', '.bg-repeat-round { background-repeat: round; }', '<div class="bg-repeat-round bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-repeat-round bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (23, '.delay-75', 'classes/animation/delay-75', NULL, '2024-03-05 19:02:20', '2024-03-05 19:02:20', '.delay-75 { transition-delay: 75ms; }', '<button class="delay-75 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">75</button>', '<div>
  <button class="delay-75 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    75
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (24, '.delay-100', 'classes/animation/delay-100', NULL, '2024-03-05 19:02:21', '2024-03-05 19:02:21', '.delay-100 { transition-delay: 100ms; }', '<button class="delay-100 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">100</button>', '<div>
  <button class="delay-100 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    100
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (25, '.delay-150', 'classes/animation/delay-150', NULL, '2024-03-05 19:02:21', '2024-03-05 19:02:21', '.delay-150 { transition-delay: 150ms; }', '<button class="delay-150 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">150</button>', '<div>
  <button class="delay-150 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    150
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (26, '.delay-200', 'classes/animation/delay-200', NULL, '2024-03-05 19:02:22', '2024-03-05 19:02:22', '.delay-200 { transition-delay: 200ms; }', '<button class="delay-200 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">200</button>', '<div>
  <button class="delay-200 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    200
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (28, '.delay-500', 'classes/animation/delay-500', NULL, '2024-03-05 19:02:22', '2024-03-05 19:02:22', '.delay-500 { transition-delay: 500ms; }', '<button class="delay-500 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">500</button>', '<div>
  <button class="delay-500 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    500
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (29, '.delay-700', 'classes/animation/delay-700', NULL, '2024-03-05 19:02:23', '2024-03-05 19:02:23', '.delay-700 { transition-delay: 700ms; }', '<button class="delay-700 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">700</button>', '<div>
  <button class="delay-700 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    700
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (36, '.animate-spin', 'classes/animations/animate-spin', NULL, '2024-03-05 19:02:25', '2024-03-05 19:02:25', NULL, '    <span class="inline-block animate-spin rounded-full p-2 bg-teal-400 text-white text-sm">animate-spin
        <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
        </svg>
    </span>', '<div>
  <span class="inline-block animate-spin rounded-full p-2 bg-teal-400 text-white text-sm">
    animate-spin
    <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15">
      </path>
    </svg>
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (58, '.bg-opacity-0', 'classes/background/bg-opacity-0', NULL, '2024-03-05 19:02:33', '2024-03-05 19:02:33', '.bg-opacity-0 { --bg-opacity: 0; }', '<div class="bg-opacity-0 bg-teal-400 m-2 h-16 w-16"></div>', '<div>
  <div class="bg-opacity-0 bg-teal-400 m-2 h-16 w-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (59, '.bg-opacity-25', 'classes/background/bg-opacity-25', NULL, '2024-03-05 19:02:34', '2024-03-05 19:02:34', '.bg-opacity-25 { --bg-opacity: 0.25; }', '<div class="bg-opacity-25 bg-teal-400 m-2 h-16 w-16"></div>', '<div>
  <div class="bg-opacity-25 bg-teal-400 m-2 h-16 w-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (61, '.bg-opacity-75', 'classes/background/bg-opacity-75', NULL, '2024-03-05 19:02:34', '2024-03-05 19:02:34', '.bg-opacity-75 { --bg-opacity: 0.75; }', '<div class="bg-opacity-75 bg-teal-400 m-2 h-16 w-16"></div>', '<div>
  <div class="bg-opacity-75 bg-teal-400 m-2 h-16 w-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (62, '.bg-opacity-100', 'classes/background/bg-opacity-100', NULL, '2024-03-05 19:02:35', '2024-03-05 19:02:35', '.bg-opacity-100 { --bg-opacity: 1; }', '<div class="bg-opacity-100 bg-teal-400 m-2 h-16 w-16"></div>', '<div>
  <div class="bg-opacity-100 bg-teal-400 m-2 h-16 w-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (48, '.bg-right-top', 'classes/background/bg-right-top', NULL, '2024-03-05 19:02:30', '2024-03-09 18:03:46', '.bg-right-top { background-position: right top; }', '<div class="bg-right-top bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-right-top bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (43, '.bg-left', 'classes/background/bg-left', NULL, '2024-03-05 19:02:28', '2024-03-09 18:03:46', '.bg-left { background-position: left; }', '<div class="bg-left bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-left bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (46, '.bg-right', 'classes/background/bg-right', NULL, '2024-03-05 19:02:29', '2024-03-09 18:03:46', '.bg-right { background-position: right; }', '<div class="bg-right bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-right bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (51, '.bg-scroll', 'classes/background/bg-scroll', NULL, '2024-03-05 19:02:31', '2024-03-09 18:03:46', '.bg-scroll {
  background-attachment: scroll;
}', '<div class="bg-scroll bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>', '<div class="bg-scroll bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (27, '.delay-300', 'classes/animation/delay-300', NULL, '2024-03-05 19:02:22', '2024-03-05 19:02:22', '.delay-300 { transition-delay: 300ms; }', '<button class="delay-300 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">300</button>', '<div>
  <button class="delay-300 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    300
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (30, '.delay-1000', 'classes/animation/delay-1000', NULL, '2024-03-05 19:02:23', '2024-03-05 19:02:23', '.delay-1000 { transition-delay: 1000ms; }', '<button class="delay-1000 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">1000</button>', '<div>
  <button class="delay-1000 duration-100 transform hover:scale-125 transition ease-linear bg-teal-400 px-6 py-2 m-4 inline">
    1000
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (60, '.bg-opacity-50', 'classes/background/bg-opacity-50', NULL, '2024-03-05 19:02:34', '2024-03-05 19:02:34', '.bg-opacity-50 { --bg-opacity: 0.5; }', '<div class="bg-opacity-50 bg-teal-400 m-2 h-16 w-16"></div>', '<div>
  <div class="bg-opacity-50 bg-teal-400 m-2 h-16 w-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (66, '.bg-clip-padding', 'classes/background-clip/bg-clip-padding', NULL, '2024-03-05 19:02:36', '2024-03-05 19:02:36', NULL, '    <div class="border-4 border-black border-dashed p-6 bg-clip-padding bg-gray-200 bg-no-repeat h-48 w-64" style="background-image: url(''https://shuffle.dev/placeholders/pictures/office.jpg''); background-size: 12rem 8rem"></div>', '<div>
  <div class="border-4 border-black border-dashed p-6 bg-clip-padding bg-gray-200 bg-no-repeat h-48 w-64" style="background-image: url(&#39;https://shuffle.dev/placeholders/pictures/office.jpg&#39;); background-size: 12rem 8rem">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (76, '.bg-gray-500', 'classes/background-color/bg-gray-500', NULL, '2024-03-05 19:02:40', '2024-03-05 19:02:40', '.bg-gray-500 { background-color: #a0aec0; }', '<div class="bg-gray-500 h-5"></div>', '<div>
  <div class="bg-gray-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (89, '.bg-red-900', 'classes/background-color/bg-red-900', NULL, '2024-03-05 19:02:45', '2024-03-05 19:02:45', '.bg-red-900 { background-color: #742a2a; }', '<div class="bg-red-900 h-5"></div>', '<div>
  <div class="bg-red-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (101, '.bg-yellow-300', 'classes/background-color/bg-yellow-300', NULL, '2024-03-05 19:02:50', '2024-03-05 19:02:50', '.bg-yellow-300 { background-color: #faf089; }', '<div class="bg-yellow-300 h-5"></div>', '<div>
  <div class="bg-yellow-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (124, '.bg-teal-800', 'classes/background-color/bg-teal-800', NULL, '2024-03-05 19:02:59', '2024-03-05 19:02:59', '.bg-teal-800 { background-color: #285e61; }', '<div class="bg-teal-800 h-5"></div>', '<div>
  <div class="bg-teal-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (131, '.bg-blue-600', 'classes/background-color/bg-blue-600', NULL, '2024-03-05 19:03:01', '2024-03-05 19:03:01', '.bg-blue-600 { background-color: #3182ce; }', '<div class="bg-blue-600 h-5"></div>', '<div>
  <div class="bg-blue-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (144, '.bg-purple-100', 'classes/background-color/bg-purple-100', NULL, '2024-03-05 19:03:06', '2024-03-05 19:03:06', '.bg-purple-100 { background-color: #faf5ff; }', '<div class="bg-purple-100 h-5"></div>', '<div>
  <div class="bg-purple-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1307, '.text-pink-800', 'classes/text-color/text-pink-800', NULL, '2024-03-06 04:55:49', '2024-03-06 04:55:49', '.text-pink-800 { color: #97266d; }', '<div class="text-pink-800">Text</div>', '<div>
  <div class="text-pink-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1316, '.text-yellow-50', 'classes/text-color/text-yellow-50', NULL, '2024-03-06 04:55:52', '2024-03-06 04:55:52', NULL, '    <p class="text-2xl text-yellow-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-yellow-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1328, '.translate-x-12', 'classes/transform/translate-x-12', NULL, '2024-03-06 04:55:57', '2024-03-06 04:55:57', '.translate-x-12 { --transform-translate-x: 3rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-12 transform bg-teal-400 h-6 w-6 text-center">12</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-12 transform bg-teal-400 h-6 w-6 text-center">
      12
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1338, '.translate-x-1%25_F2', 'classes/transform/translate-x-1%25_F2', NULL, '2024-03-06 04:56:00', '2024-03-06 04:56:00', '.translate-x-1/2 { --transform-translate-x: 50%; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-1/2 transform bg-teal-400 h-6 w-6 text-center">1/2</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-1/2 transform bg-teal-400 h-6 w-6 text-center">
      1/2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1348, '.translate-y-10', 'classes/transform/translate-y-10', NULL, '2024-03-06 04:56:05', '2024-03-06 04:56:05', '.translate-y-10 { --transform-translate-y: 2.5rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-10 transform bg-teal-400 h-6 w-6 text-center">10</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-10 transform bg-teal-400 h-6 w-6 text-center">
      10
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1356, '.translate-y-56', 'classes/transform/translate-y-56', NULL, '2024-03-06 04:56:08', '2024-03-06 04:56:08', '.translate-y-56 { --transform-translate-y: 14rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-56 transform bg-teal-400 h-6 w-6 text-center">56</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-56 transform bg-teal-400 h-6 w-6 text-center">
      56
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1375, '.-translate-x-48', 'classes/transform/-translate-x-48', NULL, '2024-03-06 04:56:15', '2024-03-06 04:56:15', '.-translate-x-48 { --transform-translate-x: -12rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-48 transform bg-teal-400 h-6 w-8 ml-auto text-center">-48</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-48 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -48
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1379, '.-translate-x-1%25_F2', 'classes/transform/-translate-x-1%25_F2', NULL, '2024-03-06 04:56:16', '2024-03-06 04:56:16', '.-translate-x-1/2 { --transform-translate-x: -50%; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-1/2 transform bg-teal-400 h-6 w-8 ml-auto text-center">-1/2</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-1/2 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -1/2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (44, '.bg-left-bottom', 'classes/background/bg-left-bottom', NULL, '2024-03-05 19:02:28', '2024-03-09 18:03:46', '.bg-left-bottom { background-position: left bottom; }', '<div class="bg-left-bottom bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-left-bottom bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (31, '.transition+%25_F+.transition-*', 'classes/animation/transition+%25_F+.transition-*', NULL, '2024-03-05 19:02:23', '2024-03-05 19:02:23', '.transition-none { transition-property: none; }
.transition-all { transition-property: all; }
.transition { transition-property: background-color, border-color, color, fill, stroke, opacity, box-shadow, transform; }
.transition-colors { transition-property: background-color, border-color, color, fill, stroke; }
.transition-opacity { transition-property: opacity; }
.transition-shadow { transition-property: box-shadow; }
.transition-transform { transition-property: transform; }', '<button class="transition-none duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">None</button>

<button class="transition-all duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">All</button>

<button class="transition duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">Default</button>

<button class="transition-colors duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">Colors</button>

<button class="transition-opacity duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">Opacity</button>

<button class="transition-shadow duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">Shadow</button>

<button class="transition-transform duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">Transform</button>', '<div>
  <button class="transition-none duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    None
  </button>
  <button class="transition-all duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    All
  </button>
  <button class="transition duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    Default
  </button>
  <button class="transition-colors duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    Colors
  </button>
  <button class="transition-opacity duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    Opacity
  </button>
  <button class="transition-shadow duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    Shadow
  </button>
  <button class="transition-transform duration-500 transform px-6 py-2 m-4 inline
               bg-teal-400 hover:bg-indigo-400
               border-2 border-red-500 hover:border-yellow-500
               hover:text-white
               hover:opacity-50
               hover:shadow-md
               hover:scale-125">
    Transform
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (32, '.animate-bounce', 'classes/animations/animate-bounce', NULL, '2024-03-05 19:02:24', '2024-03-05 19:02:24', NULL, '    <span class="inline-block animate-bounce rounded-full p-4 bg-teal-400 text-white text-sm">animate-bounce
        <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7" />
        </svg>
    </span>', '<div>
  <span class="inline-block animate-bounce rounded-full p-4 bg-teal-400 text-white text-sm">
    animate-bounce
    <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7">
      </path>
    </svg>
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (33, '.animate-none', 'classes/animations/animate-none', NULL, '2024-03-05 19:02:24', '2024-03-05 19:02:24', NULL, '    <span class="inline-block animate-none rounded-full p-4 bg-teal-400 text-white text-sm">animate-none
        <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7" />
        </svg>
    </span>', '<div>
  <span class="inline-block animate-none rounded-full p-4 bg-teal-400 text-white text-sm">
    animate-none
    <svg class="w-6 h-6 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7">
      </path>
    </svg>
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (34, '.animate-ping', 'classes/animations/animate-ping', NULL, '2024-03-05 19:02:25', '2024-03-05 19:02:25', NULL, '    <span class="inline-block animate-ping rounded-full p-2 bg-teal-400 text-white text-xs">animate-ping
         <svg class="w-4 h-4 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7" />
        </svg>
    </span>', '<div>
  <span class="inline-block animate-ping rounded-full p-2 bg-teal-400 text-white text-xs">
    animate-ping
    <svg class="w-4 h-4 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewbox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 13l-7 7-7-7m14-8l-7 7-7-7">
      </path>
    </svg>
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (64, '.bg-clip-border', 'classes/background-clip/bg-clip-border', NULL, '2024-03-05 19:02:35', '2024-03-05 19:02:35', NULL, '    <div class="border-4 border-black border-dashed p-6 bg-clip-border bg-gray-200 bg-no-repeat h-48 w-64" style="background-image: url(''https://shuffle.dev/placeholders/pictures/office.jpg''); background-size: 12rem 8rem"></div>', '<div>
  <div class="border-4 border-black border-dashed p-6 bg-clip-border bg-gray-200 bg-no-repeat h-48 w-64" style="background-image: url(&#39;https://shuffle.dev/placeholders/pictures/office.jpg&#39;); background-size: 12rem 8rem">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (68, '.bg-transparent', 'classes/background-color/bg-transparent', NULL, '2024-03-05 19:02:37', '2024-03-05 19:02:37', '.bg-transparent { background-color: transparent; }', '<div class="bg-transparent h-5"></div>', '<div>
  <div class="bg-transparent h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (71, '.bg-white', 'classes/background-color/bg-white', NULL, '2024-03-05 19:02:38', '2024-03-05 19:02:38', '.bg-white { background-color: #fff; }', '<div class="bg-white h-5"></div>', '<div>
  <div class="bg-white h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (78, '.bg-gray-700', 'classes/background-color/bg-gray-700', NULL, '2024-03-05 19:02:41', '2024-03-05 19:02:41', '.bg-gray-700 { background-color: #4a5568; }', '<div class="bg-gray-700 h-5"></div>', '<div>
  <div class="bg-gray-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (79, '.bg-gray-800', 'classes/background-color/bg-gray-800', NULL, '2024-03-05 19:02:41', '2024-03-05 19:02:41', '.bg-gray-800 { background-color: #2d3748; }', '<div class="bg-gray-800 h-5"></div>', '<div>
  <div class="bg-gray-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (85, '.bg-red-500', 'classes/background-color/bg-red-500', NULL, '2024-03-05 19:02:43', '2024-03-05 19:02:43', '.bg-red-500 { background-color: #f56565; }', '<div class="bg-red-500 h-5"></div>', '<div>
  <div class="bg-red-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (88, '.bg-red-800', 'classes/background-color/bg-red-800', NULL, '2024-03-05 19:02:45', '2024-03-05 19:02:45', '.bg-red-800 { background-color: #9b2c2c; }', '<div class="bg-red-800 h-5"></div>', '<div>
  <div class="bg-red-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (93, '.bg-orange-400', 'classes/background-color/bg-orange-400', NULL, '2024-03-05 19:02:47', '2024-03-05 19:02:47', '.bg-orange-400 { background-color: #f6ad55; }', '<div class="bg-orange-400 h-5"></div>', '<div>
  <div class="bg-orange-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (50, '.bg-local', 'classes/background/bg-local', NULL, '2024-03-05 19:02:30', '2024-03-09 18:03:46', '.bg-local {
  background-attachment: local;
}', '<div class="bg-local bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>', '<div class="bg-local bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (49, '.bg-fixed', 'classes/background/bg-fixed', NULL, '2024-03-05 19:02:30', '2024-03-09 18:03:46', '.bg-fixed {
  background-attachment: fixed;
}', '<div class="bg-fixed bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>', '<div class="bg-fixed bg-contain overflow-auto m-2 h-48 w-64" style="background-image: url(''/images/office.jpg'')">
  <div class="h-64 w-64"></div>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (65, '.bg-clip-content', 'classes/background-clip/bg-clip-content', NULL, '2024-03-05 19:02:36', '2024-03-05 19:02:36', NULL, '    <div class="border-4 border-black border-dashed p-6 bg-clip-content bg-no-repeat h-48 w-64" style="background-image: url(''https://shuffle.dev/placeholders/pictures/office.jpg''); background-size: 12rem 8rem"></div>', '<div>
  <div class="border-4 border-black border-dashed p-6 bg-clip-content bg-no-repeat h-48 w-64" style="background-image: url(&#39;https://shuffle.dev/placeholders/pictures/office.jpg&#39;); background-size: 12rem 8rem">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (72, '.bg-gray-100', 'classes/background-color/bg-gray-100', NULL, '2024-03-05 19:02:38', '2024-03-05 19:02:38', '.bg-gray-100 { background-color: #f7fafc; }', '<div class="bg-gray-100 h-5"></div>', '<div>
  <div class="bg-gray-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (81, '.bg-red-100', 'classes/background-color/bg-red-100', NULL, '2024-03-05 19:02:42', '2024-03-05 19:02:42', '.bg-red-100 { background-color: #fff5f5; }', '<div class="bg-red-100 h-5"></div>', '<div>
  <div class="bg-red-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (92, '.bg-orange-300', 'classes/background-color/bg-orange-300', NULL, '2024-03-05 19:02:46', '2024-03-05 19:02:46', '.bg-orange-300 { background-color: #fbd38d; }', '<div class="bg-orange-300 h-5"></div>', '<div>
  <div class="bg-orange-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (100, '.bg-yellow-200', 'classes/background-color/bg-yellow-200', NULL, '2024-03-05 19:02:49', '2024-03-05 19:02:49', '.bg-yellow-200 { background-color: #fefcbf; }', '<div class="bg-yellow-200 h-5"></div>', '<div>
  <div class="bg-yellow-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (108, '.bg-green-100', 'classes/background-color/bg-green-100', NULL, '2024-03-05 19:02:52', '2024-03-05 19:02:52', '.bg-green-100 { background-color: #f0fff4; }', '<div class="bg-green-100 h-5"></div>', '<div>
  <div class="bg-green-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (112, '.bg-green-500', 'classes/background-color/bg-green-500', NULL, '2024-03-05 19:02:54', '2024-03-05 19:02:54', '.bg-green-500 { background-color: #48bb78; }', '<div class="bg-green-500 h-5"></div>', '<div>
  <div class="bg-green-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (128, '.bg-blue-300', 'classes/background-color/bg-blue-300', NULL, '2024-03-05 19:03:00', '2024-03-05 19:03:00', '.bg-blue-300 { background-color: #90cdf4; }', '<div class="bg-blue-300 h-5"></div>', '<div>
  <div class="bg-blue-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (133, '.bg-blue-800', 'classes/background-color/bg-blue-800', NULL, '2024-03-05 19:03:02', '2024-03-05 19:03:02', '.bg-blue-800 { background-color: #2c5282; }', '<div class="bg-blue-800 h-5"></div>', '<div>
  <div class="bg-blue-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1308, '.text-blue-50', 'classes/text-color/text-blue-50', NULL, '2024-03-06 04:55:49', '2024-03-06 04:55:49', NULL, '    <p class="text-2xl text-blue-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-blue-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1317, '.transform+%25_F+.transform-none', 'classes/transform/transform+%25_F+.transform-none', NULL, '2024-03-06 04:55:53', '2024-03-06 04:55:53', '.transform {
    --transform-translate-x: 0;
    --transform-translate-y: 0;
    --transform-rotate: 0;
    --transform-skew-x: 0;
    --transform-skew-y: 0;
    --transform-scale-x: 1;
    --transform-scale-y: 1;
    transform: translateX(var(--transform-translate-x)) translateY(var(--transform-translate-y)) rotate(var(--transform-rotate)) skewX(var(--transform-skew-x)) skewY(var(--transform-skew-y)) scaleX(var(--transform-scale-x)) scaleY(var(--transform-scale-y))
}
.transform-none {
    transform: none;
}', '<div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
  <div class="transform rotate-45 bg-teal-400 w-12 h-12"></div>
</div>

<div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
  <div class="transform-none rotate-45 bg-teal-400 w-12 h-12"></div>
</div>', '<div>
  <div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
    <div class="transform rotate-45 bg-teal-400 w-12 h-12">
    </div>
  </div>
  <div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
    <div class="transform-none rotate-45 bg-teal-400 w-12 h-12">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1331, '.translate-x-24', 'classes/transform/translate-x-24', NULL, '2024-03-06 04:55:58', '2024-03-06 04:55:58', '.translate-x-24 { --transform-translate-x: 6rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-24 transform bg-teal-400 h-6 w-6 text-center">24</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-24 transform bg-teal-400 h-6 w-6 text-center">
      24
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1339, '.translate-x-full', 'classes/transform/translate-x-full', NULL, '2024-03-06 04:56:01', '2024-03-06 04:56:01', '.translate-x-full { --transform-translate-x: 100%; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-full transform bg-teal-400 h-6 w-6 text-center">full</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-full transform bg-teal-400 h-6 w-6 text-center">
      full
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1350, '.translate-y-16', 'classes/transform/translate-y-16', NULL, '2024-03-06 04:56:05', '2024-03-06 04:56:05', '.translate-y-16 { --transform-translate-y: 4rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-16 transform bg-teal-400 h-6 w-6 text-center">16</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-16 transform bg-teal-400 h-6 w-6 text-center">
      16
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1364, '.-translate-x-4', 'classes/transform/-translate-x-4', NULL, '2024-03-06 04:56:11', '2024-03-06 04:56:11', '.-translate-x-4 { --transform-translate-x: -1rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-4 transform bg-teal-400 h-6 w-8 ml-auto text-center">-4</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-4 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -4
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (55, '.bg-repeat-y', 'classes/background/bg-repeat-y', NULL, '2024-03-05 19:02:32', '2024-03-09 18:03:46', '.bg-repeat-y { background-repeat: repeat-y; }', '<div class="bg-repeat-y bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-repeat-y bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (39, '.bg-contain', 'classes/background/bg-contain', NULL, '2024-03-05 19:02:26', '2024-03-09 18:03:46', '.bg-contain {
  background-size: contain;
}', '<div class="bg-contain h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>', '<div class="bg-contain h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (52, '.bg-no-repeat', 'classes/background/bg-no-repeat', NULL, '2024-03-05 19:02:31', '2024-03-09 18:03:46', '.bg-no-repeat {
  background-repeat: no-repeat;
}', '<div class="bg-no-repeat bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-no-repeat bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (80, '.bg-gray-900', 'classes/background-color/bg-gray-900', NULL, '2024-03-05 19:02:41', '2024-03-05 19:02:41', '.bg-gray-900 { background-color: #1a202c; }', '<div class="bg-gray-900 h-5"></div>', '<div>
  <div class="bg-gray-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (87, '.bg-red-700', 'classes/background-color/bg-red-700', NULL, '2024-03-05 19:02:44', '2024-03-05 19:02:44', '.bg-red-700 { background-color: #c53030; }', '<div class="bg-red-700 h-5"></div>', '<div>
  <div class="bg-red-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (94, '.bg-orange-500', 'classes/background-color/bg-orange-500', NULL, '2024-03-05 19:02:47', '2024-03-05 19:02:47', '.bg-orange-500 { background-color: #ed8936; }', '<div class="bg-orange-500 h-5"></div>', '<div>
  <div class="bg-orange-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (109, '.bg-green-200', 'classes/background-color/bg-green-200', NULL, '2024-03-05 19:02:53', '2024-03-05 19:02:53', '.bg-green-200 { background-color: #c6f6d5; }', '<div class="bg-green-200 h-5"></div>', '<div>
  <div class="bg-green-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (116, '.bg-green-900', 'classes/background-color/bg-green-900', NULL, '2024-03-05 19:02:55', '2024-03-05 19:02:55', '.bg-green-900 { background-color: #22543d; }', '<div class="bg-green-900 h-5"></div>', '<div>
  <div class="bg-green-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (129, '.bg-blue-400', 'classes/background-color/bg-blue-400', NULL, '2024-03-05 19:03:00', '2024-03-05 19:03:00', '.bg-blue-400 { background-color: #63b3ed; }', '<div class="bg-blue-400 h-5"></div>', '<div>
  <div class="bg-blue-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (137, '.bg-indigo-300', 'classes/background-color/bg-indigo-300', NULL, '2024-03-05 19:03:03', '2024-03-05 19:03:03', '.bg-indigo-300 { background-color: #a3bffa; }', '<div class="bg-indigo-300 h-5"></div>', '<div>
  <div class="bg-indigo-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1309, '.text-gray-50', 'classes/text-color/text-gray-50', NULL, '2024-03-06 04:55:50', '2024-03-06 04:55:50', NULL, '    <p class="text-2xl text-gray-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-gray-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1319, '.translate-x-0', 'classes/transform/translate-x-0', NULL, '2024-03-06 04:55:53', '2024-03-06 04:55:53', '.translate-x-0 { --transform-translate-x: 0; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-0 transform bg-teal-400 h-6 w-6 text-center">0</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-0 transform bg-teal-400 h-6 w-6 text-center">
      0
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1327, '.translate-x-10', 'classes/transform/translate-x-10', NULL, '2024-03-06 04:55:56', '2024-03-06 04:55:56', '.translate-x-10 { --transform-translate-x: 2.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-10 transform bg-teal-400 h-6 w-6 text-center">10</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-10 transform bg-teal-400 h-6 w-6 text-center">
      10
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1335, '.translate-x-56', 'classes/transform/translate-x-56', NULL, '2024-03-06 04:55:59', '2024-03-06 04:55:59', '.translate-x-56 { --transform-translate-x: 14rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-56 transform bg-teal-400 h-6 w-6 text-center">56</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-56 transform bg-teal-400 h-6 w-6 text-center">
      56
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1347, '.translate-y-8', 'classes/transform/translate-y-8', NULL, '2024-03-06 04:56:04', '2024-03-06 04:56:04', '.translate-y-8 { --transform-translate-y: 2rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-8 transform bg-teal-400 h-6 w-6 text-center">8</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-8 transform bg-teal-400 h-6 w-6 text-center">
      8
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1359, '.translate-y-1%25_F2', 'classes/transform/translate-y-1%25_F2', NULL, '2024-03-06 04:56:09', '2024-03-06 04:56:09', '.translate-y-1/2 { --transform-translate-y: 50%; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-1/2 transform bg-teal-400 h-6 w-6 text-center">1/2</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-1/2 transform bg-teal-400 h-6 w-6 text-center">
      1/2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1367, '.-translate-x-8', 'classes/transform/-translate-x-8', NULL, '2024-03-06 04:56:12', '2024-03-06 04:56:12', '.-translate-x-8 { --transform-translate-x: -2rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-8 transform bg-teal-400 h-6 w-8 ml-auto text-center">-8</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-8 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -8
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1381, '.-translate-y-1', 'classes/transform/-translate-y-1', NULL, '2024-03-06 04:56:17', '2024-03-06 04:56:17', '.-translate-y-1 { --transform-translate-y: -0.25rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-1 transform bg-teal-400 h-6 w-8 mt-auto text-center">-1</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-1 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1389, '.-translate-y-12', 'classes/transform/-translate-y-12', NULL, '2024-03-06 04:56:20', '2024-03-06 04:56:20', '.-translate-y-12 { --transform-translate-y: -3rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-12 transform bg-teal-400 h-6 w-8 mt-auto text-center">-12</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-12 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -12
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (57, '.bg-repeat-space', 'classes/background/bg-repeat-space', NULL, '2024-03-05 19:02:33', '2024-03-09 18:03:46', '.bg-repeat-space { background-repeat: space; }', '<div class="bg-repeat-space bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-repeat-space bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (45, '.bg-left-top', 'classes/background/bg-left-top', NULL, '2024-03-05 19:02:29', '2024-03-09 18:03:46', '.bg-left-top { background-position: left top; }', '<div class="bg-left-top bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-left-top bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (54, '.bg-repeat-x', 'classes/background/bg-repeat-x', NULL, '2024-03-05 19:02:32', '2024-03-09 18:03:46', '.bg-repeat-x { background-repeat: repeat-x; }', '<div class="bg-repeat-x bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-repeat-x bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (67, '.bg-clip-text', 'classes/background-clip/bg-clip-text', NULL, '2024-03-05 19:02:36', '2024-03-05 19:02:36', NULL, '    <div class="text-4xl font-bold">
        <div class="bg-blue-100 p-4">
            <span class="bg-clip-text text-transparent bg-gradient-to-b from-yellow-300 to-purple-700">Text example</span>
        </div>
    </div>', '<div>
  <div class="text-4xl font-bold">
    <div class="bg-blue-100 p-4">
      <span class="bg-clip-text text-transparent bg-gradient-to-b from-yellow-300 to-purple-700">
        Text example
      </span>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (95, '.bg-orange-600', 'classes/background-color/bg-orange-600', NULL, '2024-03-05 19:02:47', '2024-03-05 19:02:47', '.bg-orange-600 { background-color: #dd6b20; }', '<div class="bg-orange-600 h-5"></div>', '<div>
  <div class="bg-orange-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (104, '.bg-yellow-600', 'classes/background-color/bg-yellow-600', NULL, '2024-03-05 19:02:51', '2024-03-05 19:02:51', '.bg-yellow-600 { background-color: #d69e2e; }', '<div class="bg-yellow-600 h-5"></div>', '<div>
  <div class="bg-yellow-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (111, '.bg-green-400', 'classes/background-color/bg-green-400', NULL, '2024-03-05 19:02:54', '2024-03-05 19:02:54', '.bg-green-400 { background-color: #68d391; }', '<div class="bg-green-400 h-5"></div>', '<div>
  <div class="bg-green-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (125, '.bg-teal-900', 'classes/background-color/bg-teal-900', NULL, '2024-03-05 19:02:59', '2024-03-05 19:02:59', '.bg-teal-900 { background-color: #234e52; }', '<div class="bg-teal-900 h-5"></div>', '<div>
  <div class="bg-teal-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (132, '.bg-blue-700', 'classes/background-color/bg-blue-700', NULL, '2024-03-05 19:03:02', '2024-03-05 19:03:02', '.bg-blue-700 { background-color: #2b6cb0; }', '<div class="bg-blue-700 h-5"></div>', '<div>
  <div class="bg-blue-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (145, '.bg-purple-200', 'classes/background-color/bg-purple-200', NULL, '2024-03-05 19:03:07', '2024-03-05 19:03:07', '.bg-purple-200 { background-color: #e9d8fd; }', '<div class="bg-purple-200 h-5"></div>', '<div>
  <div class="bg-purple-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1310, '.text-green-50', 'classes/text-color/text-green-50', NULL, '2024-03-06 04:55:50', '2024-03-06 04:55:50', NULL, '    <p class="text-2xl text-green-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-green-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1322, '.translate-x-3', 'classes/transform/translate-x-3', NULL, '2024-03-06 04:55:54', '2024-03-06 04:55:54', '.translate-x-3 { --transform-translate-x: 0.75rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-3 transform bg-teal-400 h-6 w-6 text-center">3</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-3 transform bg-teal-400 h-6 w-6 text-center">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1332, '.translate-x-32', 'classes/transform/translate-x-32', NULL, '2024-03-06 04:55:58', '2024-03-06 04:55:58', '.translate-x-32 { --transform-translate-x: 8rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-32 transform bg-teal-400 h-6 w-6 text-center">32</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-32 transform bg-teal-400 h-6 w-6 text-center">
      32
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1340, '.translate-y-0', 'classes/transform/translate-y-0', NULL, '2024-03-06 04:56:01', '2024-03-06 04:56:01', '.translate-y-0 { --transform-translate-y: 0; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-0 transform bg-teal-400 h-6 w-6 text-center">0</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-0 transform bg-teal-400 h-6 w-6 text-center">
      0
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1351, '.translate-y-20', 'classes/transform/translate-y-20', NULL, '2024-03-06 04:56:06', '2024-03-06 04:56:06', '.translate-y-20 { --transform-translate-y: 5rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-20 transform bg-teal-400 h-6 w-6 text-center">20</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-20 transform bg-teal-400 h-6 w-6 text-center">
      20
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1360, '.translate-y-full', 'classes/transform/translate-y-full', NULL, '2024-03-06 04:56:09', '2024-03-06 04:56:09', '.translate-y-full { --transform-translate-y: 100%; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-full transform bg-teal-400 h-6 w-6 text-center">full</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-full transform bg-teal-400 h-6 w-6 text-center">
      full
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1366, '.-translate-x-6', 'classes/transform/-translate-x-6', NULL, '2024-03-06 04:56:11', '2024-03-06 04:56:11', '.-translate-x-6 { --transform-translate-x: -1.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-6 transform bg-teal-400 h-6 w-8 ml-auto text-center">-6</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-6 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1380, '.-translate-x-full', 'classes/transform/-translate-x-full', NULL, '2024-03-06 04:56:17', '2024-03-06 04:56:17', '.-translate-x-full { --transform-translate-x: -100%; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-full transform bg-teal-400 h-6 w-8 ml-auto text-center">-full</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-full transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -full
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1385, '.-translate-y-5', 'classes/transform/-translate-y-5', NULL, '2024-03-06 04:56:18', '2024-03-06 04:56:18', '.-translate-y-5 { --transform-translate-y: -1.25rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-5 transform bg-teal-400 h-6 w-8 mt-auto text-center">-5</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-5 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -5
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1399, '.-translate-y-1%25_F2', 'classes/transform/-translate-y-1%25_F2', NULL, '2024-03-06 04:56:23', '2024-03-06 04:56:23', '.-translate-y-1/2 { --transform-translate-y: -50%; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-1/2 transform bg-teal-400 h-6 w-8 mt-auto text-center">-1/2</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-1/2 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -1/2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1405, '.scale-x-90', 'classes/transform/scale-x-90', NULL, '2024-03-06 04:56:25', '2024-03-06 04:56:25', '.scale-x-90 { --transform-scale-x: .9; }', '<div class="scale-x-90 transform bg-teal-400 p-4 m-6 inline-flex">90</div>', '<div>
  <div class="scale-x-90 transform bg-teal-400 p-4 m-6 inline-flex">
    90
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1414, '.scale-y-75', 'classes/transform/scale-y-75', NULL, '2024-03-06 04:56:29', '2024-03-06 04:56:29', '.scale-y-75 { --transform-scale-y: .75; }', '<div class="scale-y-75 transform bg-teal-400 p-4 m-6 inline-flex">75</div>', '<div>
  <div class="scale-y-75 transform bg-teal-400 p-4 m-6 inline-flex">
    75
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1417, '.scale-y-100', 'classes/transform/scale-y-100', NULL, '2024-03-06 04:56:30', '2024-03-06 04:56:30', '.scale-y-100 { --transform-scale-y: 1; }', '<div class="scale-y-100 transform bg-teal-400 p-4 m-6 inline-flex">100</div>', '<div>
  <div class="scale-y-100 transform bg-teal-400 p-4 m-6 inline-flex">
    100
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1441, '.-skew-y-6', 'classes/transform/-skew-y-6', NULL, '2024-03-06 04:56:39', '2024-03-06 04:56:39', '.-skew-y-6 { --transform-skew-y: -6deg; }', '<div class="-skew-y-6 transform bg-teal-400 p-4 m-4 inline-flex">-6</div>', '<div>
  <div class="-skew-y-6 transform bg-teal-400 p-4 m-4 inline-flex">
    -6
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (69, '.bg-current', 'classes/background-color/bg-current', NULL, '2024-03-05 19:02:37', '2024-03-05 19:02:37', '.bg-current { background-color: currentColor; }', '<div class="bg-current h-5"></div>', '<div>
  <div class="bg-current h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (73, '.bg-gray-200', 'classes/background-color/bg-gray-200', NULL, '2024-03-05 19:02:39', '2024-03-05 19:02:39', '.bg-gray-200 { background-color: #edf2f7; }', '<div class="bg-gray-200 h-5"></div>', '<div>
  <div class="bg-gray-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (84, '.bg-red-400', 'classes/background-color/bg-red-400', NULL, '2024-03-05 19:02:43', '2024-03-05 19:02:43', '.bg-red-400 { background-color: #fc8181; }', '<div class="bg-red-400 h-5"></div>', '<div>
  <div class="bg-red-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (97, '.bg-orange-800', 'classes/background-color/bg-orange-800', NULL, '2024-03-05 19:02:48', '2024-03-05 19:02:48', '.bg-orange-800 { background-color: #9c4221; }', '<div class="bg-orange-800 h-5"></div>', '<div>
  <div class="bg-orange-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (105, '.bg-yellow-700', 'classes/background-color/bg-yellow-700', NULL, '2024-03-05 19:02:51', '2024-03-05 19:02:51', '.bg-yellow-700 { background-color: #b7791f; }', '<div class="bg-yellow-700 h-5"></div>', '<div>
  <div class="bg-yellow-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (114, '.bg-green-700', 'classes/background-color/bg-green-700', NULL, '2024-03-05 19:02:55', '2024-03-05 19:02:55', '.bg-green-700 { background-color: #2f855a; }', '<div class="bg-green-700 h-5"></div>', '<div>
  <div class="bg-green-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (121, '.bg-teal-500', 'classes/background-color/bg-teal-500', NULL, '2024-03-05 19:02:57', '2024-03-05 19:02:57', '.bg-teal-500 { background-color: #38b2ac; }', '<div class="bg-teal-500 h-5"></div>', '<div>
  <div class="bg-teal-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (135, '.bg-indigo-100', 'classes/background-color/bg-indigo-100', NULL, '2024-03-05 19:03:03', '2024-03-05 19:03:03', '.bg-indigo-100 { background-color: #ebf4ff; }', '<div class="bg-indigo-100 h-5"></div>', '<div>
  <div class="bg-indigo-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (142, '.bg-indigo-800', 'classes/background-color/bg-indigo-800', NULL, '2024-03-05 19:03:06', '2024-03-05 19:03:06', '.bg-indigo-800 { background-color: #434190; }', '<div class="bg-indigo-800 h-5"></div>', '<div>
  <div class="bg-indigo-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1311, '.text-indigo-50', 'classes/text-color/text-indigo-50', NULL, '2024-03-06 04:55:51', '2024-03-06 04:55:51', NULL, '    <p class="text-2xl text-indigo-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-indigo-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1321, '.translate-x-2', 'classes/transform/translate-x-2', NULL, '2024-03-06 04:55:54', '2024-03-06 04:55:54', '.translate-x-2 { --transform-translate-x: 0.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-2 transform bg-teal-400 h-6 w-6 text-center">2</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-2 transform bg-teal-400 h-6 w-6 text-center">
      2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1330, '.translate-x-20', 'classes/transform/translate-x-20', NULL, '2024-03-06 04:55:57', '2024-03-06 04:55:57', '.translate-x-20 { --transform-translate-x: 5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-20 transform bg-teal-400 h-6 w-6 text-center">20</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-20 transform bg-teal-400 h-6 w-6 text-center">
      20
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1342, '.translate-y-2', 'classes/transform/translate-y-2', NULL, '2024-03-06 04:56:02', '2024-03-06 04:56:02', '.translate-y-2 { --transform-translate-y: 0.5rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-2 transform bg-teal-400 h-6 w-6 text-center">2</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-2 transform bg-teal-400 h-6 w-6 text-center">
      2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1353, '.translate-y-32', 'classes/transform/translate-y-32', NULL, '2024-03-06 04:56:07', '2024-03-06 04:56:07', '.translate-y-32 { --transform-translate-y: 8rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-32 transform bg-teal-400 h-6 w-6 text-center">32</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-32 transform bg-teal-400 h-6 w-6 text-center">
      32
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1362, '.-translate-x-2', 'classes/transform/-translate-x-2', NULL, '2024-03-06 04:56:10', '2024-03-06 04:56:10', '.-translate-x-2 { --transform-translate-x: -0.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-2 transform bg-teal-400 h-6 w-8 ml-auto text-center">-2</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-2 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1371, '.-translate-x-20', 'classes/transform/-translate-x-20', NULL, '2024-03-06 04:56:13', '2024-03-06 04:56:13', '.-translate-x-20 { --transform-translate-x: -5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-20 transform bg-teal-400 h-6 w-8 ml-auto text-center">-20</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-20 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -20
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1378, '.-translate-x-px', 'classes/transform/-translate-x-px', NULL, '2024-03-06 04:56:16', '2024-03-06 04:56:16', '.-translate-x-px { --transform-translate-x: -1px; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-px transform bg-teal-400 h-6 w-8 ml-auto text-center">-px</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-px transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -px
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1392, '.-translate-y-24', 'classes/transform/-translate-y-24', NULL, '2024-03-06 04:56:21', '2024-03-06 04:56:21', '.-translate-y-24 { --transform-translate-y: -6rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-24 transform bg-teal-400 h-6 w-8 mt-auto text-center">-24</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-24 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -24
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1397, '.-translate-y-64', 'classes/transform/-translate-y-64', NULL, '2024-03-06 04:56:22', '2024-03-06 04:56:22', '.-translate-y-64 { --transform-translate-y: -16rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-64 transform bg-teal-400 h-6 w-8 mt-auto text-center">-64</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-64 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -64
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1408, '.scale-x-105', 'classes/transform/scale-x-105', NULL, '2024-03-06 04:56:27', '2024-03-06 04:56:27', '.scale-x-105 { --transform-scale-x: 1.05; }', '<div class="scale-x-105 transform bg-teal-400 p-4 m-6 inline-flex">105</div>', '<div>
  <div class="scale-x-105 transform bg-teal-400 p-4 m-6 inline-flex">
    105
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1411, '.scale-x-150', 'classes/transform/scale-x-150', NULL, '2024-03-06 04:56:28', '2024-03-06 04:56:28', '.scale-x-150 { --transform-scale-x: 1.5; }', '<div class="scale-x-150 transform bg-teal-400 p-4 m-6 inline-flex">150</div>', '<div>
  <div class="scale-x-150 transform bg-teal-400 p-4 m-6 inline-flex">
    150
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1426, '.-rotate-45', 'classes/transform/-rotate-45', NULL, '2024-03-06 04:56:33', '2024-03-06 04:56:33', '.-rotate-45 { --transform-rotate: -45deg; }', '<div class="-rotate-45 transform bg-teal-400 p-4 m-6 inline-flex">-45</div>', '<div>
  <div class="-rotate-45 transform bg-teal-400 p-4 m-6 inline-flex">
    -45
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (70, '.bg-black', 'classes/background-color/bg-black', NULL, '2024-03-05 19:02:37', '2024-03-05 19:02:37', '.bg-black { background-color: #000; }', '<div class="bg-black h-5"></div>', '<div>
  <div class="bg-black h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (77, '.bg-gray-600', 'classes/background-color/bg-gray-600', NULL, '2024-03-05 19:02:40', '2024-03-05 19:02:40', '.bg-gray-600 { background-color: #718096; }', '<div class="bg-gray-600 h-5"></div>', '<div>
  <div class="bg-gray-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (86, '.bg-red-600', 'classes/background-color/bg-red-600', NULL, '2024-03-05 19:02:44', '2024-03-05 19:02:44', '.bg-red-600 { background-color: #e53e3e; }', '<div class="bg-red-600 h-5"></div>', '<div>
  <div class="bg-red-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (99, '.bg-yellow-100', 'classes/background-color/bg-yellow-100', NULL, '2024-03-05 19:02:49', '2024-03-05 19:02:49', '.bg-yellow-100 { background-color: #fffff0; }', '<div class="bg-yellow-100 h-5"></div>', '<div>
  <div class="bg-yellow-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (107, '.bg-yellow-900', 'classes/background-color/bg-yellow-900', NULL, '2024-03-05 19:02:52', '2024-03-05 19:02:52', '.bg-yellow-900 { background-color: #744210; }', '<div class="bg-yellow-900 h-5"></div>', '<div>
  <div class="bg-yellow-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (119, '.bg-teal-300', 'classes/background-color/bg-teal-300', NULL, '2024-03-05 19:02:57', '2024-03-05 19:02:57', '.bg-teal-300 { background-color: #81e6d9; }', '<div class="bg-teal-300 h-5"></div>', '<div>
  <div class="bg-teal-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (126, '.bg-blue-100', 'classes/background-color/bg-blue-100', NULL, '2024-03-05 19:02:59', '2024-03-05 19:02:59', '.bg-blue-100 { background-color: #ebf8ff; }', '<div class="bg-blue-100 h-5"></div>', '<div>
  <div class="bg-blue-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (139, '.bg-indigo-500', 'classes/background-color/bg-indigo-500', NULL, '2024-03-05 19:03:04', '2024-03-05 19:03:04', '.bg-indigo-500 { background-color: #667eea; }', '<div class="bg-indigo-500 h-5"></div>', '<div>
  <div class="bg-indigo-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (146, '.bg-purple-300', 'classes/background-color/bg-purple-300', NULL, '2024-03-05 19:03:07', '2024-03-05 19:03:07', '.bg-purple-300 { background-color: #d6bcfa; }', '<div class="bg-purple-300 h-5"></div>', '<div>
  <div class="bg-purple-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1312, '.text-opacity-10', 'classes/text-color/text-opacity-10', NULL, '2024-03-06 04:55:51', '2024-03-06 04:55:51', NULL, '    <p class="text-2xl text-blue-700 text-opacity-10 bg-blue-100">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-blue-700 text-opacity-10 bg-blue-100">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1320, '.translate-x-1', 'classes/transform/translate-x-1', NULL, '2024-03-06 04:55:54', '2024-03-06 04:55:54', '.translate-x-1 { --transform-translate-x: 0.25rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-1 transform bg-teal-400 h-6 w-6 text-center">1</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-1 transform bg-teal-400 h-6 w-6 text-center">
      1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1329, '.translate-x-16', 'classes/transform/translate-x-16', NULL, '2024-03-06 04:55:57', '2024-03-06 04:55:57', '.translate-x-16 { --transform-translate-x: 4rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-16 transform bg-teal-400 h-6 w-6 text-center">16</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-16 transform bg-teal-400 h-6 w-6 text-center">
      16
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1341, '.translate-y-1', 'classes/transform/translate-y-1', NULL, '2024-03-06 04:56:02', '2024-03-06 04:56:02', '.translate-y-1 { --transform-translate-y: 0.25rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-1 transform bg-teal-400 h-6 w-6 text-center">1</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-1 transform bg-teal-400 h-6 w-6 text-center">
      1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1349, '.translate-y-12', 'classes/transform/translate-y-12', NULL, '2024-03-06 04:56:05', '2024-03-06 04:56:05', '.translate-y-12 { --transform-translate-y: 3rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-12 transform bg-teal-400 h-6 w-6 text-center">12</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-12 transform bg-teal-400 h-6 w-6 text-center">
      12
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1357, '.translate-y-64', 'classes/transform/translate-y-64', NULL, '2024-03-06 04:56:08', '2024-03-06 04:56:08', '.translate-y-64 { --transform-translate-y: 16rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-64 transform bg-teal-400 h-6 w-6 text-center">64</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-64 transform bg-teal-400 h-6 w-6 text-center">
      64
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1376, '.-translate-x-56', 'classes/transform/-translate-x-56', NULL, '2024-03-06 04:56:15', '2024-03-06 04:56:15', '.-translate-x-56 { --transform-translate-x: -14rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-56 transform bg-teal-400 h-6 w-8 ml-auto text-center">-56</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-56 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -56
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1383, '.-translate-y-3', 'classes/transform/-translate-y-3', NULL, '2024-03-06 04:56:18', '2024-03-06 04:56:18', '.-translate-y-3 { --transform-translate-y: -0.75rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-3 transform bg-teal-400 h-6 w-8 mt-auto text-center">-3</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-3 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1394, '.-translate-y-40', 'classes/transform/-translate-y-40', NULL, '2024-03-06 04:56:21', '2024-03-06 04:56:21', '.-translate-y-40 { --transform-translate-y: -10rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-40 transform bg-teal-400 h-6 w-8 mt-auto text-center">-40</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-40 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -40
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1400, '.-translate-y-full', 'classes/transform/-translate-y-full', NULL, '2024-03-06 04:56:24', '2024-03-06 04:56:24', '.-translate-y-full { --transform-translate-y: -100%; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-full transform bg-teal-400 h-6 w-8 mt-auto text-center">-full</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-full transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -full
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1424, '.rotate-90', 'classes/transform/rotate-90', NULL, '2024-03-06 04:56:32', '2024-03-06 04:56:32', '.rotate-90 { --transform-rotate: 90deg; }', '<div class="rotate-90 transform bg-teal-400 p-4 m-6 inline-flex">90</div>', '<div>
  <div class="rotate-90 transform bg-teal-400 p-4 m-6 inline-flex">
    90
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1443, '.diagonal-fractions', 'classes/transform/diagonal-fractions', NULL, '2024-03-06 04:56:39', '2024-03-06 04:56:39', NULL, '    <p class="text-2xl diagonal-fractions">1/2 2/3 3/4</p>', '<div>
  <p class="text-2xl diagonal-fractions">
    1/2 2/3 3/4
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1446, '.skew-x-2', 'classes/transform/skew-x-2', NULL, '2024-03-06 04:56:40', '2024-03-06 04:56:40', NULL, '    <div class="skew-x-2 transform bg-teal-400 p-4 m-4inline-flex">2</div>', '<div>
  <div class="skew-x-2 transform bg-teal-400 p-4 m-4inline-flex">
    2
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (74, '.bg-gray-300', 'classes/background-color/bg-gray-300', NULL, '2024-03-05 19:02:39', '2024-03-05 19:02:39', '.bg-gray-300 { background-color: #e2e8f0; }', '<div class="bg-gray-300 h-5"></div>', '<div>
  <div class="bg-gray-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (83, '.bg-red-300', 'classes/background-color/bg-red-300', NULL, '2024-03-05 19:02:43', '2024-03-05 19:02:43', '.bg-red-300 { background-color: #feb2b2; }', '<div class="bg-red-300 h-5"></div>', '<div>
  <div class="bg-red-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (91, '.bg-orange-200', 'classes/background-color/bg-orange-200', NULL, '2024-03-05 19:02:46', '2024-03-05 19:02:46', '.bg-orange-200 { background-color: #feebc8; }', '<div class="bg-orange-200 h-5"></div>', '<div>
  <div class="bg-orange-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (98, '.bg-orange-900', 'classes/background-color/bg-orange-900', NULL, '2024-03-05 19:02:49', '2024-03-05 19:02:49', '.bg-orange-900 { background-color: #7b341e; }', '<div class="bg-orange-900 h-5"></div>', '<div>
  <div class="bg-orange-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (106, '.bg-yellow-800', 'classes/background-color/bg-yellow-800', NULL, '2024-03-05 19:02:52', '2024-03-05 19:02:52', '.bg-yellow-800 { background-color: #975a16; }', '<div class="bg-yellow-800 h-5"></div>', '<div>
  <div class="bg-yellow-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (118, '.bg-teal-200', 'classes/background-color/bg-teal-200', NULL, '2024-03-05 19:02:56', '2024-03-05 19:02:56', '.bg-teal-200 { background-color: #b2f5ea; }', '<div class="bg-teal-200 h-5"></div>', '<div>
  <div class="bg-teal-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (122, '.bg-teal-600', 'classes/background-color/bg-teal-600', NULL, '2024-03-05 19:02:58', '2024-03-05 19:02:58', '.bg-teal-600 { background-color: #319795; }', '<div class="bg-teal-600 h-5"></div>', '<div>
  <div class="bg-teal-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (136, '.bg-indigo-200', 'classes/background-color/bg-indigo-200', NULL, '2024-03-05 19:03:03', '2024-03-05 19:03:03', '.bg-indigo-200 { background-color: #c3dafe; }', '<div class="bg-indigo-200 h-5"></div>', '<div>
  <div class="bg-indigo-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (143, '.bg-indigo-900', 'classes/background-color/bg-indigo-900', NULL, '2024-03-05 19:03:06', '2024-03-05 19:03:06', '.bg-indigo-900 { background-color: #3c366b; }', '<div class="bg-indigo-900 h-5"></div>', '<div>
  <div class="bg-indigo-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1313, '.text-pink-50', 'classes/text-color/text-pink-50', NULL, '2024-03-06 04:55:51', '2024-03-06 04:55:51', NULL, '    <p class="text-2xl text-pink-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-pink-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1325, '.translate-x-6', 'classes/transform/translate-x-6', NULL, '2024-03-06 04:55:56', '2024-03-06 04:55:56', '.translate-x-6 { --transform-translate-x: 1.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-6 transform bg-teal-400 h-6 w-6 text-center">6</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-6 transform bg-teal-400 h-6 w-6 text-center">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1333, '.translate-x-40', 'classes/transform/translate-x-40', NULL, '2024-03-06 04:55:59', '2024-03-06 04:55:59', '.translate-x-40 { --transform-translate-x: 10rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-40 transform bg-teal-400 h-6 w-6 text-center">40</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-40 transform bg-teal-400 h-6 w-6 text-center">
      40
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1345, '.translate-y-5', 'classes/transform/translate-y-5', NULL, '2024-03-06 04:56:04', '2024-03-06 04:56:04', '.translate-y-5 { --transform-translate-y: 1.25rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-5 transform bg-teal-400 h-6 w-6 text-center">5</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-5 transform bg-teal-400 h-6 w-6 text-center">
      5
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1354, '.translate-y-40', 'classes/transform/translate-y-40', NULL, '2024-03-06 04:56:07', '2024-03-06 04:56:07', '.translate-y-40 { --transform-translate-y: 10rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-40 transform bg-teal-400 h-6 w-6 text-center">40</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-40 transform bg-teal-400 h-6 w-6 text-center">
      40
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1361, '.-translate-x-1', 'classes/transform/-translate-x-1', NULL, '2024-03-06 04:56:10', '2024-03-06 04:56:10', '.-translate-x-1 { --transform-translate-x: -0.25rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-1 transform bg-teal-400 h-6 w-8 ml-auto text-center">-1</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-1 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1370, '.-translate-x-16', 'classes/transform/-translate-x-16', NULL, '2024-03-06 04:56:13', '2024-03-06 04:56:13', '.-translate-x-16 { --transform-translate-x: -4rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-16 transform bg-teal-400 h-6 w-8 ml-auto text-center">-16</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-16 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -16
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1374, '.-translate-x-40', 'classes/transform/-translate-x-40', NULL, '2024-03-06 04:56:14', '2024-03-06 04:56:14', '.-translate-x-40 { --transform-translate-x: -10rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-40 transform bg-teal-400 h-6 w-8 ml-auto text-center">-40</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-40 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -40
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1388, '.-translate-y-10', 'classes/transform/-translate-y-10', NULL, '2024-03-06 04:56:19', '2024-03-06 04:56:19', '.-translate-y-10 { --transform-translate-y: -2.5rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-10 transform bg-teal-400 h-6 w-8 mt-auto text-center">-10</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-10 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -10
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1396, '.-translate-y-56', 'classes/transform/-translate-y-56', NULL, '2024-03-06 04:56:22', '2024-03-06 04:56:22', '.-translate-y-56 { --transform-translate-y: -14rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-56 transform bg-teal-400 h-6 w-8 mt-auto text-center">-56</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-56 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -56
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1420, '.scale-y-125', 'classes/transform/scale-y-125', NULL, '2024-03-06 04:56:31', '2024-03-06 04:56:31', '.scale-y-125 { --transform-scale-y: 1.25; }', '<div class="scale-y-125 transform bg-teal-400 p-4 m-6 inline-flex">125</div>', '<div>
  <div class="scale-y-125 transform bg-teal-400 p-4 m-6 inline-flex">
    125
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1422, '.rotate-0', 'classes/transform/rotate-0', NULL, '2024-03-06 04:56:32', '2024-03-06 04:56:32', '.rotate-0 { --transform-rotate: 0; }', '<div class="rotate-0 transform bg-teal-400 p-4 m-6 inline-flex">0</div>', '<div>
  <div class="rotate-0 transform bg-teal-400 p-4 m-6 inline-flex">
    0
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1431, '.skew-x-6', 'classes/transform/skew-x-6', NULL, '2024-03-06 04:56:35', '2024-03-06 04:56:35', '.skew-x-6 { --transform-skew-x: 6deg; }', '<div class="skew-x-6 transform bg-teal-400 p-4 m-4 inline-flex">6</div>', '<div>
  <div class="skew-x-6 transform bg-teal-400 p-4 m-4 inline-flex">
    6
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (96, '.bg-orange-700', 'classes/background-color/bg-orange-700', NULL, '2024-03-05 19:02:48', '2024-03-05 19:02:48', '.bg-orange-700 { background-color: #c05621; }', '<div class="bg-orange-700 h-5"></div>', '<div>
  <div class="bg-orange-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (113, '.bg-green-600', 'classes/background-color/bg-green-600', NULL, '2024-03-05 19:02:54', '2024-03-05 19:02:54', '.bg-green-600 { background-color: #38a169; }', '<div class="bg-green-600 h-5"></div>', '<div>
  <div class="bg-green-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (117, '.bg-teal-100', 'classes/background-color/bg-teal-100', NULL, '2024-03-05 19:02:56', '2024-03-05 19:02:56', '.bg-teal-100 { background-color: #e6fffa; }', '<div class="bg-teal-100 h-5"></div>', '<div>
  <div class="bg-teal-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (130, '.bg-blue-500', 'classes/background-color/bg-blue-500', NULL, '2024-03-05 19:03:01', '2024-03-05 19:03:01', '.bg-blue-500 { background-color: #4299e1; }', '<div class="bg-blue-500 h-5"></div>', '<div>
  <div class="bg-blue-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (138, '.bg-indigo-400', 'classes/background-color/bg-indigo-400', NULL, '2024-03-05 19:03:04', '2024-03-05 19:03:04', '.bg-indigo-400 { background-color: #7f9cf5; }', '<div class="bg-indigo-400 h-5"></div>', '<div>
  <div class="bg-indigo-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1314, '.text-purple-50', 'classes/text-color/text-purple-50', NULL, '2024-03-06 04:55:52', '2024-03-06 04:55:52', NULL, '    <p class="text-2xl text-purple-50">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl text-purple-50">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1324, '.translate-x-5', 'classes/transform/translate-x-5', NULL, '2024-03-06 04:55:55', '2024-03-06 04:55:55', '.translate-x-5 { --transform-translate-x: 1.25rem; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-5 transform bg-teal-400 h-6 w-6 text-center">5</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-5 transform bg-teal-400 h-6 w-6 text-center">
      5
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1337, '.translate-x-px', 'classes/transform/translate-x-px', NULL, '2024-03-06 04:56:00', '2024-03-06 04:56:00', '.translate-x-px { --transform-translate-x: 1px; }', '<div class="bg-gray-300 w-64 h-6 m-2"><div class="translate-x-px transform bg-teal-400 h-6 w-6 text-center">px</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-px transform bg-teal-400 h-6 w-6 text-center">
      px
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1344, '.translate-y-4', 'classes/transform/translate-y-4', NULL, '2024-03-06 04:56:03', '2024-03-06 04:56:03', '.translate-y-4 { --transform-translate-y: 1rem; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-4 transform bg-teal-400 h-6 w-6 text-center">4</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-4 transform bg-teal-400 h-6 w-6 text-center">
      4
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1358, '.translate-y-px', 'classes/transform/translate-y-px', NULL, '2024-03-06 04:56:08', '2024-03-06 04:56:08', '.translate-y-px { --transform-translate-y: 1px; }', '<div class="bg-gray-300 h-64 w-6 m-2 inline-flex"><div class="translate-y-px transform bg-teal-400 h-6 w-6 text-center">px</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-6 m-2 inline-flex">
    <div class="translate-y-px transform bg-teal-400 h-6 w-6 text-center">
      px
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1365, '.-translate-x-5', 'classes/transform/-translate-x-5', NULL, '2024-03-06 04:56:11', '2024-03-06 04:56:11', '.-translate-x-5 { --transform-translate-x: -1.25rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-5 transform bg-teal-400 h-6 w-8 ml-auto text-center">-5</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-5 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -5
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1372, '.-translate-x-24', 'classes/transform/-translate-x-24', NULL, '2024-03-06 04:56:14', '2024-03-06 04:56:14', '.-translate-x-24 { --transform-translate-x: -6rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-24 transform bg-teal-400 h-6 w-8 ml-auto text-center">-24</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-24 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -24
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1386, '.-translate-y-6', 'classes/transform/-translate-y-6', NULL, '2024-03-06 04:56:19', '2024-03-06 04:56:19', '.-translate-y-6 { --transform-translate-y: -1.5rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-6 transform bg-teal-400 h-6 w-8 mt-auto text-center">-6</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-6 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1391, '.-translate-y-20', 'classes/transform/-translate-y-20', NULL, '2024-03-06 04:56:20', '2024-03-06 04:56:20', '.-translate-y-20 { --transform-translate-y: -5rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-20 transform bg-teal-400 h-6 w-8 mt-auto text-center">-20</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-20 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -20
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1409, '.scale-x-110', 'classes/transform/scale-x-110', NULL, '2024-03-06 04:56:27', '2024-03-06 04:56:27', '.scale-x-110 { --transform-scale-x: 1.1; }', '<div class="scale-x-110 transform bg-teal-400 p-4 m-6 inline-flex">110</div>', '<div>
  <div class="scale-x-110 transform bg-teal-400 p-4 m-6 inline-flex">
    110
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1412, '.scale-y-0', 'classes/transform/scale-y-0', NULL, '2024-03-06 04:56:28', '2024-03-06 04:56:28', '.scale-y-0 { --transform-scale-y: 0; }', '<div class="scale-y-0 transform bg-teal-400 p-4 m-6 inline-flex">0</div>', '<div>
  <div class="scale-y-0 transform bg-teal-400 p-4 m-6 inline-flex">
    0
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1440, '.-skew-y-3', 'classes/transform/-skew-y-3', NULL, '2024-03-06 04:56:38', '2024-03-06 04:56:38', '.-skew-y-3 { --transform-skew-y: -3deg; }', '<div class="-skew-y-3 transform bg-teal-400 p-4 m-4 inline-flex">-3</div>', '<div>
  <div class="-skew-y-3 transform bg-teal-400 p-4 m-4 inline-flex">
    -3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1458, '.cursor-move', 'classes/utilities/cursor-move', NULL, '2024-03-06 04:56:45', '2024-03-06 04:56:45', '.cursor-move { cursor: move; }', '<div class="cursor-move bg-teal-400 text-center w-64 py-4 m-2">Move</div>', '<div>
  <div class="cursor-move bg-teal-400 text-center w-64 py-4 m-2">
    Move
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1460, '.cursor-text', 'classes/utilities/cursor-text', NULL, '2024-03-06 04:56:46', '2024-03-06 04:56:46', '.cursor-text { cursor: text; }', '<div class="cursor-text bg-teal-400 text-center w-64 py-4 m-2">Text</div>', '<div>
  <div class="cursor-text bg-teal-400 text-center w-64 py-4 m-2">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (102, '.bg-yellow-400', 'classes/background-color/bg-yellow-400', NULL, '2024-03-05 19:02:50', '2024-03-05 19:02:50', '.bg-yellow-400 { background-color: #f6e05e; }', '<div class="bg-yellow-400 h-5"></div>', '<div>
  <div class="bg-yellow-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (115, '.bg-green-800', 'classes/background-color/bg-green-800', NULL, '2024-03-05 19:02:55', '2024-03-05 19:02:55', '.bg-green-800 { background-color: #276749; }', '<div class="bg-green-800 h-5"></div>', '<div>
  <div class="bg-green-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (120, '.bg-teal-400', 'classes/background-color/bg-teal-400', NULL, '2024-03-05 19:02:57', '2024-03-05 19:02:57', '.bg-teal-400 { background-color: #4fd1c5; }', '<div class="bg-teal-400 h-5"></div>', '<div>
  <div class="bg-teal-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (134, '.bg-blue-900', 'classes/background-color/bg-blue-900', NULL, '2024-03-05 19:03:02', '2024-03-05 19:03:02', '.bg-blue-900 { background-color: #2a4365; }', '<div class="bg-blue-900 h-5"></div>', '<div>
  <div class="bg-blue-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (141, '.bg-indigo-700', 'classes/background-color/bg-indigo-700', NULL, '2024-03-05 19:03:05', '2024-03-05 19:03:05', '.bg-indigo-700 { background-color: #4c51bf; }', '<div class="bg-indigo-700 h-5"></div>', '<div>
  <div class="bg-indigo-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (147, '.bg-purple-400', 'classes/background-color/bg-purple-400', NULL, '2024-03-05 19:03:08', '2024-03-05 19:03:08', '.bg-purple-400 { background-color: #b794f4; }', '<div class="bg-purple-400 h-5"></div>', '<div>
  <div class="bg-purple-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (148, '.bg-purple-500', 'classes/background-color/bg-purple-500', NULL, '2024-03-05 19:03:08', '2024-03-05 19:03:08', '.bg-purple-500 { background-color: #9f7aea; }', '<div class="bg-purple-500 h-5"></div>', '<div>
  <div class="bg-purple-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (149, '.bg-purple-600', 'classes/background-color/bg-purple-600', NULL, '2024-03-05 19:03:08', '2024-03-05 19:03:08', '.bg-purple-600 { background-color: #805ad5; }', '<div class="bg-purple-600 h-5"></div>', '<div>
  <div class="bg-purple-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (150, '.bg-purple-700', 'classes/background-color/bg-purple-700', NULL, '2024-03-05 19:03:09', '2024-03-05 19:03:09', '.bg-purple-700 { background-color: #6b46c1; }', '<div class="bg-purple-700 h-5"></div>', '<div>
  <div class="bg-purple-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (151, '.bg-purple-800', 'classes/background-color/bg-purple-800', NULL, '2024-03-05 19:03:09', '2024-03-05 19:03:09', '.bg-purple-800 { background-color: #553c9a; }', '<div class="bg-purple-800 h-5"></div>', '<div>
  <div class="bg-purple-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (152, '.bg-purple-900', 'classes/background-color/bg-purple-900', NULL, '2024-03-05 19:03:10', '2024-03-05 19:03:10', '.bg-purple-900 { background-color: #44337a; }', '<div class="bg-purple-900 h-5"></div>', '<div>
  <div class="bg-purple-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (153, '.bg-pink-100', 'classes/background-color/bg-pink-100', NULL, '2024-03-05 19:03:10', '2024-03-05 19:03:10', '.bg-pink-100 { background-color: #fff5f7; }', '<div class="bg-pink-100 h-5"></div>', '<div>
  <div class="bg-pink-100 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (154, '.bg-pink-200', 'classes/background-color/bg-pink-200', NULL, '2024-03-05 19:03:10', '2024-03-05 19:03:10', '.bg-pink-200 { background-color: #fed7e2; }', '<div class="bg-pink-200 h-5"></div>', '<div>
  <div class="bg-pink-200 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (155, '.bg-pink-300', 'classes/background-color/bg-pink-300', NULL, '2024-03-05 19:03:11', '2024-03-05 19:03:11', '.bg-pink-300 { background-color: #fbb6ce; }', '<div class="bg-pink-300 h-5"></div>', '<div>
  <div class="bg-pink-300 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (156, '.bg-pink-400', 'classes/background-color/bg-pink-400', NULL, '2024-03-05 19:03:11', '2024-03-05 19:03:11', '.bg-pink-400 { background-color: #f687b3; }', '<div class="bg-pink-400 h-5"></div>', '<div>
  <div class="bg-pink-400 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (157, '.bg-pink-500', 'classes/background-color/bg-pink-500', NULL, '2024-03-05 19:03:12', '2024-03-05 19:03:12', '.bg-pink-500 { background-color: #ed64a6; }', '<div class="bg-pink-500 h-5"></div>', '<div>
  <div class="bg-pink-500 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (158, '.bg-pink-600', 'classes/background-color/bg-pink-600', NULL, '2024-03-05 19:03:12', '2024-03-05 19:03:12', '.bg-pink-600 { background-color: #d53f8c; }', '<div class="bg-pink-600 h-5"></div>', '<div>
  <div class="bg-pink-600 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (159, '.bg-pink-700', 'classes/background-color/bg-pink-700', NULL, '2024-03-05 19:03:12', '2024-03-05 19:03:12', '.bg-pink-700 { background-color: #b83280; }', '<div class="bg-pink-700 h-5"></div>', '<div>
  <div class="bg-pink-700 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (160, '.bg-pink-800', 'classes/background-color/bg-pink-800', NULL, '2024-03-05 19:03:13', '2024-03-05 19:03:13', '.bg-pink-800 { background-color: #97266d; }', '<div class="bg-pink-800 h-5"></div>', '<div>
  <div class="bg-pink-800 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (161, '.bg-pink-900', 'classes/background-color/bg-pink-900', NULL, '2024-03-05 19:03:13', '2024-03-05 19:03:13', '.bg-pink-900 { background-color: #702459; }', '<div class="bg-pink-900 h-5"></div>', '<div>
  <div class="bg-pink-900 h-5">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (162, '.bg-gradient-to-b', 'classes/background-gradient/bg-gradient-to-b', NULL, '2024-03-05 19:03:13', '2024-03-05 19:03:13', NULL, '    <div class="inline-block p-6 bg-gradient-to-b from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-b from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (163, '.bg-gradient-to-bl', 'classes/background-gradient/bg-gradient-to-bl', NULL, '2024-03-05 19:03:14', '2024-03-05 19:03:14', NULL, '    <div class="inline-block p-6 bg-gradient-to-bl from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-bl from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (164, '.bg-gradient-to-br', 'classes/background-gradient/bg-gradient-to-br', NULL, '2024-03-05 19:03:14', '2024-03-05 19:03:14', NULL, '    <div class="inline-block p-6 bg-gradient-to-br from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-br from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (165, '.bg-gradient-to-l', 'classes/background-gradient/bg-gradient-to-l', NULL, '2024-03-05 19:03:14', '2024-03-05 19:03:14', NULL, '    <div class="inline-block p-6 bg-gradient-to-l from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-l from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (166, '.bg-gradient-to-r', 'classes/background-gradient/bg-gradient-to-r', NULL, '2024-03-05 19:03:15', '2024-03-05 19:03:15', NULL, '    <div class="inline-block p-6 bg-gradient-to-r from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-r from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (167, '.bg-gradient-to-t', 'classes/background-gradient/bg-gradient-to-t', NULL, '2024-03-05 19:03:15', '2024-03-05 19:03:15', NULL, '    <div class="inline-block p-6 bg-gradient-to-t from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-t from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (168, '.bg-gradient-to-tl', 'classes/background-gradient/bg-gradient-to-tl', NULL, '2024-03-05 19:03:15', '2024-03-05 19:03:15', NULL, '    <div class="inline-block p-6 bg-gradient-to-tl from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-tl from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (169, '.bg-gradient-to-tr', 'classes/background-gradient/bg-gradient-to-tr', NULL, '2024-03-05 19:03:16', '2024-03-05 19:03:16', NULL, '    <div class="inline-block p-6 bg-gradient-to-tr from-green-400 to-blue-400"></div>', '<div>
  <div class="inline-block p-6 bg-gradient-to-tr from-green-400 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (170, '.from-blue-100', 'classes/background-gradient/from-blue-100', NULL, '2024-03-05 19:03:16', '2024-03-05 19:03:16', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-100 to-yellow-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-100 to-yellow-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (171, '.from-current', 'classes/background-gradient/from-current', NULL, '2024-03-05 19:03:16', '2024-03-05 19:03:16', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-current to-gray-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-current to-gray-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (175, '.from-purple-100', 'classes/background-gradient/from-purple-100', NULL, '2024-03-05 19:03:18', '2024-03-05 19:03:18', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-purple-100 to-black"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-purple-100 to-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (192, '.to-yellow-100', 'classes/background-gradient/to-yellow-100', NULL, '2024-03-05 19:03:24', '2024-03-05 19:03:24', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-yellow-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-yellow-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (195, '.via-blue-100', 'classes/background-gradient/via-blue-100', NULL, '2024-03-05 19:03:25', '2024-03-05 19:03:25', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-blue-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-blue-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (210, '.border-gray-100', 'classes/border-color/border-gray-100', NULL, '2024-03-05 19:03:30', '2024-03-05 19:03:30', '.border-gray-100 { border-color: #f7fafc; }', '<div class="border-gray-100 border-4 p-8"></div>', '<div>
  <div class="border-gray-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (214, '.border-gray-500', 'classes/border-color/border-gray-500', NULL, '2024-03-05 19:03:32', '2024-03-05 19:03:32', '.border-gray-500 { border-color: #a0aec0; }', '<div class="border-gray-500 border-4 p-8"></div>', '<div>
  <div class="border-gray-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (232, '.border-orange-500', 'classes/border-color/border-orange-500', NULL, '2024-03-05 19:03:38', '2024-03-05 19:03:38', '.border-orange-500 { border-color: #ed8936; }', '<div class="border-orange-500 border-4 p-8"></div>', '<div>
  <div class="border-orange-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (234, '.border-orange-700', 'classes/border-color/border-orange-700', NULL, '2024-03-05 19:03:39', '2024-03-05 19:03:39', '.border-orange-700 { border-color: #c05621; }', '<div class="border-orange-700 border-4 p-8"></div>', '<div>
  <div class="border-orange-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (249, '.border-green-400', 'classes/border-color/border-green-400', NULL, '2024-03-05 19:03:45', '2024-03-05 19:03:45', '.border-green-400 { border-color: #68d391; }', '<div class="border-green-400 border-4 p-8"></div>', '<div>
  <div class="border-green-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (255, '.border-teal-100', 'classes/border-color/border-teal-100', NULL, '2024-03-05 19:03:47', '2024-03-05 19:03:47', '.border-teal-100 { border-color: #e6fffa; }', '<div class="border-teal-100 border-4 p-8"></div>', '<div>
  <div class="border-teal-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (270, '.border-blue-700', 'classes/border-color/border-blue-700', NULL, '2024-03-05 19:03:52', '2024-03-05 19:03:52', '.border-blue-700 { border-color: #2b6cb0; }', '<div class="border-blue-700 border-4 p-8"></div>', '<div>
  <div class="border-blue-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (273, '.border-indigo-100', 'classes/border-color/border-indigo-100', NULL, '2024-03-05 19:03:53', '2024-03-05 19:03:53', '.border-indigo-100 { border-color: #ebf4ff; }', '<div class="border-indigo-100 border-4 p-8"></div>', '<div>
  <div class="border-indigo-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (287, '.border-purple-600', 'classes/border-color/border-purple-600', NULL, '2024-03-05 19:03:59', '2024-03-05 19:03:59', '.border-purple-600 { border-color: #805ad5; }', '<div class="border-purple-600 border-4 p-8"></div>', '<div>
  <div class="border-purple-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (295, '.border-pink-500', 'classes/border-color/border-pink-500', NULL, '2024-03-05 19:04:01', '2024-03-05 19:04:01', '.border-pink-500 { border-color: #ed64a6; }', '<div class="border-pink-500 border-4 p-8"></div>', '<div>
  <div class="border-pink-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (308, '.border-4', 'classes/borders/border-4', NULL, '2024-03-05 19:04:06', '2024-03-05 19:04:06', '.border-4 { border-width: 4px; }', '<div class="border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1363, '.-translate-x-3', 'classes/transform/-translate-x-3', NULL, '2024-03-06 04:56:10', '2024-03-06 04:56:10', '.-translate-x-3 { --transform-translate-x: -0.75rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-3 transform bg-teal-400 h-6 w-8 ml-auto text-center">-3</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-3 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1377, '.-translate-x-64', 'classes/transform/-translate-x-64', NULL, '2024-03-06 04:56:15', '2024-03-06 04:56:15', '.-translate-x-64 { --transform-translate-x: -16rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-64 transform bg-teal-400 h-6 w-8 ml-auto text-center">-64</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-64 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -64
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1384, '.-translate-y-4', 'classes/transform/-translate-y-4', NULL, '2024-03-06 04:56:18', '2024-03-06 04:56:18', '.-translate-y-4 { --transform-translate-y: -1rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-4 transform bg-teal-400 h-6 w-8 mt-auto text-center">-4</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-4 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -4
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1398, '.-translate-y-px', 'classes/transform/-translate-y-px', NULL, '2024-03-06 04:56:23', '2024-03-06 04:56:23', '.-translate-y-px { --transform-translate-y: -1px; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-px transform bg-teal-400 h-6 w-8 mt-auto text-center">-px</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-px transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -px
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1402, '.scale-x-0', 'classes/transform/scale-x-0', NULL, '2024-03-06 04:56:24', '2024-03-06 04:56:24', '.scale-x-0 { --transform-scale-x: 0; }', '<div class="scale-x-0 transform bg-teal-400 p-4 m-6 inline-flex">0</div>', '<div>
  <div class="scale-x-0 transform bg-teal-400 p-4 m-6 inline-flex">
    0
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1429, '.skew-x-0', 'classes/transform/skew-x-0', NULL, '2024-03-06 04:56:34', '2024-03-06 04:56:34', '.skew-x-0 { --transform-skew-x: 0; }', '<div class="skew-x-0 transform bg-teal-400 p-4 m-4 inline-flex">0</div>', '<div>
  <div class="skew-x-0 transform bg-teal-400 p-4 m-4 inline-flex">
    0
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1437, '.-skew-x-3', 'classes/transform/-skew-x-3', NULL, '2024-03-06 04:56:37', '2024-03-06 04:56:37', '.-skew-x-3 { --transform-skew-x: -3deg; }', '<div class="-skew-x-3 transform bg-teal-400 p-4 m-4 inline-flex">3</div>', '<div>
  <div class="-skew-x-3 transform bg-teal-400 p-4 m-4 inline-flex">
    3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1439, '.-skew-x-12', 'classes/transform/-skew-x-12', NULL, '2024-03-06 04:56:38', '2024-03-06 04:56:38', '.-skew-x-12 { --transform-skew-x: -12deg; }', '<div class="-skew-x-12 transform bg-teal-400 p-4 m-4 inline-flex">12</div>', '<div>
  <div class="-skew-x-12 transform bg-teal-400 p-4 m-4 inline-flex">
    12
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (172, '.from-gray-100', 'classes/background-gradient/from-gray-100', NULL, '2024-03-05 19:03:17', '2024-03-05 19:03:17', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-gray-100 to-blue-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-gray-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (178, '.from-white', 'classes/background-gradient/from-white', NULL, '2024-03-05 19:03:19', '2024-03-05 19:03:19', NULL, '    <div class="inline-block p-6 bg-gray-200">
        <div class="h-32 w-32 bg-gradient-to-r from-white to-purple-400"></div>
    </div>', '<div>
  <div class="inline-block p-6 bg-gray-200">
    <div class="h-32 w-32 bg-gradient-to-r from-white to-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (193, '.top-1', 'classes/background-gradient/top-1', NULL, '2024-03-05 19:03:24', '2024-03-05 19:03:24', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute top-1 h-4 w-full bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute top-1 h-4 w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (196, '.via-current', 'classes/background-gradient/via-current', NULL, '2024-03-05 19:03:26', '2024-03-05 19:03:26', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-current to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-current to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (211, '.border-gray-200', 'classes/border-color/border-gray-200', NULL, '2024-03-05 19:03:31', '2024-03-05 19:03:31', '.border-gray-200 { border-color: #edf2f7; }', '<div class="border-gray-200 border-4 p-8"></div>', '<div>
  <div class="border-gray-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (218, '.border-gray-900', 'classes/border-color/border-gray-900', NULL, '2024-03-05 19:03:33', '2024-03-05 19:03:33', '.border-gray-900 { border-color: #1a202c; }', '<div class="border-gray-900 border-4 p-8"></div>', '<div>
  <div class="border-gray-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (233, '.border-orange-600', 'classes/border-color/border-orange-600', NULL, '2024-03-05 19:03:39', '2024-03-05 19:03:39', '.border-orange-600 { border-color: #dd6b20; }', '<div class="border-orange-600 border-4 p-8"></div>', '<div>
  <div class="border-orange-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (235, '.border-orange-800', 'classes/border-color/border-orange-800', NULL, '2024-03-05 19:03:39', '2024-03-05 19:03:39', '.border-orange-800 { border-color: #9c4221; }', '<div class="border-orange-800 border-4 p-8"></div>', '<div>
  <div class="border-orange-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (250, '.border-green-500', 'classes/border-color/border-green-500', NULL, '2024-03-05 19:03:45', '2024-03-05 19:03:45', '.border-green-500 { border-color: #48bb78; }', '<div class="border-green-500 border-4 p-8"></div>', '<div>
  <div class="border-green-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (256, '.border-teal-200', 'classes/border-color/border-teal-200', NULL, '2024-03-05 19:03:47', '2024-03-05 19:03:47', '.border-teal-200 { border-color: #b2f5ea; }', '<div class="border-teal-200 border-4 p-8"></div>', '<div>
  <div class="border-teal-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (271, '.border-blue-800', 'classes/border-color/border-blue-800', NULL, '2024-03-05 19:03:53', '2024-03-05 19:03:53', '.border-blue-800 { border-color: #2c5282; }', '<div class="border-blue-800 border-4 p-8"></div>', '<div>
  <div class="border-blue-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (274, '.border-indigo-200', 'classes/border-color/border-indigo-200', NULL, '2024-03-05 19:03:54', '2024-03-05 19:03:54', '.border-indigo-200 { border-color: #c3dafe; }', '<div class="border-indigo-200 border-4 p-8"></div>', '<div>
  <div class="border-indigo-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (288, '.border-purple-700', 'classes/border-color/border-purple-700', NULL, '2024-03-05 19:03:59', '2024-03-05 19:03:59', '.border-purple-700 { border-color: #6b46c1; }', '<div class="border-purple-700 border-4 p-8"></div>', '<div>
  <div class="border-purple-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (296, '.border-pink-600', 'classes/border-color/border-pink-600', NULL, '2024-03-05 19:04:02', '2024-03-05 19:04:02', '.border-pink-600 { border-color: #d53f8c; }', '<div class="border-pink-600 border-4 p-8"></div>', '<div>
  <div class="border-pink-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (309, '.border-8', 'classes/borders/border-8', NULL, '2024-03-05 19:04:07', '2024-03-05 19:04:07', '.border-8 { border-width: 8px; }', '<div class="border-8 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-8 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1368, '.-translate-x-10', 'classes/transform/-translate-x-10', NULL, '2024-03-06 04:56:12', '2024-03-06 04:56:12', '.-translate-x-10 { --transform-translate-x: -2.5rem; }', '<div class="bg-gray-300 w-64 h-6 m-2 ml-10"><div class="-translate-x-10 transform bg-teal-400 h-6 w-8 ml-auto text-center">-10</div></div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2 ml-10">
    <div class="-translate-x-10 transform bg-teal-400 h-6 w-8 ml-auto text-center">
      -10
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1382, '.-translate-y-2', 'classes/transform/-translate-y-2', NULL, '2024-03-06 04:56:17', '2024-03-06 04:56:17', '.-translate-y-2 { --transform-translate-y: -0.5rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-2 transform bg-teal-400 h-6 w-8 mt-auto text-center">-2</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-2 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -2
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1390, '.-translate-y-16', 'classes/transform/-translate-y-16', NULL, '2024-03-06 04:56:20', '2024-03-06 04:56:20', '.-translate-y-16 { --transform-translate-y: -4rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-16 transform bg-teal-400 h-6 w-8 mt-auto text-center">-16</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-16 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -16
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1404, '.scale-x-75', 'classes/transform/scale-x-75', NULL, '2024-03-06 04:56:25', '2024-03-06 04:56:25', '.scale-x-75 { --transform-scale-x: .75; }', '<div class="scale-x-75 transform bg-teal-400 p-4 m-6 inline-flex">75</div>', '<div>
  <div class="scale-x-75 transform bg-teal-400 p-4 m-6 inline-flex">
    75
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1407, '.scale-x-100', 'classes/transform/scale-x-100', NULL, '2024-03-06 04:56:26', '2024-03-06 04:56:26', '.scale-x-100 { --transform-scale-x: 1; }', '<div class="scale-x-100 transform bg-teal-400 p-4 m-6 inline-flex">100</div>', '<div>
  <div class="scale-x-100 transform bg-teal-400 p-4 m-6 inline-flex">
    100
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1416, '.scale-y-95', 'classes/transform/scale-y-95', NULL, '2024-03-06 04:56:29', '2024-03-06 04:56:29', '.scale-y-95 { --transform-scale-y: .95; }', '<div class="scale-y-95 transform bg-teal-400 p-4 m-6 inline-flex">95</div>', '<div>
  <div class="scale-y-95 transform bg-teal-400 p-4 m-6 inline-flex">
    95
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1419, '.scale-y-110', 'classes/transform/scale-y-110', NULL, '2024-03-06 04:56:30', '2024-03-06 04:56:30', '.scale-y-110 { --transform-scale-y: 1.1; }', '<div class="scale-y-110 transform bg-teal-400 p-4 m-6 inline-flex">110</div>', '<div>
  <div class="scale-y-110 transform bg-teal-400 p-4 m-6 inline-flex">
    110
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1436, '.skew-y-12', 'classes/transform/skew-y-12', NULL, '2024-03-06 04:56:37', '2024-03-06 04:56:37', '.skew-y-12 { --transform-skew-y: 12deg; }', '<div class="skew-y-12 transform bg-teal-400 p-4 m-4 inline-flex">12</div>', '<div>
  <div class="skew-y-12 transform bg-teal-400 p-4 m-4 inline-flex">
    12
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1438, '.-skew-x-6', 'classes/transform/-skew-x-6', NULL, '2024-03-06 04:56:37', '2024-03-06 04:56:37', '.-skew-x-6 { --transform-skew-x: -6deg; }', '<div class="-skew-x-6 transform bg-teal-400 p-4 m-4 inline-flex">6</div>', '<div>
  <div class="-skew-x-6 transform bg-teal-400 p-4 m-4 inline-flex">
    6
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (173, '.from-indigo-100', 'classes/background-gradient/from-indigo-100', NULL, '2024-03-05 19:03:17', '2024-03-05 19:03:17', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-indigo-100 to-black"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-indigo-100 to-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (188, '.to-purple-100', 'classes/background-gradient/to-purple-100', NULL, '2024-03-05 19:03:23', '2024-03-05 19:03:23', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-purple-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-purple-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (190, '.to-transparent', 'classes/background-gradient/to-transparent', NULL, '2024-03-05 19:03:23', '2024-03-05 19:03:23', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-transparent"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-transparent">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (206, '.border-transparent', 'classes/border-color/border-transparent', NULL, '2024-03-05 19:03:29', '2024-03-05 19:03:29', '.border-transparent { border-color: transparent; }', '<div class="border-transparent border-4 p-8"></div>', '<div>
  <div class="border-transparent border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (212, '.border-gray-300', 'classes/border-color/border-gray-300', NULL, '2024-03-05 19:03:31', '2024-03-05 19:03:31', '.border-gray-300 { border-color: #e2e8f0; }', '<div class="border-gray-300 border-4 p-8"></div>', '<div>
  <div class="border-gray-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (227, '.border-red-900', 'classes/border-color/border-red-900', NULL, '2024-03-05 19:03:37', '2024-03-05 19:03:37', '.border-red-900 { border-color: #742a2a; }', '<div class="border-red-900 border-4 p-8"></div>', '<div>
  <div class="border-red-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (230, '.border-orange-300', 'classes/border-color/border-orange-300', NULL, '2024-03-05 19:03:38', '2024-03-05 19:03:38', '.border-orange-300 { border-color: #fbd38d; }', '<div class="border-orange-300 border-4 p-8"></div>', '<div>
  <div class="border-orange-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (244, '.border-yellow-800', 'classes/border-color/border-yellow-800', NULL, '2024-03-05 19:03:43', '2024-03-05 19:03:43', '.border-yellow-800 { border-color: #975a16; }', '<div class="border-yellow-800 border-4 p-8"></div>', '<div>
  <div class="border-yellow-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (251, '.border-green-600', 'classes/border-color/border-green-600', NULL, '2024-03-05 19:03:45', '2024-03-05 19:03:45', '.border-green-600 { border-color: #38a169; }', '<div class="border-green-600 border-4 p-8"></div>', '<div>
  <div class="border-green-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (265, '.border-blue-200', 'classes/border-color/border-blue-200', NULL, '2024-03-05 19:03:51', '2024-03-05 19:03:51', '.border-blue-200 { border-color: #bee3f8; }', '<div class="border-blue-200 border-4 p-8"></div>', '<div>
  <div class="border-blue-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (268, '.border-blue-500', 'classes/border-color/border-blue-500', NULL, '2024-03-05 19:03:52', '2024-03-05 19:03:52', '.border-blue-500 { border-color: #4299e1; }', '<div class="border-blue-500 border-4 p-8"></div>', '<div>
  <div class="border-blue-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (282, '.border-purple-100', 'classes/border-color/border-purple-100', NULL, '2024-03-05 19:03:57', '2024-03-05 19:03:57', '.border-purple-100 { border-color: #faf5ff; }', '<div class="border-purple-100 border-4 p-8"></div>', '<div>
  <div class="border-purple-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (290, '.border-purple-900', 'classes/border-color/border-purple-900', NULL, '2024-03-05 19:04:00', '2024-03-05 19:04:00', '.border-purple-900 { border-color: #44337a; }', '<div class="border-purple-900 border-4 p-8"></div>', '<div>
  <div class="border-purple-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (299, '.border-pink-900', 'classes/border-color/border-pink-900', NULL, '2024-03-05 19:04:03', '2024-03-05 19:04:03', '.border-pink-900 { border-color: #702459; }', '<div class="border-pink-900 border-4 p-8"></div>', '<div>
  <div class="border-pink-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (307, '.border-2', 'classes/borders/border-2', NULL, '2024-03-05 19:04:06', '2024-03-05 19:04:06', '.border-2 { border-width: 2px; }', '<div class="border-2 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-2 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1387, '.-translate-y-8', 'classes/transform/-translate-y-8', NULL, '2024-03-06 04:56:19', '2024-03-06 04:56:19', '.-translate-y-8 { --transform-translate-y: -2rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-8 transform bg-teal-400 h-6 w-8 mt-auto text-center">-8</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-8 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -8
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1395, '.-translate-y-48', 'classes/transform/-translate-y-48', NULL, '2024-03-06 04:56:22', '2024-03-06 04:56:22', '.-translate-y-48 { --transform-translate-y: -12rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-48 transform bg-teal-400 h-6 w-8 mt-auto text-center">-48</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-48 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -48
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1410, '.scale-x-125', 'classes/transform/scale-x-125', NULL, '2024-03-06 04:56:27', '2024-03-06 04:56:27', '.scale-x-125 { --transform-scale-x: 1.25; }', '<div class="scale-x-125 transform bg-teal-400 p-4 m-6 inline-flex">125</div>', '<div>
  <div class="scale-x-125 transform bg-teal-400 p-4 m-6 inline-flex">
    125
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1413, '.scale-y-50', 'classes/transform/scale-y-50', NULL, '2024-03-06 04:56:28', '2024-03-06 04:56:28', '.scale-y-50 { --transform-scale-y: .5; }', '<div class="scale-y-50 transform bg-teal-400 p-4 m-6 inline-flex">50</div>', '<div>
  <div class="scale-y-50 transform bg-teal-400 p-4 m-6 inline-flex">
    50
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1425, '.rotate-180', 'classes/transform/rotate-180', NULL, '2024-03-06 04:56:33', '2024-03-06 04:56:33', '.rotate-180 { --transform-rotate: 180deg; }', '<div class="rotate-180 transform bg-teal-400 p-4 m-6 inline-flex">180</div>', '<div>
  <div class="rotate-180 transform bg-teal-400 p-4 m-6 inline-flex">
    180
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1427, '.-rotate-90', 'classes/transform/-rotate-90', NULL, '2024-03-06 04:56:34', '2024-03-06 04:56:34', '.-rotate-90 { --transform-rotate: -90deg; }', '<div class="-rotate-90 transform bg-teal-400 p-4 m-6 inline-flex">-90</div>', '<div>
  <div class="-rotate-90 transform bg-teal-400 p-4 m-6 inline-flex">
    -90
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1442, '.-skew-y-12', 'classes/transform/-skew-y-12', NULL, '2024-03-06 04:56:39', '2024-03-06 04:56:39', '.-skew-y-12 { --transform-skew-y: -12deg; }', '<div class="-skew-y-12 transform bg-teal-400 p-4 m-4 inline-flex">-12</div>', '<div>
  <div class="-skew-y-12 transform bg-teal-400 p-4 m-4 inline-flex">
    -12
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1445, '.skew-x-1', 'classes/transform/skew-x-1', NULL, '2024-03-06 04:56:40', '2024-03-06 04:56:40', NULL, '    <div class="skew-x-1 transform bg-teal-400 p-4 m-4inline-flex">1</div>', '<div>
  <div class="skew-x-1 transform bg-teal-400 p-4 m-4inline-flex">
    1
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1454, '.text-8xl', 'classes/typography/text-8xl', NULL, '2024-03-06 04:56:43', '2024-03-06 04:56:43', NULL, '    <p class="text-8xl">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-8xl">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1457, '.cursor-default', 'classes/utilities/cursor-default', NULL, '2024-03-06 04:56:44', '2024-03-06 04:56:44', '.cursor-default { cursor: default; }', '<div class="cursor-default bg-teal-400 text-center w-64 py-4 m-2">Default</div>', '<div>
  <div class="cursor-default bg-teal-400 text-center w-64 py-4 m-2">
    Default
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (174, '.from-pink-100', 'classes/background-gradient/from-pink-100', NULL, '2024-03-05 19:03:18', '2024-03-05 19:03:18', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-pink-100 to-blue-300"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-pink-100 to-blue-300">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (191, '.to-white', 'classes/background-gradient/to-white', NULL, '2024-03-05 19:03:24', '2024-03-05 19:03:24', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-white"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-white">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (209, '.border-white', 'classes/border-color/border-white', NULL, '2024-03-05 19:03:30', '2024-03-05 19:03:30', '.border-white { border-color: #fff; }', '<div class="border-white border-4 p-8"></div>', '<div>
  <div class="border-white border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (213, '.border-gray-400', 'classes/border-color/border-gray-400', NULL, '2024-03-05 19:03:31', '2024-03-05 19:03:31', '.border-gray-400 { border-color: #cbd5e0; }', '<div class="border-gray-400 border-4 p-8"></div>', '<div>
  <div class="border-gray-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (228, '.border-orange-100', 'classes/border-color/border-orange-100', NULL, '2024-03-05 19:03:37', '2024-03-05 19:03:37', '.border-orange-100 { border-color: #fffaf0; }', '<div class="border-orange-100 border-4 p-8"></div>', '<div>
  <div class="border-orange-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (231, '.border-orange-400', 'classes/border-color/border-orange-400', NULL, '2024-03-05 19:03:38', '2024-03-05 19:03:38', '.border-orange-400 { border-color: #f6ad55; }', '<div class="border-orange-400 border-4 p-8"></div>', '<div>
  <div class="border-orange-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (248, '.border-green-300', 'classes/border-color/border-green-300', NULL, '2024-03-05 19:03:44', '2024-03-05 19:03:44', '.border-green-300 { border-color: #9ae6b4; }', '<div class="border-green-300 border-4 p-8"></div>', '<div>
  <div class="border-green-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (252, '.border-green-700', 'classes/border-color/border-green-700', NULL, '2024-03-05 19:03:46', '2024-03-05 19:03:46', '.border-green-700 { border-color: #2f855a; }', '<div class="border-green-700 border-4 p-8"></div>', '<div>
  <div class="border-green-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (266, '.border-blue-300', 'classes/border-color/border-blue-300', NULL, '2024-03-05 19:03:51', '2024-03-05 19:03:51', '.border-blue-300 { border-color: #90cdf4; }', '<div class="border-blue-300 border-4 p-8"></div>', '<div>
  <div class="border-blue-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (269, '.border-blue-600', 'classes/border-color/border-blue-600', NULL, '2024-03-05 19:03:52', '2024-03-05 19:03:52', '.border-blue-600 { border-color: #3182ce; }', '<div class="border-blue-600 border-4 p-8"></div>', '<div>
  <div class="border-blue-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (286, '.border-purple-500', 'classes/border-color/border-purple-500', NULL, '2024-03-05 19:03:58', '2024-03-05 19:03:58', '.border-purple-500 { border-color: #9f7aea; }', '<div class="border-purple-500 border-4 p-8"></div>', '<div>
  <div class="border-purple-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (294, '.border-pink-400', 'classes/border-color/border-pink-400', NULL, '2024-03-05 19:04:01', '2024-03-05 19:04:01', '.border-pink-400 { border-color: #f687b3; }', '<div class="border-pink-400 border-4 p-8"></div>', '<div>
  <div class="border-pink-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (304, '.border-none', 'classes/borders/border-none', NULL, '2024-03-05 19:04:05', '2024-03-05 19:04:05', '.border-none {
    border-style: none;
}', '<div class="border-none border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-none border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1393, '.-translate-y-32', 'classes/transform/-translate-y-32', NULL, '2024-03-06 04:56:21', '2024-03-06 04:56:21', '.-translate-y-32 { --transform-translate-y: -8rem; }', '<div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex"><div class="-translate-y-32 transform bg-teal-400 h-6 w-8 mt-auto text-center">-32</div></div>', '<div>
  <div class="bg-gray-300 h-64 w-8 m-2 mt-8 inline-flex">
    <div class="-translate-y-32 transform bg-teal-400 h-6 w-8 mt-auto text-center">
      -32
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1401, '.scale-0+%25_F+.scale-*', 'classes/transform/scale-0+%25_F+.scale-*', NULL, '2024-03-06 04:56:24', '2024-03-06 04:56:24', '.scale-0 {
    --transform-scale-x: 0;
    --transform-scale-y: 0;
}
.scale-50 {
    --transform-scale-x: .5;
    --transform-scale-y: .5;
}
.scale-75 { 
    --transform-scale-x: .75;
    --transform-scale-y: .75;
}
.scale-90 { 
    --transform-scale-x: .9;
    --transform-scale-y: .9;
}
.scale-95 {
    --transform-scale-x: .95;
    --transform-scale-y: .95;
}
.scale-100 {
    --transform-scale-x: 1;
    --transform-scale-y: 1;
}
.scale-105 {
    --transform-scale-x: 1.05;
    --transform-scale-y: 1.05;
}
.scale-110 {
    --transform-scale-x: 1.1;
    --transform-scale-y: 1.1;
}
.scale-125 {
    --transform-scale-x: 1.25;
    --transform-scale-y: 1.25;
}
.scale-150 {
    --transform-scale-x: 1.5;
    --transform-scale-y: 1.5;
}', '<div class="scale-0 transform bg-teal-400 p-4 m-6 inline-flex">0</div>
<div class="scale-50 transform bg-teal-400 p-4 m-6 inline-flex">50</div>
<div class="scale-75 transform bg-teal-400 p-4 m-6 inline-flex">75</div>
<div class="scale-90 transform bg-teal-400 p-4 m-6 inline-flex">90</div>
<div class="scale-95 transform bg-teal-400 p-4 m-6 inline-flex">95</div>
<div class="scale-100 transform bg-teal-400 p-4 m-6 inline-flex">100</div>
<div class="scale-105 transform bg-teal-400 p-4 m-6 inline-flex">105</div>
<div class="scale-110 transform bg-teal-400 p-4 m-6 inline-flex">110</div>
<div class="scale-125 transform bg-teal-400 p-4 m-6 inline-flex">125</div>
<div class="scale-150 transform bg-teal-400 p-4 m-6 inline-flex">150</div>', '<div>
  <div class="scale-0 transform bg-teal-400 p-4 m-6 inline-flex">
    0
  </div>
  <div class="scale-50 transform bg-teal-400 p-4 m-6 inline-flex">
    50
  </div>
  <div class="scale-75 transform bg-teal-400 p-4 m-6 inline-flex">
    75
  </div>
  <div class="scale-90 transform bg-teal-400 p-4 m-6 inline-flex">
    90
  </div>
  <div class="scale-95 transform bg-teal-400 p-4 m-6 inline-flex">
    95
  </div>
  <div class="scale-100 transform bg-teal-400 p-4 m-6 inline-flex">
    100
  </div>
  <div class="scale-105 transform bg-teal-400 p-4 m-6 inline-flex">
    105
  </div>
  <div class="scale-110 transform bg-teal-400 p-4 m-6 inline-flex">
    110
  </div>
  <div class="scale-125 transform bg-teal-400 p-4 m-6 inline-flex">
    125
  </div>
  <div class="scale-150 transform bg-teal-400 p-4 m-6 inline-flex">
    150
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1421, '.scale-y-150', 'classes/transform/scale-y-150', NULL, '2024-03-06 04:56:31', '2024-03-06 04:56:31', '.scale-y-150 { --transform-scale-y: 1.5; }', '<div class="scale-y-150 transform bg-teal-400 p-4 m-6 inline-flex">150</div>', '<div>
  <div class="scale-y-150 transform bg-teal-400 p-4 m-6 inline-flex">
    150
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1423, '.rotate-45', 'classes/transform/rotate-45', NULL, '2024-03-06 04:56:32', '2024-03-06 04:56:32', '.rotate-45 { --transform-rotate: 45deg; }', '<div class="rotate-45 transform bg-teal-400 p-4 m-6 inline-flex">45</div>', '<div>
  <div class="rotate-45 transform bg-teal-400 p-4 m-6 inline-flex">
    45
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1432, '.skew-x-12', 'classes/transform/skew-x-12', NULL, '2024-03-06 04:56:35', '2024-03-06 04:56:35', '.skew-x-12 { --transform-skew-x: 12deg; }', '<div class="skew-x-12 transform bg-teal-400 p-4 m-4 inline-flex">12</div>', '<div>
  <div class="skew-x-12 transform bg-teal-400 p-4 m-4 inline-flex">
    12
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1435, '.skew-y-6', 'classes/transform/skew-y-6', NULL, '2024-03-06 04:56:36', '2024-03-06 04:56:36', '.skew-y-6 { --transform-skew-y: 6deg; }', '<div class="skew-y-6 transform bg-teal-400 p-4 m-4 inline-flex">6</div>', '<div>
  <div class="skew-y-6 transform bg-teal-400 p-4 m-4 inline-flex">
    6
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1452, '.font-extralight', 'classes/typography/font-extralight', NULL, '2024-03-06 04:56:43', '2024-03-06 04:56:43', NULL, '    <p class="font-extralight">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>', '<div>
  <p class="font-extralight">
    Lorem ipsum dolor sit amet consectetur adipisicing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1455, '.text-9xl', 'classes/typography/text-9xl', NULL, '2024-03-06 04:56:44', '2024-03-06 04:56:44', NULL, '    <p class="text-9xl">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-9xl">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (176, '.from-red-100', 'classes/background-gradient/from-red-100', NULL, '2024-03-05 19:03:18', '2024-03-05 19:03:18', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-red-100 to-blue-300"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-red-100 to-blue-300">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (179, '.from-yellow-100', 'classes/background-gradient/from-yellow-100', NULL, '2024-03-05 19:03:19', '2024-03-05 19:03:19', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-yellow-100 to-blue-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-yellow-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (194, '.via-black', 'classes/background-gradient/via-black', NULL, '2024-03-05 19:03:25', '2024-03-05 19:03:25', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-black to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-black to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (197, '.via-gray-100', 'classes/background-gradient/via-gray-100', NULL, '2024-03-05 19:03:26', '2024-03-05 19:03:26', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-gray-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-gray-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (215, '.border-gray-600', 'classes/border-color/border-gray-600', NULL, '2024-03-05 19:03:32', '2024-03-05 19:03:32', '.border-gray-600 { border-color: #718096; }', '<div class="border-gray-600 border-4 p-8"></div>', '<div>
  <div class="border-gray-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (219, '.border-red-100', 'classes/border-color/border-red-100', NULL, '2024-03-05 19:03:34', '2024-03-05 19:03:34', '.border-red-100 { border-color: #fff5f5; }', '<div class="border-red-100 border-4 p-8"></div>', '<div>
  <div class="border-red-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (236, '.border-orange-900', 'classes/border-color/border-orange-900', NULL, '2024-03-05 19:03:40', '2024-03-05 19:03:40', '.border-orange-900 { border-color: #7b341e; }', '<div class="border-orange-900 border-4 p-8"></div>', '<div>
  <div class="border-orange-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (253, '.border-green-800', 'classes/border-color/border-green-800', NULL, '2024-03-05 19:03:46', '2024-03-05 19:03:46', '.border-green-800 { border-color: #276749; }', '<div class="border-green-800 border-4 p-8"></div>', '<div>
  <div class="border-green-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (257, '.border-teal-300', 'classes/border-color/border-teal-300', NULL, '2024-03-05 19:03:48', '2024-03-05 19:03:48', '.border-teal-300 { border-color: #81e6d9; }', '<div class="border-teal-300 border-4 p-8"></div>', '<div>
  <div class="border-teal-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (272, '.border-blue-900', 'classes/border-color/border-blue-900', NULL, '2024-03-05 19:03:53', '2024-03-05 19:03:53', '.border-blue-900 { border-color: #2a4365; }', '<div class="border-blue-900 border-4 p-8"></div>', '<div>
  <div class="border-blue-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (278, '.border-indigo-600', 'classes/border-color/border-indigo-600', NULL, '2024-03-05 19:03:55', '2024-03-05 19:03:55', '.border-indigo-600 { border-color: #5a67d8; }', '<div class="border-indigo-600 border-4 p-8"></div>', '<div>
  <div class="border-indigo-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (291, '.border-pink-100', 'classes/border-color/border-pink-100', NULL, '2024-03-05 19:04:00', '2024-03-05 19:04:00', '.border-pink-100 { border-color: #fff5f7; }', '<div class="border-pink-100 border-4 p-8"></div>', '<div>
  <div class="border-pink-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (300, '.border-solid', 'classes/borders/border-solid', NULL, '2024-03-05 19:04:03', '2024-03-05 19:04:03', '.border-solid {
    border-style: solid;
}', '<div class="border-solid border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-solid border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (310, '.border-*-%23+%25_F+.border-t-2', 'classes/borders/border-*-%23+%25_F+.border-t-2', NULL, '2024-03-05 19:04:07', '2024-03-05 19:04:07', '.border-t { border-top-width: 1px; }
.border-r { border-right-width: 1px; }
.border-b { border-bottom-width: 1px; }
.border-l { border-left-width: 1px; }

.border-t-0 { border-top-width: 0; }
.border-r-0 { border-right-width: 0; }
.border-b-0 { border-bottom-width: 0; }
.border-l-0 { border-left-width: 0; }

.border-t-2 { border-top-width: 2px; }
.border-r-2 { border-right-width: 2px; }
.border-b-2 { border-bottom-width: 2px; }
.border-l-2 { border-left-width: 2px; }

.border-t-4 { border-top-width: 4px; }
.border-r-4 { border-right-width: 4px; }
.border-b-4 { border-bottom-width: 4px; }
.border-l-4 { border-left-width: 4px; }

.border-t-8 { border-top-width: 8px; }
.border-r-8 { border-right-width: 8px; }
.border-b-8 { border-bottom-width: 8px; }
.border-l-8 { border-left-width: 8px; }
', '<div class="my-2">
    <div class="border-t border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-r border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-b border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-l border-teal-600 bg-teal-400 p-8 inline-block"></div>
</div>

<div class="my-2">
    <div class="border-t-0 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-r-0 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-b-0 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-l-0 border-teal-600 bg-teal-400 p-8 inline-block"></div>
</div>

<div class="my-2">
    <div class="border-t-2 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-r-2 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-b-2 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-l-2 border-teal-600 bg-teal-400 p-8 inline-block"></div>
</div>

<div class="my-2">
    <div class="border-t-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-r-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-b-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-l-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>
</div>

<div class="my-2">
    <div class="border-t-8 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-r-8 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-b-8 border-teal-600 bg-teal-400 p-8 inline-block"></div>
    <div class="border-l-8 border-teal-600 bg-teal-400 p-8 inline-block"></div>
</div>', '<div>
  <div class="my-2">
    <div class="border-t border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-r border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-b border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-l border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
  </div>
  <div class="my-2">
    <div class="border-t-0 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-r-0 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-b-0 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-l-0 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
  </div>
  <div class="my-2">
    <div class="border-t-2 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-r-2 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-b-2 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-l-2 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
  </div>
  <div class="my-2">
    <div class="border-t-4 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-r-4 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-b-4 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-l-4 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
  </div>
  <div class="my-2">
    <div class="border-t-8 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-r-8 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-b-8 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
    <div class="border-l-8 border-teal-600 bg-teal-400 p-8 inline-block">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1403, '.scale-x-50', 'classes/transform/scale-x-50', NULL, '2024-03-06 04:56:25', '2024-03-06 04:56:25', '.scale-x-50 { --transform-scale-x: .5; }', '<div class="scale-x-50 transform bg-teal-400 p-4 m-6 inline-flex">50</div>', '<div>
  <div class="scale-x-50 transform bg-teal-400 p-4 m-6 inline-flex">
    50
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1406, '.scale-x-95', 'classes/transform/scale-x-95', NULL, '2024-03-06 04:56:26', '2024-03-06 04:56:26', '.scale-x-95 { --transform-scale-x: .95; }', '<div class="scale-x-95 transform bg-teal-400 p-4 m-6 inline-flex">95</div>', '<div>
  <div class="scale-x-95 transform bg-teal-400 p-4 m-6 inline-flex">
    95
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1415, '.scale-y-90', 'classes/transform/scale-y-90', NULL, '2024-03-06 04:56:29', '2024-03-06 04:56:29', '.scale-y-90 { --transform-scale-y: .9; }', '<div class="scale-y-90 transform bg-teal-400 p-4 m-6 inline-flex">90</div>', '<div>
  <div class="scale-y-90 transform bg-teal-400 p-4 m-6 inline-flex">
    90
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1418, '.scale-y-105', 'classes/transform/scale-y-105', NULL, '2024-03-06 04:56:30', '2024-03-06 04:56:30', '.scale-y-105 { --transform-scale-y: 1.05; }', '<div class="scale-y-105 transform bg-teal-400 p-4 m-6 inline-flex">105</div>', '<div>
  <div class="scale-y-105 transform bg-teal-400 p-4 m-6 inline-flex">
    105
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1430, '.skew-x-3', 'classes/transform/skew-x-3', NULL, '2024-03-06 04:56:35', '2024-03-06 04:56:35', '.skew-x-3 { --transform-skew-x: 3deg; }', '<div class="skew-x-3 transform bg-teal-400 p-4 m-4 inline-flex">3</div>', '<div>
  <div class="skew-x-3 transform bg-teal-400 p-4 m-4 inline-flex">
    3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1433, '.skew-y-0', 'classes/transform/skew-y-0', NULL, '2024-03-06 04:56:36', '2024-03-06 04:56:36', '.skew-y-0 { --transform-skew-y: 0; }', '<div class="skew-y-0 transform bg-teal-400 p-4 m-4 inline-flex">0</div>', '<div>
  <div class="skew-y-0 transform bg-teal-400 p-4 m-4 inline-flex">
    0
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (177, '.from-transparent', 'classes/background-gradient/from-transparent', NULL, '2024-03-05 19:03:19', '2024-03-05 19:03:19', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-transparent to-blue-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-transparent to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (180, '.from-transparent', 'classes/background-gradient/from-transparent', NULL, '2024-03-05 19:03:20', '2024-03-05 19:03:20', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-transparent to-blue-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-transparent to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (198, '.via-green-100', 'classes/background-gradient/via-green-100', NULL, '2024-03-05 19:03:26', '2024-03-05 19:03:26', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-green-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-green-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (201, '.via-purple-100', 'classes/background-gradient/via-purple-100', NULL, '2024-03-05 19:03:27', '2024-03-05 19:03:27', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-purple-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-purple-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (216, '.border-gray-700', 'classes/border-color/border-gray-700', NULL, '2024-03-05 19:03:33', '2024-03-05 19:03:33', '.border-gray-700 { border-color: #4a5568; }', '<div class="border-gray-700 border-4 p-8"></div>', '<div>
  <div class="border-gray-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (220, '.border-red-200', 'classes/border-color/border-red-200', NULL, '2024-03-05 19:03:34', '2024-03-05 19:03:34', '.border-red-200 { border-color: #fed7d7; }', '<div class="border-red-200 border-4 p-8"></div>', '<div>
  <div class="border-red-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (237, '.border-yellow-100', 'classes/border-color/border-yellow-100', NULL, '2024-03-05 19:03:40', '2024-03-05 19:03:40', '.border-yellow-100 { border-color: #fffff0; }', '<div class="border-yellow-100 border-4 p-8"></div>', '<div>
  <div class="border-yellow-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (240, '.border-yellow-400', 'classes/border-color/border-yellow-400', NULL, '2024-03-05 19:03:41', '2024-03-05 19:03:41', '.border-yellow-400 { border-color: #f6e05e; }', '<div class="border-yellow-400 border-4 p-8"></div>', '<div>
  <div class="border-yellow-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (254, '.border-green-900', 'classes/border-color/border-green-900', NULL, '2024-03-05 19:03:47', '2024-03-05 19:03:47', '.border-green-900 { border-color: #22543d; }', '<div class="border-green-900 border-4 p-8"></div>', '<div>
  <div class="border-green-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (258, '.border-teal-400', 'classes/border-color/border-teal-400', NULL, '2024-03-05 19:03:48', '2024-03-05 19:03:48', '.border-teal-400 { border-color: #4fd1c5; }', '<div class="border-teal-400 border-4 p-8"></div>', '<div>
  <div class="border-teal-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (275, '.border-indigo-300', 'classes/border-color/border-indigo-300', NULL, '2024-03-05 19:03:54', '2024-03-05 19:03:54', '.border-indigo-300 { border-color: #a3bffa; }', '<div class="border-indigo-300 border-4 p-8"></div>', '<div>
  <div class="border-indigo-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (279, '.border-indigo-700', 'classes/border-color/border-indigo-700', NULL, '2024-03-05 19:03:56', '2024-03-05 19:03:56', '.border-indigo-700 { border-color: #4c51bf; }', '<div class="border-indigo-700 border-4 p-8"></div>', '<div>
  <div class="border-indigo-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (292, '.border-pink-200', 'classes/border-color/border-pink-200', NULL, '2024-03-05 19:04:00', '2024-03-05 19:04:00', '.border-pink-200 { border-color: #fed7e2; }', '<div class="border-pink-200 border-4 p-8"></div>', '<div>
  <div class="border-pink-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (301, '.border-dashed', 'classes/borders/border-dashed', NULL, '2024-03-05 19:04:04', '2024-03-05 19:04:04', '.border-dashed {
    border-style: dashed;
}', '<div class="border-dashed border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-dashed border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1428, '.-rotate-180', 'classes/transform/-rotate-180', NULL, '2024-03-06 04:56:34', '2024-03-06 04:56:34', '.-rotate-180 { --transform-rotate: -180deg; }', '<div class="-rotate-180 transform bg-teal-400 p-4 m-6 inline-flex">-180</div>', '<div>
  <div class="-rotate-180 transform bg-teal-400 p-4 m-6 inline-flex">
    -180
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1451, '.translate-y-11', 'classes/transform/translate-y-11', NULL, '2024-03-06 04:56:42', '2024-03-06 04:56:42', NULL, '    <div class="bg-gray-300 h-64 w-10 m-2">
        <div class="translate-y-11 transform bg-teal-400 h-6 w-6 text-center">1</div>
    </div>', '<div>
  <div class="bg-gray-300 h-64 w-10 m-2">
    <div class="translate-y-11 transform bg-teal-400 h-6 w-6 text-center">
      1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1464, '.placeholder-transparent::placeholder', 'classes/utilities/placeholder-transparent::placeholder', NULL, '2024-03-06 04:56:47', '2024-03-06 04:56:47', '.placeholder-transparent::placeholder { color: transparent; }', '<input class="placeholder-transparent block" placeholder="Text"/>', '<div>
  <input class="placeholder-transparent block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1467, '.placeholder-white::placeholder', 'classes/utilities/placeholder-white::placeholder', NULL, '2024-03-06 04:56:48', '2024-03-06 04:56:48', '.placeholder-white::placeholder { color: #fff; }', '<input class="placeholder-white block" placeholder="Text"/>', '<div>
  <input class="placeholder-white block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (181, '.to-black', 'classes/background-gradient/to-black', NULL, '2024-03-05 19:03:20', '2024-03-05 19:03:20', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-indigo-100 to-black"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-indigo-100 to-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (184, '.to-gray-100', 'classes/background-gradient/to-gray-100', NULL, '2024-03-05 19:03:21', '2024-03-05 19:03:21', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-gray-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-gray-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (199, '.via-indigo-100', 'classes/background-gradient/via-indigo-100', NULL, '2024-03-05 19:03:26', '2024-03-05 19:03:26', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-indigo-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-indigo-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (202, '.via-red-100', 'classes/background-gradient/via-red-100', NULL, '2024-03-05 19:03:27', '2024-03-05 19:03:27', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-red-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-red-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (221, '.border-red-300', 'classes/border-color/border-red-300', NULL, '2024-03-05 19:03:34', '2024-03-05 19:03:34', '.border-red-300 { border-color: #feb2b2; }', '<div class="border-red-300 border-4 p-8"></div>', '<div>
  <div class="border-red-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (224, '.border-red-600', 'classes/border-color/border-red-600', NULL, '2024-03-05 19:03:36', '2024-03-05 19:03:36', '.border-red-600 { border-color: #e53e3e; }', '<div class="border-red-600 border-4 p-8"></div>', '<div>
  <div class="border-red-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (239, '.border-yellow-300', 'classes/border-color/border-yellow-300', NULL, '2024-03-05 19:03:41', '2024-03-05 19:03:41', '.border-yellow-300 { border-color: #faf089; }', '<div class="border-yellow-300 border-4 p-8"></div>', '<div>
  <div class="border-yellow-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (245, '.border-yellow-900', 'classes/border-color/border-yellow-900', NULL, '2024-03-05 19:03:43', '2024-03-05 19:03:43', '.border-yellow-900 { border-color: #744210; }', '<div class="border-yellow-900 border-4 p-8"></div>', '<div>
  <div class="border-yellow-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (260, '.border-teal-600', 'classes/border-color/border-teal-600', NULL, '2024-03-05 19:03:49', '2024-03-05 19:03:49', '.border-teal-600 { border-color: #319795; }', '<div class="border-teal-600 border-4 p-8"></div>', '<div>
  <div class="border-teal-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (262, '.border-teal-800', 'classes/border-color/border-teal-800', NULL, '2024-03-05 19:03:49', '2024-03-05 19:03:49', '.border-teal-800 { border-color: #285e61; }', '<div class="border-teal-800 border-4 p-8"></div>', '<div>
  <div class="border-teal-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (277, '.border-indigo-500', 'classes/border-color/border-indigo-500', NULL, '2024-03-05 19:03:55', '2024-03-05 19:03:55', '.border-indigo-500 { border-color: #667eea; }', '<div class="border-indigo-500 border-4 p-8"></div>', '<div>
  <div class="border-indigo-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (284, '.border-purple-300', 'classes/border-color/border-purple-300', NULL, '2024-03-05 19:03:57', '2024-03-05 19:03:57', '.border-purple-300 { border-color: #d6bcfa; }', '<div class="border-purple-300 border-4 p-8"></div>', '<div>
  <div class="border-purple-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (297, '.border-pink-700', 'classes/border-color/border-pink-700', NULL, '2024-03-05 19:04:02', '2024-03-05 19:04:02', '.border-pink-700 { border-color: #b83280; }', '<div class="border-pink-700 border-4 p-8"></div>', '<div>
  <div class="border-pink-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (305, '.border', 'classes/borders/border', NULL, '2024-03-05 19:04:05', '2024-03-05 19:04:05', '.border { border-width: 1px; }', '<div class="border border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1434, '.skew-y-3', 'classes/transform/skew-y-3', NULL, '2024-03-06 04:56:36', '2024-03-06 04:56:36', '.skew-y-3 { --transform-skew-y: 3deg; }', '<div class="skew-y-3 transform bg-teal-400 p-4 m-4 inline-flex">3</div>', '<div>
  <div class="skew-y-3 transform bg-teal-400 p-4 m-4 inline-flex">
    3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1447, '.skew-y-1', 'classes/transform/skew-y-1', NULL, '2024-03-06 04:56:41', '2024-03-06 04:56:41', NULL, '    <div class="skew-y-1 transform bg-teal-400 p-4 m-4inline-flex">1</div>', '<div>
  <div class="skew-y-1 transform bg-teal-400 p-4 m-4inline-flex">
    1
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1449, '.transform-gpu', 'classes/transform/transform-gpu', NULL, '2024-03-06 04:56:41', '2024-03-06 04:56:41', NULL, '    <div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
        <div class="transform-gpu rotate-45 bg-teal-400 w-12 h-12"></div>
    </div>', '<div>
  <div class="bg-gray-300 p-4 m-2 inline-flex justify-center">
    <div class="transform-gpu rotate-45 bg-teal-400 w-12 h-12">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1459, '.cursor-pointer', 'classes/utilities/cursor-pointer', NULL, '2024-03-06 04:56:45', '2024-03-06 04:56:45', '.cursor-pointer { cursor: pointer; }', '<div class="cursor-pointer bg-teal-400 text-center w-64 py-4 m-2">Pointer</div>', '<div>
  <div class="cursor-pointer bg-teal-400 text-center w-64 py-4 m-2">
    Pointer
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1461, '.cursor-wait', 'classes/utilities/cursor-wait', NULL, '2024-03-06 04:56:46', '2024-03-06 04:56:46', '.cursor-wait { cursor: wait; }', '<div class="cursor-wait bg-teal-400 text-center w-64 py-4 m-2">Wait</div>', '<div>
  <div class="cursor-wait bg-teal-400 text-center w-64 py-4 m-2">
    Wait
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (182, '.to-blue-100', 'classes/background-gradient/to-blue-100', NULL, '2024-03-05 19:03:21', '2024-03-05 19:03:21', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-yellow-400 to-blue-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-yellow-400 to-blue-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (185, '.to-green-100', 'classes/background-gradient/to-green-100', NULL, '2024-03-05 19:03:22', '2024-03-05 19:03:22', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-green-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-green-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (200, '.via-pink-100', 'classes/background-gradient/via-pink-100', NULL, '2024-03-05 19:03:27', '2024-03-05 19:03:27', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-pink-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-pink-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (203, '.via-transparent', 'classes/background-gradient/via-transparent', NULL, '2024-03-05 19:03:28', '2024-03-05 19:03:28', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-transparent to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-transparent to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (217, '.border-gray-800', 'classes/border-color/border-gray-800', NULL, '2024-03-05 19:03:33', '2024-03-05 19:03:33', '.border-gray-800 { border-color: #2d3748; }', '<div class="border-gray-800 border-4 p-8"></div>', '<div>
  <div class="border-gray-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (223, '.border-red-500', 'classes/border-color/border-red-500', NULL, '2024-03-05 19:03:35', '2024-03-05 19:03:35', '.border-red-500 { border-color: #f56565; }', '<div class="border-red-500 border-4 p-8"></div>', '<div>
  <div class="border-red-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (238, '.border-yellow-200', 'classes/border-color/border-yellow-200', NULL, '2024-03-05 19:03:41', '2024-03-05 19:03:41', '.border-yellow-200 { border-color: #fefcbf; }', '<div class="border-yellow-200 border-4 p-8"></div>', '<div>
  <div class="border-yellow-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (241, '.border-yellow-500', 'classes/border-color/border-yellow-500', NULL, '2024-03-05 19:03:42', '2024-03-05 19:03:42', '.border-yellow-500 { border-color: #ecc94b; }', '<div class="border-yellow-500 border-4 p-8"></div>', '<div>
  <div class="border-yellow-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (259, '.border-teal-500', 'classes/border-color/border-teal-500', NULL, '2024-03-05 19:03:48', '2024-03-05 19:03:48', '.border-teal-500 { border-color: #38b2ac; }', '<div class="border-teal-500 border-4 p-8"></div>', '<div>
  <div class="border-teal-500 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (261, '.border-teal-700', 'classes/border-color/border-teal-700', NULL, '2024-03-05 19:03:49', '2024-03-05 19:03:49', '.border-teal-700 { border-color: #2c7a7b; }', '<div class="border-teal-700 border-4 p-8"></div>', '<div>
  <div class="border-teal-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (276, '.border-indigo-400', 'classes/border-color/border-indigo-400', NULL, '2024-03-05 19:03:55', '2024-03-05 19:03:55', '.border-indigo-400 { border-color: #7f9cf5; }', '<div class="border-indigo-400 border-4 p-8"></div>', '<div>
  <div class="border-indigo-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (283, '.border-purple-200', 'classes/border-color/border-purple-200', NULL, '2024-03-05 19:03:57', '2024-03-05 19:03:57', '.border-purple-200 { border-color: #e9d8fd; }', '<div class="border-purple-200 border-4 p-8"></div>', '<div>
  <div class="border-purple-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (293, '.border-pink-300', 'classes/border-color/border-pink-300', NULL, '2024-03-05 19:04:01', '2024-03-05 19:04:01', '.border-pink-300 { border-color: #fbb6ce; }', '<div class="border-pink-300 border-4 p-8"></div>', '<div>
  <div class="border-pink-300 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (302, '.border-dotted', 'classes/borders/border-dotted', NULL, '2024-03-05 19:04:04', '2024-03-05 19:04:04', '.border-dotted {
    border-style: dotted;
}', '<div class="border-dotted border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-dotted border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1444, '.rotate-1', 'classes/transform/rotate-1', NULL, '2024-03-06 04:56:40', '2024-03-06 04:56:40', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform rotate-1 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform rotate-1 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1453, '.text-7xl', 'classes/typography/text-7xl', NULL, '2024-03-06 04:56:43', '2024-03-06 04:56:43', NULL, '    <p class="text-7xl">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-7xl">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1456, '.cursor-auto', 'classes/utilities/cursor-auto', NULL, '2024-03-06 04:56:44', '2024-03-06 04:56:44', '.cursor-auto { cursor: auto; }', '<div class="cursor-auto bg-teal-400 text-center w-64 py-4 m-2">Auto</div>', '<div>
  <div class="cursor-auto bg-teal-400 text-center w-64 py-4 m-2">
    Auto
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (183, '.to-current', 'classes/background-gradient/to-current', NULL, '2024-03-05 19:03:21', '2024-03-05 19:03:21', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-current"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-current">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (186, '.to-indigo-100', 'classes/background-gradient/to-indigo-100', NULL, '2024-03-05 19:03:22', '2024-03-05 19:03:22', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-indigo-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-indigo-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (204, '.via-white', 'classes/background-gradient/via-white', NULL, '2024-03-05 19:03:28', '2024-03-05 19:03:28', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-white to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-white to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (207, '.border-current', 'classes/border-color/border-current', NULL, '2024-03-05 19:03:29', '2024-03-05 19:03:29', '.border-current { border-color: currentColor; }', '<div class="border-current border-4 p-8"></div>', '<div>
  <div class="border-current border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (226, '.border-red-800', 'classes/border-color/border-red-800', NULL, '2024-03-05 19:03:36', '2024-03-05 19:03:36', '.border-red-800 { border-color: #9b2c2c; }', '<div class="border-red-800 border-4 p-8"></div>', '<div>
  <div class="border-red-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (229, '.border-orange-200', 'classes/border-color/border-orange-200', NULL, '2024-03-05 19:03:37', '2024-03-05 19:03:37', '.border-orange-200 { border-color: #feebc8; }', '<div class="border-orange-200 border-4 p-8"></div>', '<div>
  <div class="border-orange-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (243, '.border-yellow-700', 'classes/border-color/border-yellow-700', NULL, '2024-03-05 19:03:42', '2024-03-05 19:03:42', '.border-yellow-700 { border-color: #b7791f; }', '<div class="border-yellow-700 border-4 p-8"></div>', '<div>
  <div class="border-yellow-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (247, '.border-green-200', 'classes/border-color/border-green-200', NULL, '2024-03-05 19:03:44', '2024-03-05 19:03:44', '.border-green-200 { border-color: #c6f6d5; }', '<div class="border-green-200 border-4 p-8"></div>', '<div>
  <div class="border-green-200 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (264, '.border-blue-100', 'classes/border-color/border-blue-100', NULL, '2024-03-05 19:03:50', '2024-03-05 19:03:50', '.border-blue-100 { border-color: #ebf8ff; }', '<div class="border-blue-100 border-4 p-8"></div>', '<div>
  <div class="border-blue-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (267, '.border-blue-400', 'classes/border-color/border-blue-400', NULL, '2024-03-05 19:03:51', '2024-03-05 19:03:51', '.border-blue-400 { border-color: #63b3ed; }', '<div class="border-blue-400 border-4 p-8"></div>', '<div>
  <div class="border-blue-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (281, '.border-indigo-900', 'classes/border-color/border-indigo-900', NULL, '2024-03-05 19:03:56', '2024-03-05 19:03:56', '.border-indigo-900 { border-color: #3c366b; }', '<div class="border-indigo-900 border-4 p-8"></div>', '<div>
  <div class="border-indigo-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (289, '.border-purple-800', 'classes/border-color/border-purple-800', NULL, '2024-03-05 19:03:59', '2024-03-05 19:03:59', '.border-purple-800 { border-color: #553c9a; }', '<div class="border-purple-800 border-4 p-8"></div>', '<div>
  <div class="border-purple-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (303, '.border-double', 'classes/borders/border-double', NULL, '2024-03-05 19:04:04', '2024-03-05 19:04:04', '.border-double {
    border-style: double;
}', '<div class="border-double border-4 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-double border-4 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (311, '.border-opacity-25+%25_F+border-*-%23', 'classes/borders/border-opacity-25+%25_F+border-*-%23', NULL, '2024-03-05 19:04:07', '2024-03-05 19:04:07', '.border-opacity-0 { --border-opacity: 0; }
border-opacity-25 { --border-opacity: 0.25; }
border-opacity-50 { --border-opacity: 0.5; }
border-opacity-75 { --border-opacity: 0.75; }
border-opacity-100 { --border-opacity: 1; }', '<div class="border-opacity-0 border-4 border-teal-600 p-4"></div>
<div class="border-opacity-25 border-4 border-teal-600 p-4"></div>
<div class="border-opacity-50 border-4 border-teal-600 p-4"></div>
<div class="border-opacity-100 border-4 border-teal-600 p-4"></div>', '<div>
  <div class="border-opacity-0 border-4 border-teal-600 p-4">
  </div>
  <div class="border-opacity-25 border-4 border-teal-600 p-4">
  </div>
  <div class="border-opacity-50 border-4 border-teal-600 p-4">
  </div>
  <div class="border-opacity-100 border-4 border-teal-600 p-4">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1448, '.skew-y-2', 'classes/transform/skew-y-2', NULL, '2024-03-06 04:56:41', '2024-03-06 04:56:41', NULL, '    <div class="skew-y-2 transform bg-teal-400 p-4 m-4inline-flex">2</div>', '<div>
  <div class="skew-y-2 transform bg-teal-400 p-4 m-4inline-flex">
    2
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1450, '.translate-x-11', 'classes/transform/translate-x-11', NULL, '2024-03-06 04:56:42', '2024-03-06 04:56:42', NULL, '    <div class="bg-gray-300 w-64 h-6 m-2">
        <div class="translate-x-11 transform bg-teal-400 h-6 w-6 text-center">1</div>
    </div>', '<div>
  <div class="bg-gray-300 w-64 h-6 m-2">
    <div class="translate-x-11 transform bg-teal-400 h-6 w-6 text-center">
      1
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1462, '.cursor-not-allowed', 'classes/utilities/cursor-not-allowed', NULL, '2024-03-06 04:56:46', '2024-03-06 04:56:46', '.cursor-not-allowed { cursor: not-allowed; }', '<div class="cursor-not-allowed bg-teal-400 text-center w-64 py-4 m-2">Not Allowed</div>', '<div>
  <div class="cursor-not-allowed bg-teal-400 text-center w-64 py-4 m-2">
    Not Allowed
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (187, '.to-pink-100', 'classes/background-gradient/to-pink-100', NULL, '2024-03-05 19:03:22', '2024-03-05 19:03:22', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-pink-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-pink-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (189, '.to-red-100', 'classes/background-gradient/to-red-100', NULL, '2024-03-05 19:03:23', '2024-03-05 19:03:23', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-red-100"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-blue-400 to-red-100">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (205, '.via-yellow-100', 'classes/background-gradient/via-yellow-100', NULL, '2024-03-05 19:03:29', '2024-03-05 19:03:29', NULL, '    <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-yellow-100 to-blue-400"></div>', '<div>
  <div class="inline-block p-8 bg-gradient-to-b from-green-400 via-yellow-100 to-blue-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (208, '.border-black', 'classes/border-color/border-black', NULL, '2024-03-05 19:03:30', '2024-03-05 19:03:30', '.border-black { border-color: #000; }', '<div class="border-black border-4 p-8"></div>', '<div>
  <div class="border-black border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (222, '.border-red-400', 'classes/border-color/border-red-400', NULL, '2024-03-05 19:03:35', '2024-03-05 19:03:35', '.border-red-400 { border-color: #fc8181; }', '<div class="border-red-400 border-4 p-8"></div>', '<div>
  <div class="border-red-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (225, '.border-red-700', 'classes/border-color/border-red-700', NULL, '2024-03-05 19:03:36', '2024-03-05 19:03:36', '.border-red-700 { border-color: #c53030; }', '<div class="border-red-700 border-4 p-8"></div>', '<div>
  <div class="border-red-700 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (242, '.border-yellow-600', 'classes/border-color/border-yellow-600', NULL, '2024-03-05 19:03:42', '2024-03-05 19:03:42', '.border-yellow-600 { border-color: #d69e2e; }', '<div class="border-yellow-600 border-4 p-8"></div>', '<div>
  <div class="border-yellow-600 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (246, '.border-green-100', 'classes/border-color/border-green-100', NULL, '2024-03-05 19:03:43', '2024-03-05 19:03:43', '.border-green-100 { border-color: #f0fff4; }', '<div class="border-green-100 border-4 p-8"></div>', '<div>
  <div class="border-green-100 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (263, '.border-teal-900', 'classes/border-color/border-teal-900', NULL, '2024-03-05 19:03:50', '2024-03-05 19:03:50', '.border-teal-900 { border-color: #234e52; }', '<div class="border-teal-900 border-4 p-8"></div>', '<div>
  <div class="border-teal-900 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (280, '.border-indigo-800', 'classes/border-color/border-indigo-800', NULL, '2024-03-05 19:03:56', '2024-03-05 19:03:56', '.border-indigo-800 { border-color: #434190; }', '<div class="border-indigo-800 border-4 p-8"></div>', '<div>
  <div class="border-indigo-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (285, '.border-purple-400', 'classes/border-color/border-purple-400', NULL, '2024-03-05 19:03:58', '2024-03-05 19:03:58', '.border-purple-400 { border-color: #b794f4; }', '<div class="border-purple-400 border-4 p-8"></div>', '<div>
  <div class="border-purple-400 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (298, '.border-pink-800', 'classes/border-color/border-pink-800', NULL, '2024-03-05 19:04:03', '2024-03-05 19:04:03', '.border-pink-800 { border-color: #97266d; }', '<div class="border-pink-800 border-4 p-8"></div>', '<div>
  <div class="border-pink-800 border-4 p-8">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (306, '.border-0', 'classes/borders/border-0', NULL, '2024-03-05 19:04:05', '2024-03-05 19:04:05', '.border-0 { border-width: 0; }', '<div class="border-0 border-teal-600 bg-teal-400 p-8 inline-block"></div>', '<div>
  <div class="border-0 border-teal-600 bg-teal-400 p-8 inline-block">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (312, '.divide-x', 'classes/borders/divide-x', NULL, '2024-03-05 19:04:08', '2024-03-05 19:04:08', '.divide-x { border-left-width: 1px; }', '<div class="grid grid-cols-3 divide-x-4 divide-teal-600 my-4">', NULL);
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (313, '.divide-x-0', 'classes/borders/divide-x-0', NULL, '2024-03-05 19:04:08', '2024-03-05 19:04:08', '.divide-x-0 { border-left-width: 0; }', '  <div class="text-center">1</div>', '<div>
  <div class="text-center">
    1
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (314, '.divide-x-2', 'classes/borders/divide-x-2', NULL, '2024-03-05 19:04:08', '2024-03-05 19:04:08', '.divide-x-2 { border-left-width: 2px; }', '  <div class="text-center">2</div>', '<div>
  <div class="text-center">
    2
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (315, '.divide-x-4', 'classes/borders/divide-x-4', NULL, '2024-03-05 19:04:09', '2024-03-05 19:04:09', '.divide-x-4 { border-left-width: 4px; }', '  <div class="text-center">3</div>', '<div>
  <div class="text-center">
    3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (316, '.divide-x-8', 'classes/borders/divide-x-8', NULL, '2024-03-05 19:04:09', '2024-03-05 19:04:09', '.divide-x-8 { border-left-width: 8px; }', '</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (317, '.divide-y', 'classes/borders/divide-y', NULL, '2024-03-05 19:04:10', '2024-03-05 19:04:10', '.divide-y { border-top-width: 1px; }', '<div class="grid grid-cols-1 divide-y-4 divide-teal-600  my-4">', NULL);
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (318, '.divide-y-0', 'classes/borders/divide-y-0', NULL, '2024-03-05 19:04:10', '2024-03-05 19:04:10', '.divide-y-0 { border-top-width: 0; }', '  <div class="text-center">1</div>', '<div>
  <div class="text-center">
    1
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (319, '.divide-y-2', 'classes/borders/divide-y-2', NULL, '2024-03-05 19:04:10', '2024-03-05 19:04:10', '.divide-y-2 { border-top-width: 2px; }', '  <div class="text-center">2</div>', '<div>
  <div class="text-center">
    2
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (320, '.divide-y-4', 'classes/borders/divide-y-4', NULL, '2024-03-05 19:04:11', '2024-03-05 19:04:11', '.divide-y-4 { border-top-width: 4px; }', '  <div class="text-center">3</div>', '<div>
  <div class="text-center">
    3
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (321, '.divide-y-8', 'classes/borders/divide-y-8', NULL, '2024-03-05 19:04:11', '2024-03-05 19:04:11', '.divide-y-8 { border-top-width: 8px; }', '</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (322, '.divide-gray-100+%25_F+.divide-*-%23', 'classes/borders/divide-gray-100+%25_F+.divide-*-%23', NULL, '2024-03-05 19:04:11', '2024-03-05 19:04:11', '.divide-transparent { border-color: transparent; }
.divide-current { border-color: currentColor; }
.divide-black { border-color: #000; }
.divide-white { border-color: #fff; }

/* availale colours */
.divide-gray-600 { border-color: #718096; }
.divide-red-600 { border-color: #e53e3e; }
.divide-orange-600 { border-color: #dd6b20; }
.divide-yellow-600 { border-color: #d69e2e; }
.divide-green-600 { border-color: #38a169; }
.divide-teal-600 { border-color: #319795; }
.divide-blue-600 { border-color: #3182ce; }
.divide-indigo-600 { border-color: #5a67d8; }
.divide-purple-600 { border-color: #805ad5; }
.divide-pink-600 { border-color: #d53f8c; }

/* availale values */
.divide-gray-100 { border-color: #f7fafc; }
.divide-gray-200 { border-color: #edf2f7; }
.divide-gray-300 { border-color: #e2e8f0; }
.divide-gray-400 { border-color: #cbd5e0; }
.divide-gray-500 { border-color: #a0aec0; }
.divide-gray-600 { border-color: #718096; }
.divide-gray-700 { border-color: #4a5568; }
.divide-gray-800 { border-color: #2d3748; }
.divide-gray-900 { border-color: #1a202c; }', '<div class="grid grid-cols-3 divide-x-4 divide-teal-600 my-4">
  <div class="text-center">1</div>
  <div class="text-center">2</div>
  <div class="text-center">3</div>
</div>
<div class="grid grid-cols-3 divide-x-4 divide-red-300 my-4">
  <div class="text-center">1</div>
  <div class="text-center">2</div>
  <div class="text-center">3</div>
</div>', '<div>
  <div class="grid grid-cols-3 divide-x-4 divide-teal-600 my-4">
    <div class="text-center">
      1
    </div>
    <div class="text-center">
      2
    </div>
    <div class="text-center">
      3
    </div>
  </div>
  <div class="grid grid-cols-3 divide-x-4 divide-red-300 my-4">
    <div class="text-center">
      1
    </div>
    <div class="text-center">
      2
    </div>
    <div class="text-center">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (328, '.border-b', 'classes/borders/border-b', NULL, '2024-03-05 19:04:14', '2024-03-05 19:04:14', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-b border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-b border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (329, '.border-b-0', 'classes/borders/border-b-0', NULL, '2024-03-05 19:04:14', '2024-03-05 19:04:14', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-black border-b-0"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-black border-b-0">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (330, '.border-blue-50', 'classes/borders/border-blue-50', NULL, '2024-03-05 19:04:14', '2024-03-05 19:04:14', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-blue-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-blue-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (323, '.divide-x-reverse+%25_F+.divide-*-reverse', 'classes/borders/divide-x-reverse+%25_F+.divide-*-reverse', NULL, '2024-03-05 19:04:12', '2024-03-05 19:04:12', '.divide-x-reverse {
    --divide-x-reverse: 1
}
.divide-y-reverse {
    --divide-y-reverse: 1
}', '<div class="flex flex-row-reverse divide-x-reverse divide-x-4 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>

<div class="flex flex-col-reverse divide-y-reverse divide-y-4 divide-teal-600 my-4">
  <div class="text-center">1</div>
  <div class="text-center">2</div>
  <div class="text-center">3</div>
</div>', '<div>
  <div class="flex flex-row-reverse divide-x-reverse divide-x-4 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
  <div class="flex flex-col-reverse divide-y-reverse divide-y-4 divide-teal-600 my-4">
    <div class="text-center">
      1
    </div>
    <div class="text-center">
      2
    </div>
    <div class="text-center">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (324, '.divide-opacity-25+%25_F+.divide-opacity-*', 'classes/borders/divide-opacity-25+%25_F+.divide-opacity-*', NULL, '2024-03-05 19:04:12', '2024-03-05 19:04:12', '.divide-opacity-0 { --divide-opacity: 0; }
.divide-opacity-25 { --divide-opacity: 0.25; }
.divide-opacity-50 { --divide-opacity: 0.5; }
.divide-opacity-75 { --divide-opacity: 0.75; }
.divide-opacity-100 { --divide-opacity: 1; }', '<div class="flex divide-x-4 divide-opacity-0 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>
<div class="flex divide-x-4 divide-opacity-25 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>
<div class="flex divide-x-4 divide-opacity-50 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>
<div class="flex divide-x-4 divide-opacity-75 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>
<div class="flex divide-x-4 divide-opacity-100 divide-teal-600 my-4">
  <div class="flex-1 text-center">1</div>
  <div class="flex-1 text-center">2</div>
  <div class="flex-1 text-center">3</div>
</div>', '<div>
  <div class="flex divide-x-4 divide-opacity-0 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
  <div class="flex divide-x-4 divide-opacity-25 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
  <div class="flex divide-x-4 divide-opacity-50 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
  <div class="flex divide-x-4 divide-opacity-75 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
  <div class="flex divide-x-4 divide-opacity-100 divide-teal-600 my-4">
    <div class="flex-1 text-center">
      1
    </div>
    <div class="flex-1 text-center">
      2
    </div>
    <div class="flex-1 text-center">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (332, '.border-green-50', 'classes/borders/border-green-50', NULL, '2024-03-05 19:04:15', '2024-03-05 19:04:15', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-green-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-green-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (336, '.border-opacity-0', 'classes/borders/border-opacity-0', NULL, '2024-03-05 19:04:17', '2024-03-05 19:04:17', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-black border-opacity-0"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-black border-opacity-0">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (342, '.border-t', 'classes/borders/border-t', NULL, '2024-03-05 19:04:19', '2024-03-05 19:04:19', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-t border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-t border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (343, '.border-t-0', 'classes/borders/border-t-0', NULL, '2024-03-05 19:04:19', '2024-03-05 19:04:19', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-t-0 border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-t-0 border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (348, '.rounded-b-3xl', 'classes/borders/rounded-b-3xl', NULL, '2024-03-05 19:04:21', '2024-03-05 19:04:21', NULL, '    <div class="rounded-b-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-b-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (352, '.rounded-bl-xl', 'classes/borders/rounded-bl-xl', NULL, '2024-03-05 19:04:23', '2024-03-05 19:04:23', NULL, '    <div class="rounded-bl-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-bl-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (359, '.rounded-r-3xl', 'classes/borders/rounded-r-3xl', NULL, '2024-03-05 19:04:25', '2024-03-05 19:04:25', NULL, '    <div class="rounded-r-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-r-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (362, '.rounded-t-3xl', 'classes/borders/rounded-t-3xl', NULL, '2024-03-05 19:04:26', '2024-03-05 19:04:26', NULL, '    <div class="rounded-t-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-t-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (367, '.rounded-tr-2xl', 'classes/borders/rounded-tr-2xl', NULL, '2024-03-05 19:04:28', '2024-03-05 19:04:28', NULL, '    <div class="rounded-tr-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tr-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (369, '.rounded-tr-xl', 'classes/borders/rounded-tr-xl', NULL, '2024-03-05 19:04:29', '2024-03-05 19:04:29', NULL, '    <div class="rounded-tr-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tr-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (376, '.bg-indigo-50', 'classes/colors/bg-indigo-50', NULL, '2024-03-05 19:04:31', '2024-03-05 19:04:31', NULL, '    <div class="p-6 bg-indigo-50"></div>', '<div>
  <div class="p-6 bg-indigo-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (383, '.hidden', 'classes/display/hidden', NULL, '2024-03-05 19:04:34', '2024-03-05 19:04:34', '.hidden {
    display: none;
}', '<div class="bg-gray-400 p-2">
  <span class="hidden bg-teal-400">One</span>
  <span class="block bg-teal-400">Two</span>
</div>
', '<div>
  <div class="bg-gray-400 p-2">
    <span class="hidden bg-teal-400">
      One
    </span>
    <span class="block bg-teal-400">
      Two
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (387, '.inline-grid', 'classes/display/inline-grid', NULL, '2024-03-05 19:04:36', '2024-03-05 19:04:36', '.inline-grid {
    display: inline-grid;
}', '<div class="bg-gray-400 p-2 inline-grid gap-2 grid-cols-2">
  <div class="bg-teal-400">One</div>
  <div class="bg-teal-400">Two</div>
  <div class="bg-teal-400">Three</div>
  <div class="bg-teal-400">Four</div>
</div>', '<div>
  <div class="bg-gray-400 p-2 inline-grid gap-2 grid-cols-2">
    <div class="bg-teal-400">
      One
    </div>
    <div class="bg-teal-400">
      Two
    </div>
    <div class="bg-teal-400">
      Three
    </div>
    <div class="bg-teal-400">
      Four
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (390, '.flow-root', 'classes/display/flow-root', NULL, '2024-03-05 19:04:37', '2024-03-05 19:04:37', '.flow-root {
    display: flow-root;
}', '<div class="flow-root bg-gray-400">
  <div class="bg-teal-400">One</div>
</div>
<div class="flow-root bg-gray-200">
  <div class="bg-teal-400">Two</div>
</div>', '<div>
  <div class="flow-root bg-gray-400">
    <div class="bg-teal-400">
      One
    </div>
  </div>
  <div class="flow-root bg-gray-200">
    <div class="bg-teal-400">
      Two
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (397, '.divide-gray-100', 'classes/divide/divide-gray-100', NULL, '2024-03-05 19:04:39', '2024-03-05 19:04:39', NULL, '    <div class="divide-y-4 divide-gray-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-gray-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (599, '.mb-px', 'classes/margins/mb-px', NULL, '2024-03-06 04:51:14', '2024-03-06 04:51:14', '.mb-px { margin-bottom: 1px; }', '<span class="mb-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (325, '.border-collapse', 'classes/borders/border-collapse', NULL, '2024-03-05 19:04:13', '2024-03-05 19:04:13', '.border-collapse {
  border-collapse: collapse;
}', '<table class="border-collapse border-2 border-gray-500">
  <tr>
    <td class="border border-gray-400 p-2">One</td>
    <td class="border border-gray-400 p-2">One</td>
  </tr>
  <tr>
    <td class="border border-gray-400 p-2">Two</td>
    <td class="border border-gray-400 p-2">Two</td>
  </tr>
</table>', '<div>
  <table class="border-collapse border-2 border-gray-500">
    <tr>
      <td class="border border-gray-400 p-2">
        One
      </td>
      <td class="border border-gray-400 p-2">
        One
      </td>
    </tr>
    <tr>
      <td class="border border-gray-400 p-2">
        Two
      </td>
      <td class="border border-gray-400 p-2">
        Two
      </td>
    </tr>
  </table>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (333, '.border-indigo-50', 'classes/borders/border-indigo-50', NULL, '2024-03-05 19:04:16', '2024-03-05 19:04:16', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-indigo-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-indigo-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (345, '.rounded-2xl', 'classes/borders/rounded-2xl', NULL, '2024-03-05 19:04:20', '2024-03-05 19:04:20', NULL, '    <div class="rounded-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (353, '.rounded-br-2xl', 'classes/borders/rounded-br-2xl', NULL, '2024-03-05 19:04:23', '2024-03-05 19:04:23', NULL, '    <div class="rounded-br-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-br-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (363, '.rounded-t-xl', 'classes/borders/rounded-t-xl', NULL, '2024-03-05 19:04:27', '2024-03-05 19:04:27', NULL, '    <div class="rounded-t-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-t-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (370, '.rounded-xl', 'classes/borders/rounded-xl', NULL, '2024-03-05 19:04:29', '2024-03-05 19:04:29', NULL, '    <div class="rounded-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (384, '.inline', 'classes/display/inline', NULL, '2024-03-05 19:04:35', '2024-03-05 19:04:35', '.inline {
    display: inline;
}', '<div class="bg-gray-400 p-2">
  <div class="inline bg-teal-400">One</div>
  <div class="inline bg-teal-400">Two</div>
</div>', '<div>
  <div class="bg-gray-400 p-2">
    <div class="inline bg-teal-400">
      One
    </div>
    <div class="inline bg-teal-400">
      Two
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (388, '.flex', 'classes/display/flex', NULL, '2024-03-05 19:04:36', '2024-03-05 19:04:36', '.flex {
    display: flex;
}', '<div class="bg-gray-400 p-2 flex">
  <div class="flex-1 bg-teal-400">One</div>
  <div class="flex-1 bg-teal-400">Two</div>
</div>', '<div>
  <div class="bg-gray-400 p-2 flex">
    <div class="flex-1 bg-teal-400">
      One
    </div>
    <div class="flex-1 bg-teal-400">
      Two
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (402, '.divide-pink-100', 'classes/divide/divide-pink-100', NULL, '2024-03-05 19:04:41', '2024-03-05 19:04:41', NULL, '    <div class="divide-y-4 divide-pink-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-pink-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (409, '.divide-y-reverse', 'classes/divide/divide-y-reverse', NULL, '2024-03-05 19:04:43', '2024-03-05 19:04:43', NULL, '    <div class="divide-y-2 divide-black divide-y-reverse">
        <p class="p-2">1</p>
        <p class="p-2">2</p>
        <p class="p-2">3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-black divide-y-reverse">
    <p class="p-2">
      1
    </p>
    <p class="p-2">
      2
    </p>
    <p class="p-2">
      3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (419, '.flex-no-wrap', 'classes/flex/flex-no-wrap', NULL, '2024-03-05 19:04:47', '2024-03-05 19:04:47', '.flex-no-wrap {
    flex-wrap: nowrap;
}', '<div class="flex flex-no-wrap bg-gray-200">
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">1</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">2</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex flex-no-wrap bg-gray-200">
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (431, '.content-center', 'classes/flexbox/content-center', NULL, '2024-03-05 19:04:51', '2024-03-05 19:04:51', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-center">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-center">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (439, '.justify-items-end', 'classes/flexbox/justify-items-end', NULL, '2024-03-05 19:04:55', '2024-03-05 19:04:55', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-end p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-end p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (453, '.from-black', 'classes/forms/from-black', NULL, '2024-03-05 19:05:00', '2024-03-05 19:05:00', NULL, '    <div class="h-32 w-32 bg-gradient-to-r from-black to-gray-400"></div>', '<div>
  <div class="h-32 w-32 bg-gradient-to-r from-black to-gray-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (461, '.grid-rows-1+%25_F+.grid-rows-*', 'classes/grid/grid-rows-1+%25_F+.grid-rows-*', NULL, '2024-03-05 19:05:03', '2024-03-05 19:05:03', '.grid-rows-1 { grid-template-rows: repeat(1, minmax(0, 1fr)); }
.grid-rows-2 { grid-template-rows: repeat(2, minmax(0, 1fr)); }
.grid-rows-3 { grid-template-rows: repeat(3, minmax(0, 1fr)); }
.grid-rows-4 { grid-template-rows: repeat(4, minmax(0, 1fr)); }
.grid-rows-5 { grid-template-rows: repeat(5, minmax(0, 1fr)); }
.grid-rows-6 { grid-template-rows: repeat(6, minmax(0, 1fr)); }
.grid-rows-none { grid-template-rows: none; }', '<div class="grid grid-rows-3 grid-flow-col gap-2">
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col gap-2">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (326, '.border-separate', 'classes/borders/border-separate', NULL, '2024-03-05 19:04:13', '2024-03-05 19:04:13', '.border-separate {
  border-collapse: separate;
}', '<table class="border-separate border-2 border-gray-500">
  <tr>
    <td class="border border-gray-400 p-2">One</td>
    <td class="border border-gray-400 p-2">One</td>
  </tr>
  <tr>
    <td class="border border-gray-400 p-2">Two</td>
    <td class="border border-gray-400 p-2">Two</td>
  </tr>
</table>', '<div>
  <table class="border-separate border-2 border-gray-500">
    <tr>
      <td class="border border-gray-400 p-2">
        One
      </td>
      <td class="border border-gray-400 p-2">
        One
      </td>
    </tr>
    <tr>
      <td class="border border-gray-400 p-2">
        Two
      </td>
      <td class="border border-gray-400 p-2">
        Two
      </td>
    </tr>
  </table>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (334, '.border-l', 'classes/borders/border-l', NULL, '2024-03-05 19:04:16', '2024-03-05 19:04:16', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-l border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-l border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (346, '.rounded-3xl', 'classes/borders/rounded-3xl', NULL, '2024-03-05 19:04:21', '2024-03-05 19:04:21', NULL, '    <div class="rounded-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (354, '.rounded-br-3xl', 'classes/borders/rounded-br-3xl', NULL, '2024-03-05 19:04:23', '2024-03-05 19:04:23', NULL, '    <div class="rounded-br-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-br-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (372, '.box-content', 'classes/box/box-content', NULL, '2024-03-05 19:04:30', '2024-03-05 19:04:30', '.box-content {
    box-sizing: content-box;
}', '<div class="box-content h-20 w-20 p-4 border-4 border-teal-400 bg-teal-200">
  <div class="h-full w-full bg-teal-400"></div>
</div>', '<div>
  <div class="box-content h-20 w-20 p-4 border-4 border-teal-400 bg-teal-200">
    <div class="h-full w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (377, '.bg-opacity-10', 'classes/colors/bg-opacity-10', NULL, '2024-03-05 19:04:32', '2024-03-05 19:04:32', NULL, '    <div class="flex items-center">
        <div class="inline-block mr-4 p-4 h-20 w-40 bg-blue-600 bg-opacity-10">bg-opacity-10</div>
        <div class="inline-block p-4 h-20 w-40 bg-blue-600"></div>
    </div>', '<div>
  <div class="flex items-center">
    <div class="inline-block mr-4 p-4 h-20 w-40 bg-blue-600 bg-opacity-10">
      bg-opacity-10
    </div>
    <div class="inline-block p-4 h-20 w-40 bg-blue-600">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (391, '.divide-black', 'classes/divide/divide-black', NULL, '2024-03-05 19:04:37', '2024-03-05 19:04:37', NULL, '    <div class="divide-y-2 divide-black">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-black">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (398, '.divide-green-100', 'classes/divide/divide-green-100', NULL, '2024-03-05 19:04:40', '2024-03-05 19:04:40', NULL, '    <div class="divide-y-4 divide-green-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-green-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (412, '.flex-row-reverse', 'classes/flex/flex-row-reverse', NULL, '2024-03-05 19:04:44', '2024-03-05 19:04:44', '.flex-row-reverse {
    flex-direction: row-reverse;
}', '<div class="inline-flex flex-row-reverse">
  <div class="bg-teal-400 p-4 m-2">1</div>
  <div class="bg-teal-400 p-4 m-2">2</div>
  <div class="bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="inline-flex flex-row-reverse">
    <div class="bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (420, '.flex-wrap', 'classes/flex/flex-wrap', NULL, '2024-03-05 19:04:47', '2024-03-05 19:04:47', '.flex-wrap-reverse {
    flex-wrap: wrap-reverse;
}', '<div class="flex flex-wrap bg-gray-200">
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">1</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">2</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex flex-wrap bg-gray-200">
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (429, '.content-around', 'classes/flexbox/content-around', NULL, '2024-03-05 19:04:51', '2024-03-05 19:04:51', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-around">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-around">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (442, '.justify-self-auto', 'classes/flexbox/justify-self-auto', NULL, '2024-03-05 19:04:56', '2024-03-05 19:04:56', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="justify-self-auto bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="justify-self-auto bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (449, '.space-x-reverse', 'classes/flexbox/space-x-reverse', NULL, '2024-03-05 19:04:58', '2024-03-05 19:04:58', NULL, '    <div class="inline-flex space-x-4 flex-row-reverse space-x-reverse bg-gray-300 m-2 h-20">
        <div class="bg-teal-400 w-6 p-2">1</div>
        <div class="bg-teal-400 w-6 p-2">2</div>
        <div class="bg-teal-400 w-6 p-2">3</div>
    </div>', '<div>
  <div class="inline-flex space-x-4 flex-row-reverse space-x-reverse bg-gray-300 m-2 h-20">
    <div class="bg-teal-400 w-6 p-2">
      1
    </div>
    <div class="bg-teal-400 w-6 p-2">
      2
    </div>
    <div class="bg-teal-400 w-6 p-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (492, '.auto-rows-min', 'classes/grid/auto-rows-min', NULL, '2024-03-05 19:05:14', '2024-03-05 19:05:14', NULL, '    <div class="grid grid-flow-row auto-rows-min">
        <div class="p-4 mb-2 bg-teal-400">1</div>
        <div class="p-4 mb-2 bg-teal-400">2</div>
        <div class="p-4 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-min">
    <div class="p-4 mb-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mb-2 bg-teal-400">
      2
    </div>
    <div class="p-4 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (327, '.rounded+%25_F+.rounded-*', 'classes/borders/rounded+%25_F+.rounded-*', NULL, '2024-03-05 19:04:13', '2024-03-05 19:04:13', '.rounded-none { border-radius: 0; }
.rounded-sm { border-radius: 0.125rem; }
.rounded { border-radius: 0.25rem; }
.rounded-md { border-radius: 0.375rem; }
.rounded-lg { border-radius: 0.5rem; }
.rounded-full { border-radius: 9999px; }
.rounded-t-none { 
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.rounded-r-none { 
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.rounded-b-none {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
}
.rounded-l-none {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
.rounded-t-sm {
    border-top-left-radius: 0.125rem;
    border-top-right-radius: 0.125rem;
}
.rounded-r-sm {
    border-top-right-radius: 0.125rem;
    border-bottom-right-radius: 0.125rem;
}
.rounded-b-sm {
    border-bottom-right-radius: 0.125rem;
    border-bottom-left-radius: 0.125rem;
}
.rounded-l-sm {
    border-top-left-radius: 0.125rem;
    border-bottom-left-radius: 0.125rem;
}
.rounded-t {
    border-top-left-radius: 0.25rem;
    border-top-right-radius: 0.25rem;
}
.rounded-r {
    border-top-right-radius: 0.25rem;
    border-bottom-right-radius: 0.25rem;
}
.rounded-b {
    border-bottom-right-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}
.rounded-l {
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}
.rounded-t-md {
    border-top-left-radius: 0.375rem;
    border-top-right-radius: 0.375rem;
}
.rounded-r-md {
    border-top-right-radius: 0.375rem;
    border-bottom-right-radius: 0.375rem;
}
.rounded-b-md {
    border-bottom-right-radius: 0.375rem;
    border-bottom-left-radius: 0.375rem;
}
.rounded-l-md {
    border-top-left-radius: 0.375rem;
    border-bottom-left-radius: 0.375rem;
}
.rounded-t-lg {
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
}
.rounded-r-lg {
    border-top-right-radius: 0.5rem;
    border-bottom-right-radius: 0.5rem;
}
.rounded-b-lg {
    border-bottom-right-radius: 0.5rem;
    border-bottom-left-radius: 0.5rem;
}
.rounded-l-lg {
    border-top-left-radius: 0.5rem;
    border-bottom-left-radius: 0.5rem;
}
.rounded-t-full {
    border-top-left-radius: 9999px;
    border-top-right-radius: 9999px;
}
.rounded-r-full {
    border-top-right-radius: 9999px;
    border-bottom-right-radius: 9999px;
}
.rounded-b-full {
    border-bottom-right-radius: 9999px;
    border-bottom-left-radius: 9999px;
}
.rounded-l-full {
    border-top-left-radius: 9999px;
    border-bottom-left-radius: 9999px;
}
.rounded-tl-none { border-top-left-radius: 0; }
.rounded-tr-none { border-top-right-radius: 0; }
.rounded-br-none { border-bottom-right-radius: 0; }
.rounded-bl-none { border-bottom-left-radius: 0; }
.rounded-tl-sm { border-top-left-radius: 0.125rem; }
.rounded-tr-sm { border-top-right-radius: 0.125rem; }
.rounded-br-sm { border-bottom-right-radius: 0.125rem; }
.rounded-bl-sm { border-bottom-left-radius: 0.125rem; }
.rounded-tl { border-top-left-radius: 0.25rem; }
.rounded-tr { border-top-right-radius: 0.25rem; }
.rounded-br { border-bottom-right-radius: 0.25rem; }
.rounded-bl { border-bottom-left-radius: 0.25rem; }
.rounded-tl-md { border-top-left-radius: 0.375rem; }
.rounded-tr-md { border-top-right-radius: 0.375rem; }
.rounded-br-md { border-bottom-right-radius: 0.375rem; }
.rounded-bl-md { border-bottom-left-radius: 0.375rem; }
.rounded-tl-lg { border-top-left-radius: 0.5rem; }
.rounded-tr-lg { border-top-right-radius: 0.5rem; }
.rounded-br-lg { border-bottom-right-radius: 0.5rem; }
.rounded-bl-lg { border-bottom-left-radius: 0.5rem; }
.rounded-tl-full { border-top-left-radius: 9999px; }
.rounded-tr-full { border-top-right-radius: 9999px; }
.rounded-br-full { border-bottom-right-radius: 9999px; }
.rounded-bl-full { border-bottom-left-radius: 9999px; }', '<div class="rounded-full h-16 w-16 flex bg-teal-400 m-2"></div>
<div class="rounded-bl-lg h-16 w-24 flex bg-teal-400 m-2"></div>
<div class="rounded-b-full  h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-full h-16 w-16 flex bg-teal-400 m-2">
  </div>
  <div class="rounded-bl-lg h-16 w-24 flex bg-teal-400 m-2">
  </div>
  <div class="rounded-b-full  h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (340, '.border-r-0', 'classes/borders/border-r-0', NULL, '2024-03-05 19:04:18', '2024-03-05 19:04:18', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-r-0 border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-r-0 border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (347, '.rounded-b-2xl', 'classes/borders/rounded-b-2xl', NULL, '2024-03-05 19:04:21', '2024-03-05 19:04:21', NULL, '    <div class="rounded-b-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-b-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (361, '.rounded-t-2xl', 'classes/borders/rounded-t-2xl', NULL, '2024-03-05 19:04:26', '2024-03-05 19:04:26', NULL, '    <div class="rounded-t-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-t-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (371, '.box-border', 'classes/box/box-border', NULL, '2024-03-05 19:04:30', '2024-03-05 19:04:30', '.box-border {
    box-sizing: border-box;
}', '<div class="box-border h-20 w-20 p-4 border-4 border-teal-400 bg-teal-200">
  <div class="h-full w-full bg-teal-400"></div>
</div>', '<div>
  <div class="box-border h-20 w-20 p-4 border-4 border-teal-400 bg-teal-200">
    <div class="h-full w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (385, '.inline-block', 'classes/display/inline-block', NULL, '2024-03-05 19:04:35', '2024-03-05 19:04:35', '.inline-block {
    display: inline-block;
}', '<div class="bg-gray-400 p-2">
  <div class="inline-block bg-teal-400">One</div>
  <div class="inline-block bg-teal-400">Two</div>
</div>', '<div>
  <div class="bg-gray-400 p-2">
    <div class="inline-block bg-teal-400">
      One
    </div>
    <div class="inline-block bg-teal-400">
      Two
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (392, '.divide-blue-100', 'classes/divide/divide-blue-100', NULL, '2024-03-05 19:04:37', '2024-03-05 19:04:37', NULL, '    <div class="divide-y-2 divide-blue-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-blue-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (406, '.divide-transparent', 'classes/divide/divide-transparent', NULL, '2024-03-05 19:04:42', '2024-03-05 19:04:42', NULL, '    <div class="divide-y-4 divide-transparent">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-transparent">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (411, '.flex-row', 'classes/flex/flex-row', NULL, '2024-03-05 19:04:44', '2024-03-05 19:04:44', '.flex-row {
    flex-direction: row;
}', '<div class="inline-flex flex-row">
  <div class="bg-teal-400 p-4 m-2">1</div>
  <div class="bg-teal-400 p-4 m-2">2</div>
  <div class="bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="inline-flex flex-row">
    <div class="bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (428, '.order-1+%25_F+.order-*', 'classes/flex/order-1+%25_F+.order-*', NULL, '2024-03-05 19:04:50', '2024-03-05 19:04:50', '.order-first { order: -9999; }
.order-last { order: 9999; }
.order-none { order: 0; }
.order-1 { order: 1; }
.order-2 { order: 2; }
.order-3 { order: 3; }
.order-4 { order: 4; }
.order-5 { order: 5; }
.order-6 { order: 6; }
.order-7 { order: 7; }
.order-8 { order: 8; }
.order-9 { order: 9; }
.order-10 { order: 10; }
.order-11 { order: 11; }
.order-12 { order: 12; }', '<div class="flex bg-gray-200">
  <div class="order-2 bg-teal-400 p-2 m-2">1</div>
  <div class="order-3 bg-teal-400 p-2 m-2">3</div>
  <div class="order-last bg-teal-400 p-2 m-2">4</div>
  <div class="order-first bg-teal-400 p-2 m-2">5</div>
  <div class="bg-teal-400 p-2 m-2">6</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="order-2 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="order-3 bg-teal-400 p-2 m-2">
      3
    </div>
    <div class="order-last bg-teal-400 p-2 m-2">
      4
    </div>
    <div class="order-first bg-teal-400 p-2 m-2">
      5
    </div>
    <div class="bg-teal-400 p-2 m-2">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (441, '.justify-items-stretch', 'classes/flexbox/justify-items-stretch', NULL, '2024-03-05 19:04:55', '2024-03-05 19:04:55', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (445, '.justify-self-start', 'classes/flexbox/justify-self-start', NULL, '2024-03-05 19:04:57', '2024-03-05 19:04:57', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-stretch bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4 m-2">1</div>
        <div class="justify-self-start bg-teal-400 p-4 m-2">2</div>
        <div class="bg-purple-400 p-4 m-2">3</div>
        <div class="bg-purple-400 p-4 m-2">4</div>
        <div class="bg-purple-400 p-4 m-2">5</div>
        <div class="bg-purple-400 p-4 m-2">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-stretch bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4 m-2">
      1
    </div>
    <div class="justify-self-start bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-purple-400 p-4 m-2">
      3
    </div>
    <div class="bg-purple-400 p-4 m-2">
      4
    </div>
    <div class="bg-purple-400 p-4 m-2">
      5
    </div>
    <div class="bg-purple-400 p-4 m-2">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (493, '.col-end-1', 'classes/grid/col-end-1', NULL, '2024-03-05 19:05:15', '2024-03-05 19:05:15', NULL, '    <div class="grid grid-cols-6 gap-4 h-30">
        <div class="p-4 col-end-1 bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-6 gap-4 h-30">
    <div class="p-4 col-end-1 bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (331, '.border-gray-50', 'classes/borders/border-gray-50', NULL, '2024-03-05 19:04:15', '2024-03-05 19:04:15', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-gray-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-gray-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (339, '.border-r', 'classes/borders/border-r', NULL, '2024-03-05 19:04:18', '2024-03-05 19:04:18', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-r border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-r border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (356, '.rounded-l-2xl', 'classes/borders/rounded-l-2xl', NULL, '2024-03-05 19:04:24', '2024-03-05 19:04:24', NULL, '    <div class="rounded-l-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-l-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (364, '.rounded-tl-2xl', 'classes/borders/rounded-tl-2xl', NULL, '2024-03-05 19:04:27', '2024-03-05 19:04:27', NULL, '    <div class="rounded-tl-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tl-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (378, '.bg-pink-50', 'classes/colors/bg-pink-50', NULL, '2024-03-05 19:04:32', '2024-03-05 19:04:32', NULL, '    <div class="p-6 bg-pink-50"></div>', '<div>
  <div class="p-6 bg-pink-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (382, '.block', 'classes/display/block', NULL, '2024-03-05 19:04:34', '2024-03-05 19:04:34', '.block {
    display: block;
}', '<div class="bg-gray-400 p-2">
  <span class="block bg-teal-400">One</span>
  <span class="block bg-teal-400">Two</span>
</div>
', '<div>
  <div class="bg-gray-400 p-2">
    <span class="block bg-teal-400">
      One
    </span>
    <span class="block bg-teal-400">
      Two
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (396, '.divide-doubble', 'classes/divide/divide-doubble', NULL, '2024-03-05 19:04:39', '2024-03-05 19:04:39', NULL, '    <div class="divide-y-2 divide-doubble">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-doubble">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (403, '.divide-purple-100', 'classes/divide/divide-purple-100', NULL, '2024-03-05 19:04:41', '2024-03-05 19:04:41', NULL, '    <div class="divide-y-4 divide-purple-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-purple-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (414, '.flex-col-reverse', 'classes/flex/flex-col-reverse', NULL, '2024-03-05 19:04:45', '2024-03-05 19:04:45', '.flex-col-reverse {
    flex-direction: column-reverse;
}', '<div class="inline-flex flex-col-reverse">
  <div class="bg-teal-400 p-4 m-2">1</div>
  <div class="bg-teal-400 p-4 m-2">2</div>
  <div class="bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="inline-flex flex-col-reverse">
    <div class="bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (422, '.items-stretch+%25_F+.items-*', 'classes/flex/items-stretch+%25_F+.items-*', NULL, '2024-03-05 19:04:48', '2024-03-05 19:04:48', '.items-stretch { align-items: stretch; }
.items-start { align-items: flex-start; }
.items-center { align-items: center; }
.items-end { align-items: flex-end; }
.items-baseline { align-items: baseline; }', '<div class="flex items-stretch bg-gray-200 h-20 my-2">
  <div class="flex-1 bg-teal-400 p-2 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-start bg-gray-200 h-20 my-2">
  <div class="flex-1 bg-teal-400 p-2 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-center bg-gray-200 h-20 my-2">
  <div class="flex-1 bg-teal-400 p-2 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-end bg-gray-200 h-20 my-2">
  <div class="flex-1 bg-teal-400 p-2 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-baseline bg-gray-200 h-20 my-2">
  <div class="flex-1 bg-teal-400 p-2 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-2 m-2 text-2xl">2</div>
  <div class="flex-1 bg-teal-400 p-2 m-2">3</div>
</div>', '<div>
  <div class="flex items-stretch bg-gray-200 h-20 my-2">
    <div class="flex-1 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-start bg-gray-200 h-20 my-2">
    <div class="flex-1 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-center bg-gray-200 h-20 my-2">
    <div class="flex-1 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-end bg-gray-200 h-20 my-2">
    <div class="flex-1 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-baseline bg-gray-200 h-20 my-2">
    <div class="flex-1 bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2 text-2xl">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (433, '.content-evenly', 'classes/flexbox/content-evenly', NULL, '2024-03-05 19:04:52', '2024-03-05 19:04:52', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-evenly">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-evenly">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (446, '.justify-self-stretch', 'classes/flexbox/justify-self-stretch', NULL, '2024-03-05 19:04:57', '2024-03-05 19:04:57', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-start bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4 m-2">1</div>
        <div class="justify-self-stretch bg-teal-400 p-4 m-2">2</div>
        <div class="bg-purple-400 p-4 m-2">3</div>
        <div class="bg-purple-400 p-4 m-2">4</div>
        <div class="bg-purple-400 p-4 m-2">5</div>
        <div class="bg-purple-400 p-4 m-2">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-start bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4 m-2">
      1
    </div>
    <div class="justify-self-stretch bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-purple-400 p-4 m-2">
      3
    </div>
    <div class="bg-purple-400 p-4 m-2">
      4
    </div>
    <div class="bg-purple-400 p-4 m-2">
      5
    </div>
    <div class="bg-purple-400 p-4 m-2">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (451, '.space-y-reverse', 'classes/flexbox/space-y-reverse', NULL, '2024-03-05 19:04:59', '2024-03-05 19:04:59', NULL, '    <div class="flex flex-col-reverse space-y-4 space-y-reverse bg-gray-300 m-2 w-40">
        <div class="bg-teal-400 w-6 p-2">1</div>
        <div class="bg-teal-400 w-6 p-2">2</div>
        <div class="bg-teal-400 w-6 p-2">3</div>
    </div>', '<div>
  <div class="flex flex-col-reverse space-y-4 space-y-reverse bg-gray-300 m-2 w-40">
    <div class="bg-teal-400 w-6 p-2">
      1
    </div>
    <div class="bg-teal-400 w-6 p-2">
      2
    </div>
    <div class="bg-teal-400 w-6 p-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (494, '.col-end-auto', 'classes/grid/col-end-auto', NULL, '2024-03-05 19:05:15', '2024-03-05 19:05:15', NULL, '    <div class="grid grid-cols-6 gap-4 h-30">
        <div class="p-4 col-end-auto bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-6 gap-4 h-30">
    <div class="p-4 col-end-auto bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (335, '.border-l-0', 'classes/borders/border-l-0', NULL, '2024-03-05 19:04:16', '2024-03-05 19:04:16', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-l-0 border-black"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-l-0 border-black">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (344, '.border-yellow-50', 'classes/borders/border-yellow-50', NULL, '2024-03-05 19:04:20', '2024-03-05 19:04:20', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-yellow-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-yellow-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (357, '.rounded-l-xl', 'classes/borders/rounded-l-xl', NULL, '2024-03-05 19:04:25', '2024-03-05 19:04:25', NULL, '    <div class="rounded-l-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-l-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (365, '.rounded-tl-3xl', 'classes/borders/rounded-tl-3xl', NULL, '2024-03-05 19:04:27', '2024-03-05 19:04:27', NULL, '    <div class="rounded-tl-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tl-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (379, '.bg-purple-50', 'classes/colors/bg-purple-50', NULL, '2024-03-05 19:04:33', '2024-03-05 19:04:33', NULL, '    <div class="p-6 bg-purple-50"></div>', '<div>
  <div class="p-6 bg-purple-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (386, '.inline-flex', 'classes/display/inline-flex', NULL, '2024-03-05 19:04:35', '2024-03-05 19:04:35', '.inline-flex {
    display: inline-flex;
}', '<div class="bg-gray-400 p-2 inline-flex">
  <div class="bg-teal-400">One</div>
  <div class="bg-teal-400">Two</div>
</div>', '<div>
  <div class="bg-gray-400 p-2 inline-flex">
    <div class="bg-teal-400">
      One
    </div>
    <div class="bg-teal-400">
      Two
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (400, '.divide-none', 'classes/divide/divide-none', NULL, '2024-03-05 19:04:40', '2024-03-05 19:04:40', NULL, '    <div class="divide-y-2 divide-none">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-none">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (405, '.divide-solid', 'classes/divide/divide-solid', NULL, '2024-03-05 19:04:42', '2024-03-05 19:04:42', NULL, '    <div class="divide-y-4 divide-black divide-solid">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-black divide-solid">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (418, '.flex-none', 'classes/flex/flex-none', NULL, '2024-03-05 19:04:47', '2024-03-05 19:04:47', '.flex-none {
    flex: none;
}', '<div class="flex bg-gray-200">
  <div class="flex-none bg-teal-400 p-4 m-2">1</div>
  <div class="flex-none bg-teal-400 p-4 m-2">2</div>
  <div class="flex-none bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-none bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="flex-none bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="flex-none bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (427, '.flex-shrink+%25_F+.flex-shrink-0', 'classes/flex/flex-shrink+%25_F+.flex-shrink-0', NULL, '2024-03-05 19:04:50', '2024-03-05 19:04:50', '.flex-shrink { flex-shrink: 1; }
.flex-shrink-0 { flex-shrink: 0; }', '<div class="flex bg-gray-200">
  <div class="flex-none text-center bg-teal-400 p-2 m-2">Lorem ipsum dolor sit amet, consectetur</div>
  <div class="flex-shrink text-center bg-teal-400 p-2 m-2">
    Lorem ipsum dolor sit amet, consectetur 
    adipiscing elit. Pellentesque justo purus, 
    vulputate at ipsum eget, posuere facilisis 
    libero. Proin et pulvinar felis.
  </div>
  <div class="flex-none text-center bg-teal-400 p-2 m-2">Lorem ipsum dolor sit amet, consectetur</div>
</div>
<div class="flex bg-gray-200">
  <div class="flex-shrink text-center bg-teal-400 p-2 m-2">Lorem ipsum dolor sit amet, consectetur</div>
  <div class="flex-shrink-0 text-center bg-teal-400 p-2 m-2">
    Lorem ipsum dolor sit amet, consectetur 
    adipiscing elit. Pellentesque justo purus, 
    vulputate at ipsum eget, posuere facilisis 
    libero. Proin et pulvinar felis.
  </div>
  <div class="flex-shrink text-center bg-teal-400 p-2 m-2">Lorem ipsum dolor sit amet, consectetur</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-none text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur
    </div>
    <div class="flex-shrink text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur 
    adipiscing elit. Pellentesque justo purus, 
    vulputate at ipsum eget, posuere facilisis 
    libero. Proin et pulvinar felis.
    </div>
    <div class="flex-none text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur
    </div>
  </div>
  <div class="flex bg-gray-200">
    <div class="flex-shrink text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur
    </div>
    <div class="flex-shrink-0 text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur 
    adipiscing elit. Pellentesque justo purus, 
    vulputate at ipsum eget, posuere facilisis 
    libero. Proin et pulvinar felis.
    </div>
    <div class="flex-shrink text-center bg-teal-400 p-2 m-2">
      Lorem ipsum dolor sit amet, consectetur
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (435, '.contents', 'classes/flexbox/contents', NULL, '2024-03-05 19:04:53', '2024-03-05 19:04:53', NULL, '    <div class="flex h-40 w-96 p-2 bg-gray-200">
        <div class="flex-1 px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="flex-1 px-10 py-2 bg-teal-400 rounded">2</div>
        <div class="contents">
            <div class="flex-1 px-10 py-2 bg-teal-400 rounded">3</div>
            <div class="flex-1 px-10 py-2 bg-teal-400 rounded">4</div>
        </div>
    </div>', '<div>
  <div class="flex h-40 w-96 p-2 bg-gray-200">
    <div class="flex-1 px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="flex-1 px-10 py-2 bg-teal-400 rounded">
      2
    </div>
    <div class="contents">
      <div class="flex-1 px-10 py-2 bg-teal-400 rounded">
        3
      </div>
      <div class="flex-1 px-10 py-2 bg-teal-400 rounded">
        4
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (448, '.space-x-px', 'classes/flexbox/space-x-px', NULL, '2024-03-05 19:04:58', '2024-03-05 19:04:58', NULL, '    <div class="inline-flex space-x-px bg-gray-300 m-2 h-20">
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
    </div>', '<div>
  <div class="inline-flex space-x-px bg-gray-300 m-2 h-20">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (455, '.col-span-1+%25_F+.col-span-*', 'classes/grid/col-span-1+%25_F+.col-span-*', NULL, '2024-03-05 19:05:00', '2024-03-05 19:05:00', '.col-span-1 { grid-column: span 1 / span 1; }
.col-span-2 { grid-column: span 2 / span 2; }
.col-span-3 { grid-column: span 3 / span 3; }
.col-span-4 { grid-column: span 4 / span 4; }
.col-span-5 { grid-column: span 5 / span 5; }
.col-span-6 { grid-column: span 6 / span 6; }
.col-span-7 { grid-column: span 7 / span 7; }
.col-span-8 { grid-column: span 8 / span 8; }
.col-span-9 { grid-column: span 9 / span 9; }
.col-span-10 { grid-column: span 10 / span 10; }
.col-span-11 { grid-column: span 11 / span 11; }
.col-span-12 { grid-column: span 12 / span 12; }', '<div class="grid grid-cols-3 gap-4">
  <div class="col-span-3 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-2 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="col-span-3 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-2 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (468, '.row-start-auto', 'classes/grid/row-start-auto', NULL, '2024-03-05 19:05:06', '2024-03-05 19:05:06', '.row-start-auto { grid-row-start: auto; }', '<div class="grid grid-cols-3 gap-4">', NULL);
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (337, '.border-pink-50', 'classes/borders/border-pink-50', NULL, '2024-03-05 19:04:17', '2024-03-05 19:04:17', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-pink-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-pink-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (350, '.rounded-bl-2xl', 'classes/borders/rounded-bl-2xl', NULL, '2024-03-05 19:04:22', '2024-03-05 19:04:22', NULL, '    <div class="rounded-b-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-b-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (355, '.rounded-br-xl', 'classes/borders/rounded-br-xl', NULL, '2024-03-05 19:04:24', '2024-03-05 19:04:24', NULL, '    <div class="rounded-br-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-br-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (368, '.rounded-tr-3xl', 'classes/borders/rounded-tr-3xl', NULL, '2024-03-05 19:04:29', '2024-03-05 19:04:29', NULL, '    <div class="rounded-tr-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tr-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (375, '.bg-green-50', 'classes/colors/bg-green-50', NULL, '2024-03-05 19:04:31', '2024-03-05 19:04:31', NULL, '    <div class="p-6 bg-green-50"></div>', '<div>
  <div class="p-6 bg-green-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (389, '.grid', 'classes/display/grid', NULL, '2024-03-05 19:04:36', '2024-03-05 19:04:36', '.grid {
    display: grid;
}', '<div class="bg-gray-400 p-2 grid gap-2 grid-cols-2">
  <div class="bg-teal-400">One</div>
  <div class="bg-teal-400">Two</div>
  <div class="bg-teal-400">Three</div>
  <div class="bg-teal-400">Four</div>
</div>', '<div>
  <div class="bg-gray-400 p-2 grid gap-2 grid-cols-2">
    <div class="bg-teal-400">
      One
    </div>
    <div class="bg-teal-400">
      Two
    </div>
    <div class="bg-teal-400">
      Three
    </div>
    <div class="bg-teal-400">
      Four
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (393, '.divide-current', 'classes/divide/divide-current', NULL, '2024-03-05 19:04:38', '2024-03-05 19:04:38', NULL, '    <div class="divide-y-2 divide-current">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-current">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (407, '.divide-white', 'classes/divide/divide-white', NULL, '2024-03-05 19:04:43', '2024-03-05 19:04:43', NULL, '    <div class="bg-black p-4 text-white divide-y-2 divide-black divide-white">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="bg-black p-4 text-white divide-y-2 divide-black divide-white">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (415, '.flex-initial', 'classes/flex/flex-initial', NULL, '2024-03-05 19:04:45', '2024-03-05 19:04:45', '.flex-initial {
    flex: 0 1 auto;
}', '<div class="flex bg-gray-200">
  <div class="flex-initial bg-teal-400 p-4 m-2">1</div>
  <div class="flex-initial bg-teal-400 p-4 m-2">2</div>
  <div class="flex-initial bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-initial bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="flex-initial bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="flex-initial bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (424, '.justify-start+%25_F+.justify-*', 'classes/flex/justify-start+%25_F+.justify-*', NULL, '2024-03-05 19:04:49', '2024-03-05 19:04:49', '.justify-start { justify-content: flex-start; }
.justify-center { justify-content: center; }
.justify-end { justify-content: flex-end; }
.justify-between { justify-content: space-between; }
.justify-around { justify-content: space-around; }', '<div class="flex justify-start bg-gray-200 my-2">
 <div class="bg-teal-400 p-2 m-2">1</div>
 <div class="bg-teal-400 p-2 m-2">2</div>
 <div class="bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex justify-center bg-gray-200 my-2">
 <div class="bg-teal-400 p-2 m-2">1</div>
 <div class="bg-teal-400 p-2 m-2">2</div>
 <div class="bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex justify-end bg-gray-200 my-2">
 <div class="bg-teal-400 p-2 m-2">1</div>
 <div class="bg-teal-400 p-2 m-2">2</div>
 <div class="bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex justify-between bg-gray-200 my-2">
 <div class="bg-teal-400 p-2 m-2">1</div>
 <div class="bg-teal-400 p-2 m-2">2</div>
 <div class="bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex justify-around bg-gray-200 my-2">
 <div class="bg-teal-400 p-2 m-2">1</div>
 <div class="bg-teal-400 p-2 m-2">2</div>
 <div class="bg-teal-400 p-2 m-2">3</div>
</div>', '<div>
  <div class="flex justify-start bg-gray-200 my-2">
    <div class="bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex justify-center bg-gray-200 my-2">
    <div class="bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex justify-end bg-gray-200 my-2">
    <div class="bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex justify-between bg-gray-200 my-2">
    <div class="bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex justify-around bg-gray-200 my-2">
    <div class="bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (436, '.flex-nowrap', 'classes/flexbox/flex-nowrap', NULL, '2024-03-05 19:04:53', '2024-03-05 19:04:53', NULL, '    <div class="h-40 w-64 px-2 py-6 bg-gray-200 flex flex-nowrap">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
    </div>', '<div>
  <div class="h-40 w-64 px-2 py-6 bg-gray-200 flex flex-nowrap">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (440, '.justify-items-start', 'classes/flexbox/justify-items-start', NULL, '2024-03-05 19:04:55', '2024-03-05 19:04:55', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-start p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-start p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (457, '.col-end-1+%25_F+.col-end-*', 'classes/grid/col-end-1+%25_F+.col-end-*', NULL, '2024-03-05 19:05:01', '2024-03-05 19:05:01', '.col-end-1 { grid-column-end: 1; }
.col-end-2 { grid-column-end: 2; }
.col-end-3 { grid-column-end: 3; }
.col-end-4 { grid-column-end: 4; }
.col-end-5 { grid-column-end: 5; }
.col-end-6 { grid-column-end: 6; }
.col-end-7 { grid-column-end: 7; }
.col-end-8 { grid-column-end: 8; }
.col-end-9 { grid-column-end: 9; }
.col-end-10 { grid-column-end: 10; }
.col-end-11 { grid-column-end: 11; }
.col-end-12 { grid-column-end: 12; }
.col-end-13 { grid-column-end: 13; }
.col-end-auto { grid-column-end: auto; }', '<div class="grid grid-cols-3 gap-4">
  <div class="col-start-2 col-span-2 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-auto col-end-4 h-4 bg-teal-400"></div>
  <div class="col-start-2 col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="col-start-2 col-span-2 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-auto col-end-4 h-4 bg-teal-400">
    </div>
    <div class="col-start-2 col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (338, '.border-purple-50', 'classes/borders/border-purple-50', NULL, '2024-03-05 19:04:17', '2024-03-05 19:04:17', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-purple-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-purple-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (351, '.rounded-bl-3xl', 'classes/borders/rounded-bl-3xl', NULL, '2024-03-05 19:04:22', '2024-03-05 19:04:22', NULL, '    <div class="rounded-bl-3xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-bl-3xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (360, '.rounded-r-xl', 'classes/borders/rounded-r-xl', NULL, '2024-03-05 19:04:26', '2024-03-05 19:04:26', NULL, '    <div class="rounded-r-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-r-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (374, '.bg-gray-50', 'classes/colors/bg-gray-50', NULL, '2024-03-05 19:04:31', '2024-03-05 19:04:31', NULL, '    <div class="p-6 bg-gray-50"></div>', '<div>
  <div class="p-6 bg-gray-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (381, '.bg-yellow-50', 'classes/colors/bg-yellow-50', NULL, '2024-03-05 19:04:34', '2024-03-05 19:04:34', NULL, '    <div class="p-6 bg-yellow-50"></div>', '<div>
  <div class="p-6 bg-yellow-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (395, '.divide-dotted', 'classes/divide/divide-dotted', NULL, '2024-03-05 19:04:38', '2024-03-05 19:04:38', NULL, '    <div class="divide-y-2 divide-dotted">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-dotted">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (404, '.divide-red-100', 'classes/divide/divide-red-100', NULL, '2024-03-05 19:04:41', '2024-03-05 19:04:41', NULL, '    <div class="divide-y-4 divide-red-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-red-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (417, '.flex-auto', 'classes/flex/flex-auto', NULL, '2024-03-05 19:04:46', '2024-03-05 19:04:46', '.flex-auto {
    flex: 1 1 auto;
}', '<div class="flex bg-gray-200">
  <div class="flex-auto bg-teal-400 p-4 m-2">1</div>
  <div class="flex-auto bg-teal-400 p-4 m-2">2</div>
  <div class="flex-auto bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-auto bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="flex-auto bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="flex-auto bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (426, '.flex-grow+%25_F+.flex-grow-0', 'classes/flex/flex-grow+%25_F+.flex-grow-0', NULL, '2024-03-05 19:04:49', '2024-03-05 19:04:49', '.flex-grow { flex-grow: 1; }
.flex-grow-0 { flex-grow: 0; }', '<div class="flex bg-gray-200">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="flex-grow text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex bg-gray-200">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="flex-grow-0 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-grow text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex bg-gray-200">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="flex-grow-0 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (434, '.content-start', 'classes/flexbox/content-start', NULL, '2024-03-05 19:04:52', '2024-03-05 19:04:52', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-start">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-start">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (447, '.space-x-7', 'classes/flexbox/space-x-7', NULL, '2024-03-05 19:04:57', '2024-03-05 19:04:57', NULL, '    <div class="inline-flex space-x-7 bg-gray-300 m-2 h-20">
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
    </div>', '<div>
  <div class="inline-flex space-x-7 bg-gray-300 m-2 h-20">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (454, '.col-auto', 'classes/grid/col-auto', NULL, '2024-03-05 19:05:00', '2024-03-05 19:05:00', '.col-auto {
    grid-column: auto;
}', '<div class="grid grid-cols-3 gap-4">
  <div class="col-auto h-4 bg-teal-400"></div>
  <div class="col-auto h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-2 h-4 bg-teal-400"></div>
  <div class="col-auto h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="col-auto h-4 bg-teal-400">
    </div>
    <div class="col-auto h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-2 h-4 bg-teal-400">
    </div>
    <div class="col-auto h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (467, '.row-span-1+%25_F+.row-span-*', 'classes/grid/row-span-1+%25_F+.row-span-*', NULL, '2024-03-05 19:05:05', '2024-03-05 19:05:05', '.row-auto { grid-row: auto; }
.row-span-1 { grid-row: span 1 / span 1; }
.row-span-2 { grid-row: span 2 / span 2; }
.row-span-3 { grid-row: span 3 / span 3; }
.row-span-4 { grid-row: span 4 / span 4; }
.row-span-5 { grid-row: span 5 / span 5; }
.row-span-6 { grid-row: span 6 / span 6; }', '<div class="grid grid-cols-3 gap-4">
  <div class="row-span-3 col-span-1 bg-teal-400"></div>
  <div class="row-span-1 col-span-1 bg-teal-400"></div>
  <div class="row-span-2 col-span-2 bg-teal-400"></div>
  <div class="row-span-1 col-span-1 bg-teal-400"></div>
  <div class="row-span-2 col-span-1 bg-teal-400"></div>
  <div class="row-span-3 col-span-1 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="row-span-3 col-span-1 bg-teal-400">
    </div>
    <div class="row-span-1 col-span-1 bg-teal-400">
    </div>
    <div class="row-span-2 col-span-2 bg-teal-400">
    </div>
    <div class="row-span-1 col-span-1 bg-teal-400">
    </div>
    <div class="row-span-2 col-span-1 bg-teal-400">
    </div>
    <div class="row-span-3 col-span-1 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1463, '.appearance-none', 'classes/utilities/appearance-none', NULL, '2024-03-06 04:56:47', '2024-03-06 04:56:47', '.appearance-none {
  appearance: none;
}', '<select class="w-16 block">
  <option>Yes</option>
  <option>No</option>
</select>

<select class="appearance-none w-16 block">
  <option>Yes</option>
  <option>No</option>
</select>', '<div>
  <select class="w-16 block">
    <option>
      Yes
    </option>
    <option>
      No
    </option>
  </select>
  <select class="appearance-none w-16 block">
    <option>
      Yes
    </option>
    <option>
      No
    </option>
  </select>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (341, '.border-red-50', 'classes/borders/border-red-50', NULL, '2024-03-05 19:04:19', '2024-03-05 19:04:19', NULL, '    <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-red-50"></div>', '<div>
  <div class="p-6 w-20 h-20 bg-teal-400 border-4 border-red-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (349, '.rounded-b-xl', 'classes/borders/rounded-b-xl', NULL, '2024-03-05 19:04:22', '2024-03-05 19:04:22', NULL, '    <div class="rounded-b-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-b-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (358, '.rounded-r-2xl', 'classes/borders/rounded-r-2xl', NULL, '2024-03-05 19:04:25', '2024-03-05 19:04:25', NULL, '    <div class="rounded-r-2xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-r-2xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (366, '.rounded-tl-xl', 'classes/borders/rounded-tl-xl', NULL, '2024-03-05 19:04:28', '2024-03-05 19:04:28', NULL, '    <div class="rounded-tl-xl h-16 w-24 flex bg-teal-400 m-2"></div>', '<div>
  <div class="rounded-tl-xl h-16 w-24 flex bg-teal-400 m-2">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (373, '.bg-blue-50', 'classes/colors/bg-blue-50', NULL, '2024-03-05 19:04:30', '2024-03-05 19:04:30', NULL, '    <div class="grid grid-flow-row auto-rows-min">
        <div class="p-4 mb-2 bg-blue-50"></div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-min">
    <div class="p-4 mb-2 bg-blue-50">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (380, '.bg-red-50', 'classes/colors/bg-red-50', NULL, '2024-03-05 19:04:33', '2024-03-05 19:04:33', NULL, '    <div class="p-6 bg-red-50"></div>', '<div>
  <div class="p-6 bg-red-50">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (394, '.divide-dashed', 'classes/divide/divide-dashed', NULL, '2024-03-05 19:04:38', '2024-03-05 19:04:38', NULL, '    <div class="divide-y-2 divide-dashed">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-2 divide-dashed">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (399, '.divide-indigo-100', 'classes/divide/divide-indigo-100', NULL, '2024-03-05 19:04:40', '2024-03-05 19:04:40', NULL, '    <div class="divide-y-4 divide-indigo-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-indigo-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (413, '.flex-col', 'classes/flex/flex-col', NULL, '2024-03-05 19:04:45', '2024-03-05 19:04:45', '.flex-col {
    flex-direction: column;
}', '<div class="inline-flex flex-col">
  <div class="bg-teal-400 p-4 m-2">1</div>
  <div class="bg-teal-400 p-4 m-2">2</div>
  <div class="bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="inline-flex flex-col">
    <div class="bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (421, '.flex-wrap-reverse', 'classes/flex/flex-wrap-reverse', NULL, '2024-03-05 19:04:48', '2024-03-05 19:04:48', '.flex-wrap-reverse {
    flex-wrap: wrap-reverse;
}', '<div class="flex flex-wrap-reverse bg-gray-200">
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">1</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">2</div>
  <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex flex-wrap-reverse bg-gray-200">
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="w-2/5 flex-none bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (430, '.content-between', 'classes/flexbox/content-between', NULL, '2024-03-05 19:04:51', '2024-03-05 19:04:51', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-between">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-between">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (443, '.justify-self-center', 'classes/flexbox/justify-self-center', NULL, '2024-03-05 19:04:56', '2024-03-05 19:04:56', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-start p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="justify-self-center bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-start p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="justify-self-center bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (450, '.space-y-px', 'classes/flexbox/space-y-px', NULL, '2024-03-05 19:04:59', '2024-03-05 19:04:59', NULL, '    <div class="flex flex-col space-y-px bg-gray-300 m-2 w-40">
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
        <div class="bg-teal-400 h-6 w-6"></div>
    </div>', '<div>
  <div class="flex flex-col space-y-px bg-gray-300 m-2 w-40">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (463, '.grid-flow-row', 'classes/grid/grid-flow-row', NULL, '2024-03-05 19:05:04', '2024-03-05 19:05:04', '.grid-flow-row {
    grid-auto-flow: row;
}', '<div class="grid grid-cols-3 grid-flow-row gap-2">
  <div class="text-center bg-teal-400">1</div>
  <div class="text-center bg-teal-400">2</div>
  <div class="text-center col-span-2 bg-teal-400">3</div>
  <div class="text-center bg-teal-400">4</div>
  <div class="text-center bg-teal-400">5</div>
  <div class="text-center bg-teal-400">6</div>
</div>', '<div>
  <div class="grid grid-cols-3 grid-flow-row gap-2">
    <div class="text-center bg-teal-400">
      1
    </div>
    <div class="text-center bg-teal-400">
      2
    </div>
    <div class="text-center col-span-2 bg-teal-400">
      3
    </div>
    <div class="text-center bg-teal-400">
      4
    </div>
    <div class="text-center bg-teal-400">
      5
    </div>
    <div class="text-center bg-teal-400">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (471, '.row-start-3', 'classes/grid/row-start-3', NULL, '2024-03-05 19:05:07', '2024-03-05 19:05:07', '.row-start-3 { grid-row-start: 3; }', '  <div class="row-start-5 col-span-3 h-4 bg-teal-600"></div>', '<div>
  <div class="row-start-5 col-span-3 h-4 bg-teal-600">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1465, '.placeholder-current::placeholder', 'classes/utilities/placeholder-current::placeholder', NULL, '2024-03-06 04:56:47', '2024-03-06 04:56:47', '.placeholder-current::placeholder { color: currentColor; }', '<input class="placeholder-current block" placeholder="Text"/>', '<div>
  <input class="placeholder-current block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (401, '.divide-opacity-0', 'classes/divide/divide-opacity-0', NULL, '2024-03-05 19:04:40', '2024-03-05 19:04:40', NULL, '    <div class="divide-y-4 divide-black divide-opacity-0">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-black divide-opacity-0">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (410, '.divide-yellow-100', 'classes/divide/divide-yellow-100', NULL, '2024-03-05 19:04:44', '2024-03-05 19:04:44', NULL, '    <div class="divide-y-4 divide-yellow-100">
        <p>Example 1</p>
        <p>Example 2</p>
        <p>Example 3</p>
    </div>', '<div>
  <div class="divide-y-4 divide-yellow-100">
    <p>
      Example 1
    </p>
    <p>
      Example 2
    </p>
    <p>
      Example 3
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (423, '.content-start+%25_F+.content-*', 'classes/flex/content-start+%25_F+.content-*', NULL, '2024-03-05 19:04:48', '2024-03-05 19:04:48', '.content-start { align-content: flex-start; }
.content-center { align-content: center; }
.content-end { align-content: flex-end; }
.content-between { align-content: space-between; }
.content-around { align-content: space-around; }', '<div class="flex flex-wrap content-start bg-gray-200 h-32 my-2">
  <div class="w-2/5 bg-teal-400 p-1 m-1">1</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">2</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">3</div>
</div>
<div class="flex flex-wrap content-center bg-gray-200 h-32 my-2">
  <div class="w-2/5 bg-teal-400 p-1 m-1">1</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">2</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">3</div>
</div>
<div class="flex flex-wrap content-end bg-gray-200 h-32 my-2">
  <div class="w-2/5 bg-teal-400 p-1 m-1">1</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">2</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">3</div>
</div>
<div class="flex flex-wrap content-between bg-gray-200 h-32 my-2">
  <div class="w-2/5 bg-teal-400 p-1 m-1">1</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">2</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">3</div>
</div>
<div class="flex flex-wrap content-around bg-gray-200 h-32 my-2">
  <div class="w-2/5 bg-teal-400 p-1 m-1">1</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">2</div>
  <div class="w-2/5 bg-teal-400 p-1 m-1">3</div>
</div>', '<div>
  <div class="flex flex-wrap content-start bg-gray-200 h-32 my-2">
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      1
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      2
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      3
    </div>
  </div>
  <div class="flex flex-wrap content-center bg-gray-200 h-32 my-2">
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      1
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      2
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      3
    </div>
  </div>
  <div class="flex flex-wrap content-end bg-gray-200 h-32 my-2">
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      1
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      2
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      3
    </div>
  </div>
  <div class="flex flex-wrap content-between bg-gray-200 h-32 my-2">
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      1
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      2
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      3
    </div>
  </div>
  <div class="flex flex-wrap content-around bg-gray-200 h-32 my-2">
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      1
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      2
    </div>
    <div class="w-2/5 bg-teal-400 p-1 m-1">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (432, '.content-end', 'classes/flexbox/content-end', NULL, '2024-03-05 19:04:52', '2024-03-05 19:04:52', NULL, '    <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-end">
        <div class="px-10 py-2 bg-teal-400 rounded">1</div>
        <div class="px-10 py-2 bg-purple-400 rounded">2</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">3</div>
        <div class="px-10 py-2 bg-teal-400 rounded">4</div>
        <div class="px-10 py-2 bg-purple-400 rounded">5</div>
        <div class="px-10 py-2 bg-indigo-400 rounded">6</div>
    </div>', '<div>
  <div class="h-40 w-96 p-2 bg-gray-200 flex flex-wrap content-end">
    <div class="px-10 py-2 bg-teal-400 rounded">
      1
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      2
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      3
    </div>
    <div class="px-10 py-2 bg-teal-400 rounded">
      4
    </div>
    <div class="px-10 py-2 bg-purple-400 rounded">
      5
    </div>
    <div class="px-10 py-2 bg-indigo-400 rounded">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (438, '.justify-items-center', 'classes/flexbox/justify-items-center', NULL, '2024-03-05 19:04:54', '2024-03-05 19:04:54', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-center p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-center p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (452, '.focus-within', 'classes/forms/focus-within', NULL, '2024-03-05 19:04:59', '2024-03-05 19:04:59', NULL, '    <form>
        <div class="text-gray-400 focus-within:text-green-600 focus-within:underline">
            Enter your name:
            <input class="ml-2 px-4 py-2 border rounded" type="text" placeholder="Name">
        </div>
    </form>', '<div>
  <form>
    <div class="text-gray-400 focus-within:text-green-600 focus-within:underline">
      Enter your name:
      <input class="ml-2 px-4 py-2 border rounded" type="text" placeholder="Name"/>
    </div>
  </form>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (456, '.col-start-1+%25_F+.col-start-*', 'classes/grid/col-start-1+%25_F+.col-start-*', NULL, '2024-03-05 19:05:01', '2024-03-05 19:05:01', '.col-start-1 { grid-column-start: 1; }
.col-start-2 { grid-column-start: 2; }
.col-start-3 { grid-column-start: 3; }
.col-start-4 { grid-column-start: 4; }
.col-start-5 { grid-column-start: 5; }
.col-start-6 { grid-column-start: 6; }
.col-start-7 { grid-column-start: 7; }
.col-start-8 { grid-column-start: 8; }
.col-start-9 { grid-column-start: 9; }
.col-start-10 { grid-column-start: 10; }
.col-start-11 { grid-column-start: 11; }
.col-start-12 { grid-column-start: 12; }
.col-start-13 { grid-column-start: 13; }
.col-start-auto { grid-column-start: auto; }', '<div class="grid grid-cols-3 gap-4">
  <div class="col-start-2 col-span-2 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
  <div class="col-auto col-end-4 h-4 bg-teal-400"></div>
  <div class="col-start-2 col-span-1 h-4 bg-teal-400"></div>
  <div class="col-span-1 h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="col-start-2 col-span-2 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-auto col-end-4 h-4 bg-teal-400">
    </div>
    <div class="col-start-2 col-span-1 h-4 bg-teal-400">
    </div>
    <div class="col-span-1 h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (469, '.row-start-1', 'classes/grid/row-start-1', NULL, '2024-03-05 19:05:06', '2024-03-05 19:05:06', '.row-start-1 { grid-row-start: 1; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1466, '.placeholder-black::placeholder', 'classes/utilities/placeholder-black::placeholder', NULL, '2024-03-06 04:56:48', '2024-03-06 04:56:48', '.placeholder-black::placeholder { color: #000; }', '<input class="placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (408, '.divide-x-reverse', 'classes/divide/divide-x-reverse', NULL, '2024-03-05 19:04:43', '2024-03-05 19:04:43', NULL, '    <div class="max-w-xs grid grid-cols-3 divide-x-2 divide-black divide-x-reverse">
        <div class="p-2">1</div>
        <div class="p-2">2</div>
        <div class="p-2">3</div>
    </div>', '<div>
  <div class="max-w-xs grid grid-cols-3 divide-x-2 divide-black divide-x-reverse">
    <div class="p-2">
      1
    </div>
    <div class="p-2">
      2
    </div>
    <div class="p-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (416, '.flex-1', 'classes/flex/flex-1', NULL, '2024-03-05 19:04:46', '2024-03-05 19:04:46', '.flex-1 {
    flex: 1 1 0%;
}', '<div class="flex bg-gray-200">
  <div class="flex-1 bg-teal-400 p-4 m-2">1</div>
  <div class="flex-1 bg-teal-400 p-4 m-2">2</div>
  <div class="flex-1 bg-teal-400 p-4 m-2">3</div>
</div>', '<div>
  <div class="flex bg-gray-200">
    <div class="flex-1 bg-teal-400 p-4 m-2">
      1
    </div>
    <div class="flex-1 bg-teal-400 p-4 m-2">
      2
    </div>
    <div class="flex-1 bg-teal-400 p-4 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (425, '.self-start+%25_F+.self-*', 'classes/flex/self-start+%25_F+.self-*', NULL, '2024-03-05 19:04:49', '2024-03-05 19:04:49', '.self-auto { align-self: auto; }
.self-start { align-self: flex-start; }
.self-center { align-self: center; }
.self-end { align-self: flex-end; }
.self-stretch { align-self: stretch; }', '<div class="flex items-stretch bg-gray-200 h-24">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="self-auto flex-1 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-stretch bg-gray-200 h-24">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="self-start flex-1 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-stretch bg-gray-200 h-24">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="self-center flex-1 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-stretch bg-gray-200 h-24">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="self-end flex-1 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>
<div class="flex items-start bg-gray-200 h-24">
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">1</div>
  <div class="self-stretch flex-1 text-center bg-teal-400 p-2 m-2">2</div>
  <div class="flex-1 text-center bg-teal-400 p-2 m-2">3</div>
</div>', '<div>
  <div class="flex items-stretch bg-gray-200 h-24">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="self-auto flex-1 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-stretch bg-gray-200 h-24">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="self-start flex-1 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-stretch bg-gray-200 h-24">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="self-center flex-1 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-stretch bg-gray-200 h-24">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="self-end flex-1 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
  <div class="flex items-start bg-gray-200 h-24">
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      1
    </div>
    <div class="self-stretch flex-1 text-center bg-teal-400 p-2 m-2">
      2
    </div>
    <div class="flex-1 text-center bg-teal-400 p-2 m-2">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (437, '.justify-items-auto', 'classes/flexbox/justify-items-auto', NULL, '2024-03-05 19:04:54', '2024-03-05 19:04:54', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-auto p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-auto p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (444, '.justify-self-end', 'classes/flexbox/justify-self-end', NULL, '2024-03-05 19:04:56', '2024-03-05 19:04:56', NULL, '    <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="justify-self-end bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 justify-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="justify-self-end bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (458, '.gap-0+%25_F+.gap-*', 'classes/grid/gap-0+%25_F+.gap-*', NULL, '2024-03-05 19:05:01', '2024-03-05 19:05:01', '.gap-0 { gap: 0; }
.gap-1 { gap: 0.25rem; }
.gap-2 { gap: 0.5rem; }
.gap-3 { gap: 0.75rem; }
.gap-4 { gap: 1rem; }
.gap-5 { gap: 1.25rem; }
.gap-6 { gap: 1.5rem; }
.gap-8 { gap: 2rem; }
.gap-10 { gap: 2.5rem; }
.gap-12 { gap: 3rem; }
.gap-16 { gap: 4rem; }
.gap-20 { gap: 5rem; }
.gap-24 { gap: 6rem; }
.gap-32 { gap: 8rem; }
.gap-40 { gap: 10rem; }
.gap-48 { gap: 12rem; }
.gap-56 { gap: 14rem; }
.gap-64 { gap: 16rem; }
.gap-px { gap: 1px; }', '<div class="grid grid-cols-3 gap-4">
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 gap-4">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (465, '.grid-flow-col', 'classes/grid/grid-flow-col', NULL, '2024-03-05 19:05:04', '2024-03-05 19:05:04', '.grid-flow-col {
    grid-auto-flow: column;
}', '<div class="grid grid-rows-3 grid-flow-col gap-2">
  <div class="text-center bg-teal-400">1</div>
  <div class="text-center bg-teal-400">2</div>
  <div class="text-center col-span-2 bg-teal-400">3</div>
  <div class="text-center bg-teal-400">4</div>
  <div class="text-center bg-teal-400">5</div>
  <div class="text-center bg-teal-400">6</div>
  <div class="text-center bg-teal-400">7</div>
</div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col gap-2">
    <div class="text-center bg-teal-400">
      1
    </div>
    <div class="text-center bg-teal-400">
      2
    </div>
    <div class="text-center col-span-2 bg-teal-400">
      3
    </div>
    <div class="text-center bg-teal-400">
      4
    </div>
    <div class="text-center bg-teal-400">
      5
    </div>
    <div class="text-center bg-teal-400">
      6
    </div>
    <div class="text-center bg-teal-400">
      7
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1468, '.placeholder-gray-600::placeholder', 'classes/utilities/placeholder-gray-600::placeholder', NULL, '2024-03-06 04:56:48', '2024-03-06 04:56:48', '.placeholder-gray-600::placeholder { color: #718096; }', '<input class="placeholder-gray-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1476, '.placeholder-purple-600::placeholder', 'classes/utilities/placeholder-purple-600::placeholder', NULL, '2024-03-06 04:56:51', '2024-03-06 04:56:51', '.placeholder-purple-600::placeholder { color: #805ad5; }', '<input class="placeholder-purple-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-purple-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1479, '.placeholder-gray-200::placeholder', 'classes/utilities/placeholder-gray-200::placeholder', NULL, '2024-03-06 04:56:52', '2024-03-06 04:56:52', '.placeholder-gray-200::placeholder { color: #edf2f7; }', '<input class="placeholder-gray-200 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-200 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (459, '.row-gap-0+%25_F+.row-gap-*', 'classes/grid/row-gap-0+%25_F+.row-gap-*', NULL, '2024-03-05 19:05:02', '2024-03-05 19:05:02', '.row-gap-0 { row-gap: 0; }
.row-gap-1 { row-gap: 0.25rem; }
.row-gap-2 { row-gap: 0.5rem; }
.row-gap-3 { row-gap: 0.75rem; }
.row-gap-4 { row-gap: 1rem; }
.row-gap-5 { row-gap: 1.25rem; }
.row-gap-6 { row-gap: 1.5rem; }
.row-gap-8 { row-gap: 2rem; }
.row-gap-10 { row-gap: 2.5rem; }
.row-gap-12 { row-gap: 3rem; }
.row-gap-16 { row-gap: 4rem; }
.row-gap-20 { row-gap: 5rem; }
.row-gap-24 { row-gap: 6rem; }
.row-gap-32 { row-gap: 8rem; }
.row-gap-40 { row-gap: 10rem; }
.row-gap-48 { row-gap: 12rem; }
.row-gap-56 { row-gap: 14rem; }
.row-gap-64 { row-gap: 16rem; }
.row-gap-px { row-gap: 1px; }', '<div class="grid grid-cols-3 row-gap-2 col-gap-4">
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 row-gap-2 col-gap-4">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (466, '.grid-flow-col-dense', 'classes/grid/grid-flow-col-dense', NULL, '2024-03-05 19:05:05', '2024-03-05 19:05:05', '.grid-flow-col-dense {
    grid-auto-flow: column dense;
}', '<div class="grid grid-rows-3 grid-flow-col-dense gap-2">
  <div class="text-center bg-teal-400">1</div>
  <div class="text-center bg-teal-400">2</div>
  <div class="text-center col-span-2 bg-teal-400">3</div>
  <div class="text-center bg-teal-400">4</div>
  <div class="text-center bg-teal-400">5</div>
  <div class="text-center bg-teal-400">6</div>
  <div class="text-center bg-teal-400">7</div>
</div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col-dense gap-2">
    <div class="text-center bg-teal-400">
      1
    </div>
    <div class="text-center bg-teal-400">
      2
    </div>
    <div class="text-center col-span-2 bg-teal-400">
      3
    </div>
    <div class="text-center bg-teal-400">
      4
    </div>
    <div class="text-center bg-teal-400">
      5
    </div>
    <div class="text-center bg-teal-400">
      6
    </div>
    <div class="text-center bg-teal-400">
      7
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1469, '.placeholder-red-600::placeholder', 'classes/utilities/placeholder-red-600::placeholder', NULL, '2024-03-06 04:56:49', '2024-03-06 04:56:49', '.placeholder-red-600::placeholder { color: #e53e3e; }', '<input class="placeholder-red-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-red-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1471, '.placeholder-yellow-600::placeholder', 'classes/utilities/placeholder-yellow-600::placeholder', NULL, '2024-03-06 04:56:50', '2024-03-06 04:56:50', '.placeholder-yellow-600::placeholder { color: #d69e2e; }', '<input class="placeholder-yellow-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-yellow-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1486, '.placeholder-gray-900::placeholder', 'classes/utilities/placeholder-gray-900::placeholder', NULL, '2024-03-06 04:56:55', '2024-03-06 04:56:55', '.placeholder-gray-900::placeholder { color: #1a202c; }', '<input class="placeholder-gray-900 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-900 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1490, '.placeholder-opacity-75', 'classes/utilities/placeholder-opacity-75', NULL, '2024-03-06 04:56:56', '2024-03-06 04:56:56', '.placeholder-opacity-75 { --placeholder-opacity: 0.75; }', '<input class="placeholder-opacity-75 placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-75 placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1504, '.select-auto', 'classes/utilities/select-auto', NULL, '2024-03-06 04:57:01', '2024-03-06 04:57:01', '.select-auto { user-select: auto; }', '<div class="select-auto">Lorem ipsum dolor sit amet, consectetur.</div>', '<div>
  <div class="select-auto">
    Lorem ipsum dolor sit amet, consectetur.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1511, '.placeholder-pink-100', 'classes/utilities/placeholder-pink-100', NULL, '2024-03-06 04:57:04', '2024-03-06 04:57:04', NULL, '    <input class="placeholder-pink-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-pink-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1526, '.w-1', 'classes/width/w-1', NULL, '2024-03-06 04:57:09', '2024-03-06 04:57:09', '.w-1 { width: 0.25rem; }', '<span class="w-1 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1532, '.w-8', 'classes/width/w-8', NULL, '2024-03-06 04:57:12', '2024-03-06 04:57:12', '.w-8 { width: 2rem; }', '<span class="w-8 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-8 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1544, '.w-px', 'classes/width/w-px', NULL, '2024-03-06 04:57:17', '2024-03-06 04:57:17', '.w-px { width: 1px; }', '<span class="w-px h-4 block bg-teal-400"></span>', '<div>
  <span class="w-px h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1552, '.w-3%25_F4', 'classes/width/w-3%25_F4', NULL, '2024-03-06 04:57:20', '2024-03-06 04:57:20', '.w-3/4 { width: 75%; }', '<span class="w-3/4 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-3/4 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1568, '.w-7%25_F12', 'classes/width/w-7%25_F12', NULL, '2024-03-06 04:57:27', '2024-03-06 04:57:27', '.w-7/12 { width: 58.333333%; }', '<span class="w-7/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-7/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1572, '.w-11%25_F12', 'classes/width/w-11%25_F12', NULL, '2024-03-06 04:57:28', '2024-03-06 04:57:28', '.w-11/12 { width: 91.666667%; }', '<span class="w-11/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-11/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1589, '.min-w-0', 'classes/width/min-w-0', NULL, '2024-03-06 04:57:35', '2024-03-06 04:57:35', '.min-w-0 { min-width: 0; }', '<div class="min-w-0 h-5 bg-teal-400"></div>', '<div>
  <div class="min-w-0 h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1591, '.max-h-0', 'classes/width/max-h-0', NULL, '2024-03-06 04:57:36', '2024-03-06 04:57:36', NULL, '    <div class="bg-gray-300 w-32 h-32">
        <div class="max-h-0 w-10 bg-teal-400">
            <div class="w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        </div>
    </div>', '<div>
  <div class="bg-gray-300 w-32 h-32">
    <div class="max-h-0 w-10 bg-teal-400">
      <div class="w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (460, '.col-gap-0+%25_F+.col-gap-*', 'classes/grid/col-gap-0+%25_F+.col-gap-*', NULL, '2024-03-05 19:05:02', '2024-03-05 19:05:02', '.col-gap-0 { column-gap: 0; }
.col-gap-1 { column-gap: 0.25rem; }
.col-gap-2 { column-gap: 0.5rem; }
.col-gap-3 { column-gap: 0.75rem; }
.col-gap-4 { column-gap: 1rem; }
.col-gap-5 { column-gap: 1.25rem; }
.col-gap-6 { column-gap: 1.5rem; }
.col-gap-8 { column-gap: 2rem; }
.col-gap-10 { column-gap: 2.5rem; }
.col-gap-12 { column-gap: 3rem; }
.col-gap-16 { column-gap: 4rem; }
.col-gap-20 { column-gap: 5rem; }
.col-gap-24 { column-gap: 6rem; }
.col-gap-32 { column-gap: 8rem; }
.col-gap-40 { column-gap: 10rem; }
.col-gap-48 { column-gap: 12rem; }
.col-gap-56 { column-gap: 14rem; }
.col-gap-64 { column-gap: 16rem; }
.col-gap-px { column-gap: 1px; }', '<div class="grid grid-cols-3 row-gap-2 col-gap-4">
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 row-gap-2 col-gap-4">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (472, '.row-start-4', 'classes/grid/row-start-4', NULL, '2024-03-05 19:05:07', '2024-03-05 19:05:07', '.row-start-4 { grid-row-start: 4; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1470, '.placeholder-orange-600::placeholder', 'classes/utilities/placeholder-orange-600::placeholder', NULL, '2024-03-06 04:56:49', '2024-03-06 04:56:49', '.placeholder-orange-600::placeholder { color: #dd6b20; }', '<input class="placeholder-orange-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-orange-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1472, '.placeholder-green-600::placeholder', 'classes/utilities/placeholder-green-600::placeholder', NULL, '2024-03-06 04:56:50', '2024-03-06 04:56:50', '.placeholder-green-600::placeholder { color: #38a169; }', '<input class="placeholder-green-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-green-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1487, '.placeholder-opacity-0', 'classes/utilities/placeholder-opacity-0', NULL, '2024-03-06 04:56:55', '2024-03-06 04:56:55', '.placeholder-opacity-0 { --placeholder-opacity: 0; }', '<input class="placeholder-opacity-0 placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-0 placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1494, '.scrolling-touch+%25_F+.scrolling-auto', 'classes/utilities/scrolling-touch+%25_F+.scrolling-auto', NULL, '2024-03-06 04:56:58', '2024-03-06 04:56:58', '.scrolling-touch { -webkit-overflow-scrolling: touch; }
.scrolling-auto { -webkit-overflow-scrolling: auto; }', '<div class="scrolling-touch overflow-auto h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>

<div class="scrolling-auto overflow-auto h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>', '<div>
  <div class="scrolling-touch overflow-auto h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
  <div class="scrolling-auto overflow-auto h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1508, '.placeholder-green-100', 'classes/utilities/placeholder-green-100', NULL, '2024-03-06 04:57:03', '2024-03-06 04:57:03', NULL, '    <input class="placeholder-green-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-green-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1512, '.placeholder-purple-100', 'classes/utilities/placeholder-purple-100', NULL, '2024-03-06 04:57:04', '2024-03-06 04:57:04', NULL, '    <input class="placeholder-purple-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-purple-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1529, '.w-4', 'classes/width/w-4', NULL, '2024-03-06 04:57:11', '2024-03-06 04:57:11', '.w-4 { width: 1rem; }', '<span class="w-4 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-4 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1533, '.w-10', 'classes/width/w-10', NULL, '2024-03-06 04:57:12', '2024-03-06 04:57:12', '.w-10 { width: 2.5rem; }', '<span class="w-10 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-10 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1545, '.w-full', 'classes/width/w-full', NULL, '2024-03-06 04:57:17', '2024-03-06 04:57:17', '.w-full { width: 100%; }', '<span class="w-full h-4 block bg-teal-400"></span>', '<div>
  <span class="w-full h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1553, '.w-1%25_F5', 'classes/width/w-1%25_F5', NULL, '2024-03-06 04:57:20', '2024-03-06 04:57:20', '.w-1/5 { width: 20%; }', '<span class="w-1/5 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/5 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1557, '.w-1%25_F6', 'classes/width/w-1%25_F6', NULL, '2024-03-06 04:57:22', '2024-03-06 04:57:22', '.w-1/6 { width: 16.666667%; }', '<span class="w-1/6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1573, '.max-w-xs', 'classes/width/max-w-xs', NULL, '2024-03-06 04:57:28', '2024-03-06 04:57:28', '.max-w-xs { max-width: 20rem; }', '<div class="max-w-xs h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-xs h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1578, '.max-w-2xl', 'classes/width/max-w-2xl', NULL, '2024-03-06 04:57:30', '2024-03-06 04:57:30', '.max-w-2xl { max-width: 42rem; }', '<div class="max-w-2xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-2xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1593, '.max-w-7xl', 'classes/width/max-w-7xl', NULL, '2024-03-06 04:57:36', '2024-03-06 04:57:36', NULL, '    <div class="max-w-7xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-7xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (462, '.grid-cols-1+%25_F+.grid-cols-*', 'classes/grid/grid-cols-1+%25_F+.grid-cols-*', NULL, '2024-03-05 19:05:03', '2024-03-05 19:05:03', '.grid-cols-1 { grid-template-columns: repeat(1, minmax(0, 1fr)); }
.grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
.grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
.grid-cols-4 { grid-template-columns: repeat(4, minmax(0, 1fr)); }
.grid-cols-5 { grid-template-columns: repeat(5, minmax(0, 1fr)); }
.grid-cols-6 { grid-template-columns: repeat(6, minmax(0, 1fr)); }
.grid-cols-7 { grid-template-columns: repeat(7, minmax(0, 1fr)); }
.grid-cols-8 { grid-template-columns: repeat(8, minmax(0, 1fr)); }
.grid-cols-9 { grid-template-columns: repeat(9, minmax(0, 1fr)); }
.grid-cols-10 { grid-template-columns: repeat(10, minmax(0, 1fr)); }
.grid-cols-11 { grid-template-columns: repeat(11, minmax(0, 1fr)); }
.grid-cols-12 { grid-template-columns: repeat(12, minmax(0, 1fr)); }
.grid-cols-none { grid-template-columns: none; }', '<div class="grid grid-cols-3 grid-flow-row gap-2">
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
  <div class="h-4 bg-teal-400"></div>
</div>', '<div>
  <div class="grid grid-cols-3 grid-flow-row gap-2">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (470, '.row-start-2', 'classes/grid/row-start-2', NULL, '2024-03-05 19:05:06', '2024-03-05 19:05:06', '.row-start-2 { grid-row-start: 2; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1473, '.placeholder-teal-600::placeholder', 'classes/utilities/placeholder-teal-600::placeholder', NULL, '2024-03-06 04:56:50', '2024-03-06 04:56:50', '.placeholder-teal-600::placeholder { color: #319795; }', '<input class="placeholder-teal-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-teal-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1491, '.placeholder-opacity-100', 'classes/utilities/placeholder-opacity-100', NULL, '2024-03-06 04:56:57', '2024-03-06 04:56:57', '.placeholder-opacity-100 { --placeholder-opacity: 1; }', '<input class="placeholder-opacity-100 placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-100 placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1495, '.pointer-events-none', 'classes/utilities/pointer-events-none', NULL, '2024-03-06 04:56:58', '2024-03-06 04:56:58', '.pointer-events-none { pointer-events: none; }', '<button class="pointer-events-auto hover:bg-teal-400 px-4 py-2 bg-gray-300 m-2">Auto</button>', '<div>
  <button class="pointer-events-auto hover:bg-teal-400 px-4 py-2 bg-gray-300 m-2">
    Auto
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1509, '.placeholder-indigo-100', 'classes/utilities/placeholder-indigo-100', NULL, '2024-03-06 04:57:03', '2024-03-06 04:57:03', NULL, '    <input class="placeholder-indigo-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-indigo-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1516, '.placeholder-yellow-100', 'classes/utilities/placeholder-yellow-100', NULL, '2024-03-06 04:57:06', '2024-03-06 04:57:06', NULL, '    <input class="placeholder-yellow-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-yellow-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1530, '.w-5', 'classes/width/w-5', NULL, '2024-03-06 04:57:11', '2024-03-06 04:57:11', '.w-5 { width: 1.25rem; }', '<span class="w-5 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-5 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1537, '.w-24', 'classes/width/w-24', NULL, '2024-03-06 04:57:14', '2024-03-06 04:57:14', '.w-24 { width: 6rem; }', '<span class="w-24 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-24 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1549, '.w-2%25_F3', 'classes/width/w-2%25_F3', NULL, '2024-03-06 04:57:19', '2024-03-06 04:57:19', '.w-2/3 { width: 66.666667%; }', '<span class="w-2/3 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2/3 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1555, '.w-3%25_F5', 'classes/width/w-3%25_F5', NULL, '2024-03-06 04:57:21', '2024-03-06 04:57:21', '.w-3/5 { width: 60%; }', '<span class="w-3/5 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-3/5 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1569, '.w-8%25_F12', 'classes/width/w-8%25_F12', NULL, '2024-03-06 04:57:27', '2024-03-06 04:57:27', '.w-8/12 { width: 66.666667%; }', '<span class="w-8/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-8/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1576, '.max-w-lg', 'classes/width/max-w-lg', NULL, '2024-03-06 04:57:30', '2024-03-06 04:57:30', '.max-w-lg { max-width: 32rem; }', '<div class="max-w-lg h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-lg h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1590, '.min-w-full', 'classes/width/min-w-full', NULL, '2024-03-06 04:57:35', '2024-03-06 04:57:35', '.min-w-full { min-width: 100%; }', '<div class="min-w-full h-5 bg-teal-400"></div>', '<div>
  <div class="min-w-full h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1592, '.max-w-0', 'classes/width/max-w-0', NULL, '2024-03-06 04:57:36', '2024-03-06 04:57:36', NULL, '    <div class="bg-gray-300 h-32">
        <div class="max-w-0 h-5 bg-teal-400">
            <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
            <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
            <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
            <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
            <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        </div>
    </div>', '<div>
  <div class="bg-gray-300 h-32">
    <div class="max-w-0 h-5 bg-teal-400">
      <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
      <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
      <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
      <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
      <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (464, '.grid-flow-row-dense', 'classes/grid/grid-flow-row-dense', NULL, '2024-03-05 19:05:04', '2024-03-05 19:05:04', '.grid-flow-row-dense {
    grid-auto-flow: row dense;
}', '<div class="grid grid-cols-3 grid-flow-row-dense gap-2">
  <div class="text-center bg-teal-400">1</div>
  <div class="text-center bg-teal-400">2</div>
  <div class="text-center col-span-2 bg-teal-400">3</div>
  <div class="text-center bg-teal-400">4</div>
  <div class="text-center bg-teal-400">5</div>
  <div class="text-center bg-teal-400">6</div>
</div>', '<div>
  <div class="grid grid-cols-3 grid-flow-row-dense gap-2">
    <div class="text-center bg-teal-400">
      1
    </div>
    <div class="text-center bg-teal-400">
      2
    </div>
    <div class="text-center col-span-2 bg-teal-400">
      3
    </div>
    <div class="text-center bg-teal-400">
      4
    </div>
    <div class="text-center bg-teal-400">
      5
    </div>
    <div class="text-center bg-teal-400">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (473, '.row-start-5', 'classes/grid/row-start-5', NULL, '2024-03-05 19:05:08', '2024-03-05 19:05:08', '.row-start-5 { grid-row-start: 5; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (474, '.row-start-6', 'classes/grid/row-start-6', NULL, '2024-03-05 19:05:08', '2024-03-05 19:05:08', '.row-start-6 { grid-row-start: 6; }', '  <div class="row-start-1 col-span-1 h-4 bg-teal-600"></div>', '<div>
  <div class="row-start-1 col-span-1 h-4 bg-teal-600">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (475, '.row-start-7', 'classes/grid/row-start-7', NULL, '2024-03-05 19:05:08', '2024-03-05 19:05:08', '.row-start-7 { grid-row-start: 7; }', '</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (476, '.row-end-auto', 'classes/grid/row-end-auto', NULL, '2024-03-05 19:05:09', '2024-03-05 19:05:09', '.row-end-auto { grid-row-end: auto; }', '<div class="grid grid-cols-3 gap-4">', NULL);
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (477, '.row-end-1', 'classes/grid/row-end-1', NULL, '2024-03-05 19:05:09', '2024-03-05 19:05:09', '.row-end-1 { grid-row-end: 1; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (478, '.row-end-2', 'classes/grid/row-end-2', NULL, '2024-03-05 19:05:09', '2024-03-05 19:05:09', '.row-end-2 { grid-row-end: 2; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (479, '.row-end-3', 'classes/grid/row-end-3', NULL, '2024-03-05 19:05:10', '2024-03-05 19:05:10', '.row-end-3 { grid-row-end: 3; }', '  <div class="row-start-1 row-end-4 col-span-1 bg-teal-600"></div>', '<div>
  <div class="row-start-1 row-end-4 col-span-1 bg-teal-600">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (480, '.row-end-4', 'classes/grid/row-end-4', NULL, '2024-03-05 19:05:10', '2024-03-05 19:05:10', '.row-end-4 { grid-row-end: 4; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (481, '.row-end-5', 'classes/grid/row-end-5', NULL, '2024-03-05 19:05:10', '2024-03-05 19:05:10', '.row-end-5 { grid-row-end: 5; }', '  <div class="col-span-1 h-4 bg-teal-400"></div>', '<div>
  <div class="col-span-1 h-4 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (482, '.row-end-6', 'classes/grid/row-end-6', NULL, '2024-03-05 19:05:11', '2024-03-05 19:05:11', '.row-end-6 { grid-row-end: 6; }', '  <div class="row-end-3 col-span-1 bg-teal-600"></div>', '<div>
  <div class="row-end-3 col-span-1 bg-teal-600">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (483, '.row-end-7', 'classes/grid/row-end-7', NULL, '2024-03-05 19:05:11', '2024-03-05 19:05:11', '.row-end-7 { grid-row-end: 7; }', '</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (484, '.auto-cols-auto', 'classes/grid/auto-cols-auto', NULL, '2024-03-05 19:05:12', '2024-03-05 19:05:12', NULL, '    <div class="grid grid-flow-col auto-cols-auto">
        <div class="p-4 mr-2 bg-teal-400">1</div>
        <div class="p-4 mr-2 bg-teal-400">2</div>
        <div class="p-4 mr-2 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-col auto-cols-auto">
    <div class="p-4 mr-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      2
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (485, '.auto-cols-fr', 'classes/grid/auto-cols-fr', NULL, '2024-03-05 19:05:12', '2024-03-05 19:05:12', NULL, '    <div class="grid grid-flow-col auto-cols-fr">
        <div class="p-4 mr-2 bg-teal-400">1</div>
        <div class="p-4 mr-2 bg-teal-400">2</div>
        <div class="p-4 mr-2 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-col auto-cols-fr">
    <div class="p-4 mr-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      2
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (486, '.auto-cols-max', 'classes/grid/auto-cols-max', NULL, '2024-03-05 19:05:12', '2024-03-05 19:05:12', NULL, '    <div class="grid grid-flow-col auto-cols-max">
        <div class="p-4 mr-2 bg-teal-400">1</div>
        <div class="p-4 mr-2 bg-teal-400">2</div>
        <div class="p-4 mr-2 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-col auto-cols-max">
    <div class="p-4 mr-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      2
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (487, '.auto-cols-min', 'classes/grid/auto-cols-min', NULL, '2024-03-05 19:05:13', '2024-03-05 19:05:13', NULL, '    <div class="grid grid-flow-col auto-cols-min">
        <div class="p-4 mr-2 bg-teal-400">1</div>
        <div class="p-4 mr-2 bg-teal-400">2</div>
        <div class="p-4 mr-2 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-col auto-cols-min">
    <div class="p-4 mr-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      2
    </div>
    <div class="p-4 mr-2 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (488, '.auto-rows-auto', 'classes/grid/auto-rows-auto', NULL, '2024-03-05 19:05:13', '2024-03-05 19:05:13', NULL, '    <div class="grid grid-flow-row auto-rows-auto">
        <div class="p-4 mb-2 bg-teal-400">1</div>
        <div class="p-4 mb-2 bg-teal-400">2</div>
        <div class="p-4 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-auto">
    <div class="p-4 mb-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mb-2 bg-teal-400">
      2
    </div>
    <div class="p-4 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (489, '.auto-rows-fr', 'classes/grid/auto-rows-fr', NULL, '2024-03-05 19:05:13', '2024-03-05 19:05:13', NULL, '    <div class="grid grid-flow-row auto-rows-fr">
        <div class="p-4 mb-2 bg-teal-400">1</div>
        <div class="p-4 mb-2 bg-teal-400">2</div>
        <div class="p-4 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-fr">
    <div class="p-4 mb-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mb-2 bg-teal-400">
      2
    </div>
    <div class="p-4 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (490, '.auto-rows-max', 'classes/grid/auto-rows-max', NULL, '2024-03-05 19:05:14', '2024-03-05 19:05:14', NULL, '    <div class="grid grid-flow-row auto-rows-max">
        <div class="p-4 mb-2 bg-teal-400">1</div>
        <div class="p-4 mb-2 bg-teal-400">2</div>
        <div class="p-4 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-max">
    <div class="p-4 mb-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mb-2 bg-teal-400">
      2
    </div>
    <div class="p-4 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (491, '.auto-rows-min', 'classes/grid/auto-rows-min', NULL, '2024-03-05 19:05:14', '2024-03-05 19:05:14', NULL, '    <div class="grid grid-flow-row auto-rows-min">
        <div class="p-4 mb-2 bg-teal-400">1</div>
        <div class="p-4 mb-2 bg-teal-400">2</div>
        <div class="p-4 bg-teal-400">3</div>
    </div>', '<div>
  <div class="grid grid-flow-row auto-rows-min">
    <div class="p-4 mb-2 bg-teal-400">
      1
    </div>
    <div class="p-4 mb-2 bg-teal-400">
      2
    </div>
    <div class="p-4 bg-teal-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (495, '.col-span-1', 'classes/grid/col-span-1', NULL, '2024-03-05 19:05:16', '2024-03-05 19:05:16', NULL, '    <div class="grid grid-cols-12 gap-4 h-30">
        <div class="p-4 col-span-1 bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-12 gap-4 h-30">
    <div class="p-4 col-span-1 bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (513, '.place-items-center', 'classes/grid/place-items-center', NULL, '2024-03-05 19:05:22', '2024-03-05 19:05:22', NULL, '    <div class="grid grid-cols-3 gap-2 place-items-center h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-items-center h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (516, '.place-items-stretch', 'classes/grid/place-items-stretch', NULL, '2024-03-05 19:05:23', '2024-03-05 19:05:23', NULL, '    <div class="grid grid-cols-3 gap-2 place-items-stretch h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-items-stretch h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (535, '.h-12', 'classes/height/h-12', NULL, '2024-03-05 19:05:31', '2024-03-05 19:05:31', '.h-12 { height: 3rem; }', '<span class="h-12 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-12 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (541, '.h-48', 'classes/height/h-48', NULL, '2024-03-05 19:05:33', '2024-03-05 19:05:33', '.h-48 { height: 12rem; }', '<span class="h-48 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-48 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (554, '.list-disc+%25_F+.list-*', 'classes/list/list-disc+%25_F+.list-*', NULL, '2024-03-05 19:05:38', '2024-03-05 19:05:38', '.list-none { list-style-type: none; }
.list-disc { list-style-type: disc; }
.list-decimal { list-style-type: decimal; }', '<ul class="list-none list-inside m-2">
  <li>None</li>
  <li>None</li>
</ul>
<ul class="list-disc list-inside m-2">
  <li>Disc</li>
  <li>Disc</li>
</ul>
<ul class="list-decimal list-inside m-2">
  <li>Decimal</li>
  <li>Decimal</li>
</ul>', '<div>
  <ul class="list-none list-inside m-2">
    <li>
      None
    </li>
    <li>
      None
    </li>
  </ul>
  <ul class="list-disc list-inside m-2">
    <li>
      Disc
    </li>
    <li>
      Disc
    </li>
  </ul>
  <ul class="list-decimal list-inside m-2">
    <li>
      Decimal
    </li>
    <li>
      Decimal
    </li>
  </ul>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (558, '.m-2', 'classes/margins/m-2', NULL, '2024-03-05 19:05:40', '2024-03-05 19:05:40', '.m-2 { margin: 0.5rem; }', '<span class="m-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (572, '.m-56', 'classes/margins/m-56', NULL, '2024-03-05 19:05:45', '2024-03-05 19:05:45', '.m-56 { margin: 14rem; }', '<span class="m-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (578, '.mb-2', 'classes/margins/mb-2', NULL, '2024-03-05 19:05:47', '2024-03-05 19:05:47', '.mb-2 { margin-bottom: 0.5rem; }', '<span class="mb-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1474, '.placeholder-blue-600::placeholder', 'classes/utilities/placeholder-blue-600::placeholder', NULL, '2024-03-06 04:56:51', '2024-03-06 04:56:51', '.placeholder-blue-600::placeholder { color: #3182ce; }', '<input class="placeholder-blue-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-blue-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1477, '.placeholder-pink-600::placeholder', 'classes/utilities/placeholder-pink-600::placeholder', NULL, '2024-03-06 04:56:52', '2024-03-06 04:56:52', '.placeholder-pink-600::placeholder { color: #d53f8c; }', '<input class="placeholder-pink-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-pink-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1492, '.outline-none', 'classes/utilities/outline-none', NULL, '2024-03-06 04:56:57', '2024-03-06 04:56:57', '.outline-none {
    outline: 0;
}', '<input class="placeholder-black block" placeholder="With outline"/>
<input class="outline-none placeholder-black block" placeholder="Without outline"/>', '<div>
  <input class="placeholder-black block" placeholder="With outline"/>
  <input class="outline-none placeholder-black block" placeholder="Without outline"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1499, '.resize-y', 'classes/utilities/resize-y', NULL, '2024-03-06 04:57:00', '2024-03-06 04:57:00', '.resize-y { resize: vertical; }', '<textarea class="resize-y bg-gray-200 m-2 block">Y</textarea>', '<div>
  <textarea class="resize-y bg-gray-200 m-2 block">
    Y
  </textarea>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1513, '.placeholder-red-100', 'classes/utilities/placeholder-red-100', NULL, '2024-03-06 04:57:05', '2024-03-06 04:57:05', NULL, '    <input class="placeholder-red-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-red-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1517, '.opacity-100', 'classes/visibility/opacity-100', NULL, '2024-03-06 04:57:06', '2024-03-06 04:57:06', '.opacity-100 { opacity: 1; }', '<p class="opacity-100 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-100 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1531, '.w-6', 'classes/width/w-6', NULL, '2024-03-06 04:57:11', '2024-03-06 04:57:11', '.w-6 { width: 1.5rem; }', '<span class="w-6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1538, '.w-32', 'classes/width/w-32', NULL, '2024-03-06 04:57:14', '2024-03-06 04:57:14', '.w-32 { width: 8rem; }', '<span class="w-32 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-32 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1550, '.w-1%25_F4', 'classes/width/w-1%25_F4', NULL, '2024-03-06 04:57:19', '2024-03-06 04:57:19', '.w-1/4 { width: 25%; }', '<span class="w-1/4 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/4 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1556, '.w-4%25_F5', 'classes/width/w-4%25_F5', NULL, '2024-03-06 04:57:22', '2024-03-06 04:57:22', '.w-4/5 { width: 80%; }', '<span class="w-4/5 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-4/5 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1570, '.w-9%25_F12', 'classes/width/w-9%25_F12', NULL, '2024-03-06 04:57:27', '2024-03-06 04:57:27', '.w-9/12 { width: 75%; }', '<span class="w-9/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-9/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1577, '.max-w-xl', 'classes/width/max-w-xl', NULL, '2024-03-06 04:57:30', '2024-03-06 04:57:30', '.max-w-xl { max-width: 36rem; }', '<div class="max-w-xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (496, '.col-span-full', 'classes/grid/col-span-full', NULL, '2024-03-05 19:05:16', '2024-03-05 19:05:16', NULL, '    <div class="grid grid-cols-6 gap-4 h-30">
        <div class="p-4 col-span-full bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-6 gap-4 h-30">
    <div class="p-4 col-span-full bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (512, '.place-items-auto', 'classes/grid/place-items-auto', NULL, '2024-03-05 19:05:22', '2024-03-05 19:05:22', NULL, '    <div class="grid grid-cols-3 gap-2 place-items-auto h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-items-auto h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (518, '.place-self-end', 'classes/grid/place-self-end', NULL, '2024-03-05 19:05:24', '2024-03-05 19:05:24', NULL, '    <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="place-self-end bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="place-self-end bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (522, '.row-span-1', 'classes/grid/row-span-1', NULL, '2024-03-05 19:05:26', '2024-03-05 19:05:26', NULL, '    <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
        <div class="row-span-1 bg-teal-400 p-4">1</div>
        <div class="row-span-1 bg-purple-400 p-4">2</div>
        <div class="row-span-1 bg-purple-400 p-4">3</div>
    </div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
    <div class="row-span-1 bg-teal-400 p-4">
      1
    </div>
    <div class="row-span-1 bg-purple-400 p-4">
      2
    </div>
    <div class="row-span-1 bg-purple-400 p-4">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (539, '.h-32', 'classes/height/h-32', NULL, '2024-03-05 19:05:32', '2024-03-05 19:05:32', '.h-32 { height: 8rem; }', '<span class="h-32 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-32 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (543, '.h-64', 'classes/height/h-64', NULL, '2024-03-05 19:05:34', '2024-03-05 19:05:34', '.h-64 { height: 16rem; }', '<span class="h-64 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-64 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (555, '.list-inside+%25_F+.list-outside', 'classes/list/list-inside+%25_F+.list-outside', NULL, '2024-03-05 19:05:38', '2024-03-05 19:05:38', '.list-inside { list-style-position: inside; }
.list-outside { list-style-position: outside; }', '<ul class="list-disc bg-teal-400 list-inside m-2 ml-6">
  <li>Disc</li>
  <li>Disc</li>
</ul>
<ul class="list-disc bg-teal-400 list-outside m-2 ml-6">
  <li>Disc</li>
  <li>Disc</li>
</ul>', '<div>
  <ul class="list-disc bg-teal-400 list-inside m-2 ml-6">
    <li>
      Disc
    </li>
    <li>
      Disc
    </li>
  </ul>
  <ul class="list-disc bg-teal-400 list-outside m-2 ml-6">
    <li>
      Disc
    </li>
    <li>
      Disc
    </li>
  </ul>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (559, '.m-3', 'classes/margins/m-3', NULL, '2024-03-05 19:05:40', '2024-03-05 19:05:40', '.m-3 { margin: 0.75rem; }', '<span class="m-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (575, '.m-px', 'classes/margins/m-px', NULL, '2024-03-05 19:05:46', '2024-03-05 19:05:46', '.m-px { margin: 1px; }', '<span class="m-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (579, '.mb-3', 'classes/margins/mb-3', NULL, '2024-03-05 19:05:48', '2024-03-05 19:05:48', '.mb-3 { margin-bottom: 0.75rem; }', '<span class="mb-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1475, '.placeholder-indigo-600::placeholder', 'classes/utilities/placeholder-indigo-600::placeholder', NULL, '2024-03-06 04:56:51', '2024-03-06 04:56:51', '.placeholder-indigo-600::placeholder { color: #5a67d8; }', '<input class="placeholder-indigo-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-indigo-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1478, '.placeholder-gray-100::placeholder', 'classes/utilities/placeholder-gray-100::placeholder', NULL, '2024-03-06 04:56:52', '2024-03-06 04:56:52', '.placeholder-gray-100::placeholder { color: #f7fafc; }', '<input class="placeholder-gray-100 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-100 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1493, '.overflow-hidden+%25_F+.overflow-*', 'classes/utilities/overflow-hidden+%25_F+.overflow-*', NULL, '2024-03-06 04:56:57', '2024-03-06 04:56:57', '.overflow-auto { overflow: auto; }
.overflow-hidden { overflow: hidden; }
.overflow-visible { overflow: visible; }
.overflow-scroll { overflow: scroll; }
.overflow-x-auto { overflow-x: auto; }
.overflow-y-auto { overflow-y: auto; }
.overflow-x-hidden { overflow-x: hidden; }
.overflow-y-hidden { overflow-y: hidden; }
.overflow-x-visible { overflow-x: visible; }
.overflow-y-visible { overflow-y: visible; }
.overflow-x-scroll { overflow-x: scroll; }
.overflow-y-scroll { overflow-y: scroll; }', '<div class="overflow-auto h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>
<div class="overflow-hidden h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>
<div class="overflow-scroll h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>
<div class="overflow-visible h-32 w-64 bg-gray-300 m-2">
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
</div>', '<div>
  <div class="overflow-auto h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
  <div class="overflow-hidden h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
  <div class="overflow-scroll h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
  <div class="overflow-visible h-32 w-64 bg-gray-300 m-2">
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to make a type specimen book.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1500, '.resize-x', 'classes/utilities/resize-x', NULL, '2024-03-06 04:57:00', '2024-03-06 04:57:00', '.resize-x { resize: horizontal; }', '<textarea class="resize-x bg-gray-200 m-2 block">X</textarea>', '<div>
  <textarea class="resize-x bg-gray-200 m-2 block">
    X
  </textarea>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1514, '.placeholder-transparent', 'classes/utilities/placeholder-transparent', NULL, '2024-03-06 04:57:05', '2024-03-06 04:57:05', NULL, '    <input class="placeholder-transparent block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-transparent block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1518, '.opacity-75', 'classes/visibility/opacity-75', NULL, '2024-03-06 04:57:06', '2024-03-06 04:57:06', '.opacity-75 { opacity: 0.75; }', '<p class="opacity-75 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-75 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (497, '.col-start-1', 'classes/grid/col-start-1', NULL, '2024-03-05 19:05:16', '2024-03-05 19:05:16', NULL, '    <div class="grid grid-cols-12 gap-4 h-30">
        <div class="p-4 col-start-1 bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-12 gap-4 h-30">
    <div class="p-4 col-start-1 bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (501, '.gap-x-0', 'classes/grid/gap-x-0', NULL, '2024-03-05 19:05:18', '2024-03-05 19:05:18', NULL, '    <div class="grid grid-cols-3 gap-x-0">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-x-0">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (515, '.place-items-start', 'classes/grid/place-items-start', NULL, '2024-03-05 19:05:23', '2024-03-05 19:05:23', NULL, '    <div class="grid grid-cols-3 gap-2 place-items-start h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-items-start h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (521, '.row-auto', 'classes/grid/row-auto', NULL, '2024-03-05 19:05:25', '2024-03-05 19:05:25', NULL, '    <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
        <div class="row-auto bg-teal-400 p-4">1</div>
        <div class="row-span-2 bg-purple-400 p-4">2</div>
        <div class="row-span-3 bg-purple-400 p-4">3</div>
    </div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
    <div class="row-auto bg-teal-400 p-4">
      1
    </div>
    <div class="row-span-2 bg-purple-400 p-4">
      2
    </div>
    <div class="row-span-3 bg-purple-400 p-4">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (529, '.h-3', 'classes/height/h-3', NULL, '2024-03-05 19:05:28', '2024-03-05 19:05:28', '.h-3 { height: 0.75rem; }', '<span class="h-3 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-3 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (532, '.h-6', 'classes/height/h-6', NULL, '2024-03-05 19:05:29', '2024-03-05 19:05:29', '.h-6 { height: 1.5rem; }', '<span class="h-6 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-6 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (551, '.min-h-full', 'classes/height/min-h-full', NULL, '2024-03-05 19:05:37', '2024-03-05 19:05:37', '.min-h-full { min-height: 100%; }', '<div class="min-h-full inline-block h-5 w-5 bg-teal-400"></div>', '<div>
  <div class="min-h-full inline-block h-5 w-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (557, '.m-1', 'classes/margins/m-1', NULL, '2024-03-05 19:05:39', '2024-03-05 19:05:39', '.m-1 { margin: 0.25rem; }', '<span class="m-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (571, '.m-48', 'classes/margins/m-48', NULL, '2024-03-05 19:05:45', '2024-03-05 19:05:45', '.m-48 { margin: 12rem; }', '<span class="m-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (574, '.m-auto', 'classes/margins/m-auto', NULL, '2024-03-05 19:05:46', '2024-03-05 19:05:46', '.m-auto { margin: auto; }', '<span class="m-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1480, '.placeholder-gray-300::placeholder', 'classes/utilities/placeholder-gray-300::placeholder', NULL, '2024-03-06 04:56:53', '2024-03-06 04:56:53', '.placeholder-gray-300::placeholder { color: #e2e8f0; }', '<input class="placeholder-gray-300 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-300 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1483, '.placeholder-gray-600::placeholder', 'classes/utilities/placeholder-gray-600::placeholder', NULL, '2024-03-06 04:56:54', '2024-03-06 04:56:54', '.placeholder-gray-600::placeholder { color: #718096; }', '<input class="placeholder-gray-600 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-600 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1497, '.resize', 'classes/utilities/resize', NULL, '2024-03-06 04:56:59', '2024-03-06 04:56:59', '.resize { resize: both; }', '<textarea class="resize bg-gray-200 m-2 block">Default</textarea>', '<div>
  <textarea class="resize bg-gray-200 m-2 block">
    Default
  </textarea>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1505, '.placeholder-blue-100', 'classes/utilities/placeholder-blue-100', NULL, '2024-03-06 04:57:02', '2024-03-06 04:57:02', NULL, '    <input class="placeholder-blue-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-blue-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1519, '.opacity-50', 'classes/visibility/opacity-50', NULL, '2024-03-06 04:57:07', '2024-03-06 04:57:07', '.opacity-50 { opacity: 0.5; }', '<p class="opacity-50 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-50 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1522, '.visible', 'classes/visibility/visible', NULL, '2024-03-06 04:57:08', '2024-03-06 04:57:08', '.visible {
  visibility: visible;
}', '<div class="flex justify-center">
  <div class="bg-teal-400 h-16 w-24"></div>
  <div class="visible bg-teal-600 h-16 w-24"></div>
  <div class="bg-teal-400 h-16 w-24"></div>
</div>', '<div>
  <div class="flex justify-center">
    <div class="bg-teal-400 h-16 w-24">
    </div>
    <div class="visible bg-teal-600 h-16 w-24">
    </div>
    <div class="bg-teal-400 h-16 w-24">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1536, '.w-20', 'classes/width/w-20', NULL, '2024-03-06 04:57:13', '2024-03-06 04:57:13', '.w-20 { width: 5rem; }', '<span class="w-20 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-20 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1546, '.w-screen', 'classes/width/w-screen', NULL, '2024-03-06 04:57:18', '2024-03-06 04:57:18', '.w-screen { width: 100vw; }', '<span class="w-screen h-4 block bg-teal-400"></span>', '<div>
  <span class="w-screen h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1559, '.w-3%25_F6', 'classes/width/w-3%25_F6', NULL, '2024-03-06 04:57:23', '2024-03-06 04:57:23', '.w-3/6 { width: 50%; }', '<span class="w-3/6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-3/6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1562, '.w-1%25_F12', 'classes/width/w-1%25_F12', NULL, '2024-03-06 04:57:24', '2024-03-06 04:57:24', '.w-1/12 { width: 8.333333%; }', '<span class="w-1/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1579, '.max-w-3xl', 'classes/width/max-w-3xl', NULL, '2024-03-06 04:57:31', '2024-03-06 04:57:31', '.max-w-3xl { max-width: 48rem; }', '<div class="max-w-3xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-3xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1583, '.max-w-full', 'classes/width/max-w-full', NULL, '2024-03-06 04:57:32', '2024-03-06 04:57:32', '.max-w-full { max-width: 100%; }', '<div class="max-w-full h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-full h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (498, '.col-start-auto', 'classes/grid/col-start-auto', NULL, '2024-03-05 19:05:17', '2024-03-05 19:05:17', NULL, '    <div class="grid grid-cols-12 gap-4 h-30">
        <div class="p-4 col-start-auto bg-teal-400">1</div>
        <div class="p-4 bg-gray-400">2</div>
        <div class="p-4 bg-gray-400">3</div>
    </div>', '<div>
  <div class="grid grid-cols-12 gap-4 h-30">
    <div class="p-4 col-start-auto bg-teal-400">
      1
    </div>
    <div class="p-4 bg-gray-400">
      2
    </div>
    <div class="p-4 bg-gray-400">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (502, '.gap-x-px', 'classes/grid/gap-x-px', NULL, '2024-03-05 19:05:18', '2024-03-05 19:05:18', NULL, '    <div class="grid grid-cols-3 gap-x-px">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-x-px">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (519, '.place-self-start', 'classes/grid/place-self-start', NULL, '2024-03-05 19:05:24', '2024-03-05 19:05:24', NULL, '    <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="place-self-start bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="place-self-start bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (523, '.row-span-full', 'classes/grid/row-span-full', NULL, '2024-03-05 19:05:26', '2024-03-05 19:05:26', NULL, '    <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
        <div class="row-span-full bg-teal-400 p-4">1</div>
        <div class="row-span-auto bg-purple-400 p-4">2</div>
        <div class="row-span-auto bg-purple-400 p-4">3</div>
    </div>', '<div>
  <div class="grid grid-rows-3 grid-flow-col gap-2 max-w-md bg-gray-200 p-2">
    <div class="row-span-full bg-teal-400 p-4">
      1
    </div>
    <div class="row-span-auto bg-purple-400 p-4">
      2
    </div>
    <div class="row-span-auto bg-purple-400 p-4">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (530, '.h-4', 'classes/height/h-4', NULL, '2024-03-05 19:05:29', '2024-03-05 19:05:29', '.h-4 { height: 1rem; }', '<span class="h-4 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-4 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (533, '.h-8', 'classes/height/h-8', NULL, '2024-03-05 19:05:30', '2024-03-05 19:05:30', '.h-8 { height: 2rem; }', '<span class="h-8 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-8 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (549, '.max-h-screen', 'classes/height/max-h-screen', NULL, '2024-03-05 19:05:36', '2024-03-05 19:05:36', '.max-h-screen { max-height: 100vh; }', '<div class="max-h-screen h-5 w-5 bg-teal-400"></div>', '<div>
  <div class="max-h-screen h-5 w-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (552, '.min-h-screen', 'classes/height/min-h-screen', NULL, '2024-03-05 19:05:37', '2024-03-05 19:05:37', '.min-h-screen { min-height: 100vh; }', '<div class="min-h-screen inline-block h-5 w-5 bg-teal-400"></div>', '<div>
  <div class="min-h-screen inline-block h-5 w-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (569, '.m-32', 'classes/margins/m-32', NULL, '2024-03-05 19:05:44', '2024-03-05 19:05:44', '.m-32 { margin: 8rem; }', '<span class="m-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1481, '.placeholder-gray-400::placeholder', 'classes/utilities/placeholder-gray-400::placeholder', NULL, '2024-03-06 04:56:53', '2024-03-06 04:56:53', '.placeholder-gray-400::placeholder { color: #cbd5e0; }', '<input class="placeholder-gray-400 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-400 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1484, '.placeholder-gray-700::placeholder', 'classes/utilities/placeholder-gray-700::placeholder', NULL, '2024-03-06 04:56:54', '2024-03-06 04:56:54', '.placeholder-gray-700::placeholder { color: #4a5568; }', '<input class="placeholder-gray-700 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-700 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1498, '.resize-none', 'classes/utilities/resize-none', NULL, '2024-03-06 04:56:59', '2024-03-06 04:56:59', '.resize-none { resize: none; }', '<textarea class="resize-none bg-gray-200 m-2 block">None</textarea>', '<div>
  <textarea class="resize-none bg-gray-200 m-2 block">
    None
  </textarea>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1506, '.placeholder-current', 'classes/utilities/placeholder-current', NULL, '2024-03-06 04:57:02', '2024-03-06 04:57:02', NULL, '    <input class="placeholder-current block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-current block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1520, '.opacity-25', 'classes/visibility/opacity-25', NULL, '2024-03-06 04:57:07', '2024-03-06 04:57:07', '.opacity-25 { opacity: 0.25; }', '<p class="opacity-25 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-25 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1523, '.invisible', 'classes/visibility/invisible', NULL, '2024-03-06 04:57:08', '2024-03-06 04:57:08', '.invisible {
  visibility: hidden;
}', '<div class="flex justify-center">
  <div class="bg-teal-400 h-16 w-24"></div>
  <div class="invisible bg-teal-600 h-16 w-24"></div>
  <div class="bg-teal-400 h-16 w-24"></div>
</div>', '<div>
  <div class="flex justify-center">
    <div class="bg-teal-400 h-16 w-24">
    </div>
    <div class="invisible bg-teal-600 h-16 w-24">
    </div>
    <div class="bg-teal-400 h-16 w-24">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1539, '.w-40', 'classes/width/w-40', NULL, '2024-03-06 04:57:15', '2024-03-06 04:57:15', '.w-40 { width: 10rem; }', '<span class="w-40 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-40 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1547, '.w-1%25_F2', 'classes/width/w-1%25_F2', NULL, '2024-03-06 04:57:18', '2024-03-06 04:57:18', '.w-1/2 { width: 50%; }', '<span class="w-1/2 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/2 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1563, '.w-2%25_F12', 'classes/width/w-2%25_F12', NULL, '2024-03-06 04:57:25', '2024-03-06 04:57:25', '.w-2/12 { width: 16.666667%; }', '<span class="w-2/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1566, '.w-5%25_F12', 'classes/width/w-5%25_F12', NULL, '2024-03-06 04:57:26', '2024-03-06 04:57:26', '.w-5/12 { width: 41.666667%; }', '<span class="w-5/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-5/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1584, '.max-w-screen-sm', 'classes/width/max-w-screen-sm', NULL, '2024-03-06 04:57:33', '2024-03-06 04:57:33', '.max-w-screen-sm { max-width: 640px; }', '<div class="max-w-screen-sm h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-screen-sm h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1587, '.max-w-screen-xl', 'classes/width/max-w-screen-xl', NULL, '2024-03-06 04:57:34', '2024-03-06 04:57:34', '.max-w-screen-xl { max-width: 1280px; }', '<div class="max-w-screen-xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-screen-xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (499, '.gap-0', 'classes/grid/gap-0', NULL, '2024-03-05 19:05:17', '2024-03-05 19:05:17', NULL, '    <div class="grid grid-cols-3 gap-0">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-0">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (505, '.place-contant-around', 'classes/grid/place-contant-around', NULL, '2024-03-05 19:05:19', '2024-03-05 19:05:19', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-around h-52 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-around h-52 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (520, '.place-self-stretch', 'classes/grid/place-self-stretch', NULL, '2024-03-05 19:05:25', '2024-03-05 19:05:25', NULL, '    <div class="grid grid-cols-3 gap-4 place-items-start p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="place-self-stretch bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 place-items-start p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="place-self-stretch bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (526, '.h-0', 'classes/height/h-0', NULL, '2024-03-05 19:05:27', '2024-03-05 19:05:27', '.h-0 { height: 0; }', '<span class="h-0 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-0 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (540, '.h-40', 'classes/height/h-40', NULL, '2024-03-05 19:05:33', '2024-03-05 19:05:33', '.h-40 { height: 10rem; }', '<span class="h-40 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-40 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (546, '.h-full', 'classes/height/h-full', NULL, '2024-03-05 19:05:35', '2024-03-05 19:05:35', '.h-full { height: 100%; }', '<span class="h-full w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-full w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (565, '.m-12', 'classes/margins/m-12', NULL, '2024-03-05 19:05:42', '2024-03-05 19:05:42', '.m-12 { margin: 3rem; }', '<span class="m-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (567, '.m-20', 'classes/margins/m-20', NULL, '2024-03-05 19:05:43', '2024-03-05 19:05:43', '.m-20 { margin: 5rem; }', '<span class="m-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (581, '.mb-5', 'classes/margins/mb-5', NULL, '2024-03-05 19:05:49', '2024-03-05 19:05:49', '.mb-5 { margin-bottom: 1.25rem; }', '<span class="mb-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1482, '.placeholder-gray-500::placeholder', 'classes/utilities/placeholder-gray-500::placeholder', NULL, '2024-03-06 04:56:53', '2024-03-06 04:56:53', '.placeholder-gray-500::placeholder { color: #a0aec0; }', '<input class="placeholder-gray-500 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-500 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1488, '.placeholder-opacity-25', 'classes/utilities/placeholder-opacity-25', NULL, '2024-03-06 04:56:56', '2024-03-06 04:56:56', '.placeholder-opacity-25 { --placeholder-opacity: 0.25; }', '<input class="placeholder-opacity-25 placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-25 placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1502, '.select-text', 'classes/utilities/select-text', NULL, '2024-03-06 04:57:01', '2024-03-06 04:57:01', '.select-text { user-select: text; }', '<div class="select-text">Lorem ipsum dolor sit amet, consectetur.</div>', '<div>
  <div class="select-text">
    Lorem ipsum dolor sit amet, consectetur.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1507, '.placeholder-gray-100', 'classes/utilities/placeholder-gray-100', NULL, '2024-03-06 04:57:02', '2024-03-06 04:57:02', NULL, '    <input class="placeholder-gray-100 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-100 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1524, '.sr-only+%25_F+.not-sr-only', 'classes/visibility/sr-only+%25_F+.not-sr-only', NULL, '2024-03-06 04:57:09', '2024-03-06 04:57:09', '.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}
.not-sr-only {
  position: static;
  width: auto;
  height: auto;
  padding: 0;
  margin: 0;
  overflow: visible;
  clip: auto;
  white-space: normal;
}', '<span class="sr-only sm:not-sr-only">Lorem ipsum dolor sit amet.</span>
', '<div>
  <span class="sr-only sm:not-sr-only">
    Lorem ipsum dolor sit amet.
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1527, '.w-2', 'classes/width/w-2', NULL, '2024-03-06 04:57:10', '2024-03-06 04:57:10', '.w-2 { width: 0.5rem; }', '<span class="w-2 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1540, '.w-48', 'classes/width/w-48', NULL, '2024-03-06 04:57:15', '2024-03-06 04:57:15', '.w-48 { width: 12rem; }', '<span class="w-48 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-48 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1548, '.w-1%25_F3', 'classes/width/w-1%25_F3', NULL, '2024-03-06 04:57:18', '2024-03-06 04:57:18', '.w-1/3 { width: 33.333333%; }', '<span class="w-1/3 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-1/3 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1564, '.w-3%25_F12', 'classes/width/w-3%25_F12', NULL, '2024-03-06 04:57:25', '2024-03-06 04:57:25', '.w-3/12 { width: 25%; }', '<span class="w-3/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-3/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1567, '.w-6%25_F12', 'classes/width/w-6%25_F12', NULL, '2024-03-06 04:57:26', '2024-03-06 04:57:26', '.w-6/12 { width: 50%; }', '<span class="w-6/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-6/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1580, '.max-w-4xl', 'classes/width/max-w-4xl', NULL, '2024-03-06 04:57:31', '2024-03-06 04:57:31', '.max-w-4xl { max-width: 56rem; }', '<div class="max-w-4xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-4xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1586, '.max-w-screen-lg', 'classes/width/max-w-screen-lg', NULL, '2024-03-06 04:57:33', '2024-03-06 04:57:33', '.max-w-screen-lg { max-width: 1024px; }', '<div class="max-w-screen-lg h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-screen-lg h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1600, '.w-11', 'classes/width/w-11', NULL, '2024-03-06 04:57:39', '2024-03-06 04:57:39', NULL, '    <span class="w-11 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-11 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (500, '.gap-px', 'classes/grid/gap-px', NULL, '2024-03-05 19:05:17', '2024-03-05 19:05:17', NULL, '    <div class="grid grid-cols-3 gap-px">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-px">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (514, '.place-items-end', 'classes/grid/place-items-end', NULL, '2024-03-05 19:05:23', '2024-03-05 19:05:23', NULL, '    <div class="grid grid-cols-3 gap-2 place-items-end h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-items-end h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (517, '.place-self-auto', 'classes/grid/place-self-auto', NULL, '2024-03-05 19:05:24', '2024-03-05 19:05:24', NULL, '    <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
        <div class="bg-purple-400 p-4">1</div>
        <div class="place-self-auto bg-teal-400 p-4">2</div>
        <div class="bg-purple-400 p-4">3</div>
        <div class="bg-purple-400 p-4">4</div>
        <div class="bg-purple-400 p-4">5</div>
        <div class="bg-purple-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-4 place-items-stretch p-2 bg-gray-200 max-w-md">
    <div class="bg-purple-400 p-4">
      1
    </div>
    <div class="place-self-auto bg-teal-400 p-4">
      2
    </div>
    <div class="bg-purple-400 p-4">
      3
    </div>
    <div class="bg-purple-400 p-4">
      4
    </div>
    <div class="bg-purple-400 p-4">
      5
    </div>
    <div class="bg-purple-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (534, '.h-10', 'classes/height/h-10', NULL, '2024-03-05 19:05:30', '2024-03-05 19:05:30', '.h-10 { height: 2.5rem; }', '<span class="h-10 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-10 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (538, '.h-24', 'classes/height/h-24', NULL, '2024-03-05 19:05:32', '2024-03-05 19:05:32', '.h-24 { height: 6rem; }', '<span class="h-24 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-24 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (550, '.min-h-0', 'classes/height/min-h-0', NULL, '2024-03-05 19:05:37', '2024-03-05 19:05:37', '.min-h-0 { min-height: 0; }', '<div class="min-h-0 inline-block h-5 w-5 bg-teal-400"></div>', '<div>
  <div class="min-h-0 inline-block h-5 w-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (553, '.max-h-px', 'classes/height/max-h-px', NULL, '2024-03-05 19:05:38', '2024-03-05 19:05:38', NULL, '    <div class="bg-gray-300 w-32 h-32">
        <div class="max-h-px w-10 bg-teal-400">
            <div class="w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        </div>
    </div>', '<div>
  <div class="bg-gray-300 w-32 h-32">
    <div class="max-h-px w-10 bg-teal-400">
      <div class="w-4 h-4 bg-red-400 rounded-full mx-auto">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (570, '.m-40', 'classes/margins/m-40', NULL, '2024-03-05 19:05:44', '2024-03-05 19:05:44', '.m-40 { margin: 10rem; }', '<span class="m-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (573, '.m-64', 'classes/margins/m-64', NULL, '2024-03-05 19:05:45', '2024-03-05 19:05:45', '.m-64 { margin: 16rem; }', '<span class="m-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1485, '.placeholder-gray-800::placeholder', 'classes/utilities/placeholder-gray-800::placeholder', NULL, '2024-03-06 04:56:55', '2024-03-06 04:56:55', '.placeholder-gray-800::placeholder { color: #2d3748; }', '<input class="placeholder-gray-800 block" placeholder="Text"/>', '<div>
  <input class="placeholder-gray-800 block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1489, '.placeholder-opacity-50', 'classes/utilities/placeholder-opacity-50', NULL, '2024-03-06 04:56:56', '2024-03-06 04:56:56', '.placeholder-opacity-50 { --placeholder-opacity: 0.5; }', '<input class="placeholder-opacity-50 placeholder-black block" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-50 placeholder-black block" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1503, '.select-all', 'classes/utilities/select-all', NULL, '2024-03-06 04:57:01', '2024-03-06 04:57:01', '.select-all { user-select: all; }', '<div class="select-all">Lorem ipsum dolor sit amet, consectetur.</div>', '<div>
  <div class="select-all">
    Lorem ipsum dolor sit amet, consectetur.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1510, '.placeholder-opacity-10', 'classes/utilities/placeholder-opacity-10', NULL, '2024-03-06 04:57:03', '2024-03-06 04:57:03', NULL, '    <input class="placeholder-opacity-10 block px-2 py-1 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-opacity-10 block px-2 py-1 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1525, '.w-0', 'classes/width/w-0', NULL, '2024-03-06 04:57:09', '2024-03-06 04:57:09', '.w-0 { width: 0; }', '<span class="w-0 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-0 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1528, '.w-3', 'classes/width/w-3', NULL, '2024-03-06 04:57:10', '2024-03-06 04:57:10', '.w-3 { width: 0.75rem; }', '<span class="w-3 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-3 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1541, '.w-56', 'classes/width/w-56', NULL, '2024-03-06 04:57:15', '2024-03-06 04:57:15', '.w-56 { width: 14rem; }', '<span class="w-56 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-56 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1551, '.w-2%25_F4', 'classes/width/w-2%25_F4', NULL, '2024-03-06 04:57:20', '2024-03-06 04:57:20', '.w-2/4 { width: 50%; }', '<span class="w-2/4 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2/4 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1565, '.w-4%25_F12', 'classes/width/w-4%25_F12', NULL, '2024-03-06 04:57:25', '2024-03-06 04:57:25', '.w-4/12 { width: 33.333333%; }', '<span class="w-4/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-4/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1571, '.w-10%25_F12', 'classes/width/w-10%25_F12', NULL, '2024-03-06 04:57:28', '2024-03-06 04:57:28', '.w-10/12 { width: 83.333333%; }', '<span class="w-10/12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-10/12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1585, '.max-w-screen-md', 'classes/width/max-w-screen-md', NULL, '2024-03-06 04:57:33', '2024-03-06 04:57:33', '.max-w-screen-md { max-width: 768px; }', '<div class="max-w-screen-md h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-screen-md h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1588, '.max-w-none', 'classes/width/max-w-none', NULL, '2024-03-06 04:57:34', '2024-03-06 04:57:34', '.max-w-none { max-width: none; }', '<div class="max-w-none h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-none h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (503, '.gap-y-0', 'classes/grid/gap-y-0', NULL, '2024-03-05 19:05:18', '2024-03-05 19:05:18', NULL, '    <div class="grid grid-cols-3 gap-y-0">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-y-0">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (506, '.place-contant-between', 'classes/grid/place-contant-between', NULL, '2024-03-05 19:05:20', '2024-03-05 19:05:20', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-between h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-between h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (536, '.h-16', 'classes/height/h-16', NULL, '2024-03-05 19:05:31', '2024-03-05 19:05:31', '.h-16 { height: 4rem; }', '<span class="h-16 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-16 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (542, '.h-56', 'classes/height/h-56', NULL, '2024-03-05 19:05:33', '2024-03-05 19:05:33', '.h-56 { height: 14rem; }', '<span class="h-56 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-56 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (566, '.m-16', 'classes/margins/m-16', NULL, '2024-03-05 19:05:43', '2024-03-05 19:05:43', '.m-16 { margin: 4rem; }', '<span class="m-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (568, '.m-24', 'classes/margins/m-24', NULL, '2024-03-05 19:05:43', '2024-03-05 19:05:43', '.m-24 { margin: 6rem; }', '<span class="m-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1496, '.pointer-events-auto', 'classes/utilities/pointer-events-auto', NULL, '2024-03-06 04:56:59', '2024-03-06 04:56:59', '.pointer-events-auto { pointer-events: auto; }', '<button class="pointer-events-none hover:bg-teal-400 px-4 py-2 bg-gray-300 m-2">None</button>', '<div>
  <button class="pointer-events-none hover:bg-teal-400 px-4 py-2 bg-gray-300 m-2">
    None
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1501, '.select-none', 'classes/utilities/select-none', NULL, '2024-03-06 04:57:00', '2024-03-06 04:57:00', '.select-none { user-select: none; }', '<div class="select-none">Lorem ipsum dolor sit amet, consectetur.</div>', '<div>
  <div class="select-none">
    Lorem ipsum dolor sit amet, consectetur.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1515, '.placeholder-white', 'classes/utilities/placeholder-white', NULL, '2024-03-06 04:57:05', '2024-03-06 04:57:05', NULL, '    <input class="placeholder-white block px-2 py-1 bg-gray-800 border rounded" placeholder="Text"/>', '<div>
  <input class="placeholder-white block px-2 py-1 bg-gray-800 border rounded" placeholder="Text"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1521, '.opacity-0', 'classes/visibility/opacity-0', NULL, '2024-03-06 04:57:08', '2024-03-06 04:57:08', '.opacity-0 { opacity: 0; }', '<p class="opacity-0 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-0 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1535, '.w-16', 'classes/width/w-16', NULL, '2024-03-06 04:57:13', '2024-03-06 04:57:13', '.w-16 { width: 4rem; }', '<span class="w-16 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-16 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1543, '.w-auto', 'classes/width/w-auto', NULL, '2024-03-06 04:57:16', '2024-03-06 04:57:16', '.w-auto { width: auto; }', '<span class="w-auto h-4 block bg-teal-400"></span>', '<div>
  <span class="w-auto h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1558, '.w-2%25_F6', 'classes/width/w-2%25_F6', NULL, '2024-03-06 04:57:23', '2024-03-06 04:57:23', '.w-2/6 { width: 33.333333%; }', '<span class="w-2/6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2/6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1561, '.w-5%25_F6', 'classes/width/w-5%25_F6', NULL, '2024-03-06 04:57:24', '2024-03-06 04:57:24', '.w-5/6 { width: 83.333333%; }', '<span class="w-5/6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-5/6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1575, '.max-w-md', 'classes/width/max-w-md', NULL, '2024-03-06 04:57:29', '2024-03-06 04:57:29', '.max-w-md { max-width: 28rem; }', '<div class="max-w-md h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-md h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1582, '.max-w-6xl', 'classes/width/max-w-6xl', NULL, '2024-03-06 04:57:32', '2024-03-06 04:57:32', '.max-w-6xl { max-width: 72rem; }', '<div class="max-w-6xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-6xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1598, '.min-w-max', 'classes/width/min-w-max', NULL, '2024-03-06 04:57:38', '2024-03-06 04:57:38', NULL, '    <div class="min-w-max h-5 bg-teal-400">
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
    </div>', '<div>
  <div class="min-w-max h-5 bg-teal-400">
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (504, '.gap-y-px', 'classes/grid/gap-y-px', NULL, '2024-03-05 19:05:19', '2024-03-05 19:05:19', NULL, '    <div class="grid grid-cols-3 gap-y-px">
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-indigo-400"></div>
        <div class="h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-y-px">
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-indigo-400">
    </div>
    <div class="h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (507, '.place-contant-center', 'classes/grid/place-contant-center', NULL, '2024-03-05 19:05:20', '2024-03-05 19:05:20', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-center h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-center h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (524, '.group-hover', 'classes/group-hover/group-hover', NULL, '2024-03-05 19:05:26', '2024-03-05 19:05:26', NULL, '    <div class="inline-block group p-6 border-2 cursor-pointer hover:bg-gray-50 hover:border-blue-100">
        <p class="group-hover:text-gray-400">John Smith</p>
        <p class="group-hover:text-blue-400">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente, voluptatibus.</p>
    </div>', '<div>
  <div class="inline-block group p-6 border-2 cursor-pointer hover:bg-gray-50 hover:border-blue-100">
    <p class="group-hover:text-gray-400">
      John Smith
    </p>
    <p class="group-hover:text-blue-400">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente, voluptatibus.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (527, '.h-1', 'classes/height/h-1', NULL, '2024-03-05 19:05:27', '2024-03-05 19:05:27', '.h-1 { height: 0.25rem; }', '<span class="h-1 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-1 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (544, '.h-auto', 'classes/height/h-auto', NULL, '2024-03-05 19:05:34', '2024-03-05 19:05:34', '.h-auto { height: auto; }', '<span class="h-px w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-px w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (547, '.h-screen', 'classes/height/h-screen', NULL, '2024-03-05 19:05:35', '2024-03-05 19:05:35', '.h-screen { height: 100vw; }', '<span class="h-screen w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-screen w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (561, '.m-5', 'classes/margins/m-5', NULL, '2024-03-05 19:05:41', '2024-03-05 19:05:41', '.m-5 { margin: 1.25rem; }', '<span class="m-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (564, '.m-10', 'classes/margins/m-10', NULL, '2024-03-05 19:05:42', '2024-03-05 19:05:42', '.m-10 { margin: 2.5rem; }', '<span class="m-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (580, '.mb-4', 'classes/margins/mb-4', NULL, '2024-03-05 19:05:48', '2024-03-05 19:05:48', '.mb-4 { margin-bottom: 1rem; }', '<span class="mb-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (584, '.mb-10', 'classes/margins/mb-10', NULL, '2024-03-05 19:05:50', '2024-03-05 19:05:50', '.mb-10 { margin-bottom: 2.5rem; }', '<span class="mb-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1534, '.w-12', 'classes/width/w-12', NULL, '2024-03-06 04:57:13', '2024-03-06 04:57:13', '.w-12 { width: 3rem; }', '<span class="w-12 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-12 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1542, '.w-64', 'classes/width/w-64', NULL, '2024-03-06 04:57:16', '2024-03-06 04:57:16', '.w-64 { width: 16rem; }', '<span class="w-64 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-64 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1554, '.w-2%25_F5', 'classes/width/w-2%25_F5', NULL, '2024-03-06 04:57:21', '2024-03-06 04:57:21', '.w-2/5 { width: 40%; }', '<span class="w-2/5 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-2/5 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1560, '.w-4%25_F6', 'classes/width/w-4%25_F6', NULL, '2024-03-06 04:57:24', '2024-03-06 04:57:24', '.w-4/6 { width: 66.666667%; }', '<span class="w-4/6 h-4 block bg-teal-400"></span>', '<div>
  <span class="w-4/6 h-4 block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1574, '.max-w-sm', 'classes/width/max-w-sm', NULL, '2024-03-06 04:57:29', '2024-03-06 04:57:29', '.max-w-sm { max-width: 24rem; }', '<div class="max-w-sm h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-sm h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1581, '.max-w-5xl', 'classes/width/max-w-5xl', NULL, '2024-03-06 04:57:32', '2024-03-06 04:57:32', '.max-w-5xl { max-width: 64rem; }', '<div class="max-w-5xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-5xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1595, '.max-w-min', 'classes/width/max-w-min', NULL, '2024-03-06 04:57:37', '2024-03-06 04:57:37', NULL, '    <div class="bg-gray-300 h-20 w-20">
        <div class="max-w-min h-6 bg-teal-400">
            <div class="w-6 h-6 bg-red-400 rounded-full mx-auto"></div>
        </div>
    </div>', '<div>
  <div class="bg-gray-300 h-20 w-20">
    <div class="max-w-min h-6 bg-teal-400">
      <div class="w-6 h-6 bg-red-400 rounded-full mx-auto">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1597, '.max-w-screen-2xl', 'classes/width/max-w-screen-2xl', NULL, '2024-03-06 04:57:38', '2024-03-06 04:57:38', NULL, '    <div class="max-w-screen-2xl h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-screen-2xl h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (508, '.place-contant-end', 'classes/grid/place-contant-end', NULL, '2024-03-05 19:05:20', '2024-03-05 19:05:20', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-end h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-end h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (510, '.place-contant-start', 'classes/grid/place-contant-start', NULL, '2024-03-05 19:05:21', '2024-03-05 19:05:21', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-start h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-start h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (531, '.h-5', 'classes/height/h-5', NULL, '2024-03-05 19:05:29', '2024-03-05 19:05:29', '.h-5 { height: 1.25rem; }', '<span class="h-5 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-5 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (537, '.h-20', 'classes/height/h-20', NULL, '2024-03-05 19:05:31', '2024-03-05 19:05:31', '.h-20 { height: 5rem; }', '<span class="h-20 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-20 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (560, '.m-4', 'classes/margins/m-4', NULL, '2024-03-05 19:05:40', '2024-03-05 19:05:40', '.m-4 { margin: 1rem; }', '<span class="m-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (563, '.m-8', 'classes/margins/m-8', NULL, '2024-03-05 19:05:42', '2024-03-05 19:05:42', '.m-8 { margin: 2rem; }', '<span class="m-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (577, '.mb-1', 'classes/margins/mb-1', NULL, '2024-03-05 19:05:47', '2024-03-05 19:05:47', '.mb-1 { margin-bottom: 0.25rem; }', '<span class="mb-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (583, '.mb-8', 'classes/margins/mb-8', NULL, '2024-03-05 19:05:49', '2024-03-05 19:05:49', '.mb-8 { margin-bottom: 2rem; }', '<span class="mb-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1594, '.max-w-max', 'classes/width/max-w-max', NULL, '2024-03-06 04:57:37', '2024-03-06 04:57:37', NULL, '    <div class="bg-gray-300 h-20 w-20">
        <div class="max-w-max h-6 bg-teal-400">
            <div class="w-6 h-6 bg-red-400 rounded-full mx-auto"></div>
        </div>
    </div>', '<div>
  <div class="bg-gray-300 h-20 w-20">
    <div class="max-w-max h-6 bg-teal-400">
      <div class="w-6 h-6 bg-red-400 rounded-full mx-auto">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1596, '.max-w-prose', 'classes/width/max-w-prose', NULL, '2024-03-06 04:57:37', '2024-03-06 04:57:37', NULL, '    <div class="max-w-prose h-5 bg-teal-400"></div>', '<div>
  <div class="max-w-prose h-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (509, '.place-contant-evenly', 'classes/grid/place-contant-evenly', NULL, '2024-03-05 19:05:21', '2024-03-05 19:05:21', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-evenly h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-evenly h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (511, '.place-contant-stretch', 'classes/grid/place-contant-stretch', NULL, '2024-03-05 19:05:21', '2024-03-05 19:05:21', NULL, '    <div class="grid grid-cols-3 gap-2 place-content-stretch h-40 p-2 bg-gray-200 max-w-md">
        <div class="bg-teal-400 p-4">1</div>
        <div class="bg-teal-400 p-4">2</div>
        <div class="bg-teal-400 p-4">3</div>
        <div class="bg-teal-400 p-4">4</div>
        <div class="bg-teal-400 p-4">5</div>
        <div class="bg-teal-400 p-4">6</div>
    </div>', '<div>
  <div class="grid grid-cols-3 gap-2 place-content-stretch h-40 p-2 bg-gray-200 max-w-md">
    <div class="bg-teal-400 p-4">
      1
    </div>
    <div class="bg-teal-400 p-4">
      2
    </div>
    <div class="bg-teal-400 p-4">
      3
    </div>
    <div class="bg-teal-400 p-4">
      4
    </div>
    <div class="bg-teal-400 p-4">
      5
    </div>
    <div class="bg-teal-400 p-4">
      6
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (525, '.group-hover', 'classes/group-hover/group-hover', NULL, '2024-03-05 19:05:27', '2024-03-05 19:05:27', NULL, '    <div class="inline-block group p-6 border-2 cursor-pointer hover:bg-gray-50 hover:border-blue-100">
        <p class="group-hover:text-gray-400">John Smith</p>
        <p class="group-hover:text-blue-400">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente, voluptatibus.</p>
    </div>', '<div>
  <div class="inline-block group p-6 border-2 cursor-pointer hover:bg-gray-50 hover:border-blue-100">
    <p class="group-hover:text-gray-400">
      John Smith
    </p>
    <p class="group-hover:text-blue-400">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente, voluptatibus.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (528, '.h-2', 'classes/height/h-2', NULL, '2024-03-05 19:05:28', '2024-03-05 19:05:28', '.h-2 { height: 0.5rem; }', '<span class="h-2 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-2 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (545, '.h-px', 'classes/height/h-px', NULL, '2024-03-05 19:05:35', '2024-03-05 19:05:35', '.h-px { height: 1px; }', '<span class="h-auto w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-auto w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (548, '.max-h-full', 'classes/height/max-h-full', NULL, '2024-03-05 19:05:36', '2024-03-05 19:05:36', '.max-h-full { max-height: 100%; }', '<div class="max-h-full h-5 w-5 bg-teal-400"></div>', '<div>
  <div class="max-h-full h-5 w-5 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (556, '.m-0', 'classes/margins/m-0', NULL, '2024-03-05 19:05:39', '2024-03-05 19:05:39', '.m-0 { margin: 0; }', '<span class="m-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (562, '.m-6', 'classes/margins/m-6', NULL, '2024-03-05 19:05:41', '2024-03-05 19:05:41', '.m-6 { margin: 1.5rem; }', '<span class="m-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="m-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (576, '.mb-0', 'classes/margins/mb-0', NULL, '2024-03-05 19:05:47', '2024-03-05 19:05:47', '.mb-0 { margin-bottom: 0; }', '<span class="mb-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (582, '.mb-6', 'classes/margins/mb-6', NULL, '2024-03-05 19:05:49', '2024-03-05 19:05:49', '.mb-6 { margin-bottom: 1.5rem; }', '<span class="mb-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (586, '.mb-6', 'classes/margins/mb-6', NULL, '2024-03-06 04:51:08', '2024-03-06 04:51:08', '.mb-6 { margin-bottom: 1.5rem; }', '<span class="mb-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (587, '.mb-8', 'classes/margins/mb-8', NULL, '2024-03-06 04:51:09', '2024-03-06 04:51:09', '.mb-8 { margin-bottom: 2rem; }', '<span class="mb-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (588, '.mb-10', 'classes/margins/mb-10', NULL, '2024-03-06 04:51:09', '2024-03-06 04:51:09', '.mb-10 { margin-bottom: 2.5rem; }', '<span class="mb-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (589, '.mb-12', 'classes/margins/mb-12', NULL, '2024-03-06 04:51:10', '2024-03-06 04:51:10', NULL, '<span class="mb-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (590, '.mb-16', 'classes/margins/mb-16', NULL, '2024-03-06 04:51:10', '2024-03-06 04:51:10', '.mb-16 { margin-bottom: 4rem; }', '<span class="mb-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (591, '.mb-20', 'classes/margins/mb-20', NULL, '2024-03-06 04:51:11', '2024-03-06 04:51:11', '.mb-20 { margin-bottom: 5rem; }', '<span class="mb-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (592, '.mb-24', 'classes/margins/mb-24', NULL, '2024-03-06 04:51:11', '2024-03-06 04:51:11', '.mb-24 { margin-bottom: 6rem; }', '<span class="mb-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (593, '.mb-32', 'classes/margins/mb-32', NULL, '2024-03-06 04:51:12', '2024-03-06 04:51:12', '.mb-32 { margin-bottom: 8rem; }', '<span class="mb-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (594, '.mb-40', 'classes/margins/mb-40', NULL, '2024-03-06 04:51:12', '2024-03-06 04:51:12', '.mb-40 { margin-bottom: 10rem; }', '<span class="mb-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (595, '.mb-48', 'classes/margins/mb-48', NULL, '2024-03-06 04:51:12', '2024-03-06 04:51:12', '.mb-48 { margin-bottom: 12rem; }', '<span class="mb-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (596, '.mb-56', 'classes/margins/mb-56', NULL, '2024-03-06 04:51:13', '2024-03-06 04:51:13', '.mb-56 { margin-bottom: 14rem; }', '<span class="mb-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (597, '.mb-64', 'classes/margins/mb-64', NULL, '2024-03-06 04:51:13', '2024-03-06 04:51:13', '.mb-64 { margin-bottom: 16rem; }', '<span class="mb-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (598, '.mb-auto', 'classes/margins/mb-auto', NULL, '2024-03-06 04:51:14', '2024-03-06 04:51:14', '.mb-auto { margin-bottom: auto; }', '<span class="mb-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (600, '.mr-0', 'classes/margins/mr-0', NULL, '2024-03-06 04:51:15', '2024-03-06 04:51:15', '.mr-0 { margin-right: 0; }', '<span class="mr-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (611, '.mr-20', 'classes/margins/mr-20', NULL, '2024-03-06 04:51:19', '2024-03-06 04:51:19', '.mr-20 { margin-right: 5rem; }', '<span class="mr-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (614, '.mr-40', 'classes/margins/mr-40', NULL, '2024-03-06 04:51:20', '2024-03-06 04:51:20', '.mr-40 { margin-right: 10rem; }', '<span class="mr-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (630, '.mt-16', 'classes/margins/mt-16', NULL, '2024-03-06 04:51:27', '2024-03-06 04:51:27', '.mt-16 { margin-top: 4rem; }', '<span class="mt-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (633, '.mt-32', 'classes/margins/mt-32', NULL, '2024-03-06 04:51:30', '2024-03-06 04:51:30', '.mt-32 { margin-top: 8rem; }', '<span class="mt-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (649, '.ml-12', 'classes/margins/ml-12', NULL, '2024-03-06 04:51:37', '2024-03-06 04:51:37', '.ml-12 { margin-left: 3rem; }', '<span class="ml-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (651, '.ml-20', 'classes/margins/ml-20', NULL, '2024-03-06 04:51:38', '2024-03-06 04:51:38', '.ml-20 { margin-left: 5rem; }', '<span class="ml-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (668, '.mx-10', 'classes/margins/mx-10', NULL, '2024-03-06 04:51:45', '2024-03-06 04:51:45', '.mx-10 { margin-right: 2.5rem; margin-left: 2.5rem; }', '<span class="mx-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (672, '.mx-24', 'classes/margins/mx-24', NULL, '2024-03-06 04:51:46', '2024-03-06 04:51:46', '.mx-24 { margin-right: 6rem; margin-left: 6rem; }', '<span class="mx-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (688, '.my-10', 'classes/margins/my-10', NULL, '2024-03-06 04:51:53', '2024-03-06 04:51:53', '.my-10 { margin-top: 2.5rem; margin-bottom: 2.5rem; }', '<span class="my-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (691, '.my-20', 'classes/margins/my-20', NULL, '2024-03-06 04:51:54', '2024-03-06 04:51:54', '.my-20 { margin-top: 5rem; margin-bottom: 5rem; }', '<span class="my-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (705, '.-m-6', 'classes/margins/-m-6', NULL, '2024-03-06 04:51:59', '2024-03-06 04:51:59', '.-m-6 { margin: -1.5rem; }', '<span class="-m-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (707, '.-m-10', 'classes/margins/-m-10', NULL, '2024-03-06 04:52:00', '2024-03-06 04:52:00', '.-m-10 { margin: -2.5rem; }', '<span class="-m-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (728, '.-mb-20', 'classes/margins/-mb-20', NULL, '2024-03-06 04:52:09', '2024-03-06 04:52:09', '.-mb-20 { margin-bottom: -5rem; }', '<span class="-mb-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (733, '.-mb-56', 'classes/margins/-mb-56', NULL, '2024-03-06 04:52:12', '2024-03-06 04:52:12', '.-mb-56 { margin-bottom: -14rem; }', '<span class="-mb-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (746, '.-mr-20', 'classes/margins/-mr-20', NULL, '2024-03-06 04:52:17', '2024-03-06 04:52:17', '.-mr-20 { margin-right: -5rem; }', '<span class="-mr-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (749, '.-mr-40', 'classes/margins/-mr-40', NULL, '2024-03-06 04:52:19', '2024-03-06 04:52:19', '.-mr-40 { margin-right: -10rem; }', '<span class="-mr-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (765, '.-mt-24', 'classes/margins/-mt-24', NULL, '2024-03-06 04:52:25', '2024-03-06 04:52:25', '.-mt-24 { margin-top: -6rem; }', '<span class="-mt-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (771, '.-mt-px', 'classes/margins/-mt-px', NULL, '2024-03-06 04:52:28', '2024-03-06 04:52:28', '.-mt-px { margin-top: -1px; }', '<span class="-mt-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (787, '.-ml-56', 'classes/margins/-ml-56', NULL, '2024-03-06 04:52:34', '2024-03-06 04:52:34', '.-ml-56 { margin-left: -14rem; }', '<span class="-ml-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (803, '.-mx-40', 'classes/margins/-mx-40', NULL, '2024-03-06 04:52:41', '2024-03-06 04:52:41', '.-mx-40 { margin-right: -10rem; margin-left: -10rem; }', '<span class="-mx-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (805, '.-mx-56', 'classes/margins/-mx-56', NULL, '2024-03-06 04:52:42', '2024-03-06 04:52:42', '.-mx-56 { margin-right: -14rem; margin-left: -14rem; }', '<span class="-mx-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (819, '.-my-24', 'classes/margins/-my-24', NULL, '2024-03-06 04:52:47', '2024-03-06 04:52:47', '.-my-24 { margin-top: -6rem; margin-bottom: -6rem; }', '<span class="-my-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1599, '.min-w-min', 'classes/width/min-w-min', NULL, '2024-03-06 04:57:39', '2024-03-06 04:57:39', NULL, '    <div class="min-w-min h-5 bg-teal-400">
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
        <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto"></div>
    </div>', '<div>
  <div class="min-w-min h-5 bg-teal-400">
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
    <div class="inline-block w-4 h-4 bg-red-400 rounded-full mx-auto">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (601, '.mr-1', 'classes/margins/mr-1', NULL, '2024-03-06 04:51:15', '2024-03-06 04:51:15', '.mr-1 { margin-right: 0.25rem; }', '<span class="mr-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (602, '.mr-2', 'classes/margins/mr-2', NULL, '2024-03-06 04:51:16', '2024-03-06 04:51:16', '.mr-2 { margin-right: 0.5rem; }', '<span class="mr-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (616, '.mr-56', 'classes/margins/mr-56', NULL, '2024-03-06 04:51:21', '2024-03-06 04:51:21', '.mr-56 { margin-right: 14rem; }', '<span class="mr-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (618, '.mr-auto', 'classes/margins/mr-auto', NULL, '2024-03-06 04:51:22', '2024-03-06 04:51:22', '.mr-auto { margin-right: auto; }', '<span class="mr-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (639, '.mt-px', 'classes/margins/mt-px', NULL, '2024-03-06 04:51:33', '2024-03-06 04:51:33', '.mt-px { margin-top: 1px; }', '<span class="mt-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (641, '.ml-1', 'classes/margins/ml-1', NULL, '2024-03-06 04:51:34', '2024-03-06 04:51:34', '.ml-1 { margin-left: 0.25rem; }', '<span class="ml-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (657, '.ml-64', 'classes/margins/ml-64', NULL, '2024-03-06 04:51:41', '2024-03-06 04:51:41', '.ml-64 { margin-left: 16rem; }', '<span class="ml-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (661, '.mx-1', 'classes/margins/mx-1', NULL, '2024-03-06 04:51:42', '2024-03-06 04:51:42', '.mx-1 { margin-right: 0.25rem; margin-left: 0.25rem; }', '<span class="mx-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (678, '.mx-auto', 'classes/margins/mx-auto', NULL, '2024-03-06 04:51:49', '2024-03-06 04:51:49', '.mx-auto { margin-right: auto; margin-left: auto; }', '<span class="mx-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (680, '.my-0', 'classes/margins/my-0', NULL, '2024-03-06 04:51:50', '2024-03-06 04:51:50', '.my-0 { margin-top: 0; margin-bottom: 0; }', '<span class="my-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (695, '.my-48', 'classes/margins/my-48', NULL, '2024-03-06 04:51:55', '2024-03-06 04:51:55', '.my-48 { margin-top: 12rem; margin-bottom: 12rem; }', '<span class="my-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (697, '.my-64', 'classes/margins/my-64', NULL, '2024-03-06 04:51:56', '2024-03-06 04:51:56', '.my-64 { margin-top: 16rem; margin-bottom: 16rem; }', '<span class="my-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (713, '.-m-40', 'classes/margins/-m-40', NULL, '2024-03-06 04:52:03', '2024-03-06 04:52:03', '.-m-40 { margin: -10rem; }', '<span class="-m-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (715, '.-m-56', 'classes/margins/-m-56', NULL, '2024-03-06 04:52:04', '2024-03-06 04:52:04', '.-m-56 { margin: -14rem; }', '<span class="-m-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (723, '.-mb-6', 'classes/margins/-mb-6', NULL, '2024-03-06 04:52:07', '2024-03-06 04:52:07', '.-mb-6 { margin-bottom: -1.5rem; }', '<span class="-mb-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (726, '.-mb-12', 'classes/margins/-mb-12', NULL, '2024-03-06 04:52:08', '2024-03-06 04:52:08', '.-mb-12 { margin-bottom: -3rem; }', '<span class="-mb-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (737, '.-mr-2', 'classes/margins/-mr-2', NULL, '2024-03-06 04:52:13', '2024-03-06 04:52:13', '.-mr-2 { margin-right: -0.5rem; }', '<span class="-mr-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (743, '.-mr-10', 'classes/margins/-mr-10', NULL, '2024-03-06 04:52:16', '2024-03-06 04:52:16', '.-mr-10 { margin-right: -2.5rem; }', '<span class="-mr-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (759, '.-mt-6', 'classes/margins/-mt-6', NULL, '2024-03-06 04:52:23', '2024-03-06 04:52:23', '.-mt-6 { margin-top: -1.5rem; }', '<span class="-mt-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (762, '.-mt-12', 'classes/margins/-mt-12', NULL, '2024-03-06 04:52:24', '2024-03-06 04:52:24', '.-mt-12 { margin-top: -3rem; }', '<span class="-mt-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (779, '.-ml-10', 'classes/margins/-ml-10', NULL, '2024-03-06 04:52:31', '2024-03-06 04:52:31', '.-ml-10 { margin-left: -2.5rem; }', '<span class="-ml-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (781, '.-ml-16', 'classes/margins/-ml-16', NULL, '2024-03-06 04:52:32', '2024-03-06 04:52:32', '.-ml-16 { margin-left: -4rem; }', '<span class="-ml-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (797, '.-mx-10', 'classes/margins/-mx-10', NULL, '2024-03-06 04:52:38', '2024-03-06 04:52:38', '.-mx-10 { margin-right: -2.5rem; margin-left: -2.5rem; }', '<span class="-mx-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (813, '.-my-6', 'classes/margins/-my-6', NULL, '2024-03-06 04:52:45', '2024-03-06 04:52:45', '.-my-6 { margin-top: -1.5rem; margin-bottom: -1.5rem; }', '<span class="-my-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (815, '.-my-10', 'classes/margins/-my-10', NULL, '2024-03-06 04:52:46', '2024-03-06 04:52:46', '.-my-10 { margin-top: -2.5rem; margin-bottom: -2.5rem; }', '<span class="-my-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (47, '.bg-right-bottom', 'classes/background/bg-right-bottom', NULL, '2024-03-05 19:02:29', '2024-03-09 18:03:46', '.bg-right-bottom { background-position: right bottom; }', '<div class="bg-right-bottom bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-right-bottom bg-gray-400 bg-no-repeat m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (603, '.mr-3', 'classes/margins/mr-3', NULL, '2024-03-06 04:51:16', '2024-03-06 04:51:16', '.mr-3 { margin-right: 0.75rem; }', '<span class="mr-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (620, '.mt-0', 'classes/margins/mt-0', NULL, '2024-03-06 04:51:23', '2024-03-06 04:51:23', '.mt-0 { margin-top: 0; }', '<span class="mt-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (623, '.mt-3', 'classes/margins/mt-3', NULL, '2024-03-06 04:51:24', '2024-03-06 04:51:24', '.mt-3 { margin-top: 0.75rem; }', '<span class="mt-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (638, '.mt-auto', 'classes/margins/mt-auto', NULL, '2024-03-06 04:51:33', '2024-03-06 04:51:33', '.mt-auto { margin-top: auto; }', '<span class="mt-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (640, '.ml-0', 'classes/margins/ml-0', NULL, '2024-03-06 04:51:34', '2024-03-06 04:51:34', '.ml-0 { margin-left: 0; }', '<span class="ml-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (654, '.ml-40', 'classes/margins/ml-40', NULL, '2024-03-06 04:51:39', '2024-03-06 04:51:39', '.ml-40 { margin-left: 10rem; }', '<span class="ml-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (660, '.mx-0', 'classes/margins/mx-0', NULL, '2024-03-06 04:51:42', '2024-03-06 04:51:42', '.mx-0 { margin-right: 0; margin-left: 0; }', '<span class="mx-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (674, '.mx-40', 'classes/margins/mx-40', NULL, '2024-03-06 04:51:47', '2024-03-06 04:51:47', '.mx-40 { margin-right: 10rem; margin-left: 10rem; }', '<span class="mx-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (677, '.mx-64', 'classes/margins/mx-64', NULL, '2024-03-06 04:51:48', '2024-03-06 04:51:48', '.mx-64 { margin-right: 16rem; margin-left: 16rem; }', '<span class="mx-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (694, '.my-40', 'classes/margins/my-40', NULL, '2024-03-06 04:51:55', '2024-03-06 04:51:55', '.my-40 { margin-top: 10rem; margin-bottom: 10rem; }', '<span class="my-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (696, '.my-56', 'classes/margins/my-56', NULL, '2024-03-06 04:51:56', '2024-03-06 04:51:56', '.my-56 { margin-top: 14rem; margin-bottom: 14rem; }', '<span class="my-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (710, '.-m-20', 'classes/margins/-m-20', NULL, '2024-03-06 04:52:01', '2024-03-06 04:52:01', '.-m-20 { margin: -5rem; }', '<span class="-m-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (712, '.-m-32', 'classes/margins/-m-32', NULL, '2024-03-06 04:52:02', '2024-03-06 04:52:02', '.-m-32 { margin: -8rem; }', '<span class="-m-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (732, '.-mb-48', 'classes/margins/-mb-48', NULL, '2024-03-06 04:52:11', '2024-03-06 04:52:11', '.-mb-48 { margin-bottom: -12rem; }', '<span class="-mb-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (738, '.-mr-3', 'classes/margins/-mr-3', NULL, '2024-03-06 04:52:14', '2024-03-06 04:52:14', '.-mr-3 { margin-right: -0.75rem; }', '<span class="-mr-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (754, '.-mt-1', 'classes/margins/-mt-1', NULL, '2024-03-06 04:52:21', '2024-03-06 04:52:21', '.-mt-1 { margin-top: -0.25rem; }', '<span class="-mt-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (756, '.-mt-3', 'classes/margins/-mt-3', NULL, '2024-03-06 04:52:22', '2024-03-06 04:52:22', '.-mt-3 { margin-top: -0.75rem; }', '<span class="-mt-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (773, '.-ml-2', 'classes/margins/-ml-2', NULL, '2024-03-06 04:52:29', '2024-03-06 04:52:29', '.-ml-2 { margin-left: -0.5rem; }', '<span class="-ml-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (776, '.-ml-5', 'classes/margins/-ml-5', NULL, '2024-03-06 04:52:30', '2024-03-06 04:52:30', '.-ml-5 { margin-left: -1.25rem; }', '<span class="-ml-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (792, '.-mx-3', 'classes/margins/-mx-3', NULL, '2024-03-06 04:52:36', '2024-03-06 04:52:36', '.-mx-3 { margin-right: -0.75rem; margin-left: -0.75rem; }', '<span class="-mx-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (808, '.-my-1', 'classes/margins/-my-1', NULL, '2024-03-06 04:52:43', '2024-03-06 04:52:43', '.-my-1 { margin-top: -0.25rem; margin-bottom: -0.25rem; }', '<span class="-my-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (810, '.-my-3', 'classes/margins/-my-3', NULL, '2024-03-06 04:52:44', '2024-03-06 04:52:44', '.-my-3 { margin-top: -0.75rem; margin-bottom: -0.75rem; }', '<span class="-my-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (604, '.mr-4', 'classes/margins/mr-4', NULL, '2024-03-06 04:51:16', '2024-03-06 04:51:16', '.mr-4 { margin-right: 1rem; }', '<span class="mr-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (619, '.mr-px', 'classes/margins/mr-px', NULL, '2024-03-06 04:51:22', '2024-03-06 04:51:22', '.mr-px { margin-right: 1px; }', '<span class="mr-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (627, '.mt-8', 'classes/margins/mt-8', NULL, '2024-03-06 04:51:25', '2024-03-06 04:51:25', '.mt-8 { margin-top: 2rem; }', '<span class="mt-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (632, '.mt-24', 'classes/margins/mt-24', NULL, '2024-03-06 04:51:30', '2024-03-06 04:51:30', '.mt-24 { margin-top: 6rem; }', '<span class="mt-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (648, '.ml-10', 'classes/margins/ml-10', NULL, '2024-03-06 04:51:37', '2024-03-06 04:51:37', '.ml-10 { margin-left: 2.5rem; }', '<span class="ml-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (650, '.ml-16', 'classes/margins/ml-16', NULL, '2024-03-06 04:51:38', '2024-03-06 04:51:38', '.ml-16 { margin-left: 4rem; }', '<span class="ml-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (664, '.mx-4', 'classes/margins/mx-4', NULL, '2024-03-06 04:51:43', '2024-03-06 04:51:43', '.mx-4 { margin-right: 1rem; margin-left: 1rem; }', '<span class="mx-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (671, '.mx-20', 'classes/margins/mx-20', NULL, '2024-03-06 04:51:46', '2024-03-06 04:51:46', '.mx-20 { margin-right: 5rem; margin-left: 5rem; }', '<span class="mx-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (687, '.my-8', 'classes/margins/my-8', NULL, '2024-03-06 04:51:52', '2024-03-06 04:51:52', '.my-8 { margin-top: 2rem; margin-bottom: 2rem; }', '<span class="my-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (704, '.-m-5', 'classes/margins/-m-5', NULL, '2024-03-06 04:51:59', '2024-03-06 04:51:59', '.-m-5 { margin: -1.25rem; }', '<span class="-m-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (706, '.-m-8', 'classes/margins/-m-8', NULL, '2024-03-06 04:52:00', '2024-03-06 04:52:00', '.-m-8 { margin: -2rem; }', '<span class="-m-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (750, '.-mr-48', 'classes/margins/-mr-48', NULL, '2024-03-06 04:52:19', '2024-03-06 04:52:19', '.-mr-48 { margin-right: -12rem; }', '<span class="-mr-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (752, '.-mr-64', 'classes/margins/-mr-64', NULL, '2024-03-06 04:52:20', '2024-03-06 04:52:20', '.-mr-64 { margin-right: -16rem; }', '<span class="-mr-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (768, '.-mt-48', 'classes/margins/-mt-48', NULL, '2024-03-06 04:52:27', '2024-03-06 04:52:27', '.-mt-48 { margin-top: -12rem; }', '<span class="-mt-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (772, '.-ml-1', 'classes/margins/-ml-1', NULL, '2024-03-06 04:52:29', '2024-03-06 04:52:29', '.-ml-1 { margin-left: -0.25rem; }', '<span class="-ml-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (788, '.-ml-64', 'classes/margins/-ml-64', NULL, '2024-03-06 04:52:35', '2024-03-06 04:52:35', '.-ml-64 { margin-left: -16rem; }', '<span class="-ml-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (790, '.-mx-1', 'classes/margins/-mx-1', NULL, '2024-03-06 04:52:36', '2024-03-06 04:52:36', '.-mx-1 { margin-right: -0.25rem; margin-left: -0.25rem; }', '<span class="-mx-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (804, '.-mx-48', 'classes/margins/-mx-48', NULL, '2024-03-06 04:52:41', '2024-03-06 04:52:41', '.-mx-48 { margin-right: -12rem; margin-left: -12rem; }', '<span class="-mx-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (806, '.-mx-64', 'classes/margins/-mx-64', NULL, '2024-03-06 04:52:42', '2024-03-06 04:52:42', '.-mx-64 { margin-right: -16rem; margin-left: -16rem; }', '<span class="-mx-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (994, '.object-left', 'classes/positioning/object-left', NULL, '2024-03-06 04:53:55', '2024-03-07 17:51:08', '.object-left { object-position: left; }', '<img class="object-left object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-left object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (37, '.bg-auto', 'classes/background/bg-auto', NULL, '2024-03-05 19:02:26', '2024-03-09 18:03:46', '.bg-auto {
  background-size: auto;
}', '<div class="bg-auto h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>', '<div class="bg-auto h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (40, '.bg-bottom', 'classes/background/bg-bottom', NULL, '2024-03-05 19:02:27', '2024-03-09 18:03:46', '.bg-bottom {
  background-position: bottom;
}', '<div class="bg-bottom bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-bottom bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (605, '.mr-5', 'classes/margins/mr-5', NULL, '2024-03-06 04:51:17', '2024-03-06 04:51:17', '.mr-5 { margin-right: 1.25rem; }', '<span class="mr-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (608, '.mr-10', 'classes/margins/mr-10', NULL, '2024-03-06 04:51:18', '2024-03-06 04:51:18', '.mr-10 { margin-right: 2.5rem; }', '<span class="mr-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (625, '.mt-5', 'classes/margins/mt-5', NULL, '2024-03-06 04:51:25', '2024-03-06 04:51:25', '.mt-5 { margin-top: 1.25rem; }', '<span class="mt-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (629, '.mt-12', 'classes/margins/mt-12', NULL, '2024-03-06 04:51:26', '2024-03-06 04:51:26', '.mt-12 { margin-top: 3rem; }', '<span class="mt-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (644, '.ml-4', 'classes/margins/ml-4', NULL, '2024-03-06 04:51:35', '2024-03-06 04:51:35', '.ml-4 { margin-left: 1rem; }', '<span class="ml-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (646, '.ml-6', 'classes/margins/ml-6', NULL, '2024-03-06 04:51:36', '2024-03-06 04:51:36', '.ml-6 { margin-left: 1.5rem; }', '<span class="ml-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (662, '.mx-2', 'classes/margins/mx-2', NULL, '2024-03-06 04:51:43', '2024-03-06 04:51:43', '.mx-2 { margin-right: 0.5rem; margin-left: 0.5rem; }', '<span class="mx-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (667, '.mx-8', 'classes/margins/mx-8', NULL, '2024-03-06 04:51:45', '2024-03-06 04:51:45', '.mx-8 { margin-right: 2rem; margin-left: 2rem; }', '<span class="mx-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (682, '.my-2', 'classes/margins/my-2', NULL, '2024-03-06 04:51:50', '2024-03-06 04:51:50', '.my-2 { margin-top: 0.5rem; margin-bottom: 0.5rem; }', '<span class="my-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (699, '.my-px', 'classes/margins/my-px', NULL, '2024-03-06 04:51:57', '2024-03-06 04:51:57', '.my-px { margin-top: 1px; margin-bottom: 1px; }', '<span class="my-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (701, '.-m-2', 'classes/margins/-m-2', NULL, '2024-03-06 04:51:58', '2024-03-06 04:51:58', '.-m-2 { margin: -0.5rem; }', '<span class="-m-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (718, '.-mb-1', 'classes/margins/-mb-1', NULL, '2024-03-06 04:52:05', '2024-03-06 04:52:05', '.-mb-1 { margin-bottom: -0.25rem; }', '<span class="-mb-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (720, '.-mb-3', 'classes/margins/-mb-3', NULL, '2024-03-06 04:52:06', '2024-03-06 04:52:06', '.-mb-3 { margin-bottom: -0.75rem; }', '<span class="-mb-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (735, '.-mb-px', 'classes/margins/-mb-px', NULL, '2024-03-06 04:52:13', '2024-03-06 04:52:13', '.-mb-px { margin-bottom: -1px; }', '<span class="-mb-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (739, '.-mr-4', 'classes/margins/-mr-4', NULL, '2024-03-06 04:52:14', '2024-03-06 04:52:14', '.-mr-4 { margin-right: -1rem; }', '<span class="-mr-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (755, '.-mt-2', 'classes/margins/-mt-2', NULL, '2024-03-06 04:52:21', '2024-03-06 04:52:21', '.-mt-2 { margin-top: -0.5rem; }', '<span class="-mt-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (757, '.-mt-4', 'classes/margins/-mt-4', NULL, '2024-03-06 04:52:22', '2024-03-06 04:52:22', '.-mt-4 { margin-top: -1rem; }', '<span class="-mt-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (774, '.-ml-3', 'classes/margins/-ml-3', NULL, '2024-03-06 04:52:29', '2024-03-06 04:52:29', '.-ml-3 { margin-left: -0.75rem; }', '<span class="-ml-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (777, '.-ml-6', 'classes/margins/-ml-6', NULL, '2024-03-06 04:52:30', '2024-03-06 04:52:30', '.-ml-6 { margin-left: -1.5rem; }', '<span class="-ml-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (793, '.-mx-4', 'classes/margins/-mx-4', NULL, '2024-03-06 04:52:37', '2024-03-06 04:52:37', '.-mx-4 { margin-right: -1rem; margin-left: -1rem; }', '<span class="-mx-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (795, '.-mx-6', 'classes/margins/-mx-6', NULL, '2024-03-06 04:52:38', '2024-03-06 04:52:38', '.-mx-6 { margin-right: -1.5rem; margin-left: -1.5rem; }', '<span class="-mx-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (809, '.-my-2', 'classes/margins/-my-2', NULL, '2024-03-06 04:52:43', '2024-03-06 04:52:43', '.-my-2 { margin-top: -0.5rem; margin-bottom: -0.5rem; }', '<span class="-my-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (811, '.-my-4', 'classes/margins/-my-4', NULL, '2024-03-06 04:52:44', '2024-03-06 04:52:44', '.-my-4 { margin-top: -1rem; margin-bottom: -1rem; }', '<span class="-my-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (41, '.bg-top', 'classes/background/bg-top', NULL, '2024-03-05 19:02:27', '2024-03-09 18:03:46', '.bg-top {
  background-position: top;
}', '<div class="bg-top bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-top bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (606, '.mr-6', 'classes/margins/mr-6', NULL, '2024-03-06 04:51:17', '2024-03-06 04:51:17', '.mr-6 { margin-right: 1.5rem; }', '<span class="mr-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (609, '.mr-12', 'classes/margins/mr-12', NULL, '2024-03-06 04:51:18', '2024-03-06 04:51:18', '.mr-12 { margin-right: 3rem; }', '<span class="mr-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (622, '.mt-2', 'classes/margins/mt-2', NULL, '2024-03-06 04:51:24', '2024-03-06 04:51:24', '.mt-2 { margin-top: 0.5rem; }', '<span class="mt-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (628, '.mt-10', 'classes/margins/mt-10', NULL, '2024-03-06 04:51:26', '2024-03-06 04:51:26', '.mt-10 { margin-top: 2.5rem; }', '<span class="mt-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (643, '.ml-3', 'classes/margins/ml-3', NULL, '2024-03-06 04:51:35', '2024-03-06 04:51:35', '.ml-3 { margin-left: 0.75rem; }', '<span class="ml-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (645, '.ml-5', 'classes/margins/ml-5', NULL, '2024-03-06 04:51:36', '2024-03-06 04:51:36', '.ml-5 { margin-left: 1.25rem; }', '<span class="ml-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (659, '.ml-px', 'classes/margins/ml-px', NULL, '2024-03-06 04:51:41', '2024-03-06 04:51:41', '.ml-px { margin-left: 1px; }', '<span class="ml-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (666, '.mx-6', 'classes/margins/mx-6', NULL, '2024-03-06 04:51:44', '2024-03-06 04:51:44', '.mx-6 { margin-right: 1.5rem; margin-left: 1.5rem; }', '<span class="mx-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (679, '.mx-px', 'classes/margins/mx-px', NULL, '2024-03-06 04:51:49', '2024-03-06 04:51:49', '.mx-px { margin-right: 1px; margin-left: 1px; }', '<span class="mx-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (681, '.my-1', 'classes/margins/my-1', NULL, '2024-03-06 04:51:50', '2024-03-06 04:51:50', '.my-1 { margin-top: 0.25rem; margin-bottom: 0.25rem; }', '<span class="my-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (698, '.my-auto', 'classes/margins/my-auto', NULL, '2024-03-06 04:51:56', '2024-03-06 04:51:56', '.my-auto { margin-top: auto; margin-bottom: auto; }', '<span class="my-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (714, '.-m-48', 'classes/margins/-m-48', NULL, '2024-03-06 04:52:03', '2024-03-06 04:52:03', '.-m-48 { margin: -12rem; }', '<span class="-m-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (716, '.-m-64', 'classes/margins/-m-64', NULL, '2024-03-06 04:52:04', '2024-03-06 04:52:04', '.-m-64 { margin: -16rem; }', '<span class="-m-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (724, '.-mb-8', 'classes/margins/-mb-8', NULL, '2024-03-06 04:52:07', '2024-03-06 04:52:07', '.-mb-8 { margin-bottom: -2rem; }', '<span class="-mb-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (729, '.-mb-24', 'classes/margins/-mb-24', NULL, '2024-03-06 04:52:10', '2024-03-06 04:52:10', '.-mb-24 { margin-bottom: -6rem; }', '<span class="-mb-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (741, '.-mr-6', 'classes/margins/-mr-6', NULL, '2024-03-06 04:52:15', '2024-03-06 04:52:15', '.-mr-6 { margin-right: -1.5rem; }', '<span class="-mr-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (747, '.-mr-24', 'classes/margins/-mr-24', NULL, '2024-03-06 04:52:18', '2024-03-06 04:52:18', '.-mr-24 { margin-right: -6rem; }', '<span class="-mr-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (764, '.-mt-20', 'classes/margins/-mt-20', NULL, '2024-03-06 04:52:25', '2024-03-06 04:52:25', '.-mt-20 { margin-top: -5rem; }', '<span class="-mt-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (770, '.-mt-64', 'classes/margins/-mt-64', NULL, '2024-03-06 04:52:28', '2024-03-06 04:52:28', '.-mt-64 { margin-top: -16rem; }', '<span class="-mt-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (784, '.-ml-32', 'classes/margins/-ml-32', NULL, '2024-03-06 04:52:33', '2024-03-06 04:52:33', '.-ml-32 { margin-left: -8rem; }', '<span class="-ml-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (786, '.-ml-48', 'classes/margins/-ml-48', NULL, '2024-03-06 04:52:34', '2024-03-06 04:52:34', '.-ml-48 { margin-left: -12rem; }', '<span class="-ml-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (802, '.-mx-32', 'classes/margins/-mx-32', NULL, '2024-03-06 04:52:40', '2024-03-06 04:52:40', '.-mx-32 { margin-right: -8rem; margin-left: -8rem; }', '<span class="-mx-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (818, '.-my-20', 'classes/margins/-my-20', NULL, '2024-03-06 04:52:47', '2024-03-06 04:52:47', '.-my-20 { margin-top: -5rem; margin-bottom: -5rem; }', '<span class="-my-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (42, '.bg-center', 'classes/background/bg-center', NULL, '2024-03-05 19:02:28', '2024-03-09 18:03:46', '.bg-center {
  background-position: center;
}', '<div class="bg-center bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-center bg-gray-400 bg-no-repeat h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (607, '.mr-8', 'classes/margins/mr-8', NULL, '2024-03-06 04:51:17', '2024-03-06 04:51:17', '.mr-8 { margin-right: 2rem; }', '<span class="mr-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (612, '.mr-24', 'classes/margins/mr-24', NULL, '2024-03-06 04:51:20', '2024-03-06 04:51:20', '.mr-24 { margin-right: 6rem; }', '<span class="mr-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (626, '.mt-6', 'classes/margins/mt-6', NULL, '2024-03-06 04:51:25', '2024-03-06 04:51:25', '.mt-6 { margin-top: 1.5rem; }', '<span class="mt-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (631, '.mt-20', 'classes/margins/mt-20', NULL, '2024-03-06 04:51:30', '2024-03-06 04:51:30', '.mt-20 { margin-top: 5rem; }', '<span class="mt-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (647, '.ml-8', 'classes/margins/ml-8', NULL, '2024-03-06 04:51:36', '2024-03-06 04:51:36', '.ml-8 { margin-left: 2rem; }', '<span class="ml-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (663, '.mx-3', 'classes/margins/mx-3', NULL, '2024-03-06 04:51:43', '2024-03-06 04:51:43', '.mx-3 { margin-right: 0.75rem; margin-left: 0.75rem; }', '<span class="mx-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (670, '.mx-16', 'classes/margins/mx-16', NULL, '2024-03-06 04:51:46', '2024-03-06 04:51:46', '.mx-16 { margin-right: 4rem; margin-left: 4rem; }', '<span class="mx-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (684, '.my-4', 'classes/margins/my-4', NULL, '2024-03-06 04:51:51', '2024-03-06 04:51:51', '.my-4 { margin-top: 1rem; margin-bottom: 1rem; }', '<span class="my-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (686, '.my-6', 'classes/margins/my-6', NULL, '2024-03-06 04:51:52', '2024-03-06 04:51:52', '.my-6 { margin-top: 1.5rem; margin-bottom: 1.5rem; }', '<span class="my-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (703, '.-m-4', 'classes/margins/-m-4', NULL, '2024-03-06 04:51:58', '2024-03-06 04:51:58', '.-m-4 { margin: -1rem; }', '<span class="-m-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (719, '.-mb-2', 'classes/margins/-mb-2', NULL, '2024-03-06 04:52:05', '2024-03-06 04:52:05', '.-mb-2 { margin-bottom: -0.5rem; }', '<span class="-mb-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (721, '.-mb-4', 'classes/margins/-mb-4', NULL, '2024-03-06 04:52:06', '2024-03-06 04:52:06', '.-mb-4 { margin-bottom: -1rem; }', '<span class="-mb-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (736, '.-mr-1', 'classes/margins/-mr-1', NULL, '2024-03-06 04:52:13', '2024-03-06 04:52:13', '.-mr-1 { margin-right: -0.25rem; }', '<span class="-mr-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (742, '.-mr-8', 'classes/margins/-mr-8', NULL, '2024-03-06 04:52:16', '2024-03-06 04:52:16', '.-mr-8 { margin-right: -2rem; }', '<span class="-mr-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (758, '.-mt-5', 'classes/margins/-mt-5', NULL, '2024-03-06 04:52:23', '2024-03-06 04:52:23', '.-mt-5 { margin-top: -1.25rem; }', '<span class="-mt-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (761, '.-mt-10', 'classes/margins/-mt-10', NULL, '2024-03-06 04:52:24', '2024-03-06 04:52:24', '.-mt-10 { margin-top: -2.5rem; }', '<span class="-mt-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (778, '.-ml-8', 'classes/margins/-ml-8', NULL, '2024-03-06 04:52:31', '2024-03-06 04:52:31', '.-ml-8 { margin-left: -2rem; }', '<span class="-ml-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (780, '.-ml-12', 'classes/margins/-ml-12', NULL, '2024-03-06 04:52:32', '2024-03-06 04:52:32', '.-ml-12 { margin-left: -3rem; }', '<span class="-ml-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (794, '.-mx-5', 'classes/margins/-mx-5', NULL, '2024-03-06 04:52:37', '2024-03-06 04:52:37', '.-mx-5 { margin-right: -1.25rem; margin-left: -1.25rem; }', '<span class="-mx-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (796, '.-mx-8', 'classes/margins/-mx-8', NULL, '2024-03-06 04:52:38', '2024-03-06 04:52:38', '.-mx-8 { margin-right: -2rem; margin-left: -2rem; }', '<span class="-mx-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (812, '.-my-5', 'classes/margins/-my-5', NULL, '2024-03-06 04:52:45', '2024-03-06 04:52:45', '.-my-5 { margin-top: -1.25rem; margin-bottom: -1.25rem; }', '<span class="-my-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (38, '.bg-cover', 'classes/background/bg-cover', NULL, '2024-03-05 19:02:26', '2024-03-09 18:03:46', '.bg-cover {
  background-size: cover;
}', '<div class="bg-cover h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>', '<div class="bg-cover h-48 w-64" style="background-image: url(''/images/office.jpg'')"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (610, '.mr-16', 'classes/margins/mr-16', NULL, '2024-03-06 04:51:19', '2024-03-06 04:51:19', '.mr-16 { margin-right: 4rem; }', '<span class="mr-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (613, '.mr-32', 'classes/margins/mr-32', NULL, '2024-03-06 04:51:20', '2024-03-06 04:51:20', '.mr-32 { margin-right: 8rem; }', '<span class="mr-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (621, '.mt-1', 'classes/margins/mt-1', NULL, '2024-03-06 04:51:23', '2024-03-06 04:51:23', '.mt-1 { margin-top: 0.25rem; }', '<span class="mt-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (624, '.mt-4', 'classes/margins/mt-4', NULL, '2024-03-06 04:51:24', '2024-03-06 04:51:24', '.mt-4 { margin-top: 1rem; }', '<span class="mt-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (642, '.ml-2', 'classes/margins/ml-2', NULL, '2024-03-06 04:51:34', '2024-03-06 04:51:34', '.ml-2 { margin-left: 0.5rem; }', '<span class="ml-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (658, '.ml-auto', 'classes/margins/ml-auto', NULL, '2024-03-06 04:51:41', '2024-03-06 04:51:41', '.ml-auto { margin-left: auto; }', '<span class="ml-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (665, '.mx-5', 'classes/margins/mx-5', NULL, '2024-03-06 04:51:44', '2024-03-06 04:51:44', '.mx-5 { margin-right: 1.25rem; margin-left: 1.25rem; }', '<span class="mx-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (683, '.my-3', 'classes/margins/my-3', NULL, '2024-03-06 04:51:51', '2024-03-06 04:51:51', '.my-3 { margin-top: 0.75rem; margin-bottom: 0.75rem; }', '<span class="my-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (685, '.my-5', 'classes/margins/my-5', NULL, '2024-03-06 04:51:52', '2024-03-06 04:51:52', '.my-5 { margin-top: 1.25rem; margin-bottom: 1.25rem; }', '<span class="my-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (700, '.-m-1', 'classes/margins/-m-1', NULL, '2024-03-06 04:51:57', '2024-03-06 04:51:57', '.-m-1 { margin: -0.25rem; }', '<span class="-m-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (702, '.-m-3', 'classes/margins/-m-3', NULL, '2024-03-06 04:51:58', '2024-03-06 04:51:58', '.-m-3 { margin: -0.75rem; }', '<span class="-m-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (717, '.-m-px', 'classes/margins/-m-px', NULL, '2024-03-06 04:52:04', '2024-03-06 04:52:04', '.-m-px { margin: -1px; }', '<span class="-m-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (740, '.-mr-5', 'classes/margins/-mr-5', NULL, '2024-03-06 04:52:15', '2024-03-06 04:52:15', '.-mr-5 { margin-right: -1.25rem; }', '<span class="-mr-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (744, '.-mr-12', 'classes/margins/-mr-12', NULL, '2024-03-06 04:52:16', '2024-03-06 04:52:16', '.-mr-12 { margin-right: -3rem; }', '<span class="-mr-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (760, '.-mt-8', 'classes/margins/-mt-8', NULL, '2024-03-06 04:52:23', '2024-03-06 04:52:23', '.-mt-8 { margin-top: -2rem; }', '<span class="-mt-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (766, '.-mt-32', 'classes/margins/-mt-32', NULL, '2024-03-06 04:52:26', '2024-03-06 04:52:26', '.-mt-32 { margin-top: -8rem; }', '<span class="-mt-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (782, '.-ml-20', 'classes/margins/-ml-20', NULL, '2024-03-06 04:52:32', '2024-03-06 04:52:32', '.-ml-20 { margin-left: -5rem; }', '<span class="-ml-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (798, '.-mx-12', 'classes/margins/-mx-12', NULL, '2024-03-06 04:52:39', '2024-03-06 04:52:39', '.-mx-12 { margin-right: -3rem; margin-left: -3rem; }', '<span class="-mx-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (800, '.-mx-20', 'classes/margins/-mx-20', NULL, '2024-03-06 04:52:40', '2024-03-06 04:52:40', '.-mx-20 { margin-right: -5rem; margin-left: -5rem; }', '<span class="-mx-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (814, '.-my-8', 'classes/margins/-my-8', NULL, '2024-03-06 04:52:45', '2024-03-06 04:52:45', '.-my-8 { margin-top: -2rem; margin-bottom: -2rem; }', '<span class="-my-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (816, '.-my-12', 'classes/margins/-my-12', NULL, '2024-03-06 04:52:46', '2024-03-06 04:52:46', '.-my-12 { margin-top: -3rem; margin-bottom: -3rem; }', '<span class="-my-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (615, '.mr-48', 'classes/margins/mr-48', NULL, '2024-03-06 04:51:21', '2024-03-06 04:51:21', '.mr-48 { margin-right: 12rem; }', '<span class="mr-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (617, '.mr-64', 'classes/margins/mr-64', NULL, '2024-03-06 04:51:22', '2024-03-06 04:51:22', '.mr-64 { margin-right: 16rem; }', '<span class="mr-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (634, '.mt-40', 'classes/margins/mt-40', NULL, '2024-03-06 04:51:31', '2024-03-06 04:51:31', '.mt-40 { margin-top: 10rem; }', '<span class="mt-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (635, '.mt-48', 'classes/margins/mt-48', NULL, '2024-03-06 04:51:31', '2024-03-06 04:51:31', '.mt-48 { margin-top: 12rem; }', '<span class="mt-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (636, '.mt-56', 'classes/margins/mt-56', NULL, '2024-03-06 04:51:32', '2024-03-06 04:51:32', '.mt-56 { margin-top: 14rem; }', '<span class="mt-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (637, '.mt-64', 'classes/margins/mt-64', NULL, '2024-03-06 04:51:32', '2024-03-06 04:51:32', '.mt-64 { margin-top: 16rem; }', '<span class="mt-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mt-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (652, '.ml-24', 'classes/margins/ml-24', NULL, '2024-03-06 04:51:39', '2024-03-06 04:51:39', '.ml-24 { margin-left: 6rem; }', '<span class="ml-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (653, '.ml-32', 'classes/margins/ml-32', NULL, '2024-03-06 04:51:39', '2024-03-06 04:51:39', '.ml-32 { margin-left: 8rem; }', '<span class="ml-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (655, '.ml-48', 'classes/margins/ml-48', NULL, '2024-03-06 04:51:40', '2024-03-06 04:51:40', '.ml-48 { margin-left: 12rem; }', '<span class="ml-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (656, '.ml-56', 'classes/margins/ml-56', NULL, '2024-03-06 04:51:40', '2024-03-06 04:51:40', '.ml-56 { margin-left: 14rem; }', '<span class="ml-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="ml-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (669, '.mx-12', 'classes/margins/mx-12', NULL, '2024-03-06 04:51:45', '2024-03-06 04:51:45', '.mx-12 { margin-right: 3rem; margin-left: 3rem; }', '<span class="mx-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (673, '.mx-32', 'classes/margins/mx-32', NULL, '2024-03-06 04:51:47', '2024-03-06 04:51:47', '.mx-32 { margin-right: 8rem; margin-left: 8rem; }', '<span class="mx-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (675, '.mx-48', 'classes/margins/mx-48', NULL, '2024-03-06 04:51:48', '2024-03-06 04:51:48', '.mx-48 { margin-right: 12rem; margin-left: 12rem; }', '<span class="mx-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (676, '.mx-56', 'classes/margins/mx-56', NULL, '2024-03-06 04:51:48', '2024-03-06 04:51:48', '.mx-56 { margin-right: 14rem; margin-left: 14rem; }', '<span class="mx-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mx-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (689, '.my-12', 'classes/margins/my-12', NULL, '2024-03-06 04:51:53', '2024-03-06 04:51:53', '.my-12 { margin-top: 3rem; margin-bottom: 3rem; }', '<span class="my-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (690, '.my-16', 'classes/margins/my-16', NULL, '2024-03-06 04:51:53', '2024-03-06 04:51:53', '.my-16 { margin-top: 4rem; margin-bottom: 4rem; }', '<span class="my-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (692, '.my-24', 'classes/margins/my-24', NULL, '2024-03-06 04:51:54', '2024-03-06 04:51:54', '.my-24 { margin-top: 6rem; margin-bottom: 6rem; }', '<span class="my-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (693, '.my-32', 'classes/margins/my-32', NULL, '2024-03-06 04:51:54', '2024-03-06 04:51:54', '.my-32 { margin-top: 8rem; margin-bottom: 8rem; }', '<span class="my-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="my-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (708, '.-m-12', 'classes/margins/-m-12', NULL, '2024-03-06 04:52:00', '2024-03-06 04:52:00', '.-m-12 { margin: -3rem; }', '<span class="-m-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (709, '.-m-16', 'classes/margins/-m-16', NULL, '2024-03-06 04:52:01', '2024-03-06 04:52:01', '.-m-16 { margin: -4rem; }', '<span class="-m-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (711, '.-m-24', 'classes/margins/-m-24', NULL, '2024-03-06 04:52:02', '2024-03-06 04:52:02', '.-m-24 { margin: -6rem; }', '<span class="-m-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-m-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (722, '.-mb-5', 'classes/margins/-mb-5', NULL, '2024-03-06 04:52:07', '2024-03-06 04:52:07', '.-mb-5 { margin-bottom: -1.25rem; }', '<span class="-mb-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (725, '.-mb-10', 'classes/margins/-mb-10', NULL, '2024-03-06 04:52:08', '2024-03-06 04:52:08', '.-mb-10 { margin-bottom: -2.5rem; }', '<span class="-mb-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (727, '.-mb-16', 'classes/margins/-mb-16', NULL, '2024-03-06 04:52:09', '2024-03-06 04:52:09', '.-mb-16 { margin-bottom: -4rem; }', '<span class="-mb-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (730, '.-mb-32', 'classes/margins/-mb-32', NULL, '2024-03-06 04:52:10', '2024-03-06 04:52:10', '.-mb-32 { margin-bottom: -8rem; }', '<span class="-mb-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (731, '.-mb-40', 'classes/margins/-mb-40', NULL, '2024-03-06 04:52:11', '2024-03-06 04:52:11', '.-mb-40 { margin-bottom: -10rem; }', '<span class="-mb-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (734, '.-mb-64', 'classes/margins/-mb-64', NULL, '2024-03-06 04:52:12', '2024-03-06 04:52:12', '.-mb-64 { margin-bottom: -16rem; }', '<span class="-mb-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mb-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (745, '.-mr-16', 'classes/margins/-mr-16', NULL, '2024-03-06 04:52:17', '2024-03-06 04:52:17', '.-mr-16 { margin-right: -4rem; }', '<span class="-mr-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (748, '.-mr-32', 'classes/margins/-mr-32', NULL, '2024-03-06 04:52:18', '2024-03-06 04:52:18', '.-mr-32 { margin-right: -8rem; }', '<span class="-mr-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (751, '.-mr-56', 'classes/margins/-mr-56', NULL, '2024-03-06 04:52:19', '2024-03-06 04:52:19', '.-mr-56 { margin-right: -14rem; }', '<span class="-mr-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (753, '.-mr-px', 'classes/margins/-mr-px', NULL, '2024-03-06 04:52:20', '2024-03-06 04:52:20', '.-mr-px { margin-right: -1px; }', '<span class="-mr-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mr-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (769, '.-mt-56', 'classes/margins/-mt-56', NULL, '2024-03-06 04:52:27', '2024-03-06 04:52:27', '.-mt-56 { margin-top: -14rem; }', '<span class="-mt-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (775, '.-ml-4', 'classes/margins/-ml-4', NULL, '2024-03-06 04:52:30', '2024-03-06 04:52:30', '.-ml-4 { margin-left: -1rem; }', '<span class="-ml-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (789, '.-ml-px', 'classes/margins/-ml-px', NULL, '2024-03-06 04:52:35', '2024-03-06 04:52:35', '.-ml-px { margin-left: -1px; }', '<span class="-ml-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (791, '.-mx-2', 'classes/margins/-mx-2', NULL, '2024-03-06 04:52:36', '2024-03-06 04:52:36', '.-mx-2 { margin-right: -0.5rem; margin-left: -0.5rem; }', '<span class="-mx-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (807, '.-mx-px', 'classes/margins/-mx-px', NULL, '2024-03-06 04:52:42', '2024-03-06 04:52:42', '.-mx-px { margin-right: -1px; margin-left: -1px; }', '<span class="-mx-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (986, '.float-*', 'classes/positioning/float-*', NULL, '2024-03-06 04:53:53', '2024-03-09 18:03:46', '.float-left { float: left; }
.float-right { float: right; }
.float-none { float: none; }', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <img class="float-right mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <img class="float-none mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <img class="float-right mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <img class="float-none mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (763, '.-mt-16', 'classes/margins/-mt-16', NULL, '2024-03-06 04:52:25', '2024-03-06 04:52:25', '.-mt-16 { margin-top: -4rem; }', '<span class="-mt-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (767, '.-mt-40', 'classes/margins/-mt-40', NULL, '2024-03-06 04:52:26', '2024-03-06 04:52:26', '.-mt-40 { margin-top: -10rem; }', '<span class="-mt-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mt-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (783, '.-ml-24', 'classes/margins/-ml-24', NULL, '2024-03-06 04:52:33', '2024-03-06 04:52:33', '.-ml-24 { margin-left: -6rem; }', '<span class="-ml-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (785, '.-ml-40', 'classes/margins/-ml-40', NULL, '2024-03-06 04:52:34', '2024-03-06 04:52:34', '.-ml-40 { margin-left: -10rem; }', '<span class="-ml-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-ml-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (799, '.-mx-16', 'classes/margins/-mx-16', NULL, '2024-03-06 04:52:39', '2024-03-06 04:52:39', '.-mx-16 { margin-right: -4rem; margin-left: -4rem; }', '<span class="-mx-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (801, '.-mx-24', 'classes/margins/-mx-24', NULL, '2024-03-06 04:52:40', '2024-03-06 04:52:40', '.-mx-24 { margin-right: -6rem; margin-left: -6rem; }', '<span class="-mx-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-mx-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (817, '.-my-16', 'classes/margins/-my-16', NULL, '2024-03-06 04:52:46', '2024-03-06 04:52:46', '.-my-16 { margin-top: -4rem; margin-bottom: -4rem; }', '<span class="-my-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (820, '.-my-32', 'classes/margins/-my-32', NULL, '2024-03-06 04:52:48', '2024-03-06 04:52:48', '.-my-32 { margin-top: -8rem; margin-bottom: -8rem; }', '<span class="-my-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (821, '.-my-40', 'classes/margins/-my-40', NULL, '2024-03-06 04:52:48', '2024-03-06 04:52:48', '.-my-40 { margin-top: -10rem; margin-bottom: -10rem; }', '<span class="-my-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (822, '.-my-48', 'classes/margins/-my-48', NULL, '2024-03-06 04:52:48', '2024-03-06 04:52:48', '.-my-48 { margin-top: -12rem; margin-bottom: -12rem; }', '<span class="-my-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (823, '.-my-56', 'classes/margins/-my-56', NULL, '2024-03-06 04:52:49', '2024-03-06 04:52:49', '.-my-56 { margin-top: -14rem; margin-bottom: -14rem; }', '<span class="-my-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (824, '.-my-64', 'classes/margins/-my-64', NULL, '2024-03-06 04:52:49', '2024-03-06 04:52:49', '.-my-64 { margin-top: -16rem; margin-bottom: -16rem; }', '<span class="-my-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (825, '.-my-px', 'classes/margins/-my-px', NULL, '2024-03-06 04:52:50', '2024-03-06 04:52:50', '.-my-px { margin-top: -1px; margin-bottom: -1px; }', '<span class="-my-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="-my-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (826, '.mt-11', 'classes/margins/mt-11', NULL, '2024-03-06 04:52:50', '2024-03-06 04:52:50', NULL, '    <div class="h-6 bg-gray-400"></div>
    <div class="mt-11 h-6 bg-teal-400"></div>', '<div>
  <div class="h-6 bg-gray-400">
  </div>
  <div class="mt-11 h-6 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (827, '.mb-11', 'classes/margins/mb-11', NULL, '2024-03-06 04:52:50', '2024-03-06 04:52:50', NULL, '    <div class="max-w-md">
        <div class="mb-11 h-4 bg-teal-400"></div>
        <div class="h-4 bg-purple-400"></div>
    </div>', '<div>
  <div class="max-w-md">
    <div class="mb-11 h-4 bg-teal-400">
    </div>
    <div class="h-4 bg-purple-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (828, '.ml-11', 'classes/margins/ml-11', NULL, '2024-03-06 04:52:51', '2024-03-06 04:52:51', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-64">
        <div class="ml-11 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-64">
    <div class="ml-11 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (829, '.mr-11', 'classes/margins/mr-11', NULL, '2024-03-06 04:52:51', '2024-03-06 04:52:51', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-64">
        <div class="mr-11 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-64">
    <div class="mr-11 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (830, '.mt-11', 'classes/margins/mt-11', NULL, '2024-03-06 04:52:52', '2024-03-06 04:52:52', NULL, '    <div class="h-6 bg-gray-400"></div>
    <div class="mt-11 h-6 bg-teal-400"></div>', '<div>
  <div class="h-6 bg-gray-400">
  </div>
  <div class="mt-11 h-6 bg-teal-400">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (831, '.mx-11', 'classes/margins/mx-11', NULL, '2024-03-06 04:52:52', '2024-03-06 04:52:52', NULL, '    <div class="inline-block w-10 h-6 bg-gray-400 text-sm"></div>
    <div class="inline-block mx-11 w-10 h-6 bg-teal-400 text-sm"></div>
    <div class="inline-block w-10 h-6 bg-gray-400 text-sm"></div>', '<div>
  <div class="inline-block w-10 h-6 bg-gray-400 text-sm">
  </div>
  <div class="inline-block mx-11 w-10 h-6 bg-teal-400 text-sm">
  </div>
  <div class="inline-block w-10 h-6 bg-gray-400 text-sm">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (832, '.my-11', 'classes/margins/my-11', NULL, '2024-03-06 04:52:53', '2024-03-06 04:52:53', NULL, '    <div class="h-6 bg-gray-400 text-sm"></div>
    <div class="my-11 h-6 bg-teal-400 text-sm"></div>
    <div class="h-6 bg-gray-400 text-sm"></div>', '<div>
  <div class="h-6 bg-gray-400 text-sm">
  </div>
  <div class="my-11 h-6 bg-teal-400 text-sm">
  </div>
  <div class="h-6 bg-gray-400 text-sm">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (833, '.lining-nums', 'classes/nums/lining-nums', NULL, '2024-03-06 04:52:53', '2024-03-06 04:52:53', NULL, '    <p class="lining-nums">1234567890</p>', '<div>
  <p class="lining-nums">
    1234567890
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (834, '.normal-nums', 'classes/nums/normal-nums', NULL, '2024-03-06 04:52:53', '2024-03-06 04:52:53', NULL, '    <p class="normal-nums">123456789</p>', '<div>
  <p class="normal-nums">
    123456789
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (835, '.oldstyle-nums', 'classes/nums/oldstyle-nums', NULL, '2024-03-06 04:52:53', '2024-03-06 04:52:53', NULL, '    <p class="oldstyle-nums">123456789</p>', '<div>
  <p class="oldstyle-nums">
    123456789
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (836, '.stacked-fractions', 'classes/nums/stacked-fractions', NULL, '2024-03-06 04:52:54', '2024-03-06 04:52:54', NULL, '    <p class="text-2xl stacked-fractions">1/2 2/3 3/4</p>', '<div>
  <p class="text-2xl stacked-fractions">
    1/2 2/3 3/4
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (837, '.opacity-10', 'classes/opacity/opacity-10', NULL, '2024-03-06 04:52:54', '2024-03-06 04:52:54', NULL, '    <p class="opacity-10 bg-teal-400 m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="opacity-10 bg-teal-400 m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (838, '.outline-black', 'classes/outline/outline-black', NULL, '2024-03-06 04:52:55', '2024-03-06 04:52:55', NULL, '    <button class="p-2 outline-black">Click here</button>', '<div>
  <button class="p-2 outline-black">
    Click here
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (839, '.outline-white', 'classes/outline/outline-white', NULL, '2024-03-06 04:52:55', '2024-03-06 04:52:55', NULL, '    <div class="bg-gray-300 p-4">
        <button class="p-2 outline-white">Click here</button>
    </div>', '<div>
  <div class="bg-gray-300 p-4">
    <button class="p-2 outline-white">
      Click here
    </button>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (840, '.p-0', 'classes/paddings/p-0', NULL, '2024-03-06 04:52:55', '2024-03-06 04:52:55', '.p-0 { padding: 0; }', '<span class="p-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (842, '.p-2', 'classes/paddings/p-2', NULL, '2024-03-06 04:52:56', '2024-03-06 04:52:56', '.p-2 { padding: 0.5rem; }', '<span class="p-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (857, '.p-64', 'classes/paddings/p-64', NULL, '2024-03-06 04:53:03', '2024-03-06 04:53:03', '.p-64 { padding: 16rem; }', '<span class="p-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (861, '.pb-2', 'classes/paddings/pb-2', NULL, '2024-03-06 04:53:04', '2024-03-06 04:53:04', '.pb-2 { padding-bottom: 0.5rem; }', '<span class="pb-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (874, '.pb-48', 'classes/paddings/pb-48', NULL, '2024-03-06 04:53:09', '2024-03-06 04:53:09', '.pb-48 { padding-bottom: 12rem; }', '<span class="pb-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (881, '.pr-3', 'classes/paddings/pr-3', NULL, '2024-03-06 04:53:12', '2024-03-06 04:53:12', '.pr-3 { padding-right: 0.75rem; }', '<span class="pr-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (895, '.pr-64', 'classes/paddings/pr-64', NULL, '2024-03-06 04:53:17', '2024-03-06 04:53:17', '.pr-64 { padding-right: 16rem; }', '<span class="pr-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (901, '.pt-4', 'classes/paddings/pt-4', NULL, '2024-03-06 04:53:20', '2024-03-06 04:53:20', '.pt-4 { padding-top: 1rem; }', '<span class="pt-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (913, '.pt-56', 'classes/paddings/pt-56', NULL, '2024-03-06 04:53:25', '2024-03-06 04:53:25', '.pt-56 { padding-top: 14rem; }', '<span class="pt-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (921, '.pl-5', 'classes/paddings/pl-5', NULL, '2024-03-06 04:53:28', '2024-03-06 04:53:28', '.pl-5 { padding-left: 1.25rem; }', '<span class="pl-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (934, '.pl-px', 'classes/paddings/pl-px', NULL, '2024-03-06 04:53:33', '2024-03-06 04:53:33', '.pl-px { padding-left: 1px; }', '<span class="pl-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (942, '.px-8', 'classes/paddings/px-8', NULL, '2024-03-06 04:53:36', '2024-03-06 04:53:36', '.px-8 { padding-right: 2rem; padding-left: 2rem; }', '<span class="px-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (950, '.px-48', 'classes/paddings/px-48', NULL, '2024-03-06 04:53:39', '2024-03-06 04:53:39', '.px-48 { padding-right: 12rem; padding-left: 12rem; }', '<span class="px-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (962, '.py-10', 'classes/paddings/py-10', NULL, '2024-03-06 04:53:44', '2024-03-06 04:53:44', '.py-10 { padding-top: 2.5rem; padding-bottom: 2.5rem; }', '<span class="py-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (970, '.py-56', 'classes/paddings/py-56', NULL, '2024-03-06 04:53:47', '2024-03-06 04:53:47', '.py-56 { padding-top: 14rem; padding-bottom: 14rem; }', '<span class="py-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1000, '.object-top', 'classes/positioning/object-top', NULL, '2024-03-06 04:53:58', '2024-03-07 17:51:08', '.object-top { object-position: top; }', '<img class="object-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (841, '.p-1', 'classes/paddings/p-1', NULL, '2024-03-06 04:52:56', '2024-03-06 04:52:56', '.p-1 { padding: 0.25rem; }', '<span class="p-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (855, '.p-48', 'classes/paddings/p-48', NULL, '2024-03-06 04:53:01', '2024-03-06 04:53:01', '.p-48 { padding: 12rem; }', '<span class="p-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (860, '.pb-1', 'classes/paddings/pb-1', NULL, '2024-03-06 04:53:04', '2024-03-06 04:53:04', '.pb-1 { padding-bottom: 0.25rem; }', '<span class="pb-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (873, '.pb-40', 'classes/paddings/pb-40', NULL, '2024-03-06 04:53:09', '2024-03-06 04:53:09', '.pb-40 { padding-bottom: 10rem; }', '<span class="pb-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (880, '.pr-2', 'classes/paddings/pr-2', NULL, '2024-03-06 04:53:12', '2024-03-06 04:53:12', '.pr-2 { padding-right: 0.5rem; }', '<span class="pr-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (894, '.pr-56', 'classes/paddings/pr-56', NULL, '2024-03-06 04:53:17', '2024-03-06 04:53:17', '.pr-56 { padding-right: 14rem; }', '<span class="pr-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (897, '.pt-0', 'classes/paddings/pt-0', NULL, '2024-03-06 04:53:18', '2024-03-06 04:53:18', '.pt-0 { padding-top: 0; }', '<span class="pt-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (910, '.pt-32', 'classes/paddings/pt-32', NULL, '2024-03-06 04:53:24', '2024-03-06 04:53:24', '.pt-32 { padding-top: 8rem; }', '<span class="pt-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (920, '.pl-4', 'classes/paddings/pl-4', NULL, '2024-03-06 04:53:28', '2024-03-06 04:53:28', '.pl-4 { padding-left: 1rem; }', '<span class="pl-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (933, '.pl-64', 'classes/paddings/pl-64', NULL, '2024-03-06 04:53:33', '2024-03-06 04:53:33', '.pl-64 { padding-left: 16rem; }', '<span class="pl-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (941, '.px-6', 'classes/paddings/px-6', NULL, '2024-03-06 04:53:36', '2024-03-06 04:53:36', '.px-6 { padding-right: 1.5rem; padding-left: 1.5rem; }', '<span class="px-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (951, '.px-56', 'classes/paddings/px-56', NULL, '2024-03-06 04:53:39', '2024-03-06 04:53:39', '.px-56 { padding-right: 14rem; padding-left: 14rem; }', '<span class="px-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (963, '.py-12', 'classes/paddings/py-12', NULL, '2024-03-06 04:53:44', '2024-03-06 04:53:44', '.py-12 { padding-top: 3rem; padding-bottom: 3rem; }', '<span class="py-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (971, '.py-64', 'classes/paddings/py-64', NULL, '2024-03-06 04:53:47', '2024-03-06 04:53:47', '.py-64 { padding-top: 16rem; padding-bottom: 16rem; }', '<span class="py-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (998, '.object-right-bottom', 'classes/positioning/object-right-bottom', NULL, '2024-03-06 04:53:57', '2024-03-07 17:51:08', '.object-right-bottom { object-position: right bottom; }', '<img class="object-right-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-right-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (843, '.p-3', 'classes/paddings/p-3', NULL, '2024-03-06 04:52:56', '2024-03-06 04:52:56', '.p-3 { padding: 0.75rem; }', '<span class="p-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (858, '.p-px', 'classes/paddings/p-px', NULL, '2024-03-06 04:53:03', '2024-03-06 04:53:03', '.p-px { padding: 1px; }', '<span class="p-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (865, '.pb-6', 'classes/paddings/pb-6', NULL, '2024-03-06 04:53:06', '2024-03-06 04:53:06', '.pb-6 { padding-bottom: 1.5rem; }', '<span class="pb-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (878, '.pr-0', 'classes/paddings/pr-0', NULL, '2024-03-06 04:53:11', '2024-03-06 04:53:11', '.pr-0 { padding-right: 0; }', '<span class="pr-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (882, '.pr-4', 'classes/paddings/pr-4', NULL, '2024-03-06 04:53:12', '2024-03-06 04:53:12', '.pr-4 { padding-right: 1rem; }', '<span class="pr-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (898, '.pt-1', 'classes/paddings/pt-1', NULL, '2024-03-06 04:53:19', '2024-03-06 04:53:19', '.pt-1 { padding-top: 0.25rem; }', '<span class="pt-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (902, '.pt-5', 'classes/paddings/pt-5', NULL, '2024-03-06 04:53:20', '2024-03-06 04:53:20', '.pt-5 { padding-top: 1.25rem; }', '<span class="pt-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (914, '.pt-64', 'classes/paddings/pt-64', NULL, '2024-03-06 04:53:25', '2024-03-06 04:53:25', '.pt-64 { padding-top: 16rem; }', '<span class="pt-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (922, '.pl-6', 'classes/paddings/pl-6', NULL, '2024-03-06 04:53:29', '2024-03-06 04:53:29', '.pl-6 { padding-left: 1.5rem; }', '<span class="pl-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (935, '.px-0', 'classes/paddings/px-0', NULL, '2024-03-06 04:53:33', '2024-03-06 04:53:33', '.px-0 { padding-right: 0; padding-left: 0; }', '<span class="px-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (946, '.px-20', 'classes/paddings/px-20', NULL, '2024-03-06 04:53:38', '2024-03-06 04:53:38', '.px-20 { padding-right: 5rem; padding-left: 5rem; }', '<span class="px-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (954, '.py-0', 'classes/paddings/py-0', NULL, '2024-03-06 04:53:41', '2024-03-06 04:53:41', '.py-0 { padding-top: 0; padding-bottom: 0; }', '<span class="py-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (968, '.py-40', 'classes/paddings/py-40', NULL, '2024-03-06 04:53:46', '2024-03-06 04:53:46', '.py-40 { padding-top: 10rem; padding-bottom: 10rem; }', '<span class="py-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (53, '.bg-repeat', 'classes/background/bg-repeat', NULL, '2024-03-05 19:02:32', '2024-03-09 18:03:46', '.bg-repeat { background-repeat: repeat; }', '<div class="bg-repeat bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>', '<div class="bg-repeat bg-gray-400 m-2 h-48 w-64" style="background-image: url(''/images/office.jpg''); background-size: 12rem 8rem"></div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (844, '.p-4', 'classes/paddings/p-4', NULL, '2024-03-06 04:52:57', '2024-03-06 04:52:57', '.p-4 { padding: 1rem; }', '<span class="p-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (846, '.p-6', 'classes/paddings/p-6', NULL, '2024-03-06 04:52:58', '2024-03-06 04:52:58', '.p-6 { padding: 1.5rem; }', '<span class="p-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (859, '.pb-0', 'classes/paddings/pb-0', NULL, '2024-03-06 04:53:03', '2024-03-06 04:53:03', '.pb-0 { padding-bottom: 0; }', '<span class="pb-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (866, '.pb-8', 'classes/paddings/pb-8', NULL, '2024-03-06 04:53:06', '2024-03-06 04:53:06', '.pb-8 { padding-bottom: 2rem; }', '<span class="pb-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (879, '.pr-1', 'classes/paddings/pr-1', NULL, '2024-03-06 04:53:11', '2024-03-06 04:53:11', '.pr-1 { padding-right: 0.25rem; }', '<span class="pr-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (883, '.pr-5', 'classes/paddings/pr-5', NULL, '2024-03-06 04:53:12', '2024-03-06 04:53:12', '.pr-5 { padding-right: 1.25rem; }', '<span class="pr-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (899, '.pt-2', 'classes/paddings/pt-2', NULL, '2024-03-06 04:53:19', '2024-03-06 04:53:19', '.pt-2 { padding-top: 0.5rem; }', '<span class="pt-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (906, '.pt-12', 'classes/paddings/pt-12', NULL, '2024-03-06 04:53:22', '2024-03-06 04:53:22', '.pt-12 { padding-top: 3rem; }', '<span class="pt-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (918, '.pl-2', 'classes/paddings/pl-2', NULL, '2024-03-06 04:53:27', '2024-03-06 04:53:27', '.pl-2 { padding-left: 0.5rem; }', '<span class="pl-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (925, '.pl-12', 'classes/paddings/pl-12', NULL, '2024-03-06 04:53:30', '2024-03-06 04:53:30', '.pl-12 { padding-left: 3rem; }', '<span class="pl-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (938, '.px-3', 'classes/paddings/px-3', NULL, '2024-03-06 04:53:35', '2024-03-06 04:53:35', '.px-3 { padding-right: 0.75rem; padding-left: 0.75rem; }', '<span class="px-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (947, '.px-24', 'classes/paddings/px-24', NULL, '2024-03-06 04:53:38', '2024-03-06 04:53:38', '.px-24 { padding-right: 6rem; padding-left: 6rem; }', '<span class="px-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (955, '.py-1', 'classes/paddings/py-1', NULL, '2024-03-06 04:53:41', '2024-03-06 04:53:41', '.py-1 { padding-top: 0.25rem; padding-bottom: 0.25rem; }', '<span class="py-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (967, '.py-32', 'classes/paddings/py-32', NULL, '2024-03-06 04:53:46', '2024-03-06 04:53:46', '.py-32 { padding-top: 8rem; padding-bottom: 8rem; }', '<span class="py-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (845, '.p-5', 'classes/paddings/p-5', NULL, '2024-03-06 04:52:57', '2024-03-06 04:52:57', '.p-5 { padding: 1.25rem; }', '<span class="p-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (847, '.p-8', 'classes/paddings/p-8', NULL, '2024-03-06 04:52:58', '2024-03-06 04:52:58', '.p-8 { padding: 2rem; }', '<span class="p-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (862, '.pb-3', 'classes/paddings/pb-3', NULL, '2024-03-06 04:53:05', '2024-03-06 04:53:05', '.pb-3 { padding-bottom: 0.75rem; }', '<span class="pb-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (870, '.pb-20', 'classes/paddings/pb-20', NULL, '2024-03-06 04:53:08', '2024-03-06 04:53:08', '.pb-20 { padding-bottom: 5rem; }', '<span class="pb-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (884, '.pr-6', 'classes/paddings/pr-6', NULL, '2024-03-06 04:53:13', '2024-03-06 04:53:13', '.pr-6 { padding-right: 1.5rem; }', '<span class="pr-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (886, '.pr-10', 'classes/paddings/pr-10', NULL, '2024-03-06 04:53:14', '2024-03-06 04:53:14', '.pr-10 { padding-right: 2.5rem; }', '<span class="pr-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (900, '.pt-3', 'classes/paddings/pt-3', NULL, '2024-03-06 04:53:19', '2024-03-06 04:53:19', '.pt-3 { padding-top: 0.75rem; }', '<span class="pt-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (907, '.pt-16', 'classes/paddings/pt-16', NULL, '2024-03-06 04:53:22', '2024-03-06 04:53:22', '.pt-16 { padding-top: 4rem; }', '<span class="pt-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (919, '.pl-3', 'classes/paddings/pl-3', NULL, '2024-03-06 04:53:27', '2024-03-06 04:53:27', '.pl-3 { padding-left: 0.75rem; }', '<span class="pl-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (926, '.pl-16', 'classes/paddings/pl-16', NULL, '2024-03-06 04:53:30', '2024-03-06 04:53:30', '.pl-16 { padding-left: 4rem; }', '<span class="pl-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (939, '.px-4', 'classes/paddings/px-4', NULL, '2024-03-06 04:53:35', '2024-03-06 04:53:35', '.px-4 { padding-right: 1rem; padding-left: 1rem; }', '<span class="px-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (948, '.px-32', 'classes/paddings/px-32', NULL, '2024-03-06 04:53:38', '2024-03-06 04:53:38', '.px-32 { padding-right: 8rem; padding-left: 8rem; }', '<span class="px-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (959, '.py-5', 'classes/paddings/py-5', NULL, '2024-03-06 04:53:43', '2024-03-06 04:53:43', '.py-5 { padding-top: 1.25rem; padding-bottom: 1.25rem; }', '<span class="py-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (969, '.py-48', 'classes/paddings/py-48', NULL, '2024-03-06 04:53:46', '2024-03-06 04:53:46', '.py-48 { padding-top: 12rem; padding-bottom: 12rem; }', '<span class="py-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (848, '.p-10', 'classes/paddings/p-10', NULL, '2024-03-06 04:52:58', '2024-03-06 04:52:58', '.p-10 { padding: 2.5rem; }', '<span class="p-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (863, '.pb-4', 'classes/paddings/pb-4', NULL, '2024-03-06 04:53:05', '2024-03-06 04:53:05', '.pb-4 { padding-bottom: 1rem; }', '<span class="pb-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (871, '.pb-24', 'classes/paddings/pb-24', NULL, '2024-03-06 04:53:08', '2024-03-06 04:53:08', '.pb-24 { padding-bottom: 6rem; }', '<span class="pb-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (885, '.pr-8', 'classes/paddings/pr-8', NULL, '2024-03-06 04:53:13', '2024-03-06 04:53:13', '.pr-8 { padding-right: 2rem; }', '<span class="pr-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (887, '.pr-12', 'classes/paddings/pr-12', NULL, '2024-03-06 04:53:14', '2024-03-06 04:53:14', '.pr-12 { padding-right: 3rem; }', '<span class="pr-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (903, '.pt-6', 'classes/paddings/pt-6', NULL, '2024-03-06 04:53:21', '2024-03-06 04:53:21', '.pt-6 { padding-top: 1.5rem; }', '<span class="pt-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (911, '.pt-40', 'classes/paddings/pt-40', NULL, '2024-03-06 04:53:24', '2024-03-06 04:53:24', '.pt-40 { padding-top: 10rem; }', '<span class="pt-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (923, '.pl-8', 'classes/paddings/pl-8', NULL, '2024-03-06 04:53:29', '2024-03-06 04:53:29', '.pl-8 { padding-left: 2rem; }', '<span class="pl-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (927, '.pl-20', 'classes/paddings/pl-20', NULL, '2024-03-06 04:53:30', '2024-03-06 04:53:30', '.pl-20 { padding-left: 5rem; }', '<span class="pl-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (940, '.px-5', 'classes/paddings/px-5', NULL, '2024-03-06 04:53:35', '2024-03-06 04:53:35', '.px-5 { padding-right: 1.25rem; padding-left: 1.25rem; }', '<span class="px-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (952, '.px-64', 'classes/paddings/px-64', NULL, '2024-03-06 04:53:40', '2024-03-06 04:53:40', '.px-64 { padding-right: 16rem; padding-left: 16rem; }', '<span class="px-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (961, '.py-8', 'classes/paddings/py-8', NULL, '2024-03-06 04:53:43', '2024-03-06 04:53:43', '.py-8 { padding-top: 2rem; padding-bottom: 2rem; }', '<span class="py-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (849, '.p-12', 'classes/paddings/p-12', NULL, '2024-03-06 04:52:59', '2024-03-06 04:52:59', '.p-12 { padding: 3rem; }', '<span class="p-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (851, '.p-20', 'classes/paddings/p-20', NULL, '2024-03-06 04:53:00', '2024-03-06 04:53:00', '.p-20 { padding: 5rem; }', '<span class="p-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (864, '.pb-5', 'classes/paddings/pb-5', NULL, '2024-03-06 04:53:05', '2024-03-06 04:53:05', '.pb-5 { padding-bottom: 1.25rem; }', '<span class="pb-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (872, '.pb-32', 'classes/paddings/pb-32', NULL, '2024-03-06 04:53:08', '2024-03-06 04:53:08', '.pb-32 { padding-bottom: 8rem; }', '<span class="pb-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (888, '.pr-16', 'classes/paddings/pr-16', NULL, '2024-03-06 04:53:15', '2024-03-06 04:53:15', '.pr-16 { padding-right: 4rem; }', '<span class="pr-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (904, '.pt-8', 'classes/paddings/pt-8', NULL, '2024-03-06 04:53:21', '2024-03-06 04:53:21', '.pt-8 { padding-top: 2rem; }', '<span class="pt-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (912, '.pt-48', 'classes/paddings/pt-48', NULL, '2024-03-06 04:53:24', '2024-03-06 04:53:24', '.pt-48 { padding-top: 12rem; }', '<span class="pt-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (924, '.pl-10', 'classes/paddings/pl-10', NULL, '2024-03-06 04:53:29', '2024-03-06 04:53:29', '.pl-10 { padding-left: 2.5rem; }', '<span class="pl-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (931, '.pl-48', 'classes/paddings/pl-48', NULL, '2024-03-06 04:53:32', '2024-03-06 04:53:32', '.pl-48 { padding-left: 12rem; }', '<span class="pl-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (943, '.px-10', 'classes/paddings/px-10', NULL, '2024-03-06 04:53:37', '2024-03-06 04:53:37', '.px-10 { padding-right: 2.5rem; padding-left: 2.5rem; }', '<span class="px-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (953, '.px-px', 'classes/paddings/px-px', NULL, '2024-03-06 04:53:41', '2024-03-06 04:53:41', '.px-px { padding-right: 1px; padding-left: 1px; }', '<span class="px-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (960, '.py-6', 'classes/paddings/py-6', NULL, '2024-03-06 04:53:43', '2024-03-06 04:53:43', '.py-6 { padding-top: 1.5rem; padding-bottom: 1.5rem; }', '<span class="py-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (850, '.p-16', 'classes/paddings/p-16', NULL, '2024-03-06 04:52:59', '2024-03-06 04:52:59', '.p-16 { padding: 4rem; }', '<span class="p-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (852, '.p-24', 'classes/paddings/p-24', NULL, '2024-03-06 04:53:00', '2024-03-06 04:53:00', '.p-24 { padding: 6rem; }', '<span class="p-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (867, '.pb-10', 'classes/paddings/pb-10', NULL, '2024-03-06 04:53:07', '2024-03-06 04:53:07', '.pb-10 { padding-bottom: 2.5rem; }', '<span class="pb-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (875, '.pb-56', 'classes/paddings/pb-56', NULL, '2024-03-06 04:53:10', '2024-03-06 04:53:10', '.pb-56 { padding-bottom: 14rem; }', '<span class="pb-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (889, '.pr-20', 'classes/paddings/pr-20', NULL, '2024-03-06 04:53:15', '2024-03-06 04:53:15', '.pr-20 { padding-right: 5rem; }', '<span class="pr-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (891, '.pr-32', 'classes/paddings/pr-32', NULL, '2024-03-06 04:53:16', '2024-03-06 04:53:16', '.pr-32 { padding-right: 8rem; }', '<span class="pr-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (905, '.pt-10', 'classes/paddings/pt-10', NULL, '2024-03-06 04:53:21', '2024-03-06 04:53:21', '.pt-10 { padding-top: 2.5rem; }', '<span class="pt-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (915, '.pt-px', 'classes/paddings/pt-px', NULL, '2024-03-06 04:53:26', '2024-03-06 04:53:26', '.pt-px { padding-top: 1px; }', '<span class="pt-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (928, '.pl-24', 'classes/paddings/pl-24', NULL, '2024-03-06 04:53:31', '2024-03-06 04:53:31', '.pl-24 { padding-left: 6rem; }', '<span class="pl-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (932, '.pl-56', 'classes/paddings/pl-56', NULL, '2024-03-06 04:53:32', '2024-03-06 04:53:32', '.pl-56 { padding-left: 14rem; }', '<span class="pl-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (944, '.px-12', 'classes/paddings/px-12', NULL, '2024-03-06 04:53:37', '2024-03-06 04:53:37', '.px-12 { padding-right: 3rem; padding-left: 3rem; }', '<span class="px-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (956, '.py-2', 'classes/paddings/py-2', NULL, '2024-03-06 04:53:42', '2024-03-06 04:53:42', '.py-2 { padding-top: 0.5rem; padding-bottom: 0.5rem; }', '<span class="py-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (964, '.py-16', 'classes/paddings/py-16', NULL, '2024-03-06 04:53:45', '2024-03-06 04:53:45', '.py-16 { padding-top: 4rem; padding-bottom: 4rem; }', '<span class="py-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (853, '.p-32', 'classes/paddings/p-32', NULL, '2024-03-06 04:53:00', '2024-03-06 04:53:00', '.p-32 { padding: 8rem; }', '<span class="p-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (868, '.pb-12', 'classes/paddings/pb-12', NULL, '2024-03-06 04:53:07', '2024-03-06 04:53:07', '.pb-12 { padding-bottom: 3rem; }', '<span class="pb-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (876, '.pb-64', 'classes/paddings/pb-64', NULL, '2024-03-06 04:53:10', '2024-03-06 04:53:10', '.pb-64 { padding-bottom: 16rem; }', '<span class="pb-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (890, '.pr-24', 'classes/paddings/pr-24', NULL, '2024-03-06 04:53:15', '2024-03-06 04:53:15', '.pr-24 { padding-right: 6rem; }', '<span class="pr-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (892, '.pr-40', 'classes/paddings/pr-40', NULL, '2024-03-06 04:53:16', '2024-03-06 04:53:16', '.pr-40 { padding-right: 10rem; }', '<span class="pr-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (908, '.pt-20', 'classes/paddings/pt-20', NULL, '2024-03-06 04:53:23', '2024-03-06 04:53:23', '.pt-20 { padding-top: 5rem; }', '<span class="pt-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (916, '.pl-0', 'classes/paddings/pl-0', NULL, '2024-03-06 04:53:26', '2024-03-06 04:53:26', '.pl-0 { padding-left: 0; }', '<span class="pl-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (929, '.pl-32', 'classes/paddings/pl-32', NULL, '2024-03-06 04:53:31', '2024-03-06 04:53:31', '.pl-32 { padding-left: 8rem; }', '<span class="pl-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (936, '.px-1', 'classes/paddings/px-1', NULL, '2024-03-06 04:53:34', '2024-03-06 04:53:34', '.px-1 { padding-right: 0.25rem; padding-left: 0.25rem; }', '<span class="px-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (945, '.px-16', 'classes/paddings/px-16', NULL, '2024-03-06 04:53:37', '2024-03-06 04:53:37', '.px-16 { padding-right: 4rem; padding-left: 4rem; }', '<span class="px-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (957, '.py-3', 'classes/paddings/py-3', NULL, '2024-03-06 04:53:42', '2024-03-06 04:53:42', '.py-3 { padding-top: 0.75rem; padding-bottom: 0.75rem; }', '<span class="py-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (966, '.py-24', 'classes/paddings/py-24', NULL, '2024-03-06 04:53:45', '2024-03-06 04:53:45', '.py-24 { padding-top: 6rem; padding-bottom: 6rem; }', '<span class="py-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (985, '.clearfix', 'classes/positioning/clearfix', NULL, '2024-03-06 04:53:52', '2024-03-09 18:03:46', '&::after {
  content: "";
  display: table;
  clear: both;
}', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <p class="clearfix">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (854, '.p-40', 'classes/paddings/p-40', NULL, '2024-03-06 04:53:01', '2024-03-06 04:53:01', '.p-40 { padding: 10rem; }', '<span class="p-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (856, '.p-56', 'classes/paddings/p-56', NULL, '2024-03-06 04:53:02', '2024-03-06 04:53:02', '.p-56 { padding: 14rem; }', '<span class="p-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="p-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (869, '.pb-16', 'classes/paddings/pb-16', NULL, '2024-03-06 04:53:07', '2024-03-06 04:53:07', '.pb-16 { padding-bottom: 4rem; }', '<span class="pb-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (877, '.pb-px', 'classes/paddings/pb-px', NULL, '2024-03-06 04:53:10', '2024-03-06 04:53:10', '.pb-px { padding-bottom: 1px; }', '<span class="pb-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="pb-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (893, '.pr-48', 'classes/paddings/pr-48', NULL, '2024-03-06 04:53:17', '2024-03-06 04:53:17', '.pr-48 { padding-right: 12rem; }', '<span class="pr-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (896, '.pr-px', 'classes/paddings/pr-px', NULL, '2024-03-06 04:53:18', '2024-03-06 04:53:18', '.pr-px { padding-right: 1px; }', '<span class="pr-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="pr-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (909, '.pt-24', 'classes/paddings/pt-24', NULL, '2024-03-06 04:53:23', '2024-03-06 04:53:23', '.pt-24 { padding-top: 6rem; }', '<span class="pt-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pt-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (917, '.pl-1', 'classes/paddings/pl-1', NULL, '2024-03-06 04:53:26', '2024-03-06 04:53:26', '.pl-1 { padding-left: 0.25rem; }', '<span class="pl-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (930, '.pl-40', 'classes/paddings/pl-40', NULL, '2024-03-06 04:53:31', '2024-03-06 04:53:31', '.pl-40 { padding-left: 10rem; }', '<span class="pl-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="pl-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (937, '.px-2', 'classes/paddings/px-2', NULL, '2024-03-06 04:53:34', '2024-03-06 04:53:34', '.px-2 { padding-right: 0.5rem; padding-left: 0.5rem; }', '<span class="px-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (949, '.px-40', 'classes/paddings/px-40', NULL, '2024-03-06 04:53:39', '2024-03-06 04:53:39', '.px-40 { padding-right: 10rem; padding-left: 10rem; }', '<span class="px-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="px-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (958, '.py-4', 'classes/paddings/py-4', NULL, '2024-03-06 04:53:42', '2024-03-06 04:53:42', '.py-4 { padding-top: 1rem; padding-bottom: 1rem; }', '<span class="py-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (965, '.py-20', 'classes/paddings/py-20', NULL, '2024-03-06 04:53:45', '2024-03-06 04:53:45', '.py-20 { padding-top: 5rem; padding-bottom: 5rem; }', '<span class="py-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (972, '.py-px', 'classes/paddings/py-px', NULL, '2024-03-06 04:53:48', '2024-03-06 04:53:48', '.py-px { padding-top: 1px; padding-bottom: 1px; }', '<span class="py-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="py-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (973, '.p-11', 'classes/paddings/p-11', NULL, '2024-03-06 04:53:48', '2024-03-06 04:53:48', NULL, '    <div class="p-11 inline-block bg-gray-200">
        <div class="w-6 h-6 bg-red-400 rounded-full"></div>
    </div>', '<div>
  <div class="p-11 inline-block bg-gray-200">
    <div class="w-6 h-6 bg-red-400 rounded-full">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (974, '.pb-11', 'classes/paddings/pb-11', NULL, '2024-03-06 04:53:48', '2024-03-06 04:53:48', NULL, '    <div class="max-w-md">
        <p class="pb-11 text-blue-400">Lorem ipsum dolor sit amet consectetur.</p>
        <p>Lorem ipsum dolor sit amet consectetur.</p>
        <p>Lorem ipsum dolor sit amet consectetur.</p>
        <p>Lorem ipsum dolor sit amet consectetur.</p>
    </div>', '<div>
  <div class="max-w-md">
    <p class="pb-11 text-blue-400">
      Lorem ipsum dolor sit amet consectetur.
    </p>
    <p>
      Lorem ipsum dolor sit amet consectetur.
    </p>
    <p>
      Lorem ipsum dolor sit amet consectetur.
    </p>
    <p>
      Lorem ipsum dolor sit amet consectetur.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (975, '.pl-11', 'classes/paddings/pl-11', NULL, '2024-03-06 04:53:49', '2024-03-06 04:53:49', NULL, '    <div class="pl-11 inline-block bg-teal-400 rounded">Example</div>', '<div>
  <div class="pl-11 inline-block bg-teal-400 rounded">
    Example
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (976, '.pr-11', 'classes/paddings/pr-11', NULL, '2024-03-06 04:53:49', '2024-03-06 04:53:49', NULL, '    <div class="pr-11 inline-block bg-teal-400 rounded">Example</div>
    <div class="inline-block bg-purple-400 rounded">Example</div>', '<div>
  <div class="pr-11 inline-block bg-teal-400 rounded">
    Example
  </div>
  <div class="inline-block bg-purple-400 rounded">
    Example
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (977, '.pt-11', 'classes/paddings/pt-11', NULL, '2024-03-06 04:53:49', '2024-03-06 04:53:49', NULL, '    <span class="pt-11 inline-block bg-teal-400 rounded">Example</span>
    <span class="inline-block bg-purple-400 rounded">Example</span>', '<div>
  <span class="pt-11 inline-block bg-teal-400 rounded">
    Example
  </span>
  <span class="inline-block bg-purple-400 rounded">
    Example
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (978, '.px-11', 'classes/paddings/px-11', NULL, '2024-03-06 04:53:50', '2024-03-06 04:53:50', NULL, '    <span class="inline-block bg-purple-400 rounded">Example</span>
    <span class="px-11 inline-block bg-teal-400 rounded">Example</span>
    <span class="inline-block bg-purple-400 rounded">Example</span>', '<div>
  <span class="inline-block bg-purple-400 rounded">
    Example
  </span>
  <span class="px-11 inline-block bg-teal-400 rounded">
    Example
  </span>
  <span class="inline-block bg-purple-400 rounded">
    Example
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (979, '.py-11', 'classes/paddings/py-11', NULL, '2024-03-06 04:53:50', '2024-03-06 04:53:50', NULL, '    <span class="inline-block bg-purple-400 rounded">Example</span>
    <span class="py-11 inline-block bg-teal-400 rounded">Example</span>
    <span class="inline-block bg-purple-400 rounded">Example</span>', '<div>
  <span class="inline-block bg-purple-400 rounded">
    Example
  </span>
  <span class="py-11 inline-block bg-teal-400 rounded">
    Example
  </span>
  <span class="inline-block bg-purple-400 rounded">
    Example
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (980, '.align-*', 'classes/positioning/align-*', NULL, '2024-03-06 04:53:51', '2024-03-06 04:53:51', '.align-baseline { vertical-align: baseline; }
.align-top { vertical-align: top; }
.align-middle { vertical-align: middle; }
.align-bottom { vertical-align: bottom; }
.align-text-top { vertical-align: text-top; }
.align-text-bottom { vertical-align: text-bottom; }', '<span class="align-baseline">baseline</span>
<span class="align-top">top</span>
<span class="align-middle">middle</span>
<span class="align-bottom">bottom</span>
<span class="align-text-top">text-top</span>
<span class="align-text-bottom">text-bottom</span>', '<div>
  <span class="align-baseline">
    baseline
  </span>
  <span class="align-top">
    top
  </span>
  <span class="align-middle">
    middle
  </span>
  <span class="align-bottom">
    bottom
  </span>
  <span class="align-text-top">
    text-top
  </span>
  <span class="align-text-bottom">
    text-bottom
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1003, '.static', 'classes/positioning/static', NULL, '2024-03-06 04:53:59', '2024-03-06 04:53:59', '.static { 
    position: static;
}', '<div class="static bg-gray-600 py-6">
  Static
  <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
    Absolute
  </div>
</div>', '<div>
  <div class="static bg-gray-600 py-6">
    Static
    <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
      Absolute
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1013, '.-inset-y-0', 'classes/positioning/-inset-y-0', NULL, '2024-03-06 04:54:02', '2024-03-06 04:54:02', NULL, '    <div class="relative h-40">
        <div class="absolute -inset-y-0 left-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative h-40">
    <div class="absolute -inset-y-0 left-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1023, '.-ml-0', 'classes/positioning/-ml-0', NULL, '2024-03-06 04:54:05', '2024-03-06 04:54:05', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-ml-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-ml-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1032, '.-my-px', 'classes/positioning/-my-px', NULL, '2024-03-06 04:54:08', '2024-03-06 04:54:08', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-40">
        <div class="-my-px p-6 w-2/3 mx-auto h-full bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-40">
    <div class="-my-px p-6 w-2/3 mx-auto h-full bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1045, '.-translate-x-0', 'classes/positioning/-translate-x-0', NULL, '2024-03-06 04:54:13', '2024-03-06 04:54:13', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform -translate-x-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform -translate-x-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1049, '.-translate-y-px', 'classes/positioning/-translate-y-px', NULL, '2024-03-06 04:54:14', '2024-03-06 04:54:14', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-64">
        <div class="transform -translate-y-px h-full w-1/2 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-64">
    <div class="transform -translate-y-px h-full w-1/2 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1063, '.inset-px', 'classes/positioning/inset-px', NULL, '2024-03-06 04:54:19', '2024-03-06 04:54:19', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-px bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-px bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1066, '.inset-x-px', 'classes/positioning/inset-x-px', NULL, '2024-03-06 04:54:20', '2024-03-06 04:54:20', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-x-px h-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-x-px h-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1082, '.sm:', 'classes/responsive/sm:', NULL, '2024-03-06 04:54:25', '2024-03-06 04:54:25', '@media (min-width: 640px) {
    // styles
}', '<div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">Resize window</div>', '<div>
  <div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">
    Resize window
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1085, '.xl:', 'classes/responsive/xl:', NULL, '2024-03-06 04:54:26', '2024-03-06 04:54:26', '@media (min-width: 1280px) {
    // styles
}', '<div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">Resize window</div>', '<div>
  <div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">
    Resize window
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1101, '.ring-offset-indigo-100', 'classes/ring/ring-offset-indigo-100', NULL, '2024-03-06 04:54:31', '2024-03-06 04:54:31', NULL, '    <div class="ring ring-offset-indigo-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-indigo-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1105, '.ring-offset-transparent', 'classes/ring/ring-offset-transparent', NULL, '2024-03-06 04:54:32', '2024-03-06 04:54:32', NULL, '    <div class="ring ring-offset-transparent ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-transparent ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1130, '.shadow-outline', 'classes/shadows/shadow-outline', NULL, '2024-03-06 04:54:41', '2024-03-06 04:54:41', '.shadow-outline { box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.5); }', '<div class="shadow-outer h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-outer h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1167, '.leading-loose', 'classes/text/leading-loose', NULL, '2024-03-06 04:54:54', '2024-03-06 04:54:54', '.leading-loose { line-height: 2; }', '<p class="leading-loose bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-loose bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (995, '.object-left-bottom', 'classes/positioning/object-left-bottom', NULL, '2024-03-06 04:53:56', '2024-03-07 17:51:08', '.object-left-bottom { object-position: left bottom; }', '<img class="object-left-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-left-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (988, '.top-0+%25_F+.top-*', 'classes/positioning/top-0+%25_F+.top-*', NULL, '2024-03-06 04:53:53', '2024-03-06 04:53:53', '.top-0 { top: 0; }
.top-auto { top: auto; }', '<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute top-0 h-4 w-full bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute top-auto bottom-0 h-4 w-full bg-teal-400"></div>
</div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute top-0 h-4 w-full bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute top-auto bottom-0 h-4 w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1004, '.relative', 'classes/positioning/relative', NULL, '2024-03-06 04:53:59', '2024-03-06 04:53:59', '.relative { 
    position: relative;
}', '<div class="relative bg-gray-600 py-6">
  Relative
  <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
    Absolute
  </div>
</div>', '<div>
  <div class="relative bg-gray-600 py-6">
    Relative
    <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
      Absolute
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1014, '.-inset-y-full', 'classes/positioning/-inset-y-full', NULL, '2024-03-06 04:54:02', '2024-03-06 04:54:02', NULL, '    <div class="flex items-center h-40">
        <div class="inline-block bg-gray-300 h-8 w-36"></div>
        <div class="inline-block relative bg-gray-300 mx-10 h-8 w-36">
            <div class="absolute -inset-y-full left-0 p-4 bg-teal-400 text-sm"></div>
        </div>
        <div class="inline-block bg-gray-300 h-8 w-36"></div>
    </div>', '<div>
  <div class="flex items-center h-40">
    <div class="inline-block bg-gray-300 h-8 w-36">
    </div>
    <div class="inline-block relative bg-gray-300 mx-10 h-8 w-36">
      <div class="absolute -inset-y-full left-0 p-4 bg-teal-400 text-sm">
      </div>
    </div>
    <div class="inline-block bg-gray-300 h-8 w-36">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (996, '.object-left-top', 'classes/positioning/object-left-top', NULL, '2024-03-06 04:53:56', '2024-03-07 17:51:08', '.object-left-top { object-position: left top; }', '<img class="object-left-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-left-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (992, '.object-center', 'classes/positioning/object-center', NULL, '2024-03-06 04:53:55', '2024-03-07 17:51:08', '.object-center { object-position: center; }', '<img class="object-center object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-center object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1007, '.sticky', 'classes/positioning/sticky', NULL, '2024-03-06 04:54:00', '2024-03-06 04:54:00', '.sticky {
    position: sticky;
}', '<div class="sticky inset-x-0 top-0 left-0 bg-gray-400 py-5">Menu</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1016, '.-left-0', 'classes/positioning/-left-0', NULL, '2024-03-06 04:54:03', '2024-03-06 04:54:03', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -left-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -left-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1025, '.-mr-0', 'classes/positioning/-mr-0', NULL, '2024-03-06 04:54:06', '2024-03-06 04:54:06', NULL, '    <div class="flex items-center h-40">
        <div class="bg-gray-300 mx-auto h-20 w-36">
            <div class="-mr-0 p-6 bg-teal-400 text-sm"></div>
        </div>
    </div>', '<div>
  <div class="flex items-center h-40">
    <div class="bg-gray-300 mx-auto h-20 w-36">
      <div class="-mr-0 p-6 bg-teal-400 text-sm">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1039, '.-space-x-0', 'classes/positioning/-space-x-0', NULL, '2024-03-06 04:54:11', '2024-03-06 04:54:11', NULL, '    <div class="flex items-end -space-x-1 h-40">
        <div class="p-4 bg-teal-400 h-24 text-sm">1</div>
        <div class="p-4 bg-yellow-400 h-20 text-sm">2</div>
        <div class="p-4 bg-purple-400 h-12 text-sm">3</div>
    </div>', '<div>
  <div class="flex items-end -space-x-1 h-40">
    <div class="p-4 bg-teal-400 h-24 text-sm">
      1
    </div>
    <div class="p-4 bg-yellow-400 h-20 text-sm">
      2
    </div>
    <div class="p-4 bg-purple-400 h-12 text-sm">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1044, '.-top-px', 'classes/positioning/-top-px', NULL, '2024-03-06 04:54:12', '2024-03-06 04:54:12', NULL, '    <div class="relative mx-auto bg-gray-200 h-20 w-20">
        <div class="absolute -top-px left-0 p-4 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative mx-auto bg-gray-200 h-20 w-20">
    <div class="absolute -top-px left-0 p-4 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1059, '.bottom-full', 'classes/positioning/bottom-full', NULL, '2024-03-06 04:54:17', '2024-03-06 04:54:17', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20 mt-20">
        <div class="absolute bottom-full left-0 p-2 bg-teal-400 text-sm">bottom-full</div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20 mt-20">
    <div class="absolute bottom-full left-0 p-2 bg-teal-400 text-sm">
      bottom-full
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1062, '.inset-full', 'classes/positioning/inset-full', NULL, '2024-03-06 04:54:19', '2024-03-06 04:54:19', NULL, '    <div class="relative h-20 w-20 bg-gray-400 m-2">
        <div class="absolute inset-full bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-20 w-20 bg-gray-400 m-2">
    <div class="absolute inset-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1081, '.container', 'classes/responsive/container', NULL, '2024-03-06 04:54:25', '2024-03-06 04:54:25', '.container {
    width: 100%;
}

@media (min-width: 640px) {
    .container {
        max-width: 640px
    }
}
@media (min-width: 768px) {
    .container {
        max-width: 768px
    }
}
@media (min-width: 1024px) {
    .container {
        max-width:1024px
    }
}
@media (min-width: 1280px) {
    .container {
        max-width:1280px
    }
}', '<div class="container mx-auto bg-teal-400 h-16"></div>', '<div>
  <div class="container mx-auto bg-teal-400 h-16">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1084, '.lg:', 'classes/responsive/lg:', NULL, '2024-03-06 04:54:26', '2024-03-06 04:54:26', '@media (min-width: 1024px) {
    // styles
}', '<div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">Resize window</div>', '<div>
  <div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">
    Resize window
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1100, '.ring-offset-green-100', 'classes/ring/ring-offset-green-100', NULL, '2024-03-06 04:54:31', '2024-03-06 04:54:31', NULL, '    <div class="ring ring-offset-green-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-green-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1104, '.ring-offset-red-100', 'classes/ring/ring-offset-red-100', NULL, '2024-03-06 04:54:32', '2024-03-06 04:54:32', NULL, '    <div class="ring ring-offset-red-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-red-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1118, '.overscroll-x-none', 'classes/scroll/overscroll-x-none', NULL, '2024-03-06 04:54:37', '2024-03-06 04:54:37', NULL, '    <div class="max-w-xs">
        <p class="overscroll-x-none overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-x-none overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1122, '.shadow-xs', 'classes/shadows/shadow-xs', NULL, '2024-03-06 04:54:38', '2024-03-06 04:54:38', '.shadow-xs { box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05); }', '<div class="shadow-xs h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-xs h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1168, '.leading-3', 'classes/text/leading-3', NULL, '2024-03-06 04:54:55', '2024-03-06 04:54:55', '.leading-3 { line-height: .75rem; }', '<p class="leading-3 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-3 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (993, '.object-bottom', 'classes/positioning/object-bottom', NULL, '2024-03-06 04:53:55', '2024-03-07 17:51:08', '.object-bottom { object-position: bottom; }', '<img class="object-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-bottom object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1005, '.absolute', 'classes/positioning/absolute', NULL, '2024-03-06 04:53:59', '2024-03-06 04:53:59', '.absolute { 
    position: absolute;
}', '<div class="relative bg-gray-600 py-6">
  Relative
  <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
    Absolute
  </div>
</div>', '<div>
  <div class="relative bg-gray-600 py-6">
    Relative
    <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
      Absolute
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1015, '.-inset-y-px', 'classes/positioning/-inset-y-px', NULL, '2024-03-06 04:54:02', '2024-03-06 04:54:02', NULL, '    <div class="flex items-center">
        <div class="bg-gray-300 h-20 w-36"></div>
        <div class="relative bg-gray-300 mx-12 h-20 w-36">
            <div class="absolute -inset-y-px left-0 p-6 bg-teal-400 text-sm"></div>
        </div>
        <div class="bg-gray-300 h-20 w-36"></div>
    </div>', '<div>
  <div class="flex items-center">
    <div class="bg-gray-300 h-20 w-36">
    </div>
    <div class="relative bg-gray-300 mx-12 h-20 w-36">
      <div class="absolute -inset-y-px left-0 p-6 bg-teal-400 text-sm">
      </div>
    </div>
    <div class="bg-gray-300 h-20 w-36">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1028, '.-mt-px', 'classes/positioning/-mt-px', NULL, '2024-03-06 04:54:07', '2024-03-06 04:54:07', NULL, '   <div class="bg-gray-300 mx-auto h-20 w-40">
        <div class="-mt-px mx-auto p-6 w-2/3 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-40">
    <div class="-mt-px mx-auto p-6 w-2/3 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1037, '.-skew-x-1', 'classes/positioning/-skew-x-1', NULL, '2024-03-06 04:54:10', '2024-03-06 04:54:10', NULL, '   <div class="bg-gray-300 h-32 w-32">
        <div class="transform -skew-x-1 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 h-32 w-32">
    <div class="transform -skew-x-1 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1053, '.align-middle', 'classes/positioning/align-middle', NULL, '2024-03-06 04:54:15', '2024-03-06 04:54:15', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-middle bg-teal-400 text-sm">align-middle</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-middle bg-teal-400 text-sm">
      align-middle
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1056, '.align-top', 'classes/positioning/align-top', NULL, '2024-03-06 04:54:16', '2024-03-06 04:54:16', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-top bg-teal-400 text-sm">align-top</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-top bg-teal-400 text-sm">
      align-top
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1075, '.right-full', 'classes/positioning/right-full', NULL, '2024-03-06 04:54:23', '2024-03-06 04:54:23', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute right-full h-full w-4 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-full h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1078, '.top-px', 'classes/positioning/top-px', NULL, '2024-03-06 04:54:24', '2024-03-06 04:54:24', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute top-px h-4 w-full bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute top-px h-4 w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1094, '.ring-inset', 'classes/ring/ring-inset', NULL, '2024-03-06 04:54:29', '2024-03-06 04:54:29', NULL, '    <div class="ring-inset ring-4 ring-blue-500 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-inset ring-4 ring-blue-500 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1097, '.ring-offset-blue-100', 'classes/ring/ring-offset-blue-100', NULL, '2024-03-06 04:54:30', '2024-03-06 04:54:30', NULL, '    <div class="ring ring-offset-blue-100 ring-black ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-black rounded">Button</div>', '<div>
  <div class="ring ring-offset-blue-100 ring-black ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-black rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1113, '.ring-white', 'classes/ring/ring-white', NULL, '2024-03-06 04:54:35', '2024-03-06 04:54:35', NULL, '    <div class="inline-block p-4 bg-gray-400">
        <div class="ring-white ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>
    </div>', '<div>
  <div class="inline-block p-4 bg-gray-400">
    <div class="ring-white ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
      Button
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1116, '.overscroll-x-auto', 'classes/scroll/overscroll-x-auto', NULL, '2024-03-06 04:54:36', '2024-03-06 04:54:36', NULL, '    <div class="max-w-xs">
        <p class="overscroll-x-auto overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-x-auto overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (997, '.object-right', 'classes/positioning/object-right', NULL, '2024-03-06 04:53:56', '2024-03-07 17:51:08', '.object-right { object-position: right; }', '<img class="object-right object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-right object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (987, '.inset-y-0+%25_F+.inset-*-%23', 'classes/positioning/inset-y-0+%25_F+.inset-*-%23', NULL, '2024-03-06 04:53:53', '2024-03-06 04:53:53', '.inset-0 {
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
}
.inset-y-0 {
    top: 0;
    bottom: 0;
}
.inset-x-0 {
    right: 0;
    left: 0;
}
.inset-auto {
    top: auto;
    right: auto;
    bottom: auto;
    left: auto;
}
.inset-y-auto {
    top: auto;
    bottom: auto;
}
.inset-x-auto {
    left: auto;
    right: auto;
}', '<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-0 h-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-y-0 w-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-x-0 h-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-auto top-0 h-4 w-0 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-y-auto top-0 h-4 w-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute inset-x-auto h-4 w-4 bg-teal-400"></div>
</div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-0 h-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-y-0 w-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-x-0 h-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-auto top-0 h-4 w-0 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-y-auto top-0 h-4 w-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute inset-x-auto h-4 w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1009, '.-bottom-px', 'classes/positioning/-bottom-px', NULL, '2024-03-06 04:54:01', '2024-03-06 04:54:01', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20">
        <div class="absolute -bottom-px left-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20">
    <div class="absolute -bottom-px left-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1019, '.-m-0', 'classes/positioning/-m-0', NULL, '2024-03-06 04:54:04', '2024-03-06 04:54:04', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-m-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-m-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1029, '.-mx-0', 'classes/positioning/-mx-0', NULL, '2024-03-06 04:54:07', '2024-03-06 04:54:07', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-mx-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-mx-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1036, '.-rotate-1', 'classes/positioning/-rotate-1', NULL, '2024-03-06 04:54:10', '2024-03-06 04:54:10', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform -rotate-1 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform -rotate-1 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1051, '.align-baseline', 'classes/positioning/align-baseline', NULL, '2024-03-06 04:54:15', '2024-03-06 04:54:15', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-baseline bg-teal-400 text-sm">align-baseline</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-baseline bg-teal-400 text-sm">
      align-baseline
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1054, '.align-text-bottom', 'classes/positioning/align-text-bottom', NULL, '2024-03-06 04:54:16', '2024-03-06 04:54:16', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-text-bottom bg-teal-400 text-sm">align-text-bottom</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-text-bottom bg-teal-400 text-sm">
      align-text-bottom
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1070, '.left-1', 'classes/positioning/left-1', NULL, '2024-03-06 04:54:21', '2024-03-06 04:54:21', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 left-1 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 left-1 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1073, '.right-1', 'classes/positioning/right-1', NULL, '2024-03-06 04:54:22', '2024-03-06 04:54:22', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute right-1 h-full w-4 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-1 h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1089, '.ring-blue-100', 'classes/ring/ring-blue-100', NULL, '2024-03-06 04:54:27', '2024-03-06 04:54:27', NULL, '    <div class="ring-blue-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-black rounded">Button</div>', '<div>
  <div class="ring-blue-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-black rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1092, '.ring-green-100', 'classes/ring/ring-green-100', NULL, '2024-03-06 04:54:28', '2024-03-06 04:54:28', NULL, '    <div class="ring-green-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-green-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1108, '.ring-opacity-0', 'classes/ring/ring-opacity-0', NULL, '2024-03-06 04:54:33', '2024-03-06 04:54:33', NULL, '    <div class="ring-opacity-0 ring-black ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-opacity-0 ring-black ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1112, '.ring-transparent', 'classes/ring/ring-transparent', NULL, '2024-03-06 04:54:34', '2024-03-06 04:54:34', NULL, '    <div class="ring-transparent ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-transparent ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1128, '.shadow-2xl', 'classes/shadows/shadow-2xl', NULL, '2024-03-06 04:54:41', '2024-03-06 04:54:41', '.shadow-2xl { box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25); }', '<div class="shadow-2xl h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-2xl h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1154, '.break-normal', 'classes/text/break-normal', NULL, '2024-03-06 04:54:50', '2024-03-06 04:54:50', '.break-normal {
    word-break: normal;
    overflow-wrap: normal;
}', '<div class="h-32 w-64 bg-gray-200 m-2">
  <span class="break-normal">Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies.
  </span>
</div>', '<div>
  <div class="h-32 w-64 bg-gray-200 m-2">
    <span class="break-normal">
      Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies.
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (989, '.left-0+%25_F+.left-*', 'classes/positioning/left-0+%25_F+.left-*', NULL, '2024-03-06 04:53:54', '2024-03-06 04:53:54', '.left-0 { left: 0; }
.left-auto { left: auto; }', '<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute left-0 h-full w-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute left-auto right-0 h-full w-4 bg-teal-400"></div>
</div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute left-0 h-full w-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute left-auto right-0 h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1006, '.fixed', 'classes/positioning/fixed', NULL, '2024-03-06 04:54:00', '2024-03-06 04:54:00', '.fixed {
    position: fixed;
}', '<div class="fixed inset-x-0 top-0 left-0 bg-gray-400 py-5">Menu</div>', '<div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1017, '.-left-full', 'classes/positioning/-left-full', NULL, '2024-03-06 04:54:03', '2024-03-06 04:54:03', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -left-full p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -left-full p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1026, '.-mr-px', 'classes/positioning/-mr-px', NULL, '2024-03-06 04:54:06', '2024-03-06 04:54:06', NULL, '    <div class="flex items-center h-40">
        <div class="bg-gray-300 mx-auto h-20 w-36">
            <div class="-mr-px p-6 bg-teal-400 text-sm"></div>
        </div>
    </div>', '<div>
  <div class="flex items-center h-40">
    <div class="bg-gray-300 mx-auto h-20 w-36">
      <div class="-mr-px p-6 bg-teal-400 text-sm">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1035, '.-right-px', 'classes/positioning/-right-px', NULL, '2024-03-06 04:54:09', '2024-03-06 04:54:09', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -right-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -right-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1043, '.-top-0', 'classes/positioning/-top-0', NULL, '2024-03-06 04:54:12', '2024-03-06 04:54:12', NULL, '    <div class="flex items-center">
        <div class="relative mx-auto bg-gray-200 h-20 w-20">
            <div class="absolute -top-0 left-0 p-4 bg-teal-400 text-sm"></div>
        </div>
    </div>', '<div>
  <div class="flex items-center">
    <div class="relative mx-auto bg-gray-200 h-20 w-20">
      <div class="absolute -top-0 left-0 p-4 bg-teal-400 text-sm">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1057, '.bottom-0', 'classes/positioning/bottom-0', NULL, '2024-03-06 04:54:17', '2024-03-06 04:54:17', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20">
        <div class="absolute bottom-0 left-0 p-2 bg-teal-400 text-sm">bottom-0</div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20">
    <div class="absolute bottom-0 left-0 p-2 bg-teal-400 text-sm">
      bottom-0
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1060, '.bottom-px', 'classes/positioning/bottom-px', NULL, '2024-03-06 04:54:18', '2024-03-06 04:54:18', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20">
        <div class="absolute bottom-px left-0 p-2 bg-teal-400 text-sm">bottom-px</div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20">
    <div class="absolute bottom-px left-0 p-2 bg-teal-400 text-sm">
      bottom-px
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1076, '.right-px', 'classes/positioning/right-px', NULL, '2024-03-06 04:54:23', '2024-03-06 04:54:23', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute right-px h-full w-4 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-px h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1079, '.hover', 'classes/pseudo-class/hover', NULL, '2024-03-06 04:54:24', '2024-03-06 04:54:24', NULL, '<button class="bg-teal-400 hover:bg-teal-500 py-2 px-4">Hover</button>', '<div>
  <button class="bg-teal-400 hover:bg-teal-500 py-2 px-4">
    Hover
  </button>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1095, '.ring-offset-0', 'classes/ring/ring-offset-0', NULL, '2024-03-06 04:54:29', '2024-03-06 04:54:29', NULL, '    <div class="ring-offset-0 ring-4 ring-blue-500 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-offset-0 ring-4 ring-blue-500 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1098, '.ring-offset-current', 'classes/ring/ring-offset-current', NULL, '2024-03-06 04:54:30', '2024-03-06 04:54:30', NULL, '    <div class="ring ring-offset-current ring-black ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-black rounded">Button</div>', '<div>
  <div class="ring ring-offset-current ring-black ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-black rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1114, '.ring-yellow-100', 'classes/ring/ring-yellow-100', NULL, '2024-03-06 04:54:35', '2024-03-06 04:54:35', NULL, '    <div class="ring-yellow-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-yellow-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1120, '.overscroll-y-contain', 'classes/scroll/overscroll-y-contain', NULL, '2024-03-06 04:54:38', '2024-03-06 04:54:38', NULL, '    <div class="max-w-xs">
        <p class="overscroll-y-contain overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-y-contain overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1138, '.fill-current', 'classes/svg/fill-current', NULL, '2024-03-06 04:54:44', '2024-03-06 04:54:44', '.fill-current {
  fill: currentColor;
}', '<svg class="fill-current text-teal-400 h-12 w-12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
  <path d="M18 9.87V20H2V9.87a4.25 4.25 0 0 0 3-.38V14h10V9.5a4.26 4.26 0 0 0 3 .37zM3 0h4l-.67 6.03A3.43 3.43 0 0 1 3 9C1.34 9 .42 7.73.95 6.15L3 0zm5 0h4l.7 6.3c.17 1.5-.91 2.7-2.42 2.7h-.56A2.38 2.38 0 0 1 7.3 6.3L8 0zm5 0h4l2.05 6.15C19.58 7.73 18.65 9 17 9a3.42 3.42 0 0 1-3.33-2.97L13 0z"/>
</svg>', '<div>
  <svg class="fill-current text-teal-400 h-12 w-12" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 20 20">
    <path d="M18 9.87V20H2V9.87a4.25 4.25 0 0 0 3-.38V14h10V9.5a4.26 4.26 0 0 0 3 .37zM3 0h4l-.67 6.03A3.43 3.43 0 0 1 3 9C1.34 9 .42 7.73.95 6.15L3 0zm5 0h4l.7 6.3c.17 1.5-.91 2.7-2.42 2.7h-.56A2.38 2.38 0 0 1 7.3 6.3L8 0zm5 0h4l2.05 6.15C19.58 7.73 18.65 9 17 9a3.42 3.42 0 0 1-3.33-2.97L13 0z">
    </path>
  </svg>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (990, '.right-0+%25_F+.right-*', 'classes/positioning/right-0+%25_F+.right-*', NULL, '2024-03-06 04:53:54', '2024-03-06 04:53:54', '.right-0 { right: 0; }
.right-auto { right: auto; }', '<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute right-0 h-full w-4 bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute right-auto left-0 h-full w-4 bg-teal-400"></div>
</div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-0 h-full w-4 bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-auto left-0 h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1008, '.-bottom-1', 'classes/positioning/-bottom-1', NULL, '2024-03-06 04:54:00', '2024-03-06 04:54:00', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20">
        <div class="absolute -bottom-0 left-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20">
    <div class="absolute -bottom-0 left-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1018, '.-left-px', 'classes/positioning/-left-px', NULL, '2024-03-06 04:54:03', '2024-03-06 04:54:03', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -left-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -left-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1027, '.-mt-0', 'classes/positioning/-mt-0', NULL, '2024-03-06 04:54:06', '2024-03-06 04:54:06', NULL, '    <div class="flex items-center h-40">
        <div class="bg-gray-300 mx-auto h-20 w-40">
            <div class="-mt-0 mx-auto p-6 w-2/3 bg-teal-400 text-sm"></div>
        </div>
    </div>', '<div>
  <div class="flex items-center h-40">
    <div class="bg-gray-300 mx-auto h-20 w-40">
      <div class="-mt-0 mx-auto p-6 w-2/3 bg-teal-400 text-sm">
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1040, '.-space-x-px', 'classes/positioning/-space-x-px', NULL, '2024-03-06 04:54:11', '2024-03-06 04:54:11', NULL, '    <div class="flex items-end -space-x-px h-40">
        <div class="p-4 bg-teal-400 h-24 text-sm">1</div>
        <div class="p-4 bg-yellow-400 h-20 text-sm">2</div>
        <div class="p-4 bg-purple-400 h-12 text-sm">3</div>
    </div>', '<div>
  <div class="flex items-end -space-x-px h-40">
    <div class="p-4 bg-teal-400 h-24 text-sm">
      1
    </div>
    <div class="p-4 bg-yellow-400 h-20 text-sm">
      2
    </div>
    <div class="p-4 bg-purple-400 h-12 text-sm">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1048, '.-translate-y-0', 'classes/positioning/-translate-y-0', NULL, '2024-03-06 04:54:14', '2024-03-06 04:54:14', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform -translate-y-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform -translate-y-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1069, '.inset-y-px', 'classes/positioning/inset-y-px', NULL, '2024-03-06 04:54:21', '2024-03-06 04:54:21', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-y-px w-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-y-px w-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1072, '.left-px', 'classes/positioning/left-px', NULL, '2024-03-06 04:54:22', '2024-03-06 04:54:22', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 left-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 left-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1088, '.ring-black', 'classes/ring/ring-black', NULL, '2024-03-06 04:54:27', '2024-03-06 04:54:27', NULL, '    <div class="ring-black ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-black ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1091, '.ring-gray-100', 'classes/ring/ring-gray-100', NULL, '2024-03-06 04:54:28', '2024-03-06 04:54:28', NULL, '    <div class="ring-gray-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-gray-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1107, '.ring-offset-yellow-100', 'classes/ring/ring-offset-yellow-100', NULL, '2024-03-06 04:54:33', '2024-03-06 04:54:33', NULL, '    <div class="ring ring-offset-transparent ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-transparent ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1111, '.ring-red-100', 'classes/ring/ring-red-100', NULL, '2024-03-06 04:54:34', '2024-03-06 04:54:34', NULL, '    <div class="ring-red-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-red-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1125, '.shadow-md', 'classes/shadows/shadow-md', NULL, '2024-03-06 04:54:39', '2024-03-06 04:54:39', '.shadow-md { box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); }', '<div class="shadow-md h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-md h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1132, '.h-11', 'classes/sizing/h-11', NULL, '2024-03-06 04:54:42', '2024-03-06 04:54:42', NULL, '    <span class="h-11 w-4 inline-block bg-teal-400"></span>', '<div>
  <span class="h-11 w-4 inline-block bg-teal-400">
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1153, '.text-opacity-*', 'classes/text/text-opacity-*', NULL, '2024-03-06 04:54:49', '2024-03-06 04:54:49', '.text-opacity-0 { --text-opacity: 0; }
.text-opacity-25 { --text-opacity: 25; }
.text-opacity-50 { --text-opacity: 50; }
.text-opacity-75 { --text-opacity: 75; }
.text-opacity-100 { --text-opacity: 100; }', '<p class="text-black text-opacity-0">Lorem Ipsum is simply dummy text of the printing ...</p>
<p class="text-black text-opacity-25">Lorem Ipsum is simply dummy text of the printing ...</p>
<p class="text-black text-opacity-50">Lorem Ipsum is simply dummy text of the printing ...</p>
<p class="text-black text-opacity-75">Lorem Ipsum is simply dummy text of the printing ...</p>
<p class="text-black text-opacity-100">Lorem Ipsum is simply dummy text of the printing ...</p>', '<div>
  <p class="text-black text-opacity-0">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
  <p class="text-black text-opacity-25">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
  <p class="text-black text-opacity-50">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
  <p class="text-black text-opacity-75">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
  <p class="text-black text-opacity-100">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1180, '.font-thin', 'classes/text/font-thin', NULL, '2024-03-06 04:54:58', '2024-03-06 04:54:58', '.font-thin { font-weight: 200; }', '<p class="font-thin m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-thin m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (991, '.bottom-0+%25_F+.bottom-*', 'classes/positioning/bottom-0+%25_F+.bottom-*', NULL, '2024-03-06 04:53:54', '2024-03-06 04:53:54', '.bottom-0 { bottom: 0; }
.bottom-auto { bottom: auto; }', '<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute bottom-0 h-4 w-full bg-teal-400"></div>
</div>
<div class="relative h-16 w-16 bg-gray-400 m-2">
  <div class="absolute bottom-auto top-0 h-4 w-full bg-teal-400"></div>
</div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute bottom-0 h-4 w-full bg-teal-400">
    </div>
  </div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute bottom-auto top-0 h-4 w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1012, '.-inset-x-0', 'classes/positioning/-inset-x-0', NULL, '2024-03-06 04:54:02', '2024-03-06 04:54:02', NULL, '    <div class="relative h-40">
        <div class="absolute -inset-x-0 left-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative h-40">
    <div class="absolute -inset-x-0 left-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1022, '.-mb-px', 'classes/positioning/-mb-px', NULL, '2024-03-06 04:54:05', '2024-03-06 04:54:05', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute bottom-0 left-0 -mb-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute bottom-0 left-0 -mb-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1030, '.-mx-px', 'classes/positioning/-mx-px', NULL, '2024-03-06 04:54:08', '2024-03-06 04:54:08', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-mx-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-mx-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1046, '.-translate-x-full', 'classes/positioning/-translate-x-full', NULL, '2024-03-06 04:54:13', '2024-03-06 04:54:13', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform -translate-x-full p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform -translate-x-full p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1050, '.absolute', 'classes/positioning/absolute', NULL, '2024-03-06 04:54:14', '2024-03-06 04:54:14', '.absolute { 
    position: absolute;
}', '<div class="relative bg-gray-600 py-6">
  Relative
  <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
    Absolute
  </div>
</div>', '<div>
  <div class="relative bg-gray-600 py-6">
    Relative
    <div class="absolute bottom-0 left-0 bg-gray-800 p-4">
      Absolute
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1065, '.inset-x-full', 'classes/positioning/inset-x-full', NULL, '2024-03-06 04:54:19', '2024-03-06 04:54:19', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-x-full h-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-x-full h-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1068, '.inset-y-full', 'classes/positioning/inset-y-full', NULL, '2024-03-06 04:54:20', '2024-03-06 04:54:20', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-y-full w-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-y-full w-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1083, '.md:', 'classes/responsive/md:', NULL, '2024-03-06 04:54:25', '2024-03-06 04:54:25', '@media (min-width: 768px) {
    // styles
}', '<div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">Resize window</div>', '<div>
  <div class="bg-teal-400 sm:bg-red-400 md:bg-green-400 lg:bg-yellow-400 xl:bg-indigo-400 py-2 px-4 text-center">
    Resize window
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1086, '.ring', 'classes/ring/ring', NULL, '2024-03-06 04:54:26', '2024-03-06 04:54:26', NULL, '    <div class="ring px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1102, '.ring-offset-pink-100', 'classes/ring/ring-offset-pink-100', NULL, '2024-03-06 04:54:31', '2024-03-06 04:54:31', NULL, '    <div class="ring ring-offset-pink-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-pink-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1106, '.ring-offset-white', 'classes/ring/ring-offset-white', NULL, '2024-03-06 04:54:32', '2024-03-06 04:54:32', NULL, '    <div class="ring ring-offset-white ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-white ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1123, '.shadow-sm', 'classes/shadows/shadow-sm', NULL, '2024-03-06 04:54:39', '2024-03-06 04:54:39', '.shadow-sm { box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); }', '<div class="shadow-sm h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-sm h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1127, '.shadow-xl', 'classes/shadows/shadow-xl', NULL, '2024-03-06 04:54:40', '2024-03-06 04:54:40', '.shadow-xl { box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04); }', '<div class="shadow-xl h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-xl h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1147, '.table-header-group', 'classes/table/table-header-group', NULL, '2024-03-06 04:54:47', '2024-03-06 04:54:47', '.table-header-group {
    display: table-header-group;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (999, '.object-right-top', 'classes/positioning/object-right-top', NULL, '2024-03-06 04:53:57', '2024-03-07 17:51:08', '.object-right-top { object-position: right top; }', '<img class="object-right-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>', '<div>
  <img class="object-right-top object-none bg-gray-300 w-32 h-32 m-2 inline" src="/images/message.svg"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1010, '.-inset-0', 'classes/positioning/-inset-0', NULL, '2024-03-06 04:54:01', '2024-03-06 04:54:01', NULL, '    <div class="relative h-40">
        <div class="absolute -inset-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative h-40">
    <div class="absolute -inset-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1020, '.-m-px', 'classes/positioning/-m-px', NULL, '2024-03-06 04:54:04', '2024-03-06 04:54:04', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-m-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-m-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1033, '.-right-0', 'classes/positioning/-right-0', NULL, '2024-03-06 04:54:09', '2024-03-06 04:54:09', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -right-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -right-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1038, '.-skew-y-1', 'classes/positioning/-skew-y-1', NULL, '2024-03-06 04:54:11', '2024-03-06 04:54:11', NULL, '    <div class="bg-gray-300 h-32 w-32">
        <div class="transform -skew-y-1 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 h-32 w-32">
    <div class="transform -skew-y-1 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1058, '.bottom-auto', 'classes/positioning/bottom-auto', NULL, '2024-03-06 04:54:17', '2024-03-06 04:54:17', NULL, '    <div class="relative bg-gray-200 mx-auto w-36 h-20">
        <div class="absolute bottom-auto left-0 p-2 bg-teal-400 text-sm">bottom-auto</div>
    </div>', '<div>
  <div class="relative bg-gray-200 mx-auto w-36 h-20">
    <div class="absolute bottom-auto left-0 p-2 bg-teal-400 text-sm">
      bottom-auto
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1061, '.inset-1', 'classes/positioning/inset-1', NULL, '2024-03-06 04:54:18', '2024-03-06 04:54:18', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-1 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-1 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1077, '.top-full', 'classes/positioning/top-full', NULL, '2024-03-06 04:54:23', '2024-03-06 04:54:23', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute top-full h-4 w-full bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute top-full h-4 w-full bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1080, '.focus', 'classes/pseudo-class/focus', NULL, '2024-03-06 04:54:24', '2024-03-06 04:54:24', NULL, '<input class="bg-gray-200 border-2 border-teal-400 focus:border-teal-600 py-2 px-4" placeholder="Focus"/>', '<div>
  <input class="bg-gray-200 border-2 border-teal-400 focus:border-teal-600 py-2 px-4" placeholder="Focus"/>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1096, '.ring-offset-black', 'classes/ring/ring-offset-black', NULL, '2024-03-06 04:54:29', '2024-03-06 04:54:29', NULL, '    <div class="ring ring-offset-black ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-black ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1099, '.ring-offset-gray-100', 'classes/ring/ring-offset-gray-100', NULL, '2024-03-06 04:54:30', '2024-03-06 04:54:30', NULL, '    <div class="ring ring-offset-gray-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-gray-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1117, '.overscroll-x-contain', 'classes/scroll/overscroll-x-contain', NULL, '2024-03-06 04:54:37', '2024-03-06 04:54:37', NULL, '    <div class="max-w-xs">
        <p class="overscroll-x-contain overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-x-contain overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1121, '.overscroll-y-none', 'classes/scroll/overscroll-y-none', NULL, '2024-03-06 04:54:38', '2024-03-06 04:54:38', NULL, '    <div class="max-w-xs">
        <p class="overscroll-y-none overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-y-none overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1164, '.leading-snug', 'classes/text/leading-snug', NULL, '2024-03-06 04:54:53', '2024-03-06 04:54:53', '.leading-snug { line-height: 1.375; }', '<p class="leading-snug bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-snug bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1002, '.z-10+%25_F+.z-*', 'classes/positioning/z-10+%25_F+.z-*', NULL, '2024-03-06 04:53:58', '2024-03-06 04:53:58', '.z-0 { z-index: 0; }
.z-10 { z-index: 10; }
.z-20 { z-index: 20; }
.z-30 { z-index: 30; }
.z-40 { z-index: 40; }
.z-50 { z-index: 50; }
.z-auto { z-index: auto; }', '<div class="relative">
    <div class="z-auto absolute t-0 l-0 ml-10 mt-10 bg-teal-800 h-8 w-8"></div>
    <div class="z-40 absolute t-0 l-0 ml-0 mt-0 bg-teal-300 h-8 w-8"></div>
    <div class="z-30 absolute t-0 l-0 ml-2 mt-2 bg-teal-400 h-8 w-8"></div>
    <div class="z-20 absolute t-0 l-0 ml-4 mt-4 bg-teal-500 h-8 w-8"></div>
    <div class="z-10 absolute t-0 l-0 ml-6 mt-6 bg-teal-600 h-8 w-8"></div>
    <div class="z-0 absolute t-0 l-0 ml-8 mt-8 bg-teal-700 h-8 w-8"></div>
</div>', '<div>
  <div class="relative">
    <div class="z-auto absolute t-0 l-0 ml-10 mt-10 bg-teal-800 h-8 w-8">
    </div>
    <div class="z-40 absolute t-0 l-0 ml-0 mt-0 bg-teal-300 h-8 w-8">
    </div>
    <div class="z-30 absolute t-0 l-0 ml-2 mt-2 bg-teal-400 h-8 w-8">
    </div>
    <div class="z-20 absolute t-0 l-0 ml-4 mt-4 bg-teal-500 h-8 w-8">
    </div>
    <div class="z-10 absolute t-0 l-0 ml-6 mt-6 bg-teal-600 h-8 w-8">
    </div>
    <div class="z-0 absolute t-0 l-0 ml-8 mt-8 bg-teal-700 h-8 w-8">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1011, '.-inset-px', 'classes/positioning/-inset-px', NULL, '2024-03-06 04:54:01', '2024-03-06 04:54:01', NULL, '    <div class="relative h-40 inline-block relative bg-gray-100 w-24 h-24">
        <div class="absolute -inset-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative h-40 inline-block relative bg-gray-100 w-24 h-24">
    <div class="absolute -inset-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1021, '.-mb-0', 'classes/positioning/-mb-0', NULL, '2024-03-06 04:54:04', '2024-03-06 04:54:04', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute bottom-0 left-0 -mb-0 p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute bottom-0 left-0 -mb-0 p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1034, '.-right-full', 'classes/positioning/-right-full', NULL, '2024-03-06 04:54:09', '2024-03-06 04:54:09', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 -right-full p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 -right-full p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1042, '.-space-y-px', 'classes/positioning/-space-y-px', NULL, '2024-03-06 04:54:12', '2024-03-06 04:54:12', NULL, '    <div class="flex flex-col -space-y-px h-40">
        <div class="p-4 bg-teal-400 h-10 w-24 text-sm">1</div>
        <div class="p-4 bg-yellow-400 h-10 w-20 text-sm">2</div>
        <div class="p-4 bg-purple-400 h-10 w-12 text-sm">3</div>
    </div>', '<div>
  <div class="flex flex-col -space-y-px h-40">
    <div class="p-4 bg-teal-400 h-10 w-24 text-sm">
      1
    </div>
    <div class="p-4 bg-yellow-400 h-10 w-20 text-sm">
      2
    </div>
    <div class="p-4 bg-purple-400 h-10 w-12 text-sm">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1052, '.align-bottom', 'classes/positioning/align-bottom', NULL, '2024-03-06 04:54:15', '2024-03-06 04:54:15', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-bottom bg-teal-400 text-sm">align-bottom</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-bottom bg-teal-400 text-sm">
      align-bottom
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1055, '.align-text-top', 'classes/positioning/align-text-top', NULL, '2024-03-06 04:54:16', '2024-03-06 04:54:16', NULL, '    <div class="bg-gray-300">
        <span class="inline-block align-text-top bg-teal-400 text-sm">align-text-top</span>
    </div>', '<div>
  <div class="bg-gray-300">
    <span class="inline-block align-text-top bg-teal-400 text-sm">
      align-text-top
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1071, '.left-full', 'classes/positioning/left-full', NULL, '2024-03-06 04:54:21', '2024-03-06 04:54:21', NULL, '    <div class="relative bg-gray-300 mx-auto h-20 w-36">
        <div class="absolute top-0 left-full p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="relative bg-gray-300 mx-auto h-20 w-36">
    <div class="absolute top-0 left-full p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1074, '.right-auto', 'classes/positioning/right-auto', NULL, '2024-03-06 04:54:22', '2024-03-06 04:54:22', NULL, '    <div class="relative h-16 w-16 bg-gray-400 m-2">
        <div class="absolute right-auto h-full w-4 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-16 w-16 bg-gray-400 m-2">
    <div class="absolute right-auto h-full w-4 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1090, '.ring-current', 'classes/ring/ring-current', NULL, '2024-03-06 04:54:28', '2024-03-06 04:54:28', NULL, '    <div class="ring-current ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-current ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1093, '.ring-inding-100', 'classes/ring/ring-inding-100', NULL, '2024-03-06 04:54:28', '2024-03-06 04:54:28', NULL, '    <div class="ring-indigo-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-indigo-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1109, '.ring-pink-100', 'classes/ring/ring-pink-100', NULL, '2024-03-06 04:54:33', '2024-03-06 04:54:33', NULL, '    <div class="ring-pink-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-pink-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1115, '.overscroll-contain', 'classes/scroll/overscroll-contain', NULL, '2024-03-06 04:54:36', '2024-03-06 04:54:36', NULL, '   <div class="max-w-md">
       <p class="overscroll-contain overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
   </div>', '<div>
  <div class="max-w-md">
    <p class="overscroll-contain overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1129, '.shadow-inner', 'classes/shadows/shadow-inner', NULL, '2024-03-06 04:54:41', '2024-03-06 04:54:41', '.shadow-inner { box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06); }', '<div class="shadow-inner h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-inner h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1166, '.leading-relaxed', 'classes/text/leading-relaxed', NULL, '2024-03-06 04:54:54', '2024-03-06 04:54:54', '.leading-relaxed { line-height: 1.625; }', '<p class="leading-relaxed bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-relaxed bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1024, '.-ml-px', 'classes/positioning/-ml-px', NULL, '2024-03-06 04:54:05', '2024-03-06 04:54:05', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-36">
        <div class="-ml-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-36">
    <div class="-ml-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1031, '.-my-0', 'classes/positioning/-my-0', NULL, '2024-03-06 04:54:08', '2024-03-06 04:54:08', NULL, '    <div class="bg-gray-300 mx-auto h-20 w-40">
        <div class="-my-0 p-6 mx-auto w-2/3 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-20 w-40">
    <div class="-my-0 p-6 mx-auto w-2/3 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1041, '.-space-y-0', 'classes/positioning/-space-y-0', NULL, '2024-03-06 04:54:11', '2024-03-06 04:54:11', NULL, '    <div class="flex flex-col -space-y-0 h-40">
        <div class="p-4 bg-teal-400 h-10 w-24 text-sm">1</div>
        <div class="p-4 bg-yellow-400 h-10 w-20 text-sm">2</div>
        <div class="p-4 bg-purple-400 h-10 w-12 text-sm">3</div>
    </div>', '<div>
  <div class="flex flex-col -space-y-0 h-40">
    <div class="p-4 bg-teal-400 h-10 w-24 text-sm">
      1
    </div>
    <div class="p-4 bg-yellow-400 h-10 w-20 text-sm">
      2
    </div>
    <div class="p-4 bg-purple-400 h-10 w-12 text-sm">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1047, '.-translate-x-px', 'classes/positioning/-translate-x-px', NULL, '2024-03-06 04:54:14', '2024-03-06 04:54:14', NULL, '    <div class="bg-gray-300 mx-auto h-32 w-32">
        <div class="transform -translate-x-px p-6 bg-teal-400 text-sm"></div>
    </div>', '<div>
  <div class="bg-gray-300 mx-auto h-32 w-32">
    <div class="transform -translate-x-px p-6 bg-teal-400 text-sm">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1064, '.inset-x-1', 'classes/positioning/inset-x-1', NULL, '2024-03-06 04:54:19', '2024-03-06 04:54:19', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-x-1 h-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-x-1 h-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1067, '.inset-y-1', 'classes/positioning/inset-y-1', NULL, '2024-03-06 04:54:20', '2024-03-06 04:54:20', NULL, '    <div class="relative h-32 w-32 bg-gray-400 m-2">
        <div class="absolute inset-y-1 w-10 bg-teal-400"></div>
    </div>', '<div>
  <div class="relative h-32 w-32 bg-gray-400 m-2">
    <div class="absolute inset-y-1 w-10 bg-teal-400">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1087, '.ring-0', 'classes/ring/ring-0', NULL, '2024-03-06 04:54:26', '2024-03-06 04:54:26', NULL, '    <div class="ring-0 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-0 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1103, '.ring-offset-purple-100', 'classes/ring/ring-offset-purple-100', NULL, '2024-03-06 04:54:31', '2024-03-06 04:54:31', NULL, '    <div class="ring ring-offset-purple-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring ring-offset-purple-100 ring-blue-400 ring-offset-4 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1110, '.ring-purple-100', 'classes/ring/ring-purple-100', NULL, '2024-03-06 04:54:34', '2024-03-06 04:54:34', NULL, '    <div class="ring-purple-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">Button</div>', '<div>
  <div class="ring-purple-100 ring-2 px-4 py-2 inline-block text-white font-semibold bg-teal-400 rounded">
    Button
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1124, '.shadow', 'classes/shadows/shadow', NULL, '2024-03-06 04:54:39', '2024-03-06 04:54:39', '.shadow { box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06); }', '<div class="shadow h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1131, '.shadow-none', 'classes/shadows/shadow-none', NULL, '2024-03-06 04:54:42', '2024-03-06 04:54:42', '.shadow-none { box-shadow: none; }', '<div class="shadow-none h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-none h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1141, '.table', 'classes/table/table', NULL, '2024-03-06 04:54:45', '2024-03-06 04:54:45', '.table {
    display: table;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1145, '.table-column-group', 'classes/table/table-column-group', NULL, '2024-03-06 04:54:47', '2024-03-06 04:54:47', '.table-column-group {
    display: table-column-group;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1119, '.overscroll-y-auto', 'classes/scroll/overscroll-y-auto', NULL, '2024-03-06 04:54:37', '2024-03-06 04:54:37', NULL, '    <div class="max-w-xs">
        <p class="overscroll-y-auto overflow-auto h-20 p-2 bg-gray-200">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.</p>
    </div>', '<div>
  <div class="max-w-xs">
    <p class="overscroll-y-auto overflow-auto h-20 p-2 bg-gray-200">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam deserunt eveniet assumenda est! Voluptatum temporibus voluptate praesentium officiis animi asperiores iste! Dolorem quod tempore laborum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos perspiciatis fugit, pariatur odit non vero iusto necessitatibus officiis sequi explicabo exercitationem error quod iste ipsum.
    </p>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1126, '.shadow-lg', 'classes/shadows/shadow-lg', NULL, '2024-03-06 04:54:40', '2024-03-06 04:54:40', '.shadow-lg { box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); }', '<div class="shadow-lg h-16 w-16 m-4 bg-teal-400 inline-flex"></div>', '<div>
  <div class="shadow-lg h-16 w-16 m-4 bg-teal-400 inline-flex">
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1146, '.table-footer-group', 'classes/table/table-footer-group', NULL, '2024-03-06 04:54:47', '2024-03-06 04:54:47', '.table-footer-group {
    display: table-footer-group;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (982, '.clear-right', 'classes/positioning/clear-right', NULL, '2024-03-06 04:53:51', '2024-03-09 18:03:46', '.clear-right {
    clear: right;
}', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-right">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-right">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1133, '.space-x-1+%25_F+.space-x-*', 'classes/spacing/space-x-1+%25_F+.space-x-*', NULL, '2024-03-06 04:54:42', '2024-03-06 04:54:42', '.space-x-0 { margin-left: 0; }
.space-x-1 { margin-left: 0.25rem; }
.space-x-2 { margin-left: 0.5rem; }
.space-x-3 { margin-left: 0.75rem; }
.space-x-4 { margin-left: 1rem; }
.space-x-5 { margin-left: 1.25rem; }
.space-x-6 { margin-left: 1.5rem; }
.space-x-8 { margin-left: 2rem; }
.space-x-10 { margin-left: 2.5rem; }
.space-x-12 { margin-left: 3rem; }
.space-x-16 { margin-left: 4rem; }
.space-x-20 { margin-left: 5rem; }
.space-x-24 { margin-left: 6rem; }
.space-x-32 { margin-left: 8rem; }
.space-x-40 { margin-left: 10rem; }
.space-x-48 { margin-left: 12rem; }
.space-x-56 { margin-left: 14rem; }
.space-x-64 { margin-left: 16rem; }
.space-x-px { margin-left: 1px; }', '<div class="space-x-0 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-x-4 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-x-12 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-x-48 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>', '<div>
  <div class="space-x-0 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-x-4 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-x-12 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-x-48 bg-gray-300 m-2 flex">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (983, '.clear-both', 'classes/positioning/clear-both', NULL, '2024-03-06 04:53:52', '2024-03-09 18:03:46', '.clear-both {
    clear: both;
}', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-both">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-both">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1134, '.space-y-1+%25_F+.space-y-*', 'classes/spacing/space-y-1+%25_F+.space-y-*', NULL, '2024-03-06 04:54:43', '2024-03-06 04:54:43', '.space-y-0 { margin-top: 0; }
.space-y-1 { margin-top: 0.25rem; }
.space-y-2 { margin-top: 0.5rem; }
.space-y-3 { margin-top: 0.75rem; }
.space-y-4 { margin-top: 1rem; }
.space-y-5 { margin-top: 1.25rem; }
.space-y-6 { margin-top: 1.5rem; }
.space-y-8 { margin-top: 2rem; }
.space-y-10 { margin-top: 2.5rem; }
.space-y-12 { margin-top: 3rem; }
.space-y-16 { margin-top: 4rem; }
.space-y-20 { margin-top: 5rem; }
.space-y-24 { margin-top: 6rem; }
.space-y-32 { margin-top: 8rem; }
.space-y-40 { margin-top: 10rem; }
.space-y-48 { margin-top: 12rem; }
.space-y-56 { margin-top: 14rem; }
.space-y-64 { margin-top: 16rem; }
.space-y-px { margin-top: 1px; }', '<div class="space-y-0 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-y-4 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-y-12 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>
<div class="space-y-px bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
    <div class="bg-teal-400 h-6 w-6"></div>
</div>', '<div>
  <div class="space-y-0 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-y-4 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-y-12 bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
  <div class="space-y-px bg-gray-300 m-2 h-64 inline-flex flex-col">
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
    <div class="bg-teal-400 h-6 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1139, '.stroke-current', 'classes/svg/stroke-current', NULL, '2024-03-06 04:54:44', '2024-03-06 04:54:44', '.stroke-current {
    stroke: currentColor;
}', '<svg class="stroke-current text-teal-400 h-12 w-12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2"></circle>
    <circle cx="20" cy="21" r="2"></circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1"></path>
</svg>', '<div>
  <svg class="stroke-current text-teal-400 h-12 w-12" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2">
    </circle>
    <circle cx="20" cy="21" r="2">
    </circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1">
    </path>
  </svg>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (984, '.clear-none', 'classes/positioning/clear-none', NULL, '2024-03-06 04:53:52', '2024-03-09 18:03:46', '.clear-none {
    clear: none;
}', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-none">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-none">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1135, '.-space-x-1+%25_F+.-space-x-*', 'classes/spacing/-space-x-1+%25_F+.-space-x-*', NULL, '2024-03-06 04:54:43', '2024-03-06 04:54:43', '.-space-x-1 { margin-left: -0.25rem; }
.-space-x-2 { margin-left: -0.5rem; }
.-space-x-3 { margin-left: -0.75rem; }
.-space-x-4 { margin-left: -1rem; }
.-space-x-5 { margin-left: -1.25rem; }
.-space-x-6 { margin-left: -1.5rem; }
.-space-x-8 { margin-left: -2rem; }
.-space-x-10 { margin-left: -2.5rem; }
.-space-x-12 { margin-left: -3rem; }
.-space-x-16 { margin-left: -4rem; }
.-space-x-20 { margin-left: -5rem; }
.-space-x-24 { margin-left: -6rem; }
.-space-x-32 { margin-left: -8rem; }
.-space-x-40 { margin-left: -10rem; }
.-space-x-48 { margin-left: -12rem; }
.-space-x-56 { margin-left: -14rem; }
.-space-x-64 { margin-left: -16rem; }
.-space-x-px { margin-left: -1px; }', '<div class="-space-x-12 bg-gray-300 m-2 flex">
    <div class="bg-teal-200 h-6 w-32"></div>
    <div class="bg-teal-400 h-6 w-24"></div>
    <div class="bg-teal-600 h-6 w-12"></div>
</div>', '<div>
  <div class="-space-x-12 bg-gray-300 m-2 flex">
    <div class="bg-teal-200 h-6 w-32">
    </div>
    <div class="bg-teal-400 h-6 w-24">
    </div>
    <div class="bg-teal-600 h-6 w-12">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1142, '.table-caption', 'classes/table/table-caption', NULL, '2024-03-06 04:54:46', '2024-03-06 04:54:46', '.table-caption {
    display: table-caption;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1001, '.object-contain+%25_F+.object-*', 'classes/positioning/object-contain+%25_F+.object-*', NULL, '2024-03-06 04:53:58', '2024-03-07 17:51:08', '.object-contain { object-fit: contain; }
.object-cover { object-fit: cover; }
.object-fill { object-fit: fill; }
.object-none { object-fit: none; }
.object-scale-down { object-fit: scale-down; }', '<div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-cointain h-24 w-full" src="/images/message.svg"/>
</div>

<div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-cover h-24 w-full" src="/images/message.svg"/>
</div>

<div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-fill h-24 w-full" src="/images/message.svg"/>
</div>

<div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-none h-24 w-full" src="/images/message.svg"/>
</div>

<div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-scale-down h-24 w-full" src="/images/message.svg"/>
</div>', '<div>
  <div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-cointain h-24 w-full" src="/images/message.svg"/>
  </div>
  <div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-cover h-24 w-full" src="/images/message.svg"/>
  </div>
  <div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-fill h-24 w-full" src="/images/message.svg"/>
  </div>
  <div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-none h-24 w-full" src="/images/message.svg"/>
  </div>
  <div class="bg-gray-300 w-64 m-2 inline-flex justify-center">
    <img class="object-scale-down h-24 w-full" src="/images/message.svg"/>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1136, '.-space-y-1+%25_F+.-space-y-*', 'classes/spacing/-space-y-1+%25_F+.-space-y-*', NULL, '2024-03-06 04:54:43', '2024-03-06 04:54:43', '.-space-y-1 { margin-top: -0.25rem; }
.-space-y-2 { margin-top: -0.5rem; }
.-space-y-3 { margin-top: -0.75rem; }
.-space-y-4 { margin-top: -1rem; }
.-space-y-5 { margin-top: -1.25rem; }
.-space-y-6 { margin-top: -1.5rem; }
.-space-y-8 { margin-top: -2rem; }
.-space-y-10 { margin-top: -2.5rem; }
.-space-y-12 { margin-top: -3rem; }
.-space-y-16 { margin-top: -4rem; }
.-space-y-20 { margin-top: -5rem; }
.-space-y-24 { margin-top: -6rem; }
.-space-y-32 { margin-top: -8rem; }
.-space-y-40 { margin-top: -10rem; }
.-space-y-48 { margin-top: -12rem; }
.-space-y-56 { margin-top: -14rem; }
.-space-y-64 { margin-top: -16rem; }
.-space-y-px { margin-top: -1px; }', '<div class="-space-y-12 h-64 bg-gray-300 m-2 inline-flex flex-col">
    <div class="bg-teal-200 h-32 w-6"></div>
    <div class="bg-teal-400 h-24 w-6"></div>
    <div class="bg-teal-600 h-12 w-6"></div>
</div>', '<div>
  <div class="-space-y-12 h-64 bg-gray-300 m-2 inline-flex flex-col">
    <div class="bg-teal-200 h-32 w-6">
    </div>
    <div class="bg-teal-400 h-24 w-6">
    </div>
    <div class="bg-teal-600 h-12 w-6">
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1143, '.table-cell', 'classes/table/table-cell', NULL, '2024-03-06 04:54:46', '2024-03-06 04:54:46', '.table-cell {
    display: table-cell;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (981, '.clear-left', 'classes/positioning/clear-left', NULL, '2024-03-06 04:53:51', '2024-03-09 18:03:46', '.clear-left {
    clear: left;
}', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>', '<div class="p-4">
  <img class="float-left mr-4 my-2 h-24" src="/images/office.jpg">
  <img class="float-right ml-4 my-2 h-32" src="/images/office.jpg">
  <p class="clear-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur ante. Cras convallis risus vel vehicula dapibus. Donec eget neque fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est, et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere, vitae sollicitudin mi consequat.</p>
</div>');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1612, '.mb-56', 'classes/margins/mb-56', NULL, '2024-03-09 18:07:52', '2024-03-09 18:07:52', '.mb-56 { margin-bottom: 14rem; }', '<span class="mb-56 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-56 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1615, '.mb-px', 'classes/margins/mb-px', NULL, '2024-03-09 18:07:53', '2024-03-09 18:07:53', '.mb-px { margin-bottom: 1px; }', '<span class="mb-px inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-px inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1621, '.mr-5', 'classes/margins/mr-5', NULL, '2024-03-09 18:07:55', '2024-03-09 18:07:55', '.mr-5 { margin-right: 1.25rem; }', '<span class="mr-5 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-5 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1137, '.space-x-reverse+%25_F+.space-y-reverse', 'classes/spacing/space-x-reverse+%25_F+.space-y-reverse', NULL, '2024-03-06 04:54:44', '2024-03-06 04:54:44', '.space-x-reverse { --space-x-reverse: 1 }
.space-y-reverse { --space-y-reverse: 1 }', '<div class="space-x-reverse space-x-4 bg-gray-300 m-2 inline-flex text-center flex-row-reverse">
    <div class="bg-teal-200 h-6 w-6">1</div>
    <div class="bg-teal-400 h-6 w-6">2</div>
    <div class="bg-teal-600 h-6 w-6">3</div>
</div>

<div class="space-y-reverse space-y-4 bg-gray-300 m-2 inline-flex text-center flex-col-reverse">
    <div class="bg-teal-200 h-6 w-6">1</div>
    <div class="bg-teal-400 h-6 w-6">2</div>
    <div class="bg-teal-600 h-6 w-6">3</div>
</div>', '<div>
  <div class="space-x-reverse space-x-4 bg-gray-300 m-2 inline-flex text-center flex-row-reverse">
    <div class="bg-teal-200 h-6 w-6">
      1
    </div>
    <div class="bg-teal-400 h-6 w-6">
      2
    </div>
    <div class="bg-teal-600 h-6 w-6">
      3
    </div>
  </div>
  <div class="space-y-reverse space-y-4 bg-gray-300 m-2 inline-flex text-center flex-col-reverse">
    <div class="bg-teal-200 h-6 w-6">
      1
    </div>
    <div class="bg-teal-400 h-6 w-6">
      2
    </div>
    <div class="bg-teal-600 h-6 w-6">
      3
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1602, '.mb-6', 'classes/margins/mb-6', NULL, '2024-03-09 18:07:48', '2024-03-09 18:07:48', '.mb-6 { margin-bottom: 1.5rem; }', '<span class="mb-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1620, '.mr-4', 'classes/margins/mr-4', NULL, '2024-03-09 18:07:54', '2024-03-09 18:07:54', '.mr-4 { margin-right: 1rem; }', '<span class="mr-4 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-4 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1140, '.stroke-0+%25_F+.stroke-*', 'classes/svg/stroke-0+%25_F+.stroke-*', NULL, '2024-03-06 04:54:45', '2024-03-06 04:54:45', '.stroke-0 { stroke-width: 0; }
.stroke-1 { stroke-width: 1; }
.stroke-2 { stroke-width: 2; }', '<svg class="stroke-0 stroke-current text-teal-400 inline h-12 w-12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2"></circle>
    <circle cx="20" cy="21" r="2"></circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1"></path>
</svg>
<svg class="stroke-1 stroke-current text-teal-400 inline h-12 w-12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2"></circle>
    <circle cx="20" cy="21" r="2"></circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1"></path>
</svg>
<svg class="stroke-2 stroke-current text-teal-400 inline h-12 w-12" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2"></circle>
    <circle cx="20" cy="21" r="2"></circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1"></path>
</svg>', '<div>
  <svg class="stroke-0 stroke-current text-teal-400 inline h-12 w-12" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2">
    </circle>
    <circle cx="20" cy="21" r="2">
    </circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1">
    </path>
  </svg>
  <svg class="stroke-1 stroke-current text-teal-400 inline h-12 w-12" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2">
    </circle>
    <circle cx="20" cy="21" r="2">
    </circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1">
    </path>
  </svg>
  <svg class="stroke-2 stroke-current text-teal-400 inline h-12 w-12" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="8" cy="21" r="2">
    </circle>
    <circle cx="20" cy="21" r="2">
    </circle>
    <path d="M5.67 6H23l-1.68 8.39a2 2 0 0 1-2 1.61H8.75a2 2 0 0 1-2-1.74L5.23 2.74A2 2 0 0 0 3.25 1H1">
    </path>
  </svg>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1144, '.table-column', 'classes/table/table-column', NULL, '2024-03-06 04:54:46', '2024-03-06 04:54:46', '.table-column {
    display: table-column;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1148, '.table-row-group', 'classes/table/table-row-group', NULL, '2024-03-06 04:54:48', '2024-03-06 04:54:48', '.table-row-group {
    display: table-row-group;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1149, '.table-row', 'classes/table/table-row', NULL, '2024-03-06 04:54:48', '2024-03-06 04:54:48', '.table-row {
    display: table-row;
}', '<div class="bg-gray-400 p-2 table">
  <div class="table-caption">Description</div>
  <div class="table-header-group">
    <div class="table-cell bg-teal-400">One Header</div>
    <div class="table-cell bg-teal-400">Two Header</div>
  </div>
  <div class="table-column-group">
    <div class="table-colum bg-teal-400">One Column</div>
    <div class="table-colum bg-teal-400">Two Column</div>
  </div>
  <div class="table-row-group">
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
    <div class="table-row">
      <div class="table-cell bg-teal-400">One Data</div>
      <div class="table-cell bg-teal-400">Two Data</div>
    </div>
  </div>
  <div class="table-footer-group">
    <div class="table-cell bg-teal-400">One Footer</div>
    <div class="table-cell bg-teal-400">One Footer</div>
  </div>
</div>', '<div>
  <div class="bg-gray-400 p-2 table">
    <div class="table-caption">
      Description
    </div>
    <div class="table-header-group">
      <div class="table-cell bg-teal-400">
        One Header
      </div>
      <div class="table-cell bg-teal-400">
        Two Header
      </div>
    </div>
    <div class="table-column-group">
      <div class="table-colum bg-teal-400">
        One Column
      </div>
      <div class="table-colum bg-teal-400">
        Two Column
      </div>
    </div>
    <div class="table-row-group">
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
      <div class="table-row">
        <div class="table-cell bg-teal-400">
          One Data
        </div>
        <div class="table-cell bg-teal-400">
          Two Data
        </div>
      </div>
    </div>
    <div class="table-footer-group">
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
      <div class="table-cell bg-teal-400">
        One Footer
      </div>
    </div>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1150, '.table-auto+%25_F+.table-fixed', 'classes/table/table-auto+%25_F+.table-fixed', NULL, '2024-03-06 04:54:48', '2024-03-06 04:54:48', '.table-auto { table-layout: auto; }
.table-fixed { table-layout: fixed; }', '<table class="table-auto">
  <thead>
    <tr>
      <th class="px-4 py-2">Header 1</th>
      <th class="px-4 py-2">Header 2</th>
      <th class="px-4 py-2">Header 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="border px-4 py-2">Lorem ipsum dolor sit amet</td>
      <td class="border px-4 py-2">Lorem</td>
      <td class="border px-4 py-2">Lorem</td>
    </tr>
    <tr class="bg-gray-100">
      <td class="border px-4 py-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Morbi eget augue consequat dolor posuere dignissim.
        Duis libero purus, sodales eget erat in, condimentum placerat orci.</td>
      <td class="border px-4 py-2">Lorem</td>
      <td class="border px-4 py-2">Lorem</td>
    </tr>
  </tbody>
</table>

<table class="table-fixed">
  <thead>
    <tr>
      <th class="w-1/2 px-4 py-2">Header 1</th>
      <th class="w-1/4 px-4 py-2">Header 2</th>
      <th class="w-1/4 px-4 py-2">Header 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="border px-4 py-2">Lorem ipsum dolor sit amet</td>
      <td class="border px-4 py-2">Lorem</td>
      <td class="border px-4 py-2">Lorem</td>
    </tr>
    <tr class="bg-gray-100">
      <td class="border px-4 py-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Morbi eget augue consequat dolor posuere dignissim.
        Duis libero purus, sodales eget erat in, condimentum placerat orci.</td>
      <td class="border px-4 py-2">Lorem</td>
      <td class="border px-4 py-2">Lorem</td>
    </tr>
  </tbody>
</table>', '<div>
  <table class="table-auto">
    <thead>
      <tr>
        <th class="px-4 py-2">
          Header 1
        </th>
        <th class="px-4 py-2">
          Header 2
        </th>
        <th class="px-4 py-2">
          Header 3
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="border px-4 py-2">
          Lorem ipsum dolor sit amet
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
      </tr>
      <tr class="bg-gray-100">
        <td class="border px-4 py-2">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Morbi eget augue consequat dolor posuere dignissim.
        Duis libero purus, sodales eget erat in, condimentum placerat orci.
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
      </tr>
    </tbody>
  </table>
  <table class="table-fixed">
    <thead>
      <tr>
        <th class="w-1/2 px-4 py-2">
          Header 1
        </th>
        <th class="w-1/4 px-4 py-2">
          Header 2
        </th>
        <th class="w-1/4 px-4 py-2">
          Header 3
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="border px-4 py-2">
          Lorem ipsum dolor sit amet
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
      </tr>
      <tr class="bg-gray-100">
        <td class="border px-4 py-2">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Morbi eget augue consequat dolor posuere dignissim.
        Duis libero purus, sodales eget erat in, condimentum placerat orci.
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
        <td class="border px-4 py-2">
          Lorem
        </td>
      </tr>
    </tbody>
  </table>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1151, '.antialiased', 'classes/text/antialiased', NULL, '2024-03-06 04:54:49', '2024-03-06 04:54:49', '.antialiased {
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}', '<p class="antialiased">Lorem Ipsum is simply dummy text of the printing ...</p>', '<div>
  <p class="antialiased">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1152, '.subpixel-antialiased', 'classes/text/subpixel-antialiased', NULL, '2024-03-06 04:54:49', '2024-03-06 04:54:49', '.subpixel-antialiased {
    -webkit-font-smoothing: auto;
    -moz-osx-font-smoothing: auto;
}', '<p class="subpixel-antialiased">Lorem Ipsum is simply dummy text of the printing ...</p>', '<div>
  <p class="subpixel-antialiased">
    Lorem Ipsum is simply dummy text of the printing ...
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1163, '.leading-tight', 'classes/text/leading-tight', NULL, '2024-03-06 04:54:53', '2024-03-06 04:54:53', '.leading-tight { line-height: 1.25; }', '<p class="leading-tight bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-tight bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1155, '.break-words', 'classes/text/break-words', NULL, '2024-03-06 04:54:50', '2024-03-06 04:54:50', '.break-words {
    overflow-wrap: break-word;
}', '<div class="h-32 w-64 bg-gray-200 m-2">
  <span class="break-words">Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis.
  </span>
</div>', '<div>
  <div class="h-32 w-64 bg-gray-200 m-2">
    <span class="break-words">
      Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis.
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1170, '.leading-5', 'classes/text/leading-5', NULL, '2024-03-06 04:54:55', '2024-03-06 04:54:55', '.leading-5 { line-height: 1.25rem; }', '<p class="leading-5 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-5 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1173, '.leading-8', 'classes/text/leading-8', NULL, '2024-03-06 04:54:56', '2024-03-06 04:54:56', '.leading-8 { line-height: 2rem; }', '<p class="leading-8 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-8 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1200, '.font-mono', 'classes/text/font-mono', NULL, '2024-03-06 04:55:07', '2024-03-06 04:55:07', '.font-mono {
  font-family: Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
}', '<p class="font-mono">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-mono">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1208, '.tracking-tighter', 'classes/text/tracking-tighter', NULL, '2024-03-06 04:55:10', '2024-03-06 04:55:10', '.tracking-tighter { letter-spacing: -0.05em; }', '<div class="tracking-tighter">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-tighter">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1217, '.text-white', 'classes/text-color/text-white', NULL, '2024-03-06 04:55:13', '2024-03-06 04:55:13', '.text-white { color: #fff; }', '<div class="text-white">Text</div>', '<div>
  <div class="text-white">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1229, '.text-red-300', 'classes/text-color/text-red-300', NULL, '2024-03-06 04:55:18', '2024-03-06 04:55:18', '.text-red-300 { color: #feb2b2; }', '<div class="text-red-300">Text</div>', '<div>
  <div class="text-red-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1235, '.text-red-900', 'classes/text-color/text-red-900', NULL, '2024-03-06 04:55:21', '2024-03-06 04:55:21', '.text-red-900 { color: #742a2a; }', '<div class="text-red-900">Text</div>', '<div>
  <div class="text-red-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1253, '.text-yellow-900', 'classes/text-color/text-yellow-900', NULL, '2024-03-06 04:55:28', '2024-03-06 04:55:28', '.text-yellow-900 { color: #744210; }', '<div class="text-yellow-900">Text</div>', '<div>
  <div class="text-yellow-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1257, '.text-green-400', 'classes/text-color/text-green-400', NULL, '2024-03-06 04:55:29', '2024-03-06 04:55:29', '.text-green-400 { color: #68d391; }', '<div class="text-green-400">Text</div>', '<div>
  <div class="text-green-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1270, '.text-teal-800', 'classes/text-color/text-teal-800', NULL, '2024-03-06 04:55:34', '2024-03-06 04:55:34', '.text-teal-800 { color: #285e61; }', '<div class="text-teal-800">Text</div>', '<div>
  <div class="text-teal-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1272, '.text-blue-100', 'classes/text-color/text-blue-100', NULL, '2024-03-06 04:55:35', '2024-03-06 04:55:35', '.text-blue-100 { color: #ebf8ff; }', '<div class="text-blue-100">Text</div>', '<div>
  <div class="text-blue-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1282, '.text-indigo-200', 'classes/text-color/text-indigo-200', NULL, '2024-03-06 04:55:39', '2024-03-06 04:55:39', '.text-indigo-200 { color: #c3dafe; }', '<div class="text-indigo-200">Text</div>', '<div>
  <div class="text-indigo-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1288, '.text-indigo-800', 'classes/text-color/text-indigo-800', NULL, '2024-03-06 04:55:42', '2024-03-06 04:55:42', '.text-indigo-800 { color: #434190; }', '<div class="text-indigo-800">Text</div>', '<div>
  <div class="text-indigo-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1300, '.text-pink-200', 'classes/text-color/text-pink-200', NULL, '2024-03-06 04:55:46', '2024-03-06 04:55:46', '.text-pink-200 { color: #fed7e2; }', '<div class="text-pink-200">Text</div>', '<div>
  <div class="text-pink-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1603, '.mb-8', 'classes/margins/mb-8', NULL, '2024-03-09 18:07:49', '2024-03-09 18:07:49', '.mb-8 { margin-bottom: 2rem; }', '<span class="mb-8 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-8 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1617, '.mr-1', 'classes/margins/mr-1', NULL, '2024-03-09 18:07:53', '2024-03-09 18:07:53', '.mr-1 { margin-right: 0.25rem; }', '<span class="mr-1 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-1 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1619, '.mr-3', 'classes/margins/mr-3', NULL, '2024-03-09 18:07:54', '2024-03-09 18:07:54', '.mr-3 { margin-right: 0.75rem; }', '<span class="mr-3 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-3 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1156, '.break-all', 'classes/text/break-all', NULL, '2024-03-06 04:54:50', '2024-03-06 04:54:50', '.break-all {
    word-break: break-all;
}', '<div class="h-32 w-64 bg-gray-200 m-2">
  <span class="break-all">Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies rutrum, sed malesuada.
  </span>
</div>', '<div>
  <div class="h-32 w-64 bg-gray-200 m-2">
    <span class="break-all">
      Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies rutrum, sed malesuada.
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1157, '.truncate', 'classes/text/truncate', NULL, '2024-03-06 04:54:51', '2024-03-06 04:54:51', '.truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}', '<div class="w-64 bg-gray-200 m-2 truncate">
  <span>Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies rutrum, sed malesuada.
  </span>
</div>', '<div>
  <div class="w-64 bg-gray-200 m-2 truncate">
    <span>
      Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Pellentesque 
    justopurusulputateipsumgetsuereacilisisberoroiet pulvinar 
    felis. Vivamus ultricies rutrum, sed malesuada.
    </span>
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1158, '.uppercase', 'classes/text/uppercase', NULL, '2024-03-06 04:54:51', '2024-03-06 04:54:51', '.uppercase {
    text-transform: uppercase;
}', '<span class="uppercase">Lorem ipsum dolor sit amet, consectetur</span>', '<div>
  <span class="uppercase">
    Lorem ipsum dolor sit amet, consectetur
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1159, '.lowercase', 'classes/text/lowercase', NULL, '2024-03-06 04:54:52', '2024-03-06 04:54:52', '.lowercase {
    text-transform: lowercase;
}', '<span class="lowercase">Lorem ipSUm dolor SIT amet, consectetur</span>', '<div>
  <span class="lowercase">
    Lorem ipSUm dolor SIT amet, consectetur
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1160, '.capitalize', 'classes/text/capitalize', NULL, '2024-03-06 04:54:52', '2024-03-06 04:54:52', '.capitalize {
    text-transform: capitalize;
}', '<span class="capitalize">lorem ipsum dolor sit amet, consectetur</span>', '<div>
  <span class="capitalize">
    lorem ipsum dolor sit amet, consectetur
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1161, '.normal-case', 'classes/text/normal-case', NULL, '2024-03-06 04:54:53', '2024-03-06 04:54:53', '.normal-case {
    text-transform: none;
}', '<span class="normal-case">Lorem ipsum doLOr sit AMet, consectetur</span>', '<div>
  <span class="normal-case">
    Lorem ipsum doLOr sit AMet, consectetur
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1162, '.leading-none', 'classes/text/leading-none', NULL, '2024-03-06 04:54:53', '2024-03-06 04:54:53', '.leading-none { line-height: 1; }', '<p class="leading-none bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-none bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1165, '.leading-normal', 'classes/text/leading-normal', NULL, '2024-03-06 04:54:54', '2024-03-06 04:54:54', '.leading-normal { line-height: 1.5; }', '<p class="leading-normal bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-normal bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1174, '.leading-9', 'classes/text/leading-9', NULL, '2024-03-06 04:54:57', '2024-03-06 04:54:57', '.leading-9 { line-height: 2.25rem; }', '<p class="leading-9 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-9 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1175, '.leading-10', 'classes/text/leading-10', NULL, '2024-03-06 04:54:57', '2024-03-06 04:54:57', '.leading-10 { line-height: 2.5rem; }', '<p class="leading-10 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-10 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1176, '.underline', 'classes/text/underline', NULL, '2024-03-06 04:54:57', '2024-03-06 04:54:57', '.underline {
  text-decoration: underline;
}', '<p class="underline">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="underline">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1177, '.line-through', 'classes/text/line-through', NULL, '2024-03-06 04:54:58', '2024-03-06 04:54:58', '.line-through {
  text-decoration: line-through;
}', '<p class="line-through">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="line-through">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1178, '.no-underline', 'classes/text/no-underline', NULL, '2024-03-06 04:54:58', '2024-03-06 04:54:58', '.no-underline {
  text-decoration: none;
}', '<a href="#" class="no-underline">Lorem ipsum dolor sit amet.</a>', '<div>
  <a href="#" class="no-underline">
    Lorem ipsum dolor sit amet.
  </a>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1179, '.font-hairline', 'classes/text/font-hairline', NULL, '2024-03-06 04:54:58', '2024-03-06 04:54:58', '.font-hairline { font-weight: 100; }', '<p class="font-hairline m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-hairline m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1181, '.font-light', 'classes/text/font-light', NULL, '2024-03-06 04:54:59', '2024-03-06 04:54:59', '.font-light { font-weight: 300; }', '<p class="font-light m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-light m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1182, '.font-normal', 'classes/text/font-normal', NULL, '2024-03-06 04:54:59', '2024-03-06 04:54:59', '.font-normal { font-weight: 400; }', '<p class="font-normal m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-normal m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1184, '.font-semibold', 'classes/text/font-semibold', NULL, '2024-03-06 04:55:00', '2024-03-06 04:55:00', '.font-semibold { font-weight: 600; }', '<p class="font-semibold m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-semibold m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1185, '.font-bold', 'classes/text/font-bold', NULL, '2024-03-06 04:55:00', '2024-03-06 04:55:00', '.font-bold { font-weight: 700; }', '<p class="font-bold m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-bold m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1187, '.font-black', 'classes/text/font-black', NULL, '2024-03-06 04:55:01', '2024-03-06 04:55:01', '.font-black { font-weight: 900; }', '<p class="font-black m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-black m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1188, '.text-xs', 'classes/text/text-xs', NULL, '2024-03-06 04:55:02', '2024-03-06 04:55:02', '.text-xs { font-size: .75rem; }', '<p class="text-xs truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-xs truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1189, '.text-sm', 'classes/text/text-sm', NULL, '2024-03-06 04:55:02', '2024-03-06 04:55:02', '.text-sm { font-size: .875rem; }', '<p class="text-sm truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-sm truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1195, '.text-4xl', 'classes/text/text-4xl', NULL, '2024-03-06 04:55:05', '2024-03-06 04:55:05', '.text-4xl { font-size: 2.25rem; }', '<p class="text-4xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-4xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1196, '.text-5xl', 'classes/text/text-5xl', NULL, '2024-03-06 04:55:05', '2024-03-06 04:55:05', '.text-5xl { font-size: 3rem; }', '<p class="text-5xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-5xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1169, '.leading-4', 'classes/text/leading-4', NULL, '2024-03-06 04:54:55', '2024-03-06 04:54:55', '.leading-4 { line-height: 1rem; }', '<p class="leading-4 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-4 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1172, '.leading-7', 'classes/text/leading-7', NULL, '2024-03-06 04:54:56', '2024-03-06 04:54:56', '.leading-7 { line-height: 1.75rem; }', '<p class="leading-7 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-7 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1191, '.text-lg', 'classes/text/text-lg', NULL, '2024-03-06 04:55:03', '2024-03-06 04:55:03', '.text-lg { font-size: 1.125rem; }', '<p class="text-lg truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-lg truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1194, '.text-3xl', 'classes/text/text-3xl', NULL, '2024-03-06 04:55:04', '2024-03-06 04:55:04', '.text-3xl { font-size: 1.875rem; }', '<p class="text-3xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-3xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1207, '.whitespace-normal+%25_F+.whitespace-*', 'classes/text/whitespace-normal+%25_F+.whitespace-*', NULL, '2024-03-06 04:55:09', '2024-03-06 04:55:09', '.whitespace-normal { white-space: normal; }
.whitespace-no-wrap { white-space: nowrap; }
.whitespace-pre { white-space: pre; }
.whitespace-pre-line { white-space: pre-line; }
.whitespace-pre-wrap { white-space: pre-wrap; }', '<div class="whitespace-normal bg-gray-300 my-2 overflow-x-auto">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.</div>

<div class="whitespace-no-wrap bg-gray-300 my-2 overflow-x-auto">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.</div>

<div class="whitespace-pre bg-gray-300 my-2 overflow-x-auto">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.</div>

<div class="whitespace-pre-line bg-gray-300 my-2 overflow-x-auto">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.</div>

<div class="whitespace-pre-wrap bg-gray-300 my-2 overflow-x-auto">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.</div>', '<div>
  <div class="whitespace-normal bg-gray-300 my-2 overflow-x-auto">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.
  </div>
  <div class="whitespace-no-wrap bg-gray-300 my-2 overflow-x-auto">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.
  </div>
  <div class="whitespace-pre bg-gray-300 my-2 overflow-x-auto">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.
  </div>
  <div class="whitespace-pre-line bg-gray-300 my-2 overflow-x-auto">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.
  </div>
  <div class="whitespace-pre-wrap bg-gray-300 my-2 overflow-x-auto">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quidem itaque beatae, rem tenetur quia iure,
    eum natus enim maxime
    laudantium quibusdam illo nihil,

reprehenderit saepe quam aliquid odio accusamus.
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1218, '.text-gray-100', 'classes/text-color/text-gray-100', NULL, '2024-03-06 04:55:14', '2024-03-06 04:55:14', '.text-gray-100 { color: #f7fafc; }', '<div class="text-gray-100">Text</div>', '<div>
  <div class="text-gray-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1226, '.text-gray-900', 'classes/text-color/text-gray-900', NULL, '2024-03-06 04:55:17', '2024-03-06 04:55:17', '.text-gray-900 { color: #1a202c; }', '<div class="text-gray-900">Text</div>', '<div>
  <div class="text-gray-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1240, '.text-orange-500', 'classes/text-color/text-orange-500', NULL, '2024-03-06 04:55:23', '2024-03-06 04:55:23', '.text-orange-500 { color: #ed8936; }', '<div class="text-orange-500">Text</div>', '<div>
  <div class="text-orange-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1243, '.text-orange-800', 'classes/text-color/text-orange-800', NULL, '2024-03-06 04:55:24', '2024-03-06 04:55:24', '.text-orange-800 { color: #9c4221; }', '<div class="text-orange-800">Text</div>', '<div>
  <div class="text-orange-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1245, '.text-yellow-100', 'classes/text-color/text-yellow-100', NULL, '2024-03-06 04:55:25', '2024-03-06 04:55:25', '.text-yellow-100 { color: #fffff0; }', '<div class="text-yellow-100">Text</div>', '<div>
  <div class="text-yellow-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1271, '.text-teal-900', 'classes/text-color/text-teal-900', NULL, '2024-03-06 04:55:34', '2024-03-06 04:55:34', '.text-teal-900 { color: #234e52; }', '<div class="text-teal-900">Text</div>', '<div>
  <div class="text-teal-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1273, '.text-blue-200', 'classes/text-color/text-blue-200', NULL, '2024-03-06 04:55:35', '2024-03-06 04:55:35', '.text-blue-200 { color: #bee3f8; }', '<div class="text-blue-200">Text</div>', '<div>
  <div class="text-blue-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1281, '.text-indigo-100', 'classes/text-color/text-indigo-100', NULL, '2024-03-06 04:55:38', '2024-03-06 04:55:38', '.text-indigo-100 { color: #ebf4ff; }', '<div class="text-indigo-100">Text</div>', '<div>
  <div class="text-indigo-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1284, '.text-indigo-400', 'classes/text-color/text-indigo-400', NULL, '2024-03-06 04:55:40', '2024-03-06 04:55:40', '.text-indigo-400 { color: #7f9cf5; }', '<div class="text-indigo-400">Text</div>', '<div>
  <div class="text-indigo-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1297, '.text-purple-800', 'classes/text-color/text-purple-800', NULL, '2024-03-06 04:55:45', '2024-03-06 04:55:45', '.text-purple-800 { color: #553c9a; }', '<div class="text-purple-800">Text</div>', '<div>
  <div class="text-purple-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1604, '.mb-10', 'classes/margins/mb-10', NULL, '2024-03-09 18:07:49', '2024-03-09 18:07:49', '.mb-10 { margin-bottom: 2.5rem; }', '<span class="mb-10 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-10 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1607, '.mb-20', 'classes/margins/mb-20', NULL, '2024-03-09 18:07:50', '2024-03-09 18:07:50', '.mb-20 { margin-bottom: 5rem; }', '<span class="mb-20 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-20 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1622, '.mr-6', 'classes/margins/mr-6', NULL, '2024-03-09 18:07:55', '2024-03-09 18:07:55', '.mr-6 { margin-right: 1.5rem; }', '<span class="mr-6 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-6 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1171, '.leading-6', 'classes/text/leading-6', NULL, '2024-03-06 04:54:56', '2024-03-06 04:54:56', '.leading-6 { line-height: 1.5rem; }', '<p class="leading-6 bg-gray-300 m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="leading-6 bg-gray-300 m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1190, '.text-base', 'classes/text/text-base', NULL, '2024-03-06 04:55:03', '2024-03-06 04:55:03', '.text-base { font-size: 1rem; }', '<p class="text-base truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-base truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1193, '.text-2xl', 'classes/text/text-2xl', NULL, '2024-03-06 04:55:04', '2024-03-06 04:55:04', '.text-2xl { font-size: 1.5rem; }', '<p class="text-2xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-2xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1206, '.not-italic', 'classes/text/not-italic', NULL, '2024-03-06 04:55:09', '2024-03-06 04:55:09', '.not-italic { font-style: normal; }', '<p class="no-italic m-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="no-italic m-2">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1214, '.text-transparent', 'classes/text-color/text-transparent', NULL, '2024-03-06 04:55:12', '2024-03-06 04:55:12', '.text-transparent { color: transparent; }', '<div class="text-transparent">Text</div>', '<div>
  <div class="text-transparent">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1225, '.text-gray-800', 'classes/text-color/text-gray-800', NULL, '2024-03-06 04:55:17', '2024-03-06 04:55:17', '.text-gray-800 { color: #2d3748; }', '<div class="text-gray-800">Text</div>', '<div>
  <div class="text-gray-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1239, '.text-orange-400', 'classes/text-color/text-orange-400', NULL, '2024-03-06 04:55:22', '2024-03-06 04:55:22', '.text-orange-400 { color: #f6ad55; }', '<div class="text-orange-400">Text</div>', '<div>
  <div class="text-orange-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1242, '.text-orange-700', 'classes/text-color/text-orange-700', NULL, '2024-03-06 04:55:23', '2024-03-06 04:55:23', '.text-orange-700 { color: #c05621; }', '<div class="text-orange-700">Text</div>', '<div>
  <div class="text-orange-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1265, '.text-teal-300', 'classes/text-color/text-teal-300', NULL, '2024-03-06 04:55:32', '2024-03-06 04:55:32', '.text-teal-300 { color: #81e6d9; }', '<div class="text-teal-300">Text</div>', '<div>
  <div class="text-teal-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1268, '.text-teal-600', 'classes/text-color/text-teal-600', NULL, '2024-03-06 04:55:33', '2024-03-06 04:55:33', '.text-teal-600 { color: #319795; }', '<div class="text-teal-600">Text</div>', '<div>
  <div class="text-teal-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1292, '.text-purple-300', 'classes/text-color/text-purple-300', NULL, '2024-03-06 04:55:43', '2024-03-06 04:55:43', '.text-purple-300 { color: #d6bcfa; }', '<div class="text-purple-300">Text</div>', '<div>
  <div class="text-purple-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1303, '.text-pink-500', 'classes/text-color/text-pink-500', NULL, '2024-03-06 04:55:48', '2024-03-06 04:55:48', '.text-pink-500 { color: #ed64a6; }', '<div class="text-pink-500">Text</div>', '<div>
  <div class="text-pink-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1605, '.mb-12', 'classes/margins/mb-12', NULL, '2024-03-09 18:07:49', '2024-03-09 18:07:49', NULL, '<span class="mb-12 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-12 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1608, '.mb-24', 'classes/margins/mb-24', NULL, '2024-03-09 18:07:50', '2024-03-09 18:07:50', '.mb-24 { margin-bottom: 6rem; }', '<span class="mb-24 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-24 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1183, '.font-medium', 'classes/text/font-medium', NULL, '2024-03-06 04:54:59', '2024-03-06 04:54:59', '.font-medium { font-weight: 500; }', '<p class="font-medium m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-medium m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1186, '.font-extrabold', 'classes/text/font-extrabold', NULL, '2024-03-06 04:55:00', '2024-03-06 04:55:00', '.font-extrabold { font-weight: 800; }', '<p class="font-extrabold m-2">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-extrabold m-2">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1197, '.text-6xl', 'classes/text/text-6xl', NULL, '2024-03-06 04:55:05', '2024-03-06 04:55:05', '.text-6xl { font-size: 4rem; }', '<p class="text-6xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-6xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1204, '.text-justify', 'classes/text/text-justify', NULL, '2024-03-06 04:55:08', '2024-03-06 04:55:08', '.text-justify { text-align: justify; }', '<p class="text-justify m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.</p>', '<div>
  <p class="text-justify m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1216, '.text-black', 'classes/text-color/text-black', NULL, '2024-03-06 04:55:13', '2024-03-06 04:55:13', '.text-black { color: #000; }', '<div class="text-black">Text</div>', '<div>
  <div class="text-black">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1228, '.text-red-200', 'classes/text-color/text-red-200', NULL, '2024-03-06 04:55:18', '2024-03-06 04:55:18', '.text-red-200 { color: #fed7d7; }', '<div class="text-red-200">Text</div>', '<div>
  <div class="text-red-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1232, '.text-red-600', 'classes/text-color/text-red-600', NULL, '2024-03-06 04:55:19', '2024-03-06 04:55:19', '.text-red-600 { color: #e53e3e; }', '<div class="text-red-600">Text</div>', '<div>
  <div class="text-red-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1247, '.text-yellow-300', 'classes/text-color/text-yellow-300', NULL, '2024-03-06 04:55:25', '2024-03-06 04:55:25', '.text-yellow-300 { color: #faf089; }', '<div class="text-yellow-300">Text</div>', '<div>
  <div class="text-yellow-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1264, '.text-teal-200', 'classes/text-color/text-teal-200', NULL, '2024-03-06 04:55:32', '2024-03-06 04:55:32', '.text-teal-200 { color: #b2f5ea; }', '<div class="text-teal-200">Text</div>', '<div>
  <div class="text-teal-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1267, '.text-teal-500', 'classes/text-color/text-teal-500', NULL, '2024-03-06 04:55:33', '2024-03-06 04:55:33', '.text-teal-500 { color: #38b2ac; }', '<div class="text-teal-500">Text</div>', '<div>
  <div class="text-teal-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1295, '.text-purple-600', 'classes/text-color/text-purple-600', NULL, '2024-03-06 04:55:45', '2024-03-06 04:55:45', '.text-purple-600 { color: #805ad5; }', '<div class="text-purple-600">Text</div>', '<div>
  <div class="text-purple-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1304, '.text-pink-600', 'classes/text-color/text-pink-600', NULL, '2024-03-06 04:55:48', '2024-03-06 04:55:48', '.text-pink-600 { color: #d53f8c; }', '<div class="text-pink-600">Text</div>', '<div>
  <div class="text-pink-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1606, '.mb-16', 'classes/margins/mb-16', NULL, '2024-03-09 18:07:50', '2024-03-09 18:07:50', '.mb-16 { margin-bottom: 4rem; }', '<span class="mb-16 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-16 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1609, '.mb-32', 'classes/margins/mb-32', NULL, '2024-03-09 18:07:51', '2024-03-09 18:07:51', '.mb-32 { margin-bottom: 8rem; }', '<span class="mb-32 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-32 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1192, '.text-xl', 'classes/text/text-xl', NULL, '2024-03-06 04:55:03', '2024-03-06 04:55:03', '.text-xl { font-size: 1.25rem; }', '<p class="text-xl truncate">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="text-xl truncate">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1198, '.font-sans', 'classes/text/font-sans', NULL, '2024-03-06 04:55:06', '2024-03-06 04:55:06', '.font-sans {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}', '<p class="font-sans">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-sans">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1211, '.tracking-wide', 'classes/text/tracking-wide', NULL, '2024-03-06 04:55:11', '2024-03-06 04:55:11', '.tracking-wide { letter-spacing: 0.025em; }', '<div class="tracking-wide">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-wide">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1219, '.text-gray-200', 'classes/text-color/text-gray-200', NULL, '2024-03-06 04:55:14', '2024-03-06 04:55:14', '.text-gray-200 { color: #edf2f7; }', '<div class="text-gray-200">Text</div>', '<div>
  <div class="text-gray-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1227, '.text-red-100', 'classes/text-color/text-red-100', NULL, '2024-03-06 04:55:17', '2024-03-06 04:55:17', '.text-red-100 { color: #fff5f5; }', '<div class="text-red-100">Text</div>', '<div>
  <div class="text-red-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1249, '.text-yellow-500', 'classes/text-color/text-yellow-500', NULL, '2024-03-06 04:55:26', '2024-03-06 04:55:26', '.text-yellow-500 { color: #ecc94b; }', '<div class="text-yellow-500">Text</div>', '<div>
  <div class="text-yellow-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1252, '.text-yellow-800', 'classes/text-color/text-yellow-800', NULL, '2024-03-06 04:55:27', '2024-03-06 04:55:27', '.text-yellow-800 { color: #975a16; }', '<div class="text-yellow-800">Text</div>', '<div>
  <div class="text-yellow-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1260, '.text-green-700', 'classes/text-color/text-green-700', NULL, '2024-03-06 04:55:30', '2024-03-06 04:55:30', '.text-green-700 { color: #2f855a; }', '<div class="text-green-700">Text</div>', '<div>
  <div class="text-green-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1263, '.text-teal-100', 'classes/text-color/text-teal-100', NULL, '2024-03-06 04:55:31', '2024-03-06 04:55:31', '.text-teal-100 { color: #e6fffa; }', '<div class="text-teal-100">Text</div>', '<div>
  <div class="text-teal-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1280, '.text-blue-900', 'classes/text-color/text-blue-900', NULL, '2024-03-06 04:55:38', '2024-03-06 04:55:38', '.text-blue-900 { color: #2a4365; }', '<div class="text-blue-900">Text</div>', '<div>
  <div class="text-blue-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1283, '.text-indigo-300', 'classes/text-color/text-indigo-300', NULL, '2024-03-06 04:55:40', '2024-03-06 04:55:40', '.text-indigo-300 { color: #a3bffa; }', '<div class="text-indigo-300">Text</div>', '<div>
  <div class="text-indigo-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1296, '.text-purple-700', 'classes/text-color/text-purple-700', NULL, '2024-03-06 04:55:45', '2024-03-06 04:55:45', '.text-purple-700 { color: #6b46c1; }', '<div class="text-purple-700">Text</div>', '<div>
  <div class="text-purple-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1610, '.mb-40', 'classes/margins/mb-40', NULL, '2024-03-09 18:07:51', '2024-03-09 18:07:51', '.mb-40 { margin-bottom: 10rem; }', '<span class="mb-40 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-40 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1613, '.mb-64', 'classes/margins/mb-64', NULL, '2024-03-09 18:07:52', '2024-03-09 18:07:52', '.mb-64 { margin-bottom: 16rem; }', '<span class="mb-64 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-64 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1199, '.font-serif', 'classes/text/font-serif', NULL, '2024-03-06 04:55:06', '2024-03-06 04:55:06', '.font-serif {
  font-family: Georgia, Cambria, "Times New Roman", Times, serif;
}', '<p class="font-serif">Lorem ipsum dolor sit amet.</p>', '<div>
  <p class="font-serif">
    Lorem ipsum dolor sit amet.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1212, '.tracking-wider', 'classes/text/tracking-wider', NULL, '2024-03-06 04:55:11', '2024-03-06 04:55:11', '.tracking-wider { letter-spacing: 0.05em; }', '<div class="tracking-wider">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-wider">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1223, '.text-gray-600', 'classes/text-color/text-gray-600', NULL, '2024-03-06 04:55:16', '2024-03-06 04:55:16', '.text-gray-600 { color: #718096; }', '<div class="text-gray-600">Text</div>', '<div>
  <div class="text-gray-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1230, '.text-red-400', 'classes/text-color/text-red-400', NULL, '2024-03-06 04:55:19', '2024-03-06 04:55:19', '.text-red-400 { color: #fc8181; }', '<div class="text-red-400">Text</div>', '<div>
  <div class="text-red-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1244, '.text-orange-900', 'classes/text-color/text-orange-900', NULL, '2024-03-06 04:55:24', '2024-03-06 04:55:24', '.text-orange-900 { color: #7b341e; }', '<div class="text-orange-900">Text</div>', '<div>
  <div class="text-orange-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1246, '.text-yellow-200', 'classes/text-color/text-yellow-200', NULL, '2024-03-06 04:55:25', '2024-03-06 04:55:25', '.text-yellow-200 { color: #fefcbf; }', '<div class="text-yellow-200">Text</div>', '<div>
  <div class="text-yellow-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1259, '.text-green-600', 'classes/text-color/text-green-600', NULL, '2024-03-06 04:55:30', '2024-03-06 04:55:30', '.text-green-600 { color: #38a169; }', '<div class="text-green-600">Text</div>', '<div>
  <div class="text-green-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1262, '.text-green-900', 'classes/text-color/text-green-900', NULL, '2024-03-06 04:55:31', '2024-03-06 04:55:31', '.text-green-900 { color: #22543d; }', '<div class="text-green-900">Text</div>', '<div>
  <div class="text-green-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1279, '.text-blue-800', 'classes/text-color/text-blue-800', NULL, '2024-03-06 04:55:37', '2024-03-06 04:55:37', '.text-blue-800 { color: #2c5282; }', '<div class="text-blue-800">Text</div>', '<div>
  <div class="text-blue-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1291, '.text-purple-200', 'classes/text-color/text-purple-200', NULL, '2024-03-06 04:55:43', '2024-03-06 04:55:43', '.text-purple-200 { color: #e9d8fd; }', '<div class="text-purple-200">Text</div>', '<div>
  <div class="text-purple-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1299, '.text-pink-100', 'classes/text-color/text-pink-100', NULL, '2024-03-06 04:55:46', '2024-03-06 04:55:46', '.text-pink-100 { color: #fff5f7; }', '<div class="text-pink-100">Text</div>', '<div>
  <div class="text-pink-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1611, '.mb-48', 'classes/margins/mb-48', NULL, '2024-03-09 18:07:51', '2024-03-09 18:07:51', '.mb-48 { margin-bottom: 12rem; }', '<span class="mb-48 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-48 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1614, '.mb-auto', 'classes/margins/mb-auto', NULL, '2024-03-09 18:07:52', '2024-03-09 18:07:52', '.mb-auto { margin-bottom: auto; }', '<span class="mb-auto inline-block bg-teal-400">Item</span>', '<div>
  <span class="mb-auto inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1201, '.text-left', 'classes/text/text-left', NULL, '2024-03-06 04:55:07', '2024-03-06 04:55:07', '.text-left { text-align: left; }', '<p class="text-left m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.</p>', '<div>
  <p class="text-left m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1209, '.tracking-tight', 'classes/text/tracking-tight', NULL, '2024-03-06 04:55:10', '2024-03-06 04:55:10', '.tracking-tight { letter-spacing: -0.025em; }', '<div class="tracking-tight">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-tight">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1220, '.text-gray-300', 'classes/text-color/text-gray-300', NULL, '2024-03-06 04:55:15', '2024-03-06 04:55:15', '.text-gray-300 { color: #e2e8f0; }', '<div class="text-gray-300">Text</div>', '<div>
  <div class="text-gray-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1233, '.text-red-700', 'classes/text-color/text-red-700', NULL, '2024-03-06 04:55:20', '2024-03-06 04:55:20', '.text-red-700 { color: #c53030; }', '<div class="text-red-700">Text</div>', '<div>
  <div class="text-red-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1236, '.text-orange-100', 'classes/text-color/text-orange-100', NULL, '2024-03-06 04:55:21', '2024-03-06 04:55:21', '.text-orange-100 { color: #fffaf0; }', '<div class="text-orange-100">Text</div>', '<div>
  <div class="text-orange-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1250, '.text-yellow-600', 'classes/text-color/text-yellow-600', NULL, '2024-03-06 04:55:26', '2024-03-06 04:55:26', '.text-yellow-600 { color: #d69e2e; }', '<div class="text-yellow-600">Text</div>', '<div>
  <div class="text-yellow-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1256, '.text-green-300', 'classes/text-color/text-green-300', NULL, '2024-03-06 04:55:29', '2024-03-06 04:55:29', '.text-green-300 { color: #9ae6b4; }', '<div class="text-green-300">Text</div>', '<div>
  <div class="text-green-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1275, '.text-blue-400', 'classes/text-color/text-blue-400', NULL, '2024-03-06 04:55:36', '2024-03-06 04:55:36', '.text-blue-400 { color: #63b3ed; }', '<div class="text-blue-400">Text</div>', '<div>
  <div class="text-blue-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1277, '.text-blue-600', 'classes/text-color/text-blue-600', NULL, '2024-03-06 04:55:37', '2024-03-06 04:55:37', '.text-blue-600 { color: #3182ce; }', '<div class="text-blue-600">Text</div>', '<div>
  <div class="text-blue-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1285, '.text-indigo-500', 'classes/text-color/text-indigo-500', NULL, '2024-03-06 04:55:41', '2024-03-06 04:55:41', '.text-indigo-500 { color: #667eea; }', '<div class="text-indigo-500">Text</div>', '<div>
  <div class="text-indigo-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1289, '.text-indigo-900', 'classes/text-color/text-indigo-900', NULL, '2024-03-06 04:55:42', '2024-03-06 04:55:42', '.text-indigo-900 { color: #3c366b; }', '<div class="text-indigo-900">Text</div>', '<div>
  <div class="text-indigo-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1301, '.text-pink-300', 'classes/text-color/text-pink-300', NULL, '2024-03-06 04:55:47', '2024-03-06 04:55:47', '.text-pink-300 { color: #fbb6ce; }', '<div class="text-pink-300">Text</div>', '<div>
  <div class="text-pink-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1616, '.mr-0', 'classes/margins/mr-0', NULL, '2024-03-09 18:07:53', '2024-03-09 18:07:53', '.mr-0 { margin-right: 0; }', '<span class="mr-0 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-0 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1618, '.mr-2', 'classes/margins/mr-2', NULL, '2024-03-09 18:07:54', '2024-03-09 18:07:54', '.mr-2 { margin-right: 0.5rem; }', '<span class="mr-2 inline-block bg-teal-400">Item</span>', '<div>
  <span class="mr-2 inline-block bg-teal-400">
    Item
  </span>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1202, '.text-center', 'classes/text/text-center', NULL, '2024-03-06 04:55:07', '2024-03-06 04:55:07', '.text-center { text-align: center; }', '<p class="text-center m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.</p>', '<div>
  <p class="text-center m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1210, '.tracking-normal', 'classes/text/tracking-normal', NULL, '2024-03-06 04:55:11', '2024-03-06 04:55:11', '.tracking-normal { letter-spacing: 0; }', '<div class="tracking-normal">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-normal">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1221, '.text-gray-400', 'classes/text-color/text-gray-400', NULL, '2024-03-06 04:55:15', '2024-03-06 04:55:15', '.text-gray-400 { color: #cbd5e0; }', '<div class="text-gray-400">Text</div>', '<div>
  <div class="text-gray-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1234, '.text-red-800', 'classes/text-color/text-red-800', NULL, '2024-03-06 04:55:20', '2024-03-06 04:55:20', '.text-red-800 { color: #9b2c2c; }', '<div class="text-red-800">Text</div>', '<div>
  <div class="text-red-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1237, '.text-orange-200', 'classes/text-color/text-orange-200', NULL, '2024-03-06 04:55:21', '2024-03-06 04:55:21', '.text-orange-200 { color: #feebc8; }', '<div class="text-orange-200">Text</div>', '<div>
  <div class="text-orange-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1255, '.text-green-200', 'classes/text-color/text-green-200', NULL, '2024-03-06 04:55:28', '2024-03-06 04:55:28', '.text-green-200 { color: #c6f6d5; }', '<div class="text-green-200">Text</div>', '<div>
  <div class="text-green-200">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1261, '.text-green-800', 'classes/text-color/text-green-800', NULL, '2024-03-06 04:55:31', '2024-03-06 04:55:31', '.text-green-800 { color: #276749; }', '<div class="text-green-800">Text</div>', '<div>
  <div class="text-green-800">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1276, '.text-blue-500', 'classes/text-color/text-blue-500', NULL, '2024-03-06 04:55:36', '2024-03-06 04:55:36', '.text-blue-500 { color: #4299e1; }', '<div class="text-blue-500">Text</div>', '<div>
  <div class="text-blue-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1278, '.text-blue-700', 'classes/text-color/text-blue-700', NULL, '2024-03-06 04:55:37', '2024-03-06 04:55:37', '.text-blue-700 { color: #2b6cb0; }', '<div class="text-blue-700">Text</div>', '<div>
  <div class="text-blue-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1287, '.text-indigo-700', 'classes/text-color/text-indigo-700', NULL, '2024-03-06 04:55:41', '2024-03-06 04:55:41', '.text-indigo-700 { color: #4c51bf; }', '<div class="text-indigo-700">Text</div>', '<div>
  <div class="text-indigo-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1294, '.text-purple-500', 'classes/text-color/text-purple-500', NULL, '2024-03-06 04:55:44', '2024-03-06 04:55:44', '.text-purple-500 { color: #9f7aea; }', '<div class="text-purple-500">Text</div>', '<div>
  <div class="text-purple-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1203, '.text-right', 'classes/text/text-right', NULL, '2024-03-06 04:55:08', '2024-03-06 04:55:08', '.text-right { text-align: right; }', '<p class="text-right m-2 w-64">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.</p>', '<div>
  <p class="text-right m-2 w-64">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum eu felis nec scelerisque. Duis eget lectus nec ante tincidunt facilisis.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1215, '.text-current', 'classes/text-color/text-current', NULL, '2024-03-06 04:55:13', '2024-03-06 04:55:13', '.text-current { color: currentColor; }', '<div class="text-current">Text</div>', '<div>
  <div class="text-current">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1224, '.text-gray-700', 'classes/text-color/text-gray-700', NULL, '2024-03-06 04:55:16', '2024-03-06 04:55:16', '.text-gray-700 { color: #4a5568; }', '<div class="text-gray-700">Text</div>', '<div>
  <div class="text-gray-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1231, '.text-red-500', 'classes/text-color/text-red-500', NULL, '2024-03-06 04:55:19', '2024-03-06 04:55:19', '.text-red-500 { color: #f56565; }', '<div class="text-red-500">Text</div>', '<div>
  <div class="text-red-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1248, '.text-yellow-400', 'classes/text-color/text-yellow-400', NULL, '2024-03-06 04:55:26', '2024-03-06 04:55:26', '.text-yellow-400 { color: #f6e05e; }', '<div class="text-yellow-400">Text</div>', '<div>
  <div class="text-yellow-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1251, '.text-yellow-700', 'classes/text-color/text-yellow-700', NULL, '2024-03-06 04:55:27', '2024-03-06 04:55:27', '.text-yellow-700 { color: #b7791f; }', '<div class="text-yellow-700">Text</div>', '<div>
  <div class="text-yellow-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1266, '.text-teal-400', 'classes/text-color/text-teal-400', NULL, '2024-03-06 04:55:32', '2024-03-06 04:55:32', '.text-teal-400 { color: #4fd1c5; }', '<div class="text-teal-400">Text</div>', '<div>
  <div class="text-teal-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1269, '.text-teal-700', 'classes/text-color/text-teal-700', NULL, '2024-03-06 04:55:33', '2024-03-06 04:55:33', '.text-teal-700 { color: #2c7a7b; }', '<div class="text-teal-700">Text</div>', '<div>
  <div class="text-teal-700">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1290, '.text-purple-100', 'classes/text-color/text-purple-100', NULL, '2024-03-06 04:55:43', '2024-03-06 04:55:43', '.text-purple-100 { color: #faf5ff; }', '<div class="text-purple-100">Text</div>', '<div>
  <div class="text-purple-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1298, '.text-purple-900', 'classes/text-color/text-purple-900', NULL, '2024-03-06 04:55:46', '2024-03-06 04:55:46', '.text-purple-900 { color: #44337a; }', '<div class="text-purple-900">Text</div>', '<div>
  <div class="text-purple-900">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1205, '.italic', 'classes/text/italic', NULL, '2024-03-06 04:55:09', '2024-03-06 04:55:09', '.italic { font-style: italic; }', '<p class="italic m-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '<div>
  <p class="italic m-2">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </p>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1213, '.tracking-widest', 'classes/text/tracking-widest', NULL, '2024-03-06 04:55:12', '2024-03-06 04:55:12', '.tracking-widest { letter-spacing: 0.1em; }', '<div class="tracking-widest">Lorem ipsum dolor sit amet, consectetur adipiscing elit</div>', '<div>
  <div class="tracking-widest">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1222, '.text-gray-500', 'classes/text-color/text-gray-500', NULL, '2024-03-06 04:55:15', '2024-03-06 04:55:15', '.text-gray-500 { color: #a0aec0; }', '<div class="text-gray-500">Text</div>', '<div>
  <div class="text-gray-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1238, '.text-orange-300', 'classes/text-color/text-orange-300', NULL, '2024-03-06 04:55:22', '2024-03-06 04:55:22', '.text-orange-300 { color: #fbd38d; }', '<div class="text-orange-300">Text</div>', '<div>
  <div class="text-orange-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1241, '.text-orange-600', 'classes/text-color/text-orange-600', NULL, '2024-03-06 04:55:23', '2024-03-06 04:55:23', '.text-orange-600 { color: #dd6b20; }', '<div class="text-orange-600">Text</div>', '<div>
  <div class="text-orange-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1254, '.text-green-100', 'classes/text-color/text-green-100', NULL, '2024-03-06 04:55:28', '2024-03-06 04:55:28', '.text-green-100 { color: #f0fff4; }', '<div class="text-green-100">Text</div>', '<div>
  <div class="text-green-100">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1258, '.text-green-500', 'classes/text-color/text-green-500', NULL, '2024-03-06 04:55:29', '2024-03-06 04:55:29', '.text-green-500 { color: #48bb78; }', '<div class="text-green-500">Text</div>', '<div>
  <div class="text-green-500">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1274, '.text-blue-300', 'classes/text-color/text-blue-300', NULL, '2024-03-06 04:55:35', '2024-03-06 04:55:35', '.text-blue-300 { color: #90cdf4; }', '<div class="text-blue-300">Text</div>', '<div>
  <div class="text-blue-300">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1286, '.text-indigo-600', 'classes/text-color/text-indigo-600', NULL, '2024-03-06 04:55:41', '2024-03-06 04:55:41', '.text-indigo-600 { color: #5a67d8; }', '<div class="text-indigo-600">Text</div>', '<div>
  <div class="text-indigo-600">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1293, '.text-purple-400', 'classes/text-color/text-purple-400', NULL, '2024-03-06 04:55:44', '2024-03-06 04:55:44', '.text-purple-400 { color: #b794f4; }', '<div class="text-purple-400">Text</div>', '<div>
  <div class="text-purple-400">
    Text
  </div>
</div>
');
INSERT INTO public.class (id, name, text, example, inserted_at, updated_at, elem, label, body) VALUES (1302, '.text-pink-400', 'classes/text-color/text-pink-400', NULL, '2024-03-06 04:55:47', '2024-03-06 04:55:47', '.text-pink-400 { color: #f687b3; }', '<div class="text-pink-400">Text</div>', '<div>
  <div class="text-pink-400">
    Text
  </div>
</div>
');


--
-- TOC entry 3529 (class 0 OID 82763)
-- Dependencies: 224
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (1, 'Gudivada', ' Andhra Pradesh, India', 16.441025, 80.99263, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (2, 'Dhinoj', ' Patan, Gujarat, India', 23.661324, 72.279541, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (3, 'Idappadi', ' Salem, Tamil Nadu, India', 11.58, 77.849998, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (4, 'Chitalwana', ' Rajasthan, India', 24.924999, 71.659721, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (5, 'Pugal', ' Rajasthan, India', 28.5, 72.800003, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (6, 'Doom Dooma', ' Assam, India', 27.57, 95.57, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (7, 'Usar', ' Maharashtra, India', 18.291109, 73.131744, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (8, 'Sirsi', ' Karnataka, India', 14.6195, 74.835403, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (9, 'Perinad', ' Kerala, India', 8.95628, 76.640022, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (10, 'New Terhi', ' Uttarakhand, India', 30.379999, 78.480003, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (11, 'Cheekode', ' Kerala, India', 11.23043, 75.989342, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (12, 'Palani', ' Dindigul, Tamil Nadu, India', 10.45, 77.519997, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (13, 'Theni Allinagaram', ' Theni, Tamil Nadu, India', 10.011944, 77.478615, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (14, 'Bhawani Mandi', ' Rajasthan, India', 24.42, 75.82972, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (15, 'Beldanga', ' West Bengal, India', 23.93, 88.25, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (16, 'Vedasandur', ' Thamil Nadu, India', 10.530206, 77.922646, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (17, 'Paniyara', ' Uttar Pradesh, India', 26.997454, 83.463402, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (18, 'Nagarbera', ' Assam, India', 26.11179, 91.003578, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (19, 'Atgaon', ' Maharashtra, India', 19.502623, 73.330368, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (20, 'Malur', ' Karnataka, India', 12.99, 77.937111, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (21, 'Munnar', ' Idukki, Kerala, India', 10.089167, 77.059723, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (22, 'Demjok', ' Jammu and Kashmir, India', 32.699909, 79.449516, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (23, 'Umerkote', ' Odisha, India', 19.665001, 82.211998, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (24, 'Mohone', ' Kalyan, Thane, Maharashtra, India', 19.265133, 73.172371, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (25, 'Shiroor', ' Karnataka, India', 13.916197, 74.599342, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (26, 'Kuwerpur', ' Uttar Pradesh, India', 27.217766, 78.118172, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (27, 'Holnanthe', ' Pashte, Maharashtra, India', 21.204906, 74.900551, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (28, 'Asopur', ' Rukanpura, Patna, Bihar, India', 25.58942, 85.043251, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (29, 'Sagardighi', ' West Bengal, India', 24.292355, 88.086357, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (30, 'Siolim', ' Goa, India', 15.62009, 73.777222, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (31, 'Rahika', ' Bihar, India', 26.378592, 86.020332, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (32, 'Veerabhadrapeta', ' Andhra Pradesh, India', 18.038063, 83.194374, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (33, 'Bagseen', ' Rajasthan, India', 25.035452, 72.927742, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (34, 'Laikera', ' Odisha, India', 21.884956, 84.212807, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (35, 'Piliv', ' Maharashtra, India', 17.682156, 74.966156, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (36, 'Patnitop', ' Jammu and Kashmir, India', 33.077778, 75.326912, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (37, 'Peer Muchalla', ' Punjab, India', 30.661608, 76.863342, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (38, 'Rambha', ' Odisha, India', 19.520241, 85.090126, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (39, 'Idappadi', ' Tamil Nadu, India', 11.584286, 77.837013, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (40, 'Lasadiya', ' Rajasthan, India', 24.257906, 74.24073, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (41, 'Pimpalgaon Baswant', ' Maharashtra, India', 20.165369, 73.987991, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (42, 'Maganpur', ' Jharkhand, India', 23.565374, 85.781036, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (43, 'Banki', ' Odisha, India', 20.377754, 85.530029, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (44, 'Goilkera', ' Jharkhand, India', 22.507088, 85.37664, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (45, 'Amethi', ' Uttar Pradesh, India', 26.153912, 81.813087, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (46, 'Alur', ' Maharashtra, India', 17.695965, 76.426003, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (47, 'Belda', ' West Bengal, India', 22.070757, 87.338417, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (48, 'Mohania', ' Bihar, India', 25.166819, 83.617294, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (49, 'Bichhiya', ' Madhya Pradesh, India', 22.451139, 80.709236, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (50, 'Nasrala', ' Punjab, India', 31.489271, 75.82431, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (51, 'Amritpur', ' Uttar Pradesh, India', 27.540354, 79.597565, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (52, 'Basari', ' Madhya Pradesh, India', 24.823471, 79.717812, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (53, 'Pothencode', ' Kerala, India', 8.620447, 76.89843, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (54, 'Kalaghatagi', ' Karnataka, India', 15.192222, 74.967094, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (55, 'Natepute', ' Maharashtra, India', 17.898615, 74.754189, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (56, 'Chhibramau', ' Uttar Pradesh, India', 27.148756, 79.497009, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (57, 'Nainpur', ' Madhya Pradesh, India', 22.426605, 80.109558, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (58, 'Asotra', ' Rajasthan, India', 25.764273, 72.294334, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (59, 'Nasirabad', ' Ajmer, Rajasthan, India', 26.297997, 74.734558, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (60, 'Chandrakona Road', ' West Bengal, India', 22.733934, 87.339088, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (61, 'Veerakeralampudur', ' Tamil Nadu, India', 8.937609, 77.449501, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (62, 'Rajpipila', ' Gujarat , India', 21.87171, 73.502701, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (63, 'Chowannur', ' Kerala, India', 10.65054, 76.078346, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (64, 'Aatarsumba', ' Gujarat, India', 23.052139, 72.966629, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (65, 'Puthalam', ' Kanyakumari, Tamil Nadu, India', 8.106106, 77.466888, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (66, 'Simri', ' Bihar, India', 26.005791, 86.349442, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (67, 'Ganj Basoda', ' Madhya Pradesh, India', 23.851988, 77.927055, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (68, 'Maipit', ' West Bengal, India', 21.919558, 88.544647, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (69, 'Naranda', ' Maharashtra, India', 19.781528, 79.058151, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (70, 'Gawan', ' Uttar Pradesh, India', 28.421179, 78.351059, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (71, 'Rahatgaon', ' Madhya Pradesh, India', 22.24675, 77.228226, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (72, 'Fatehpur Sikri', ' Uttar Pradesh, India', 27.095018, 77.668846, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (73, 'Ghumansar Khurd', ' Rajasthan, India', 28.24391, 75.483482, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (74, 'Panwaria', ' Rampur, Uttar Pradesh, India', 28.760918, 79.056107, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (75, 'Shirala', ' Maharashtra, India', 16.985617, 74.129868, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (76, 'Jakhinwadi', ' Maharashtra, India', 17.238325, 74.168594, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (77, 'Galleborgaon', ' Maharashtra, India', 20.090658, 75.123199, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (78, 'Patharkandi', ' Assam, India', 24.607124, 92.317726, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (79, 'Chopta', ' Uttarakhand, India', 30.346434, 79.048386, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (80, 'Lipti', ' Chhattisgarh, India', 22.636292, 83.402977, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (84, 'Bawal', ' Haryana, India', 28.095589, 76.592751, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (81, 'Hatkanangale', ' Maharashtra, India', 16.74456, 74.446701, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (91, 'Bhatgaon', ' Chhattisgarh, India', 21.655977, 82.803757, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (101, 'Pathapatnam', ' Andhra Pradesh, India', 18.750523, 84.091576, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (111, 'Rangpo', ' Sikkim, India', 27.176147, 88.528732, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (121, 'Thekkady', ' Kumily, Kerala, India', 9.606325, 77.169701, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (131, 'Imphal West', ' Manipur, India', 24.782784, 93.885895, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (141, 'Aruvankadu', ' Tamil Nadu, India', 11.368327, 76.771164, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (151, 'Bobbili', ' Andhra Pradesh, India', 18.573505, 83.358368, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (161, 'Kuhi', ' Maharashtra, India', 21.017248, 79.367676, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (171, 'Puluru', ' Telangana, India', 15.875523, 77.997025, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (181, 'Bandardewa', ' Arunachal Pradesh, India', 27.095158, 93.82737, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (191, 'Urga', ' Chhattisgarh, India', 22.276445, 82.7267, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (201, 'Katraul', ' Bihar, India', 26.351614, 85.683624, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (211, 'Memari', ' West Bengal, India', 23.172888, 88.098244, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (221, 'Vemulawada', ' Telangana, India', 18.481934, 78.867226, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (231, 'Gadchandur', ' Maharashtra, India', 19.729097, 79.173195, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (241, 'Kedar Nagar', ' Uttar Pradesh, India', 26.540569, 82.547791, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (251, 'Rajesultanpur', ' Uttar Pradesh, India', 26.303431, 83.078415, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (261, 'Manguli', ' Cuttack, Odisha, India', 20.327068, 86.063324, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (271, 'Mul', ' Maharashtra, India', 20.072056, 79.673538, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (281, 'Aunta', ' Uttar Pradesh, India', 26.076483, 79.478058, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (291, 'Kyara', ' Uttar Pradesh, India', 28.252136, 79.420456, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (82, 'Mothkur', ' Telangana, India', 17.472683, 79.25946, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (92, 'Angul', ' Odisha, India', 20.844402, 85.151085, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (102, 'Ganeshgarh', ' Rajasthan, India', 29.746632, 73.903648, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (112, 'Candolim', ' Goa, India', 15.515447, 73.768402, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (122, 'Uchgaon', ' Kolhapur, Maharashtra, India', 16.696154, 74.274345, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (132, 'Raoti', ' Madhya Pradesh, India', 23.225624, 74.840477, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (142, 'Karmala', ' Maharashtra, India', 18.40724, 75.195221, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (152, 'Mandvi', ' Gujarat, India', 22.833334, 69.355476, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (162, 'Budhma', ' Bihar, India', 25.913647, 86.873276, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (172, 'Ieeja', ' Telangana, India', 16.019527, 77.667908, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (182, 'Vasind', ' Maharashtra, India', 19.408226, 73.264618, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (192, 'Gajendragad', ' Karnataka, India', 15.736078, 75.971001, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (202, 'Fedara', ' Gujarat, India', 22.452955, 72.157906, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (212, 'Bamiyal', ' Punjab, India', 32.286846, 75.374741, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (222, 'Maliwada', ' Maharastra, India', 19.928707, 75.221649, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (232, 'Reru', ' Jalandhar, Punjab, India', 31.359907, 75.590981, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (242, 'Gopalapur', ' Uttar Pradesh, India', 25.946089, 82.555107, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (252, 'Avadi', ' Tiruvallur, Tamil Nadu, India', 13.114656, 80.089645, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (262, 'Bhagwanpur', ' Uttarakhand, India', 29.941095, 77.812424, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (272, 'Chautham', ' Bihar, India', 25.540274, 86.659813, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (282, 'Bishnupur', ' West Bengal, India', 23.067881, 87.316521, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (292, 'Sumbal', ' Jammu and Kashmir, India', 34.230705, 74.647308, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (83, 'Dharampur', ' Gujarat, India', 20.54014, 73.179214, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (93, 'Deogarh', ' Odisha, India', 21.538315, 84.728943, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (103, 'Brahamanwada Thadi', ' Maharashtra, India', 21.324831, 77.732201, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (113, 'Khandaghosh', ' West Bengal, India', 23.214766, 87.689949, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (123, 'Etmadpur', ' Uttar Pradesh, India', 27.233313, 78.199188, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (133, 'Eyyal', ' Tamil Nadu, India', 12.406525, 79.326134, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (143, 'Adgaon', ' Nashik, Maharashtra, India', 20.039238, 73.856606, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (153, 'Pariyawan', ' Uttar Pradesh, India', 25.806955, 81.378456, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (163, 'Chainpur', ' Jharkhand, India', 23.133387, 84.240814, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (173, 'Kalwakurthy', ' Telangana, India', 16.668499, 78.490639, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (183, 'Borgaon', ' Karnataka, India', 16.600021, 74.50531, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (193, 'Poicha', ' Gujarat, India', 21.970097, 73.462425, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (203, 'Malpura', ' Rajasthan, India', 26.300568, 75.369659, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (213, 'Gopiballabpur', ' West Bengal, India', 22.205948, 86.894775, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (223, 'Bhadrajun', ' Rajasthan, India', 25.603775, 72.889946, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (233, 'Malshiras', ' Maharashtra, India', 17.863255, 74.905479, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (243, 'Jetalpur', ' Gujarat, India', 22.890657, 72.595573, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (253, 'Badrinath', ' Uttarakhand, India', 30.743309, 79.493767, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (263, 'Lalbarra', ' Balaghat, Madhya Pradesh, India', 21.938848, 80.050697, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (273, 'Pokharan', ' Rajasthan, India', 26.920542, 71.91655, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (283, 'Genguvarpatti', ' Tamil Nadu, India', 10.170677, 77.69799, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (293, 'Kumbharia Balipokhari', ' Odisha, India', 20.897675, 86.313591, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (85, 'Thasra', ' Gujarat, India', 22.802561, 73.220505, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (95, 'Dalsingh Sarai', ' Bihar, India', 25.668974, 85.834892, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (105, 'Pallikkara', ' Kerala, India', 11.503067, 75.635963, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (115, 'Rudri', ' Chhattisgarh, India', 20.665974, 81.552872, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (125, 'Gudalur', ' Tamil Nadu, India', 11.502995, 76.491722, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (135, 'Dattapur Dhamangaon', ' Maharashtra, India', 20.795732, 78.138779, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (145, 'Wokha', ' Nagaland, India', 26.091036, 94.258972, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (155, 'Bamangachi', ' West Bengal, India', 22.75692, 88.507256, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (165, 'Awankhed', ' Maharashtra, India', 20.246393, 73.849625, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (175, 'Maddur', ' Telangana, India', 16.860228, 77.612083, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (185, 'Syaldey', ' Uttarakhand, India', 29.823778, 79.209511, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (195, 'Rudhauli', ' Uttar Pradesh, India', 27.032515, 82.804024, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (205, 'Desari', ' Bihar, India', 25.6647, 85.404022, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (215, 'Rameswar', ' Jalgaon, Maharashtra, India', 9.397255, 78.626305, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (225, 'Tundla', ' Agra, Uttar Pradesh, India', 27.226391, 78.243103, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (235, 'Shahabad', ' Uttar Pradesh, India', 27.644138, 79.94471, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (245, 'Chohtan', ' Rajasthan, India', 25.49448, 71.08223, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (255, 'Dera Baba Nanak', ' Punjab, India', 32.032185, 75.030449, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (265, 'Sarava', ' Lucknow, Uttar Pradesh, India', 26.935722, 80.70591, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (275, 'Shelu Bazar', ' Maharashtra, India', 20.371378, 77.249855, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (285, 'Dalmau', ' Uttar Pradesh, India', 26.078371, 81.056442, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (295, 'Bilgram', ' Uttar Pradesh, India', 27.183037, 80.041679, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (86, 'Lohagad', ' Maharashtra, India', 18.694317, 73.487259, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (96, 'Jalalabad', ' Punjab, India', 30.60573, 74.256111, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (106, 'Kevadia', ' Gujarat, India', 21.882874, 73.697624, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (116, 'Sakri', ' Maharashtra, India', 20.993189, 74.314514, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (126, 'Chargaon', ' Maharashtra, India', 21.264942, 78.750099, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (136, 'Panewadi', ' Maharashtra, India', 20.271851, 74.507507, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (146, 'Rai Durg', ' Telangana, India', 17.416315, 78.389847, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (156, 'Kondumal', ' Maharashtra, India', 20.022755, 79.285271, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (166, 'Tindivanam', ' Tamil Nadu, India', 12.236884, 79.649948, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (176, 'Kodangal', ' Telangana, India', 17.1103, 77.623543, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (186, 'Champa Nagar', ' Uttarakhand, India', 29.830875, 79.202194, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (196, 'Varkala', ' Kerala, India', 8.737868, 76.716339, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (206, 'Honnavar', ' Karnataka, India', 14.27975, 74.443924, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (216, 'Charadva', ' Gujarat, India', 22.926941, 71.024521, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (226, 'Charai', ' Thane West, Thane, Maharashtra, India', 19.198542, 72.974846, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (236, 'Kullanchavadi', ' Tamil Nadu, India', 11.629657, 79.67128, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (246, 'Kaithwar', ' Bihar, India', 26.167292, 86.259033, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (256, 'Bewar', ' Uttar Pradesh, India', 25.758936, 79.92453, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (266, 'Borsia', ' Ghazipur, Uttar Pradesh, India', 25.628294, 83.622696, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (276, 'Kharela', ' Uttar Pradesh, India', 25.540396, 79.810066, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (286, 'Jahangir Ganj', ' Uttar Pradesh, India', 26.415346, 82.979729, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (296, 'Jaisinagar', ' Madhya Pradesh, India', 23.618185, 78.572563, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (87, 'Parwaha', ' Bihar, India', 26.233364, 87.226997, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (97, 'Takarwan', ' Maharashtra, India', 19.25038, 76.012505, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (107, 'Patarajpur', ' Odisha, India', 20.608757, 86.243416, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (117, 'Muddebihal', ' Karnataka, India', 16.339136, 76.130211, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (127, 'Huzurabad', ' Telangana, India', 18.201895, 79.396706, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (137, 'Awadhan', ' Dhule, Maharashtra, India', 20.845247, 74.760902, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (147, 'Kakiriguma', ' Odisha, India', 18.924225, 83.01062, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (157, 'Jui Khurd', ' Haryana, India', 28.633448, 75.943291, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (167, 'Sattenapalle', ' Andhra Pradesh, India', 16.394667, 80.149147, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (177, 'Arsena', ' Agra, Uttar Pradesh, India', 27.237696, 77.838142, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (187, 'Vikarabad', ' Telangana, India', 17.33643, 77.904846, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (197, 'Valasna', ' Gujarat, India', 23.827955, 72.78212, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (207, 'Iglas', ' Uttar Pradesh, India', 27.710951, 77.937683, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (217, 'Tungidighi', ' West Bengal, India', 25.755753, 87.95771, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (227, 'Koradi', ' Nagpur, Maharashtra, India', 21.237804, 79.112511, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (237, 'Shirud', ' Maharashtra, India', 20.740564, 74.895302, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (247, 'Urun Islampur', ' Maharashtra, India', 17.051073, 74.261742, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (257, 'Mehgam', ' Bharuch, Gujarat, India', 21.673908, 72.757729, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (267, 'Bhopalgarh', ' Rajasthan, India', 26.649759, 73.495621, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (277, 'Chorma', ' Bihar, India', 26.510519, 85.091171, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (287, 'Eksara', ' Howrah, West Bengal, India', 22.632233, 88.29248, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (297, 'Nidhasan', ' Uttar Pradesh, India', 27.144415, 80.868881, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (88, 'Jamtala', ' Jalabaria, West Bengal, India', 22.108612, 88.572548, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (98, 'Purena', ' Raipur, Chhattisgarh, India', 21.238678, 81.704781, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (108, 'Kulei', ' Odisha, India', 21.09145, 85.136497, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (118, 'Vatadara', ' Gujarat, India', 22.3407, 72.752487, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (128, 'Yedathore', ' Karnataka, India', 12.470855, 76.386024, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (138, 'Kanturka', ' West Bengal, India', 24.998625, 88.321503, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (148, 'Allowal', ' Punjab, India', 31.144585, 75.478325, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (158, 'Akkalkuva', ' Maharashtra, India', 21.554268, 74.016029, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (168, 'Shadnagar', ' Telangana, India', 17.07123, 78.204887, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (178, 'Nethaur', ' Uttar Pradesh, India', 29.323637, 78.38707, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (188, 'Nandavara', ' Karnataka, India', 12.867657, 75.038834, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (198, 'Majhgawa', ' Madhya Pradesh, India', 24.91367, 80.807327, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (208, 'Udhampur', ' Jammu and Kashmir, India', 32.916534, 75.132607, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (218, 'Aravatagi', ' Hubballi, Karnataka, India', 15.449764, 74.819016, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (228, 'Vita', ' Maharashtra, India', 17.273096, 74.538826, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (238, 'Silhati', ' Chhattisgarh, India', 21.783251, 81.126526, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (248, 'Changodar', ' Gujarat, India', 22.918116, 72.440613, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (258, 'Hannur', ' Maharashtra, India', 17.668001, 76.190018, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (268, 'Dehu Road', ' Pimpri Chinchwad, Maharashtra, India', 18.684626, 73.723068, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (278, 'Dramman', ' Himachal Pradesh, India', 32.227249, 76.165207, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (288, 'Mankapur', ' Uttar Pradesh, India', 27.043215, 82.212143, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (298, 'Pimpri Gawali', ' Maharashtra, India', 18.920607, 74.575623, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (89, 'Taraori', ' Haryana, India', 29.799627, 76.923973, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (99, 'Kailash', ' Karnal, Haryana, India', 29.728127, 77.010422, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (109, 'Dalhousie', ' Himachal Pradesh, India', 32.539555, 75.970955, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (119, 'Dhondalgaon', ' Maharashtra, India', 19.982878, 74.938416, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (129, 'Poovattoor', ' Kerala, India', 9.05604, 76.752411, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (139, 'Ghulewadi', ' Maharashtra, India', 19.611471, 74.193527, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (149, 'Lonand', ' Maharashtra, India', 18.041706, 74.18618, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (159, 'Nilaji', ' Karnataka, India', 16.548655, 74.891647, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (169, 'Jadcherla', ' Telangana, India', 16.763159, 78.143585, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (179, 'Tukada', ' Gujarat, India', 21.526697, 69.724129, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (189, 'Lalgarh Jattan', ' Rajasthan, India', 29.84203, 74.025513, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (199, 'Kagarol', ' Uttar Pradesh, India', 27.022673, 77.846916, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (209, 'Laling', ' Dhule, Maharashtra, India', 20.824259, 74.748177, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (219, 'Pure Dadhu', ' Uttar Pradesh, India', 26.941858, 82.150963, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (229, 'Lulhara', ' Bharatpur, Rajasthan, India', 27.168571, 77.313271, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (239, 'Dupadu', ' Andhra Pradesh, India', 15.916674, 79.367073, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (249, 'Morgram', ' West Bengal, India', 24.30258, 88.016388, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (259, 'Bamane', ' Maharashtra, India', 19.451019, 73.346626, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (269, 'Habibpur', ' West Bengal, India', 23.199638, 88.536224, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (279, 'Brahmapuri', ' Maharasthra, India', 20.608042, 79.861336, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (289, 'Talod', ' Gujarat, India', 23.351227, 72.950493, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (299, 'Jansath', ' Uttar Pradesh, India', 29.322609, 77.848465, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (90, 'Kayalpatnam', ' Tamil Nadu, India', 8.568315, 78.123833, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (100, 'Nimta', ' Kolkata, West Bengal, India', 22.668962, 88.408844, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (110, 'Khandokata', ' Odisha, India', 21.793653, 84.326042, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (120, 'Hulagabali', ' Karnataka, India', 16.662367, 74.993935, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (130, 'Bhojpura', ' Rajasthan, India', 26.62359, 75.614037, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (140, 'Phalodi', ' Rajasthan, India', 27.131235, 72.358925, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (150, 'Sangavi', ' Maharashtra, India', 18.059986, 74.486023, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (160, 'Bayana', ' Rajasthan, India', 26.91581, 77.28936, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (170, 'Amangal', ' Telangana, India', 16.849434, 78.530304, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (180, 'Chamta', ' West Bengal, India', 26.292059, 89.655754, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (190, 'Haloli', ' Maharashtra, India', 19.667858, 72.906143, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (200, 'Asind', ' Rajasthan, India', 25.740776, 74.338089, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (210, 'Sampla', ' Haryana, India', 28.776157, 76.773109, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (220, 'Mayannur', ' Kerala, India', 10.750743, 76.381088, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (230, 'Vapi', ' Gujarat, India', 20.391897, 72.913277, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (240, 'Gangolihat', ' Uttarakhand, India', 29.657042, 80.039345, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (250, 'Sarila', ' Uttar Pradesh, India', 25.773968, 79.678276, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (260, 'Mubarakpur', ' Gujarat, India', 23.349136, 72.688812, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (270, 'Debagram', ' West Bengali, India', 23.696093, 88.301239, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (280, 'Nagbhir', ' Maharashtra, India', 20.582853, 79.680359, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (290, 'Idar', ' Gujarat, India', 23.843393, 73.003059, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (300, 'Morna', ' Uttar Pradesh, India', 29.467882, 77.938171, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (94, 'Sanwer', ' Madhya Pradesh, India', 22.976303, 75.827553, '2024-03-10 04:12:33', '2024-03-10 04:12:33');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (104, 'Ghasipura', ' Anandapur, Odisha, India', 21.216875, 86.112129, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (114, 'Jyotiba Nagar', ' Talwade, Vitthal Nagar, Maharashtra, India', 18.686785, 73.790443, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (124, 'Hungund', ' Karnataka, India', 16.057627, 76.060951, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (134, 'Mussoorie', ' Uttarakhand, India', 30.459909, 78.066399, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (144, 'Devalapura', ' Karnataka, India', 12.817242, 76.868309, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (154, 'Keelara', ' Karnataka, India', 12.599972, 76.941917, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (164, 'Ramgadh', ' Gujarat, India', 21.508837, 71.993614, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (174, 'Narayanpet', ' Telangana, India', 16.745668, 77.495415, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (184, 'Gejjalagere', ' Karnataka, India', 12.564031, 76.995621, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (194, 'Jhalod', ' Gujarat, India', 23.098167, 74.164352, '2024-03-10 04:12:34', '2024-03-10 04:12:34');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (204, 'Thanakalan', ' Telangana, India', 18.672577, 78.007408, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (214, 'Kapadne', ' Maharashtra, India', 21.037188, 74.809868, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (224, 'Ahan', ' Uttar Pradesh, India', 25.677322, 82.840553, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (234, 'Kursela', ' Bihar, India', 25.450579, 87.252647, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (244, 'Jawala Pathak', ' Maharashtra, India', 19.199507, 77.404213, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (254, 'Mirajgaon', ' Maharashtra, India', 18.732149, 75.025169, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (264, 'Malihabad', ' Uttar Pradesh, India', 26.923906, 80.709, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (274, 'Manali', ' Himachal Pradesh, India', 32.239632, 77.188713, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (284, 'Kokrajhar', ' Assam, India', 26.401436, 90.266701, '2024-03-10 04:12:35', '2024-03-10 04:12:35');
INSERT INTO public.places (id, place, state, latitude, longitude, inserted_at, updated_at) VALUES (294, 'Behbalpur', ' Haryana, India', 29.621187, 75.341263, '2024-03-10 04:12:35', '2024-03-10 04:12:35');


--
-- TOC entry 3535 (class 0 OID 99016)
-- Dependencies: 230
-- Data for Name: relationship_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.relationship_types (id, name, type, inserted_at, updated_at) VALUES (1, 'Friend', 'Girl', '2024-03-13 13:46:42', '2024-03-13 13:46:42');
INSERT INTO public.relationship_types (id, name, type, inserted_at, updated_at) VALUES (2, 'Friend', 'Boy', '2024-03-13 13:46:42', '2024-03-13 13:46:42');


--
-- TOC entry 3533 (class 0 OID 98996)
-- Dependencies: 228
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (1, 4, 2, '2024-03-12 19:46:21', '2024-03-12 19:46:21', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (2, 5, 2, '2024-03-12 19:46:21', '2024-03-12 19:46:21', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (3, 6, 2, '2024-03-12 19:46:21', '2024-03-12 19:46:21', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (4, 1, 2, '2024-03-12 19:46:21', '2024-03-12 19:46:21', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (5, 2, 5, '2024-03-12 19:46:42', '2024-03-12 19:46:42', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (6, 2, 6, '2024-03-12 19:46:42', '2024-03-12 19:46:42', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (7, 2, 1, '2024-03-12 19:46:42', '2024-03-12 19:46:42', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (8, 8, 2, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (9, 9, 2, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (10, 10, 2, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (11, 11, 2, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (12, 2, 9, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (13, 2, 10, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);
INSERT INTO public.relationships (id, follower_id, followed_id, inserted_at, updated_at, relationship_type_id) VALUES (14, 2, 11, '2024-03-12 19:47:36', '2024-03-12 19:47:36', NULL);


--
-- TOC entry 3521 (class 0 OID 82606)
-- Dependencies: 216
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240129075522, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240204063843, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240205143149, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240213054832, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240213142405, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240213145253, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240216095021, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240218163936, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240303111855, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240304164600, '2024-03-04 22:31:01');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240304214140, '2024-03-05 18:06:52');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240312191221, '2024-03-12 19:17:28');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240313120502, '2024-03-13 12:54:56');
INSERT INTO public.schema_migrations (version, inserted_at) VALUES (20240313205603, '2024-03-13 21:04:14');


--
-- TOC entry 3527 (class 0 OID 82743)
-- Dependencies: 222
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3523 (class 0 OID 82612)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (3, 'Heaven Turner', '2024-03-12 19:43:08', '2024-03-12 19:43:08', 'irving_bayer@bechtelar.com', '$2b$12$pFGp6DHBAihiznjPtgtTC.ALm8WL3n22mq9HBJ3rPi/7YIU..Iy8.', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (4, 'Narciso Hagenes', '2024-03-12 19:43:08', '2024-03-12 19:43:08', 'carolyne.marks@batz.name', '$2b$12$EdulyrT68O59c5wugJ1CC.xs/6y5TQ1Xhl9Pc1kIbx9oCJqVjYIVW', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (5, 'Walter Cole', '2024-03-12 19:43:08', '2024-03-12 19:43:08', 'rubye1985@runte.info', '$2b$12$k18H9TujDwjjMuJuYzUEgOjvwzNMW/ehlhmOHHRoMgZLzqQOhyNSC', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (6, 'Cruz Gerlach Jr.', '2024-03-12 19:43:08', '2024-03-12 19:43:08', 'lola1967@thiel.info', '$2b$12$C9NqmDUnvGGWGpEdDtx75uCjR9wJMcLSXZsSSoMdM4xucPt/r93YS', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (1, 'Anshuman
', '2024-03-07 18:09:23', '2024-03-07 18:09:50', 'anshumannie@gmail.com', '$2b$12$KBojkdBVTTVZW/Yy0l2SNuXr.cJlEW1k3CmZp/hYxLZDOXtiGDdA.', '2024-03-07 18:09:50', true, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (7, 'Yasmin Bahringer', '2024-03-12 19:47:34', '2024-03-12 19:47:34', 'orion1906@towne.info', '$2b$12$LjbCKR22EB4dNwDStf8Gpu5P90dfltafre72Iami5N8hOP.vqoDO.', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (8, 'Novella Willms', '2024-03-12 19:47:35', '2024-03-12 19:47:35', 'mya2092@bradtke.net', '$2b$12$6/OhFA1X3MsL7YlZ//DAu.WAxdqTDHjUHN1gdAevoTchobGU8LCjS', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (9, 'Mrs. Whitney Ratke Sr.', '2024-03-12 19:47:35', '2024-03-12 19:47:35', 'jimmie2031@predovic.org', '$2b$12$mpCRTnPao.w.lw0Y7SswIu1p6EGAw.vWLDumln0/PFxV/ZJ2ojZzm', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (10, 'Gideon Hackett', '2024-03-12 19:47:36', '2024-03-12 19:47:36', 'mandy.mayer@brown.biz', '$2b$12$E80d7.FkVZzrtPkjtnlQ/.2fSQQ/0GiA7NEsdfDx/cwVSm7wa7AVW', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (11, 'Mr. Britney Schiller III', '2024-03-12 19:47:36', '2024-03-12 19:47:36', 'quincy.ledner@willms.info', '$2b$12$hotcpEodDxib4kmKIBzsKusKIPn4FBlr9WVM8i6AZIh6nSTzteTx.', NULL, NULL, NULL);
INSERT INTO public.users (id, name, inserted_at, updated_at, email, hashed_password, confirmed_at, is_admin, avatar) VALUES (2, 'Zachary Waters', '2024-03-12 19:43:07', '2024-03-13 21:53:41', 'alycia2073@haley.biz', '$2b$12$RQE4yslceukDp7V8Xi3zbuUL2sgSFOTwHyLVd/m8TdeCKco2gpqdS', NULL, true, NULL);


--
-- TOC entry 3525 (class 0 OID 82727)
-- Dependencies: 220
-- Data for Name: users_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_tokens (id, user_id, token, context, sent_to, inserted_at) VALUES (2, 1, '\x2da883e47277d3a1f00a9ec97d024e7fbd928d7bf402eb83fb7fc332ee9970ca', 'session', NULL, '2024-03-07 18:10:10');
INSERT INTO public.users_tokens (id, user_id, token, context, sent_to, inserted_at) VALUES (3, 1, '\x6ca7b9e6a5bca3c7e6131c66914af85fe06f20ac29bf2617703c05b6718a2477', 'session', NULL, '2024-03-13 09:48:32');


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 225
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 1622, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 223
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.places_id_seq', 300, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 229
-- Name: relationship_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relationship_types_id_seq', 2, true);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 227
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relationships_id_seq', 15, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 221
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uploads_id_seq', 1, true);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_tokens_id_seq', 3, true);


--
-- TOC entry 3364 (class 2606 OID 82779)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 82770)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 99023)
-- Name: relationship_types relationship_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship_types
    ADD CONSTRAINT relationship_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 99001)
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 82610)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3360 (class 2606 OID 82750)
-- Name: uploads uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 82617)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3357 (class 2606 OID 82734)
-- Name: users_tokens users_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 1259 OID 99013)
-- Name: relationships_followed_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationships_followed_id_index ON public.relationships USING btree (followed_id);


--
-- TOC entry 3366 (class 1259 OID 99014)
-- Name: relationships_follower_id_followed_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX relationships_follower_id_followed_id_index ON public.relationships USING btree (follower_id, followed_id);


--
-- TOC entry 3367 (class 1259 OID 99012)
-- Name: relationships_follower_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX relationships_follower_id_index ON public.relationships USING btree (follower_id);


--
-- TOC entry 3352 (class 1259 OID 82725)
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_index ON public.users USING btree (email);


--
-- TOC entry 3355 (class 1259 OID 82741)
-- Name: users_tokens_context_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_tokens_context_token_index ON public.users_tokens USING btree (context, token);


--
-- TOC entry 3358 (class 1259 OID 82740)
-- Name: users_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_tokens_user_id_index ON public.users_tokens USING btree (user_id);


--
-- TOC entry 3375 (class 2606 OID 99007)
-- Name: relationships relationships_followed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_followed_id_fkey FOREIGN KEY (followed_id) REFERENCES public.users(id);


--
-- TOC entry 3376 (class 2606 OID 99002)
-- Name: relationships relationships_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id);


--
-- TOC entry 3377 (class 2606 OID 99024)
-- Name: relationships relationships_relationship_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_relationship_type_id_fkey FOREIGN KEY (relationship_type_id) REFERENCES public.relationship_types(id);


--
-- TOC entry 3374 (class 2606 OID 82752)
-- Name: uploads uploads_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3372 (class 2606 OID 82757)
-- Name: users users_avatar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_avatar_fkey FOREIGN KEY (avatar) REFERENCES public.uploads(id);


--
-- TOC entry 3373 (class 2606 OID 82735)
-- Name: users_tokens users_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2024-03-17 11:25:17 IST

--
-- PostgreSQL database dump complete
--
