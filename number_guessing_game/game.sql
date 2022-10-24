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

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    user_id integer NOT NULL,
    username character varying(40) NOT NULL,
    game_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_user_id_seq OWNER TO freecodecamp;

--
-- Name: game_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_user_id_seq OWNED BY public.game.user_id;


--
-- Name: game user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN user_id SET DEFAULT nextval('public.game_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (1, 'user_1666569410892', 0, 0);
INSERT INTO public.game VALUES (2, 'user_1666569410891', 0, 0);
INSERT INTO public.game VALUES (4, 'you', 0, 1);
INSERT INTO public.game VALUES (5, 'Him', 0, 0);
INSERT INTO public.game VALUES (6, 'Her', 0, 0);
INSERT INTO public.game VALUES (3, 'me', 1, 3);
INSERT INTO public.game VALUES (8, 'user_1666570936578', 2, 10);
INSERT INTO public.game VALUES (7, 'user_1666570936579', 5, 10);
INSERT INTO public.game VALUES (10, 'user_1666570978746', 2, 11);
INSERT INTO public.game VALUES (9, 'user_1666570978747', 5, 11);
INSERT INTO public.game VALUES (12, 'user_1666571002445', 2, 8);
INSERT INTO public.game VALUES (11, 'user_1666571002446', 5, 10);


--
-- Name: game_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_user_id_seq', 12, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (user_id);


--
-- Name: game game_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

