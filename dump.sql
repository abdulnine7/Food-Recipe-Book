--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)

-- Started on 2019-09-14 01:48:57 IST

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25228)
-- Name: recipes; Type: TABLE; Schema: public; Owner: abdul
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    name character(255),
    ingredients text,
    directions text
);


ALTER TABLE public.recipes OWNER TO abdul;

--
-- TOC entry 197 (class 1259 OID 25231)
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: abdul
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO abdul;

--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 197
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abdul
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- TOC entry 2882 (class 2604 OID 25233)
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: abdul
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 25228)
-- Dependencies: 196
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: abdul
--

COPY public.recipes (id, name, ingredients, directions) FROM stdin;
2	KISS Salmon                                                                                                                                                                                                                                                    	2 Salmon Fillets, 1/4 cup Barbeque Sauce, 1/4 Cup Raspberry Jam	Preheat oven to 400 degrees. Grease and 11 x 7-inch baking dish. Place the salmon fillets into the prepared baking dish with skin sides down. Stir the barbeque sauce and raspberry jam together in a small bowl. Generously brush the mixture over the salmon. Bake in the preheated oven until the salmon is opaque and flakes easily with a fork, 35 to 40 minutes. Brush again with the sauce mixture after the first 15 minutes of baking time.
1	Mushroom Meat Chop                                                                                                                                                                                                                                             	4 Meat Chops,1 Pinch Garlic Salt,1 can Cream of Mushroom Soup,1/2 Pound of cream of mushroom soup	In a large skillet, brown the chops over medium-high heat. Add the onion and mushrooms, and saute for one minute. Pour cream of mushroom soup over chops. Cover skillet, and reduce temperature to medium-low. Simmer 20 to 30 minutes, or until chops are cooked through.
6	Indian Laddus                                                                                                                                                                                                                                                  	1 Kg besan aata, 1 kg sugar, 100 Gms Dry fruits	Mix the besan aata sugar with water make loaf of it till it turns smooth batten make round and round spherical laddus. Sprinkle dry fruits on it and Enjoy!
\.


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 197
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdul
--

SELECT pg_catalog.setval('public.recipes_id_seq', 6, true);


--
-- TOC entry 2884 (class 2606 OID 25235)
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: abdul
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


-- Completed on 2019-09-14 01:48:57 IST

--
-- PostgreSQL database dump complete
--

