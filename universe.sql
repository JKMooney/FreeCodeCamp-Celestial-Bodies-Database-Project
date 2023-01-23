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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30) NOT NULL,
    constellation_id integer NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_billions_of_years numeric(4,2),
    color character varying(15) NOT NULL,
    type character varying(30) NOT NULL,
    constellation character varying(45)
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text,
    discovery_year integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    has_moon boolean,
    number_of_moons integer,
    constellation character varying(45),
    potentially_habitable boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type character varying(30) NOT NULL,
    constellation character varying(45),
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Pisces', 1, 'Two fish');
INSERT INTO public.constellation VALUES ('Capricornus', 2, 'Horned goat');
INSERT INTO public.constellation VALUES ('Taurus', 3, 'Bull');
INSERT INTO public.constellation VALUES ('Sagittarius', 4, 'Centaur holding bow and arrow');
INSERT INTO public.constellation VALUES ('Aquarius', 5, 'Water bearer');
INSERT INTO public.constellation VALUES ('Aries', 6, 'Ram');
INSERT INTO public.constellation VALUES ('Scorpius', 7, 'Scorpion Tail');
INSERT INTO public.constellation VALUES ('Octans', 8, 'Eighth part of a circle called Octan');
INSERT INTO public.constellation VALUES ('Cygnus', 9, 'Swan');
INSERT INTO public.constellation VALUES ('Andromeda', 10, 'Greek mythological Princess Andromeda');
INSERT INTO public.constellation VALUES ('Virgo', 11, 'Greek mythological Goddess of Harvest and Justice');
INSERT INTO public.constellation VALUES ('Coma Berenices', 12, 'Hair of Queen Berenices of Egypt');
INSERT INTO public.constellation VALUES ('Canes Venatici', 13, 'Hunting dogs');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 13.61, 'White', 'Spiral', 'Sagittarius');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 10.01, 'Grey', 'Spiral', 'Andromeda');
INSERT INTO public.galaxy VALUES ('Sombrero', 3, 13.25, 'Brilliant White', 'Unclassified', 'Virgo');
INSERT INTO public.galaxy VALUES ('Black Eye', 4, 13.28, 'White', 'Spiral', 'Coma Berenices');
INSERT INTO public.galaxy VALUES ('Sunflower', 5, 13.28, 'Yellow', 'Spiral', 'Canes Venatici');
INSERT INTO public.galaxy VALUES ('Needle', 6, 13.24, 'Blue', 'Edge-on Spiral', 'Coma Berenices');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 'Round with craters', 0);
INSERT INTO public.moon VALUES ('Europa', 2, 2, 'Icy, round', 1610);
INSERT INTO public.moon VALUES ('Ganymede', 3, 2, 'Round with own internally generated magnetic field', 1610);
INSERT INTO public.moon VALUES ('lo', 4, 2, 'Sulfuric, round, and volcanic', 1610);
INSERT INTO public.moon VALUES ('Callisto', 5, 2, 'Round, heavily cratered surface, and ancient', 1610);
INSERT INTO public.moon VALUES ('Titan', 6, 3, 'Round, water iced surface with lakes', 1655);
INSERT INTO public.moon VALUES ('Enceladus', 7, 3, 'Round and oceanic, tiger stripe fissures', 1789);
INSERT INTO public.moon VALUES ('Mimas', 8, 3, 'Large crater, similar to the Death Star from Star Wars', 1789);
INSERT INTO public.moon VALUES ('Hyperion', 9, 3, 'Sponge-like with static charge', 1848);
INSERT INTO public.moon VALUES ('lapetus', 10, 3, 'Half black half white', 1671);
INSERT INTO public.moon VALUES ('Phoebe', 11, 3, 'dark and cold', 1898);
INSERT INTO public.moon VALUES ('Daphnis', 12, 3, 'Irregular shape', 2005);
INSERT INTO public.moon VALUES ('Rhea', 13, 3, 'Icy, round with craters', 1672);
INSERT INTO public.moon VALUES ('Phobos', 14, 4, 'Small and irregular', 1877);
INSERT INTO public.moon VALUES ('Deimos', 15, 4, 'Small and irregular', 1877);
INSERT INTO public.moon VALUES ('Triton', 16, 5, 'Round with frozen nitrogen surface', 1846);
INSERT INTO public.moon VALUES ('Despina', 17, 5, 'Irregular shape', 1989);
INSERT INTO public.moon VALUES ('Galatea', 18, 5, 'Irregular shape', 1989);
INSERT INTO public.moon VALUES ('Halimede', 19, 5, 'Grey and irregular', 2002);
INSERT INTO public.moon VALUES ('Proteus', 20, 5, 'Ellipsoidal shape with craters', 1989);
INSERT INTO public.moon VALUES ('Naiad', 21, 5, 'Irregular shape', 1989);
INSERT INTO public.moon VALUES ('Titania', 22, 6, 'Large, round with craters and icy mantle', 1787);
INSERT INTO public.moon VALUES ('Ariel', 23, 6, 'Bright and many craters', 1851);
INSERT INTO public.moon VALUES ('Umbriel', 24, 6, 'Ancient and dark with a bright ring', 1851);
INSERT INTO public.moon VALUES ('Oberon', 25, 6, 'Old and heavily cratered', 1787);
INSERT INTO public.moon VALUES ('Miranda', 26, 6, 'Giant fault canyons', 1948);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, true, 1, 'None', true);
INSERT INTO public.planet VALUES ('Jupiter', 2, 1, true, 80, 'Pisces', false);
INSERT INTO public.planet VALUES ('Saturn', 3, 1, true, 83, 'Capricornus', false);
INSERT INTO public.planet VALUES ('Mars', 4, 1, true, 2, 'Taurus', false);
INSERT INTO public.planet VALUES ('Mercury', 5, 1, false, 0, 'Sagittarius', false);
INSERT INTO public.planet VALUES ('Venus', 6, 1, false, 0, 'Capricornus', false);
INSERT INTO public.planet VALUES ('Neptune', 7, 1, true, 14, 'Aquarius', false);
INSERT INTO public.planet VALUES ('Uranus', 8, 1, true, 27, 'Aries', false);
INSERT INTO public.planet VALUES ('Gliese667Cc', 9, 2, NULL, NULL, 'Scorpius', true);
INSERT INTO public.planet VALUES ('LHS475b', 10, 3, NULL, NULL, 'Octans', true);
INSERT INTO public.planet VALUES ('Kepler69c', 11, 4, NULL, NULL, 'Cygnus', true);
INSERT INTO public.planet VALUES ('Kepler-452b', 12, 5, NULL, NULL, 'Cygnus', true);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 13, 6, NULL, NULL, 'Aquarius', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Yellow Dwarf', 'None', 1);
INSERT INTO public.star VALUES ('Gliese667C', 2, 'Red Dwarf', 'Scorpius', 1);
INSERT INTO public.star VALUES ('LHS475', 3, 'Red Dwarf', 'Octans', 1);
INSERT INTO public.star VALUES ('Kepler-69', 4, 'Yellow Dwarf', 'Cygnus', 1);
INSERT INTO public.star VALUES ('Kepler-452', 5, 'Yellow Dwarf', 'Cygnus', 1);
INSERT INTO public.star VALUES ('TRAPPIST-1', 6, 'Ultra-cool Red Dwarf', 'Aquarius', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

