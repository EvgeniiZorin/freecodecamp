--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: artificial_sattelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.artificial_sattelite (
    artificial_sattelite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(20) NOT NULL,
    year_launched integer
);


ALTER TABLE public.artificial_sattelite OWNER TO freecodecamp;

--
-- Name: earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_id_seq OWNER TO freecodecamp;

--
-- Name: earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_id_seq OWNED BY public.artificial_sattelite.artificial_sattelite_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_tyype text NOT NULL,
    age numeric(10,3),
    tar_count integer,
    notes character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    diameter_km integer,
    planet_id integer NOT NULL,
    age numeric(10,3),
    weight integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_bln_years numeric(10,3),
    diameter_km integer,
    life_present boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    life_present boolean NOT NULL,
    galaxy_id integer NOT NULL,
    mass integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: artificial_sattelite artificial_sattelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_sattelite ALTER COLUMN artificial_sattelite_id SET DEFAULT nextval('public.earth_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: artificial_sattelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.artificial_sattelite VALUES (1, 'Sputnik 1', 'Soviet Union', 1957);
INSERT INTO public.artificial_sattelite VALUES (2, 'Explorer 1', 'USA', 1958);
INSERT INTO public.artificial_sattelite VALUES (3, 'Explorer 6', 'USA', 1959);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred-spiral galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'ESO 325-G004', 'Elliptical', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'M101', 'Spiral', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 1569', 'Irregular', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'E0', 'Spherical', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'E7', 'Elliptical - highly elongated', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 3923', 'Shell galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3475, 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 3, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Amalthea', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Himalia', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Elara', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Pasiphae', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Sinope', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Lysithea', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Carme', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ananke', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Leda', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Thebe', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Adrastea', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Metis', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Callirrhoe', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Themisto', NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Megaclite', NULL, 2, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4.543, 12742, true, 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', 4.603, 139820, false, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 4.603, 6779, false, 2);
INSERT INTO public.planet VALUES (4, 'Mercury', 4.503, 4879, false, 2);
INSERT INTO public.planet VALUES (5, 'Neptune', 4.503, 49244, false, 2);
INSERT INTO public.planet VALUES (6, 'Venus', 4.503, 12104, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.503, 50724, false, 2);
INSERT INTO public.planet VALUES (8, 'Saturn', 4.503, 116460, false, 2);
INSERT INTO public.planet VALUES (11, 'HD 131399Ab', NULL, NULL, false, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-186b', NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (13, 'Kepler-186c', NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (14, 'Kepler-186d', NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (15, 'Kepler-186e', NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (16, 'Kepler-186f', NULL, NULL, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', false, 1, NULL);
INSERT INTO public.star VALUES (3, 'Antares', false, 1, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', false, 1, NULL);
INSERT INTO public.star VALUES (5, 'KW Sagittarii', false, 1, NULL);
INSERT INTO public.star VALUES (6, 'VV Cephei A', false, 1, NULL);
INSERT INTO public.star VALUES (7, 'Mu Cephei', false, 1, NULL);
INSERT INTO public.star VALUES (8, 'Kepler-186', false, 1, NULL);


--
-- Name: earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: artificial_sattelite earth_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_sattelite
    ADD CONSTRAINT earth_name_unique UNIQUE (name);


--
-- Name: artificial_sattelite earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_sattelite
    ADD CONSTRAINT earth_pkey PRIMARY KEY (artificial_sattelite_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

