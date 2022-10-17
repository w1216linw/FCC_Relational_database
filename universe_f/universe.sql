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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    speed integer,
    gravity numeric(10,5)
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
    name character varying(30) NOT NULL,
    radius integer,
    speed integer,
    gravity numeric(10,5),
    description text,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    speed integer,
    gravity numeric(10,5),
    haswater boolean,
    hastree boolean,
    star_id integer
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
-- Name: ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ship (
    ship_id integer NOT NULL,
    name character varying(30) NOT NULL,
    length integer,
    weight integer
);


ALTER TABLE public.ship OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ship_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_ship_id_seq OWNER TO freecodecamp;

--
-- Name: ship_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ship_ship_id_seq OWNED BY public.ship.ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    speed integer,
    gravity numeric(10,5),
    size text,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: ship ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship ALTER COLUMN ship_id SET DEFAULT nextval('public.ship_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a123', 9852, 2, 25.20000);
INSERT INTO public.galaxy VALUES (2, 'b321', 1252, 52, 25.50000);
INSERT INTO public.galaxy VALUES (3, 'abv1', 1245, 63, 122.00000);
INSERT INTO public.galaxy VALUES (4, 'asb2', 612, 25, 12.20000);
INSERT INTO public.galaxy VALUES (5, '124vs', 125, 12, 25.20000);
INSERT INTO public.galaxy VALUES (6, 'avs', 21265, 125, 232.20000);
INSERT INTO public.galaxy VALUES (7, '124sf', 1252, 166, 23.20000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1124124qwraz', 12, 12, 12.00000, '215125sar34r3254r235', 1);
INSERT INTO public.moon VALUES (2, 'fgj124124124', 51, 2, 1.00000, 'sad124sadf34sf1235', 2);
INSERT INTO public.moon VALUES (3, '1vb1241n2sz', 125, 12, 2.00000, 'asfasf', 3);
INSERT INTO public.moon VALUES (4, 'zxv1225ds', 125, 1234, 12.00000, '1sdfsfd25', 4);
INSERT INTO public.moon VALUES (5, '12as2662fas', 125, 421, 321.00000, 'asfaf2525as', 5);
INSERT INTO public.moon VALUES (6, '5aa2515sfww', 6126, 124, 1243.00000, 'asd2dasd2das2f', 6);
INSERT INTO public.moon VALUES (7, 'safaa1252', 5125, 1254, 125.00000, 'asfasfasfasfasfasf', 7);
INSERT INTO public.moon VALUES (8, '1124124qwrarytuz', 12, 12, 12.00000, '215125sar34r3254r235', 1);
INSERT INTO public.moon VALUES (9, 'fgj12412412tyrur4', 51, 2, 1.00000, 'sad124sadf34sf1235', 2);
INSERT INTO public.moon VALUES (10, '1vb1241npuipou2sz', 125, 12, 2.00000, 'asfasf', 3);
INSERT INTO public.moon VALUES (11, 'zxbnmghv1225ds', 125, 1234, 12.00000, '1sdfsfd25', 4);
INSERT INTO public.moon VALUES (12, '12as2662qwr2fas', 125, 421, 321.00000, 'asfaf2525as', 5);
INSERT INTO public.moon VALUES (13, '5aa251asfasf5sfww', 6126, 124, 1243.00000, 'asd2dasd2das2f', 6);
INSERT INTO public.moon VALUES (14, 'safaa12aafszx52', 5125, 1254, 125.00000, 'asfasfasfasfasfasf', 7);
INSERT INTO public.moon VALUES (15, '112qwrqwr4124qwrarytuz', 12, 12, 12.00000, '215125sar34r3254r235', 1);
INSERT INTO public.moon VALUES (16, 'fgj1241241zxc2tyrur4', 51, 2, 1.00000, 'sad124sadf34sf1235', 2);
INSERT INTO public.moon VALUES (17, '1vb1241npuipouqwdqwd2sz', 125, 12, 2.00000, 'asfasf', 3);
INSERT INTO public.moon VALUES (18, 'zxbnmghv122,oli5ds', 125, 1234, 12.00000, '1sdfsfd25', 4);
INSERT INTO public.moon VALUES (19, '12as2662qwr2fuymjas', 125, 421, 321.00000, 'asfaf2525as', 5);
INSERT INTO public.moon VALUES (20, '5aa251asfasf5sfvreww', 6126, 124, 1243.00000, 'asd2dasd2das2f', 6);
INSERT INTO public.moon VALUES (21, 'safaa12aafszcvnbx52', 5125, 1254, 125.00000, 'asfasfasfasfasfasf', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '1az', 12, 12, 12.00000, true, true, 1);
INSERT INTO public.planet VALUES (2, '124', 51, 2, 1.00000, true, false, 2);
INSERT INTO public.planet VALUES (3, '12sz', 125, 12, 2.00000, false, false, 3);
INSERT INTO public.planet VALUES (4, '12ds', 125, 1234, 12.00000, true, true, 4);
INSERT INTO public.planet VALUES (5, '12as', 125, 421, 321.00000, true, true, 5);
INSERT INTO public.planet VALUES (6, '5aww', 6126, 124, 1243.00000, true, false, 6);
INSERT INTO public.planet VALUES (7, 'asfz2', 5125, 125, 42.00000, true, true, 7);
INSERT INTO public.planet VALUES (8, '1qwraz', 12, 12, 12.00000, true, true, 1);
INSERT INTO public.planet VALUES (9, 'fgj124', 51, 2, 1.00000, true, false, 2);
INSERT INTO public.planet VALUES (10, '1vbn2sz', 125, 12, 2.00000, false, false, 3);
INSERT INTO public.planet VALUES (11, 'zxv12ds', 125, 1234, 12.00000, true, true, 4);
INSERT INTO public.planet VALUES (12, '12asfas', 125, 421, 321.00000, true, true, 5);
INSERT INTO public.planet VALUES (13, '5aasfww', 6126, 124, 1243.00000, true, false, 6);
INSERT INTO public.planet VALUES (14, 'safasfz2', 5125, 125, 42.00000, true, true, 7);


--
-- Data for Name: ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ship VALUES (1, 'abc', 12, 12);
INSERT INTO public.ship VALUES (2, 'csa', 14, 15);
INSERT INTO public.ship VALUES (3, 'asc', 15, 16);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '1qaz', 123, 123, 123.00000, '123', 1);
INSERT INTO public.star VALUES (2, '1qza', 312, 123, 321.00000, '123', 2);
INSERT INTO public.star VALUES (3, '2sx', 123, 124, 15.00000, '25', 3);
INSERT INTO public.star VALUES (4, '3as', 215, 326, 568.00000, '34', 4);
INSERT INTO public.star VALUES (5, '123asd', 151, 2151, 214.00000, '52', 5);
INSERT INTO public.star VALUES (6, 'asgas', 165, 24, 1521.00000, '512', 6);
INSERT INTO public.star VALUES (7, '1252', 215, 124, 745.00000, '45', 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: ship_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ship_ship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: ship ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_name_key UNIQUE (name);


--
-- Name: ship ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ship
    ADD CONSTRAINT ship_pkey PRIMARY KEY (ship_id);


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

