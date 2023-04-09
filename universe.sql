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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(30) NOT NULL,
    last_visit smallint,
    comet_id integer NOT NULL,
    home_galaxy character varying(30) DEFAULT 'the_milky_way'::character varying
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    millions_of_lightyears_away integer,
    galaxy_classification character varying(15),
    is_beautiful boolean DEFAULT true NOT NULL
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
    name character varying(60),
    interesting_fact text,
    home_planet character varying(60),
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(60) NOT NULL,
    is_rocky boolean,
    number_of_moons integer,
    gravity numeric(5,3),
    has_rings boolean,
    home_galaxy character varying(30) DEFAULT 'the_milky_way'::character varying
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
    name character varying(60),
    home_galaxy character varying(60),
    type_of_star character varying(30),
    is_beautiful boolean DEFAULT true NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('halleys_comet', 1986, 1, 'the_milky_way');
INSERT INTO public.comet VALUES ('comet_mcnaught', 2007, 2, 'the_milky_way');
INSERT INTO public.comet VALUES ('comet_hyakutake', 1996, 3, 'the_milky_way');
INSERT INTO public.comet VALUES ('comet_hale-bopp', 1997, 4, 'the_milky_way');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'the_black_eye_galaxy', 17, 'spiral', true);
INSERT INTO public.galaxy VALUES (2, 'the_whirlpool_galaxy', 23, 'spiral', true);
INSERT INTO public.galaxy VALUES (3, 'galaxy_ngc_3370', 98, 'spiral', true);
INSERT INTO public.galaxy VALUES (4, 'galaxy_ngc_1512', 38, 'spiral', true);
INSERT INTO public.galaxy VALUES (5, 'the_milky_way', 0, 'spiral', true);
INSERT INTO public.galaxy VALUES (6, 'messier_81', 12, 'spiral', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'phobos', 'rises and sets twice in one martian day', 'mars', false);
INSERT INTO public.moon VALUES (2, 'deimos', 'you can jump like a rocket with its low escape velocity', 'mars', false);
INSERT INTO public.moon VALUES (3, 'io', 'helped discover the speed of light', 'jupiter', false);
INSERT INTO public.moon VALUES (4, 'charon', 'plutos other half', 'pluto', false);
INSERT INTO public.moon VALUES (5, 'mimas', 'looks like the death star', 'saturn', false);
INSERT INTO public.moon VALUES (6, 'iapetus', 'light and dark', 'saturn', false);
INSERT INTO public.moon VALUES (7, 'pan', 'the ring sculptor', 'saturn', false);
INSERT INTO public.moon VALUES (8, 'neried', 'the wanderer', 'neptune', false);
INSERT INTO public.moon VALUES (9, 'callisto', 'the solar systems pin cushion', 'jupiter', false);
INSERT INTO public.moon VALUES (10, 'ganymede', 'the kind of moons', 'jupiter', false);
INSERT INTO public.moon VALUES (11, 'miranda', 'has a twin named epimetheus', 'saturn', false);
INSERT INTO public.moon VALUES (12, 'janus', 'has a twin named epimetheus', 'saturn', false);
INSERT INTO public.moon VALUES (13, 'triton', 'a volcanic space melon', 'neptune', false);
INSERT INTO public.moon VALUES (14, 'titan', 'resembles middle earth', 'saturn', false);
INSERT INTO public.moon VALUES (15, 'rhea', 'the first moon with a ring', 'saturn', false);
INSERT INTO public.moon VALUES (16, 'europa', 'the smoothest planet', 'jupiter', false);
INSERT INTO public.moon VALUES (17, 'the moon', 'the only other place humans have walked', 'earth', false);
INSERT INTO public.moon VALUES (18, 'enceladus', 'an exciting possibility for life', 'saturn', false);
INSERT INTO public.moon VALUES (19, 'atlas', 'the ufo', 'saturn', false);
INSERT INTO public.moon VALUES (20, 'hyperion', 'the space sponge', 'saturn', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', true, NULL, 3.700, false, 'the_milky_way');
INSERT INTO public.planet VALUES (2, 'venus', true, NULL, 8.900, false, 'the_milky_way');
INSERT INTO public.planet VALUES (3, 'earth', true, 1, 9.800, false, 'the_milky_way');
INSERT INTO public.planet VALUES (4, 'mars', true, 2, 3.700, false, 'the_milky_way');
INSERT INTO public.planet VALUES (5, 'jupiter', false, 95, 23.100, true, 'the_milky_way');
INSERT INTO public.planet VALUES (6, 'saturn', false, 83, 9.000, true, 'the_milky_way');
INSERT INTO public.planet VALUES (7, 'uranus', false, 27, 8.700, true, 'the_milky_way');
INSERT INTO public.planet VALUES (8, 'neptune', false, 14, 11.000, true, 'the_milky_way');
INSERT INTO public.planet VALUES (15, 'pluto', true, 5, 0.817, false, 'the_milky_way');
INSERT INTO public.planet VALUES (16, 'makemake', true, 1, 0.500, false, 'the_milky_way');
INSERT INTO public.planet VALUES (17, 'eris', true, 1, 0.820, false, 'the_milky_way');
INSERT INTO public.planet VALUES (18, 'ceres', true, 0, 0.029, false, 'the_milky_way');
INSERT INTO public.planet VALUES (19, 'haumea', true, 2, 0.401, true, 'the_milky_way');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'mu_columbae', 'the_milky_way', 'blue_star', true);
INSERT INTO public.star VALUES (2, 'alpha_centauri_a', 'the_milky_way', 'yellow_dwarf', true);
INSERT INTO public.star VALUES (3, 'alpha_centauri_b', 'the_milky_way', 'orange_dwarf', true);
INSERT INTO public.star VALUES (4, 'proxima_centauri', 'the_milky_way', 'red_dwarf', true);
INSERT INTO public.star VALUES (5, 'mintaka', 'the_milky_way', 'blue_giant', true);
INSERT INTO public.star VALUES (6, 'alnitak', 'the_milky_way', 'blue_supergiant', true);
INSERT INTO public.star VALUES (7, 'arcturus', 'the_milky_way', 'red_giant', true);
INSERT INTO public.star VALUES (8, 'antarus', 'the_milky_way', 'red_supergiant', true);
INSERT INTO public.star VALUES (9, 'sirius b', 'the_milky_way', 'white_dwarf', true);
INSERT INTO public.star VALUES (10, 'lgm-1', 'the_milky_way', 'neutron_star', true);
INSERT INTO public.star VALUES (11, 'sagittarius a*', 'the_milky_way', 'black_hole', true);
INSERT INTO public.star VALUES (12, 'luhman 16', 'the_milky_way', 'brown_dwarf', true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 19, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_comet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_fkey FOREIGN KEY (comet_id) REFERENCES public.comet(comet_id);


--
-- Name: galaxy fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_star_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

