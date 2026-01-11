--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2026-01-11 12:46:46 CET

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
-- TOC entry 218 (class 1259 OID 16886)
-- Name: days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.days (
    id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    day_of_month integer NOT NULL,
    name_day character varying(20),
    number_day_in_week integer,
    full_date date
);


ALTER TABLE public.days OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16885)
-- Name: days_of_week_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.days_of_week_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.days_of_week_id_seq OWNER TO postgres;

--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 217
-- Name: days_of_week_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.days_of_week_id_seq OWNED BY public.days.id;


--
-- TOC entry 219 (class 1259 OID 16892)
-- Name: days_of_week_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.days_of_week_name (
    id integer NOT NULL,
    name_day character(1) NOT NULL
);


ALTER TABLE public.days_of_week_name OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16817)
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notes (
    date date,
    notes character varying,
    id integer NOT NULL,
    status character varying(64)
);


ALTER TABLE public.notes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16849)
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_id_seq OWNER TO postgres;

--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 216
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- TOC entry 3453 (class 2604 OID 16889)
-- Name: days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days ALTER COLUMN id SET DEFAULT nextval('public.days_of_week_id_seq'::regclass);


--
-- TOC entry 3452 (class 2604 OID 16850)
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- TOC entry 3604 (class 0 OID 16886)
-- Dependencies: 218
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.days (id, year, month, day_of_month, name_day, number_day_in_week, full_date) FROM stdin;
1	2025	1	1	Wednesday	2	2025-01-01
2	2025	1	2	Thursday	3	2025-01-02
3	2025	1	3	Friday	4	2025-01-03
4	2025	1	4	Saturday	5	2025-01-04
5	2025	1	5	Sunday	6	2025-01-05
6	2025	1	6	Monday	0	2025-01-06
7	2025	1	7	Tuesday	1	2025-01-07
8	2025	1	8	Wednesday	2	2025-01-08
9	2025	1	9	Thursday	3	2025-01-09
10	2025	1	10	Friday	4	2025-01-10
11	2025	1	11	Saturday	5	2025-01-11
12	2025	1	12	Sunday	6	2025-01-12
13	2025	1	13	Monday	0	2025-01-13
14	2025	1	14	Tuesday	1	2025-01-14
15	2025	1	15	Wednesday	2	2025-01-15
16	2025	1	16	Thursday	3	2025-01-16
17	2025	1	17	Friday	4	2025-01-17
18	2025	1	18	Saturday	5	2025-01-18
19	2025	1	19	Sunday	6	2025-01-19
20	2025	1	20	Monday	0	2025-01-20
21	2025	1	21	Tuesday	1	2025-01-21
22	2025	1	22	Wednesday	2	2025-01-22
23	2025	1	23	Thursday	3	2025-01-23
24	2025	1	24	Friday	4	2025-01-24
25	2025	1	25	Saturday	5	2025-01-25
26	2025	1	26	Sunday	6	2025-01-26
27	2025	1	27	Monday	0	2025-01-27
28	2025	1	28	Tuesday	1	2025-01-28
29	2025	1	29	Wednesday	2	2025-01-29
30	2025	1	30	Thursday	3	2025-01-30
31	2025	1	31	Friday	4	2025-01-31
32	2025	2	1	Saturday	5	2025-02-01
33	2025	2	2	Sunday	6	2025-02-02
34	2025	2	3	Monday	0	2025-02-03
35	2025	2	4	Tuesday	1	2025-02-04
36	2025	2	5	Wednesday	2	2025-02-05
37	2025	2	6	Thursday	3	2025-02-06
38	2025	2	7	Friday	4	2025-02-07
39	2025	2	8	Saturday	5	2025-02-08
40	2025	2	9	Sunday	6	2025-02-09
41	2025	2	10	Monday	0	2025-02-10
42	2025	2	11	Tuesday	1	2025-02-11
43	2025	2	12	Wednesday	2	2025-02-12
44	2025	2	13	Thursday	3	2025-02-13
45	2025	2	14	Friday	4	2025-02-14
46	2025	2	15	Saturday	5	2025-02-15
47	2025	2	16	Sunday	6	2025-02-16
48	2025	2	17	Monday	0	2025-02-17
49	2025	2	18	Tuesday	1	2025-02-18
50	2025	2	19	Wednesday	2	2025-02-19
51	2025	2	20	Thursday	3	2025-02-20
52	2025	2	21	Friday	4	2025-02-21
53	2025	2	22	Saturday	5	2025-02-22
54	2025	2	23	Sunday	6	2025-02-23
55	2025	2	24	Monday	0	2025-02-24
56	2025	2	25	Tuesday	1	2025-02-25
57	2025	2	26	Wednesday	2	2025-02-26
58	2025	2	27	Thursday	3	2025-02-27
59	2025	2	28	Friday	4	2025-02-28
60	2025	3	1	Saturday	5	2025-03-01
61	2025	3	2	Sunday	6	2025-03-02
62	2025	3	3	Monday	0	2025-03-03
63	2025	3	4	Tuesday	1	2025-03-04
64	2025	3	5	Wednesday	2	2025-03-05
65	2025	3	6	Thursday	3	2025-03-06
66	2025	3	7	Friday	4	2025-03-07
67	2025	3	8	Saturday	5	2025-03-08
68	2025	3	9	Sunday	6	2025-03-09
69	2025	3	10	Monday	0	2025-03-10
70	2025	3	11	Tuesday	1	2025-03-11
71	2025	3	12	Wednesday	2	2025-03-12
72	2025	3	13	Thursday	3	2025-03-13
73	2025	3	14	Friday	4	2025-03-14
74	2025	3	15	Saturday	5	2025-03-15
75	2025	3	16	Sunday	6	2025-03-16
76	2025	3	17	Monday	0	2025-03-17
77	2025	3	18	Tuesday	1	2025-03-18
78	2025	3	19	Wednesday	2	2025-03-19
79	2025	3	20	Thursday	3	2025-03-20
80	2025	3	21	Friday	4	2025-03-21
81	2025	3	22	Saturday	5	2025-03-22
82	2025	3	23	Sunday	6	2025-03-23
83	2025	3	24	Monday	0	2025-03-24
84	2025	3	25	Tuesday	1	2025-03-25
85	2025	3	26	Wednesday	2	2025-03-26
86	2025	3	27	Thursday	3	2025-03-27
87	2025	3	28	Friday	4	2025-03-28
88	2025	3	29	Saturday	5	2025-03-29
89	2025	3	30	Sunday	6	2025-03-30
90	2025	3	31	Monday	0	2025-03-31
91	2025	4	1	Tuesday	1	2025-04-01
92	2025	4	2	Wednesday	2	2025-04-02
93	2025	4	3	Thursday	3	2025-04-03
94	2025	4	4	Friday	4	2025-04-04
95	2025	4	5	Saturday	5	2025-04-05
96	2025	4	6	Sunday	6	2025-04-06
97	2025	4	7	Monday	0	2025-04-07
98	2025	4	8	Tuesday	1	2025-04-08
99	2025	4	9	Wednesday	2	2025-04-09
100	2025	4	10	Thursday	3	2025-04-10
101	2025	4	11	Friday	4	2025-04-11
102	2025	4	12	Saturday	5	2025-04-12
103	2025	4	13	Sunday	6	2025-04-13
104	2025	4	14	Monday	0	2025-04-14
105	2025	4	15	Tuesday	1	2025-04-15
106	2025	4	16	Wednesday	2	2025-04-16
107	2025	4	17	Thursday	3	2025-04-17
108	2025	4	18	Friday	4	2025-04-18
109	2025	4	19	Saturday	5	2025-04-19
110	2025	4	20	Sunday	6	2025-04-20
111	2025	4	21	Monday	0	2025-04-21
112	2025	4	22	Tuesday	1	2025-04-22
113	2025	4	23	Wednesday	2	2025-04-23
114	2025	4	24	Thursday	3	2025-04-24
115	2025	4	25	Friday	4	2025-04-25
116	2025	4	26	Saturday	5	2025-04-26
117	2025	4	27	Sunday	6	2025-04-27
118	2025	4	28	Monday	0	2025-04-28
119	2025	4	29	Tuesday	1	2025-04-29
120	2025	4	30	Wednesday	2	2025-04-30
121	2025	5	1	Thursday	3	2025-05-01
122	2025	5	2	Friday	4	2025-05-02
123	2025	5	3	Saturday	5	2025-05-03
124	2025	5	4	Sunday	6	2025-05-04
125	2025	5	5	Monday	0	2025-05-05
126	2025	5	6	Tuesday	1	2025-05-06
127	2025	5	7	Wednesday	2	2025-05-07
128	2025	5	8	Thursday	3	2025-05-08
129	2025	5	9	Friday	4	2025-05-09
130	2025	5	10	Saturday	5	2025-05-10
131	2025	5	11	Sunday	6	2025-05-11
132	2025	5	12	Monday	0	2025-05-12
133	2025	5	13	Tuesday	1	2025-05-13
134	2025	5	14	Wednesday	2	2025-05-14
135	2025	5	15	Thursday	3	2025-05-15
136	2025	5	16	Friday	4	2025-05-16
137	2025	5	17	Saturday	5	2025-05-17
138	2025	5	18	Sunday	6	2025-05-18
139	2025	5	19	Monday	0	2025-05-19
140	2025	5	20	Tuesday	1	2025-05-20
141	2025	5	21	Wednesday	2	2025-05-21
142	2025	5	22	Thursday	3	2025-05-22
143	2025	5	23	Friday	4	2025-05-23
144	2025	5	24	Saturday	5	2025-05-24
145	2025	5	25	Sunday	6	2025-05-25
146	2025	5	26	Monday	0	2025-05-26
147	2025	5	27	Tuesday	1	2025-05-27
148	2025	5	28	Wednesday	2	2025-05-28
149	2025	5	29	Thursday	3	2025-05-29
150	2025	5	30	Friday	4	2025-05-30
151	2025	5	31	Saturday	5	2025-05-31
152	2025	6	1	Sunday	6	2025-06-01
153	2025	6	2	Monday	0	2025-06-02
154	2025	6	3	Tuesday	1	2025-06-03
155	2025	6	4	Wednesday	2	2025-06-04
156	2025	6	5	Thursday	3	2025-06-05
157	2025	6	6	Friday	4	2025-06-06
158	2025	6	7	Saturday	5	2025-06-07
159	2025	6	8	Sunday	6	2025-06-08
160	2025	6	9	Monday	0	2025-06-09
161	2025	6	10	Tuesday	1	2025-06-10
162	2025	6	11	Wednesday	2	2025-06-11
163	2025	6	12	Thursday	3	2025-06-12
164	2025	6	13	Friday	4	2025-06-13
165	2025	6	14	Saturday	5	2025-06-14
166	2025	6	15	Sunday	6	2025-06-15
167	2025	6	16	Monday	0	2025-06-16
168	2025	6	17	Tuesday	1	2025-06-17
169	2025	6	18	Wednesday	2	2025-06-18
170	2025	6	19	Thursday	3	2025-06-19
171	2025	6	20	Friday	4	2025-06-20
172	2025	6	21	Saturday	5	2025-06-21
173	2025	6	22	Sunday	6	2025-06-22
174	2025	6	23	Monday	0	2025-06-23
175	2025	6	24	Tuesday	1	2025-06-24
176	2025	6	25	Wednesday	2	2025-06-25
177	2025	6	26	Thursday	3	2025-06-26
178	2025	6	27	Friday	4	2025-06-27
179	2025	6	28	Saturday	5	2025-06-28
180	2025	6	29	Sunday	6	2025-06-29
181	2025	6	30	Monday	0	2025-06-30
182	2025	7	1	Tuesday	1	2025-07-01
183	2025	7	2	Wednesday	2	2025-07-02
184	2025	7	3	Thursday	3	2025-07-03
185	2025	7	4	Friday	4	2025-07-04
186	2025	7	5	Saturday	5	2025-07-05
187	2025	7	6	Sunday	6	2025-07-06
188	2025	7	7	Monday	0	2025-07-07
189	2025	7	8	Tuesday	1	2025-07-08
190	2025	7	9	Wednesday	2	2025-07-09
191	2025	7	10	Thursday	3	2025-07-10
192	2025	7	11	Friday	4	2025-07-11
193	2025	7	12	Saturday	5	2025-07-12
194	2025	7	13	Sunday	6	2025-07-13
195	2025	7	14	Monday	0	2025-07-14
196	2025	7	15	Tuesday	1	2025-07-15
197	2025	7	16	Wednesday	2	2025-07-16
198	2025	7	17	Thursday	3	2025-07-17
199	2025	7	18	Friday	4	2025-07-18
200	2025	7	19	Saturday	5	2025-07-19
201	2025	7	20	Sunday	6	2025-07-20
202	2025	7	21	Monday	0	2025-07-21
203	2025	7	22	Tuesday	1	2025-07-22
204	2025	7	23	Wednesday	2	2025-07-23
205	2025	7	24	Thursday	3	2025-07-24
206	2025	7	25	Friday	4	2025-07-25
207	2025	7	26	Saturday	5	2025-07-26
208	2025	7	27	Sunday	6	2025-07-27
209	2025	7	28	Monday	0	2025-07-28
210	2025	7	29	Tuesday	1	2025-07-29
211	2025	7	30	Wednesday	2	2025-07-30
212	2025	7	31	Thursday	3	2025-07-31
213	2025	8	1	Friday	4	2025-08-01
214	2025	8	2	Saturday	5	2025-08-02
215	2025	8	3	Sunday	6	2025-08-03
216	2025	8	4	Monday	0	2025-08-04
217	2025	8	5	Tuesday	1	2025-08-05
218	2025	8	6	Wednesday	2	2025-08-06
219	2025	8	7	Thursday	3	2025-08-07
220	2025	8	8	Friday	4	2025-08-08
221	2025	8	9	Saturday	5	2025-08-09
222	2025	8	10	Sunday	6	2025-08-10
223	2025	8	11	Monday	0	2025-08-11
224	2025	8	12	Tuesday	1	2025-08-12
225	2025	8	13	Wednesday	2	2025-08-13
226	2025	8	14	Thursday	3	2025-08-14
227	2025	8	15	Friday	4	2025-08-15
228	2025	8	16	Saturday	5	2025-08-16
229	2025	8	17	Sunday	6	2025-08-17
230	2025	8	18	Monday	0	2025-08-18
231	2025	8	19	Tuesday	1	2025-08-19
232	2025	8	20	Wednesday	2	2025-08-20
233	2025	8	21	Thursday	3	2025-08-21
234	2025	8	22	Friday	4	2025-08-22
235	2025	8	23	Saturday	5	2025-08-23
236	2025	8	24	Sunday	6	2025-08-24
237	2025	8	25	Monday	0	2025-08-25
238	2025	8	26	Tuesday	1	2025-08-26
239	2025	8	27	Wednesday	2	2025-08-27
240	2025	8	28	Thursday	3	2025-08-28
241	2025	8	29	Friday	4	2025-08-29
242	2025	8	30	Saturday	5	2025-08-30
243	2025	8	31	Sunday	6	2025-08-31
244	2025	9	1	Monday	0	2025-09-01
245	2025	9	2	Tuesday	1	2025-09-02
246	2025	9	3	Wednesday	2	2025-09-03
247	2025	9	4	Thursday	3	2025-09-04
248	2025	9	5	Friday	4	2025-09-05
249	2025	9	6	Saturday	5	2025-09-06
250	2025	9	7	Sunday	6	2025-09-07
251	2025	9	8	Monday	0	2025-09-08
252	2025	9	9	Tuesday	1	2025-09-09
253	2025	9	10	Wednesday	2	2025-09-10
254	2025	9	11	Thursday	3	2025-09-11
255	2025	9	12	Friday	4	2025-09-12
256	2025	9	13	Saturday	5	2025-09-13
257	2025	9	14	Sunday	6	2025-09-14
258	2025	9	15	Monday	0	2025-09-15
259	2025	9	16	Tuesday	1	2025-09-16
260	2025	9	17	Wednesday	2	2025-09-17
261	2025	9	18	Thursday	3	2025-09-18
262	2025	9	19	Friday	4	2025-09-19
263	2025	9	20	Saturday	5	2025-09-20
264	2025	9	21	Sunday	6	2025-09-21
265	2025	9	22	Monday	0	2025-09-22
266	2025	9	23	Tuesday	1	2025-09-23
267	2025	9	24	Wednesday	2	2025-09-24
268	2025	9	25	Thursday	3	2025-09-25
269	2025	9	26	Friday	4	2025-09-26
270	2025	9	27	Saturday	5	2025-09-27
271	2025	9	28	Sunday	6	2025-09-28
272	2025	9	29	Monday	0	2025-09-29
273	2025	9	30	Tuesday	1	2025-09-30
274	2025	10	1	Wednesday	2	2025-10-01
275	2025	10	2	Thursday	3	2025-10-02
276	2025	10	3	Friday	4	2025-10-03
277	2025	10	4	Saturday	5	2025-10-04
278	2025	10	5	Sunday	6	2025-10-05
279	2025	10	6	Monday	0	2025-10-06
280	2025	10	7	Tuesday	1	2025-10-07
281	2025	10	8	Wednesday	2	2025-10-08
282	2025	10	9	Thursday	3	2025-10-09
283	2025	10	10	Friday	4	2025-10-10
284	2025	10	11	Saturday	5	2025-10-11
285	2025	10	12	Sunday	6	2025-10-12
286	2025	10	13	Monday	0	2025-10-13
287	2025	10	14	Tuesday	1	2025-10-14
288	2025	10	15	Wednesday	2	2025-10-15
289	2025	10	16	Thursday	3	2025-10-16
290	2025	10	17	Friday	4	2025-10-17
291	2025	10	18	Saturday	5	2025-10-18
292	2025	10	19	Sunday	6	2025-10-19
293	2025	10	20	Monday	0	2025-10-20
294	2025	10	21	Tuesday	1	2025-10-21
295	2025	10	22	Wednesday	2	2025-10-22
296	2025	10	23	Thursday	3	2025-10-23
297	2025	10	24	Friday	4	2025-10-24
298	2025	10	25	Saturday	5	2025-10-25
299	2025	10	26	Sunday	6	2025-10-26
300	2025	10	27	Monday	0	2025-10-27
301	2025	10	28	Tuesday	1	2025-10-28
302	2025	10	29	Wednesday	2	2025-10-29
303	2025	10	30	Thursday	3	2025-10-30
304	2025	10	31	Friday	4	2025-10-31
305	2025	11	1	Saturday	5	2025-11-01
306	2025	11	2	Sunday	6	2025-11-02
307	2025	11	3	Monday	0	2025-11-03
308	2025	11	4	Tuesday	1	2025-11-04
309	2025	11	5	Wednesday	2	2025-11-05
310	2025	11	6	Thursday	3	2025-11-06
311	2025	11	7	Friday	4	2025-11-07
312	2025	11	8	Saturday	5	2025-11-08
313	2025	11	9	Sunday	6	2025-11-09
314	2025	11	10	Monday	0	2025-11-10
315	2025	11	11	Tuesday	1	2025-11-11
316	2025	11	12	Wednesday	2	2025-11-12
317	2025	11	13	Thursday	3	2025-11-13
318	2025	11	14	Friday	4	2025-11-14
319	2025	11	15	Saturday	5	2025-11-15
320	2025	11	16	Sunday	6	2025-11-16
321	2025	11	17	Monday	0	2025-11-17
322	2025	11	18	Tuesday	1	2025-11-18
323	2025	11	19	Wednesday	2	2025-11-19
324	2025	11	20	Thursday	3	2025-11-20
325	2025	11	21	Friday	4	2025-11-21
326	2025	11	22	Saturday	5	2025-11-22
327	2025	11	23	Sunday	6	2025-11-23
328	2025	11	24	Monday	0	2025-11-24
329	2025	11	25	Tuesday	1	2025-11-25
330	2025	11	26	Wednesday	2	2025-11-26
331	2025	11	27	Thursday	3	2025-11-27
332	2025	11	28	Friday	4	2025-11-28
333	2025	11	29	Saturday	5	2025-11-29
334	2025	11	30	Sunday	6	2025-11-30
335	2025	12	1	Monday	0	2025-12-01
336	2025	12	2	Tuesday	1	2025-12-02
337	2025	12	3	Wednesday	2	2025-12-03
338	2025	12	4	Thursday	3	2025-12-04
339	2025	12	5	Friday	4	2025-12-05
340	2025	12	6	Saturday	5	2025-12-06
341	2025	12	7	Sunday	6	2025-12-07
342	2025	12	8	Monday	0	2025-12-08
343	2025	12	9	Tuesday	1	2025-12-09
344	2025	12	10	Wednesday	2	2025-12-10
345	2025	12	11	Thursday	3	2025-12-11
346	2025	12	12	Friday	4	2025-12-12
347	2025	12	13	Saturday	5	2025-12-13
348	2025	12	14	Sunday	6	2025-12-14
349	2025	12	15	Monday	0	2025-12-15
350	2025	12	16	Tuesday	1	2025-12-16
351	2025	12	17	Wednesday	2	2025-12-17
352	2025	12	18	Thursday	3	2025-12-18
353	2025	12	19	Friday	4	2025-12-19
354	2025	12	20	Saturday	5	2025-12-20
355	2025	12	21	Sunday	6	2025-12-21
356	2025	12	22	Monday	0	2025-12-22
357	2025	12	23	Tuesday	1	2025-12-23
358	2025	12	24	Wednesday	2	2025-12-24
359	2025	12	25	Thursday	3	2025-12-25
360	2025	12	26	Friday	4	2025-12-26
361	2025	12	27	Saturday	5	2025-12-27
362	2025	12	28	Sunday	6	2025-12-28
363	2025	12	29	Monday	0	2025-12-29
364	2025	12	30	Tuesday	1	2025-12-30
365	2025	12	31	Wednesday	2	2025-12-31
\.


