--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types text NOT NULL,
    age_in_billions_of_years numeric,
    magnitude numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(15) NOT NULL,
    age_in_billions_of_years numeric,
    larger_than_luna boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_id integer,
    distance_from_earth_in_ly integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    is_in_milky_way boolean,
    is_recognized_planet boolean,
    star_id integer NOT NULL,
    magnitude numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    magnitude numeric,
    age_in_millions_of_years numeric,
    is_in_milky_way boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Barred Spiral', 10, 3.44);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Barred Spiral', 13, -20.8);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 'Spiral Galaxy', 10, 9.36);
INSERT INTO public.galaxy VALUES (4, 'NGC 2366', 'Irregular', 0.003, 11.4);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Dwarf Irregular', 1, 0.9);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf Irregular', 12, 2.7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', 4.5, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4.5, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4.5, false, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', 4.5, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4.5, false, 6);
INSERT INTO public.moon VALUES (11, 'Ariel', 4.5, false, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 4.5, false, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 4.5, false, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 4.5, false, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 4.5, false, 8);
INSERT INTO public.moon VALUES (10, 'Tethys', 4.5, false, 6);
INSERT INTO public.moon VALUES (21, 'Namaka', 4.5, false, 11);
INSERT INTO public.moon VALUES (22, 'Hi''iaka', 4.5, false, 11);
INSERT INTO public.moon VALUES (16, 'Charon', 4.5, false, 10);
INSERT INTO public.moon VALUES (17, 'Styx', 4.5, false, 10);
INSERT INTO public.moon VALUES (18, 'Nix', 4.5, false, 10);
INSERT INTO public.moon VALUES (19, 'Kerberos', 4.5, false, 10);
INSERT INTO public.moon VALUES (20, 'Hydra', 4.5, false, 10);
INSERT INTO public.moon VALUES (23, 'Dysnomia', 4.5, false, 13);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4.5, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4.5, true, 5);
INSERT INTO public.moon VALUES (4, 'Io', 4.5, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4.5, false, 5);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (3, 'N119 Emission Nebula', 5, 8, NULL);
INSERT INTO public.nebula VALUES (1, 'NGC 346', 5, 7, 200000);
INSERT INTO public.nebula VALUES (2, 'NGC 2363', 1, 6, 170000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.5, true, true, 3, -2.43);
INSERT INTO public.planet VALUES (2, 'Venus', 4.5, true, true, 3, -2.48);
INSERT INTO public.planet VALUES (3, 'Earth', 4.5, true, true, 3, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 4.5, true, true, 3, -2.9);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4.5, true, true, 3, -2.9);
INSERT INTO public.planet VALUES (6, 'Saturn', 4.5, true, true, 3, -0.55);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.5, true, true, 3, 5.4);
INSERT INTO public.planet VALUES (8, 'Neptune', 4.5, true, true, 3, 7.67);
INSERT INTO public.planet VALUES (9, 'Ceres', 4.5, true, true, 3, 6.7);
INSERT INTO public.planet VALUES (10, 'Pluto', 4.5, true, false, 3, 14.4);
INSERT INTO public.planet VALUES (11, 'Haumea', 4.5, true, false, 3, 17.3);
INSERT INTO public.planet VALUES (12, 'Makemake', 4.5, true, false, 3, 17.0);
INSERT INTO public.planet VALUES (13, 'Eris', 4.5, true, false, 3, 18.7);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 4.85, true, false, 9, 11.13);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1e', 4.85, true, false, 10, 18.80);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1f', 5.4, true, false, 10, 18.80);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'AE Andromedae', 1, 17.9, 10, false);
INSERT INTO public.star VALUES (4, 'Romano''s Star', 2, 16.5, 4.5, false);
INSERT INTO public.star VALUES (5, 'Sun', 3, -26.74, 4600, true);
INSERT INTO public.star VALUES (6, 'NGC 2363-V1', 4, 17.2, 2, false);
INSERT INTO public.star VALUES (7, 'HD 5980', 5, 11.7, 4, false);
INSERT INTO public.star VALUES (8, 'S Doradus', 6, 11.5, 10, false);
INSERT INTO public.star VALUES (10, 'TRAPPIST-1', 3, 18.8, 7605, true);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 3, 11.3, 4853, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: nebula nebula_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

