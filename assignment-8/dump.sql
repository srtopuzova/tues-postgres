--
-- PostgreSQL database dump
--

\restrict 6OsYkh3JqFllQR45BjYRET5A0zjUWOacFCoHp1vfDmeMP3GoB7Dxgx10TxvpzYl

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: device_kinds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_kinds (
    kind_id integer NOT NULL,
    kind_name character varying(50) NOT NULL
);


ALTER TABLE public.device_kinds OWNER TO postgres;

--
-- Name: device_kinds_kind_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.device_kinds ALTER COLUMN kind_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.device_kinds_kind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    device_id integer NOT NULL,
    inventory_number character varying(30) NOT NULL,
    kind_id integer NOT NULL,
    model character varying(100) NOT NULL,
    room_id integer,
    purchase_date date NOT NULL
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: devices_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.devices ALTER COLUMN device_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.devices_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    room_id integer NOT NULL,
    room_name character varying(50) NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rooms ALTER COLUMN room_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: device_kinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_kinds (kind_id, kind_name) FROM stdin;
1	Computer
2	Monitor
3	Projector
4	Printer
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (device_id, inventory_number, kind_id, model, room_id, purchase_date) FROM stdin;
1	INV-1001	1	Dell OptiPlex 7060	1	2018-09-12
2	INV-1002	2	Dell P2419H	1	2019-02-20
3	INV-1003	3	Epson EB-X05	1	2017-11-03
4	INV-1004	1	HP ProDesk 400 G6	2	2021-06-15
5	INV-1005	2	LG 24MK600	2	2022-09-01
6	INV-1006	4	Brother HL-L2350DW	2	2020-01-10
7	INV-1007	1	Lenovo ThinkCentre M720	3	2018-04-18
8	INV-1008	2	Samsung S24R350	3	2023-03-22
9	INV-1009	3	BenQ MS550	\N	2016-08-30
10	INV-1010	4	HP LaserJet Pro M15w	\N	2024-01-17
11	INV-1011	1	Acer Veriton X	1	2025-02-11
12	INV-1012	2	AOC 24B2XH	3	2017-05-25
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (room_id, room_name) FROM stdin;
1	Room 101
2	Room 102
3	Computer Lab
\.


--
-- Name: device_kinds_kind_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_kinds_kind_id_seq', 4, true);


--
-- Name: devices_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_device_id_seq', 12, true);


--
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_room_id_seq', 3, true);


--
-- Name: device_kinds device_kinds_kind_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_kinds
    ADD CONSTRAINT device_kinds_kind_name_key UNIQUE (kind_name);


--
-- Name: device_kinds device_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_kinds
    ADD CONSTRAINT device_kinds_pkey PRIMARY KEY (kind_id);


--
-- Name: devices devices_inventory_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_inventory_number_key UNIQUE (inventory_number);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (device_id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);


--
-- Name: rooms rooms_room_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_name_key UNIQUE (room_name);


--
-- Name: devices devices_kind_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_kind_id_fkey FOREIGN KEY (kind_id) REFERENCES public.device_kinds(kind_id);


--
-- Name: devices devices_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(room_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 6OsYkh3JqFllQR45BjYRET5A0zjUWOacFCoHp1vfDmeMP3GoB7Dxgx10TxvpzYl