--
-- TOC entry 3605 (class 0 OID 16892)
-- Dependencies: 219
-- Data for Name: days_of_week_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.days_of_week_name (id, name_day) FROM stdin;
1	M
2	T
3	W
4	T
5	F
6	S
7	S
\.


--
-- TOC entry 3601 (class 0 OID 16817)
-- Dependencies: 215
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notes (date, notes, id, status) FROM stdin;
2025-01-08	Send birthday card	117	InProgress
2025-01-14	Clean the kitchen	118	InProgress
2025-02-24	Start a new book	121	InProgress
2025-03-10	Team meeting	123	InProgress
2025-03-18	Organize documents	124	InProgress
2025-04-05	Family dinner	125	InProgress
2025-04-15	Submit assignment	126	InProgress
2025-04-20	Go for a run	127	InProgress
2025-05-04	Paint balcony	128	InProgress
2025-06-02	Movie night	131	InProgress
2025-06-18	Laundry day	132	InProgress
2025-06-27	Write blog post	133	InProgress
2025-07-03	Prepare presentation	134	InProgress
2025-08-01	Buy groceries	137	InProgress
2025-08-02	Finish homework	139	InProgress
2025-08-03	Go for a walk	140	InProgress
2025-08-05	Plan vacation	141	InProgress
2025-08-07	Read a book	142	InProgress
2025-08-08	Clean room	143	InProgress
2025-08-10	Bake a cake	144	InProgress
2025-08-11	Meeting with tutor	145	InProgress
2025-08-13	Gym workout	146	InProgress
2025-08-14	Watch movie	147	InProgress
2025-09-06	Grocery shopping	148	InProgress
2025-09-15	Visit grandma	149	InProgress
2025-09-28	Clean garage	150	InProgress
2025-10-01	Start new course	151	InProgress
2025-10-11	Practice guitar	152	InProgress
2025-10-22	Donate clothes	153	InProgress
2025-11-03	Decorate house	154	InProgress
2025-11-19	Prepare for exam	155	InProgress
2025-11-29	Car maintenance	156	InProgress
2025-12-05	Write holiday cards	157	InProgress
2025-12-16	Wrap gifts	158	InProgress
2025-12-25	Christmas dinner	159	InProgress
2025-01-08	Visit my mum	160	InProgress
2025-01-03	Call my mum	161	InProgress
2025-02-02	Doctor appointment	119	inProgress
2025-01-03	Buy train tickets	116	Deleted
2025-01-01	Cook	162	Deleted
2025-01-01	Make cake	163	Deleted
2025-01-18	To eat an apple	164	Deleted
2025-02-07	Write letter	174	inProgress
2025-01-22	Go to gym	165	Deleted
2025-02-02	Call my brother	166	InProgress
2025-02-03	Call friend	169	InProgress
2025-02-04	Cook dinner	170	InProgress
2025-02-09	Draw picture	173	InProgress
2025-02-13	Draw picture	176	InProgress
2025-02-28	Greeting	180	InProgress
2025-02-08	Write mum	172	Deleted
2025-02-01	To plane my day	167	Deleted
2025-02-01	Call my grandma	168	Done
2025-02-06	Draw picture	175	Done
2025-07-30	Call cousin	136	Done
2025-07-12	Beach trip	135	Done
2025-05-09	Dentist visit	129	Done
2025-02-12	Buy gift for friend	120	Done
2025-05-25	Update resume	130	Done
2025-03-01	Project deadline	122	Done
2025-02-05	Cook pizza	171	Done
2025-02-01	Greeting my mum	189	Done
2025-01-03	Buy a book	191	InProgress
2025-08-01	Call mom	138	Done
2025-01-10	Work	192	Done
\.


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 217
-- Name: days_of_week_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.days_of_week_id_seq', 365, true);


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 216
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notes_id_seq', 192, true);


--
-- TOC entry 3457 (class 2606 OID 16896)
-- Name: days_of_week_name days_of_week_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days_of_week_name
    ADD CONSTRAINT days_of_week_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3455 (class 2606 OID 16891)
-- Name: days days_of_week_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_of_week_pkey PRIMARY KEY (id);


-- Completed on 2026-01-11 12:46:46 CET

--
-- PostgreSQL database dump complete
--
