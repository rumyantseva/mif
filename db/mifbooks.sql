--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE books (
    id integer NOT NULL,
    mif_id integer,
    category_id integer,
    title character varying(512),
    isbn character varying(64),
    authors character varying(512),
    url character varying(512) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_visible boolean DEFAULT true NOT NULL
);


ALTER TABLE books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    title character varying(256) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: volumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE volumes (
    id integer NOT NULL,
    book_id integer NOT NULL,
    type character varying(32) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE volumes OWNER TO postgres;

--
-- Name: volumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE volumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volumes_id_seq OWNER TO postgres;

--
-- Name: volumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE volumes_id_seq OWNED BY volumes.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: volumes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY volumes ALTER COLUMN id SET DEFAULT nextval('volumes_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (id, mif_id, category_id, title, isbn, authors, url, created_at, updated_at, is_visible) FROM stdin;
1424	6275	10	Каждую минуту рождается еще один покупатель	978-5-91657-487-6	Джо Витале	http://www.mann-ivanov-ferber.ru/books/paperbook/born-every-minute-another-buyer/	2017-02-28 17:02:39	2017-03-03 20:17:15	t
1629	18167	9	Почему. Руководство по поиску причин и принятию решений		Саманта Клейнберг	http://www.mann-ivanov-ferber.ru/books/pochemu-rukovodstvo/	2017-02-28 17:02:42	2017-03-03 20:17:37	t
692	7384	10	Контекстная реклама, которая работает	978-5-00057-116-3	Перри Маршалл	http://www.mann-ivanov-ferber.ru/books/paperbook/ultimate-guide-google-adwords/	2017-02-28 16:57:29	2017-03-03 20:21:31	t
1677	1854	10	Маркетинговые игры	5-902862-22-1	Антон Попов	http://www.mann-ivanov-ferber.ru/books/mif/014/	2017-03-01 07:10:57	2017-03-03 20:16:36	t
21	17399	15	Женщина	978-5-00100-345-8	Джон Готтман	http://www.mann-ivanov-ferber.ru/books/zhenshhina/	2017-02-28 16:57:19	2017-03-03 18:49:01	t
1724	5442	14	Сделайте ваших детей успешными	978-5-91657-663-4	Джим  Роджерс	http://www.mann-ivanov-ferber.ru/freebook/	2017-03-02 13:26:41	2017-03-03 20:18:26	f
1214	7864	14	Большая книга LEGO®	978-5-91657-847-8	Аллан Бедфорд	http://www.mann-ivanov-ferber.ru/books/paperbook/unofficial-lego-builders-guide/	2017-02-28 17:02:36	2017-03-03 19:44:37	f
1698	6883	14	Потешки и пестушки (CD)		  	http://www.mann-ivanov-ferber.ru/books/audio/tales_mp3/	2017-03-02 13:26:22	2017-03-03 17:02:03	f
1692	5485	11	Визуальное мышление	 978-5-91657-587-3	Дэн Роэм	http://www.mann-ivanov-ferber.ru/books/paperbook/back-napkin-link/	2017-03-02 13:26:22	2017-03-03 18:46:00	f
1711	17572	9	Стратегия голубого океана	978-5-00100-258-1	Чан Ким и Рене Моборн	http://www.mann-ivanov-ferber.ru/books/paperbook/blueoceanstrategy-old/	2017-03-02 13:26:26	2017-03-03 19:31:07	f
1694	4764	14	Зоки и Бада	978-5-00100-540-7	Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/zoki_i_bada_mp3/	2017-03-02 13:26:22	2017-03-03 18:49:06	f
1027	7433	15	Moneyball	978-5-91657-854-6	Майкл Льюис	http://www.mann-ivanov-ferber.ru/books/paperbook/moneyball/	2017-02-28 17:02:32	2017-03-03 19:40:59	f
1367	8093	9	1С:Бухгалтерия 8 как на ладони	978-5-9677-1900-4	А.В. Гартвич	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/izdanie-5/	2017-02-28 17:02:39	2017-03-03 20:09:32	t
1565	2132	10	Маркетинг мест	5-315-00027-3	Филип Котлер	http://www.mann-ivanov-ferber.ru/books/sse/marketing-places/	2017-02-28 17:02:41	2017-03-03 20:13:24	t
1720	5442	14	Сделайте ваших детей успешными	978-5-91657-663-4	Джим  Роджерс	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/a_gift_to_my_children/	2017-03-02 13:26:37	2017-03-03 20:18:34	f
1754	17983	12	Цветовой квест	978-5-00100-399-1	Джоана Вебстер	http://www.mann-ivanov-ferber.ru/quest/	2017-03-02 13:26:48	2017-03-03 20:20:10	f
807	5942	15	Великие моменты великих Игр	978-5-91657-731-0	  	http://www.mann-ivanov-ferber.ru/books/paperbook/olympischen/	2017-02-28 16:57:31	2017-03-03 19:35:44	f
1566	2131	9	Корпоративная религия	5-315-00019-2	Йеспер Кунде	http://www.mann-ivanov-ferber.ru/books/sse/corporate-religion/	2017-02-28 17:02:41	2017-03-03 19:58:48	t
1568	2120	9	Караоке-капитализм	5-315-00025-7	Кьелл Нордстрем	http://www.mann-ivanov-ferber.ru/books/sse/karaoke/	2017-02-28 17:02:41	2017-03-03 19:57:19	t
1546	2318	\N	Ничего лишнего. Философия ведения бизнеса от СЕО Gillette	978-5-902862-71-0	Джеймс Килтс	http://www.mann-ivanov-ferber.ru/books/mif/040/	2017-02-28 17:02:41	2017-03-03 19:09:20	t
1703	2298	\N	Сага об ИКЕА (mp3)	978-5-902862-84-0	Бертил Торекуль	http://www.mann-ivanov-ferber.ru/books/audio/010a/	2017-03-02 13:26:23	2017-03-03 19:10:06	t
1706	2490	\N	OZON.RU	978-5-91657-068-7	Алекс Экслер	http://www.mann-ivanov-ferber.ru/books/mif/ozonru/	2017-03-02 13:26:24	2017-03-03 19:23:34	t
550	16334	\N	Утраченные секреты процветания		Наполеон Хилл	http://www.mann-ivanov-ferber.ru/books/utrachennye-sekrety-procvetaniya/	2017-02-28 16:57:27	2017-03-03 19:27:42	t
534	11240	\N	Банкиры, которые изменили мир	978-5-00057-313-6	  	http://www.mann-ivanov-ferber.ru/books/bankiri_kotorie_izmenili_mir/	2017-02-28 16:57:27	2017-03-03 19:27:49	t
551	16333	\N	Налоги за 14 дней		Сергей Молчанов	http://www.mann-ivanov-ferber.ru/books/nalogi-za-14-dney/	2017-02-28 16:57:27	2017-03-03 19:27:52	t
549	16335	\N	Лидерство на все времена		Дэвид Хэнна	http://www.mann-ivanov-ferber.ru/books/liderstvo-na-vse-vremena/	2017-02-28 16:57:27	2017-03-03 19:28:15	t
577	12510	\N	Нефть: люди, которые изменили мир	978-5-00057-276-4	  	http://www.mann-ivanov-ferber.ru/books/neftyaniki_kotorye_izmenili_mir/	2017-02-28 16:57:27	2017-03-03 19:28:53	t
673	11542	\N	Успех в бизнесе (CD)		Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/uspeh_v_biznese_cd/	2017-02-28 16:57:29	2017-03-03 19:31:16	t
864	5287	\N	Новый iPad. Исчерпывающее руководство	978-5-91657-504-0	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/new-ipad-apple/	2017-02-28 16:57:32	2017-03-03 19:38:11	t
851	5305	\N	Переходим на Мас	978-5-91657-599-6	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/switching-mac/	2017-02-28 16:57:32	2017-03-03 19:38:15	t
882	5309	\N	iPhone 4S. Исчерпывающее руководство	978-5-91657-352-7	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/iphone4s-1/	2017-02-28 16:57:32	2017-03-03 19:38:56	t
889	5316	\N	iPad и iPhone: 50 лучших приложений	978-5-91657-221-6	Владимир  Ходаковский	http://www.mann-ivanov-ferber.ru/books/selection/apple/ipadxodork-1/	2017-02-28 16:57:32	2017-03-03 19:39:14	t
811	6886	\N	Ключевые книги о бизнесе (CD)		  	http://www.mann-ivanov-ferber.ru/books/audio/set6/	2017-02-28 16:57:31	2017-03-03 19:40:18	t
1080	2373	\N	Речи, которые изменили мир	978-5-00057-825-4	Саймон Себаг  Монтефиоре	http://www.mann-ivanov-ferber.ru/books/special/speeches/	2017-02-28 17:02:34	2017-03-03 19:41:36	t
1226	13115	\N	Настройка бизнеса		Лена Рамфельт	http://www.mann-ivanov-ferber.ru/books/nastrojka_biznesa/	2017-02-28 17:02:36	2017-03-03 19:44:05	t
1305	5209	\N	CSS3 для веб-дизайнеров	978-5-91657-595-8	Дэн Сидерхолм	http://www.mann-ivanov-ferber.ru/books/book-apart/web-designers/	2017-02-28 17:02:38	2017-03-03 19:52:27	t
1291	5115	\N	Дизайн – это работа	978-5-91657-578-1	Майк  Монтейро	http://www.mann-ivanov-ferber.ru/books/book-apart/design-job/	2017-02-28 17:02:37	2017-03-03 19:52:30	t
1267	11576	\N	Айн Рэнд и миры, которые она создала		Энн Хеллер	http://www.mann-ivanov-ferber.ru/books/ajn_rend_i_miry_kotorye_ona_sozdala/	2017-02-28 17:02:37	2017-03-03 19:53:15	t
1306	5217	\N	HTML5 для веб-дизайнеров	978-5-91657-596-5	Кит Джереми	http://www.mann-ivanov-ferber.ru/books/book-apart/html5-web-designers/	2017-02-28 17:02:38	2017-03-03 19:54:46	t
1419	4454	\N	Эмоциональный веб-дизайн. Отзывчивый веб-дизайн		Аарон Уолтер	http://www.mann-ivanov-ferber.ru/books/special/komplect/	2017-02-28 17:02:39	2017-03-03 19:55:58	t
1472	3256	\N	Менеджер и организация	978-5-91657-253-7	Арташес Газарян	http://www.mann-ivanov-ferber.ru/books/paperbook/menedjeriorganizacia/	2017-02-28 17:02:40	2017-03-03 19:56:34	t
1477	4295	\N	Эмоциональный веб-дизайн	978-5-91657-386-2	Аарон Уолтер	http://www.mann-ivanov-ferber.ru/books/book-apart/emotional-web-design/	2017-02-28 17:02:40	2017-03-03 19:57:04	t
1501	3195	\N	Какого цвета ваш парашют?	978-5-91657-135-6	Ричард Боллс	http://www.mann-ivanov-ferber.ru/books/paperbook/colourofparachute/	2017-02-28 17:02:41	2017-03-03 19:57:16	t
1547	2310	\N	Секреты величия	 978-5-902862-85-7	Fortune Magazine	http://www.mann-ivanov-ferber.ru/books/mif/038/	2017-02-28 17:02:41	2017-03-03 19:57:39	t
1535	2663	\N	Перезагрузка	978-5-00100-353-3	Джим  Лоэр	http://www.mann-ivanov-ferber.ru/books/paperbook/tposn/	2017-02-28 17:02:41	2017-03-03 19:58:03	t
1579	1950	\N	Пятничный менеджер	978-5-902862-34-5	  	http://www.mann-ivanov-ferber.ru/books/mif/021/	2017-02-28 17:02:42	2017-03-03 19:58:49	t
1018	9042	\N	Финансисты, которые изменили мир	978-5-91657-996-3	  	http://www.mann-ivanov-ferber.ru/books/finansisty_kotorye_izmenili_mir/	2017-02-28 17:02:31	2017-03-03 20:02:00	t
1040	5191	\N	Бизнес-идеи, которые изменили мир	978-5-91657-658-0	 Под редакцией Иэна Уоллиса 	http://www.mann-ivanov-ferber.ru/books/special/business-ideas/	2017-02-28 17:02:33	2017-03-03 20:02:02	t
734	6723	\N	Технологии, которые изменили мир	978-5-91657-009-0	Александр Латкин	http://www.mann-ivanov-ferber.ru/books/special/technology/	2017-02-28 16:57:30	2017-03-03 20:02:16	t
1256	6566	14	Истории. Животные. Всякие вкусности (комплект из 3 книг)		Таро Гоми	http://www.mann-ivanov-ferber.ru/books/special/set4/	2017-02-28 17:02:37	2017-03-03 19:52:41	f
1252	6633	14	«Зоки и Бада». «Школа Зоков и Бады». «Зоки и Бада (аудиоспектакль)»		Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/special/set5/	2017-02-28 17:02:37	2017-03-03 19:53:15	f
155	17485	14	Как все устроено сегодня	978-5-00100-234-5	Дэвид Маколи	http://www.mann-ivanov-ferber.ru/books/kak-vse-ustroeno-segodnya/	2017-02-28 16:57:21	2017-03-03 19:04:31	f
1059	2470	\N	Лидеры, которые изменили мир		Брайан Муни	http://www.mann-ivanov-ferber.ru/books/special/leaders/	2017-02-28 17:02:34	2017-03-03 20:02:35	t
1164	14593	\N	Практический годовой отчет за 2014 год	978-5-9677-2272-1	С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/prakticheskij-godovoj-otchet-2014/	2017-02-28 17:02:35	2017-03-03 20:05:23	t
1407	4351	\N	Основы контентной стратегии	978-5-91657-387-9	Эрин  Киссейн	http://www.mann-ivanov-ferber.ru/books/book-apart/elements-content-strategy/	2017-02-28 17:02:39	2017-03-03 20:08:49	t
1395	4448	\N	Сначала мобильные!	978-5-91657-388-6	Люк Вроблевски	http://www.mann-ivanov-ferber.ru/books/book-apart/mobilfirst/	2017-02-28 17:02:39	2017-03-03 20:08:52	t
1375	7497	\N	Жить с ребенком легко		Ольга Белоцерковская	http://www.mann-ivanov-ferber.ru/books/paperbook/living-child/	2017-02-28 17:02:39	2017-03-03 20:09:31	t
1353	5110	\N	Развиваем восприимчивость к обучению	978-5-91657-291-9	Максин Далтон	http://www.mann-ivanov-ferber.ru/books/navigator-for-the-leader/becoming-more-versatile-learner/	2017-02-28 17:02:38	2017-03-03 20:09:39	t
1479	4360	\N	Отзывчивый веб-дизайн	978-5-91657-385-5	Итан Маркотт	http://www.mann-ivanov-ferber.ru/books/book-apart/otzivchivij-web-design/	2017-02-28 17:02:40	2017-03-03 20:10:30	t
821	5797	\N	Сторителлинг в проектировании интерфейсов	978-5-91657-714-3	Уитни Кесенбери	http://www.mann-ivanov-ferber.ru/books/rosenfeld/storytelling-design-interfaces/	2017-02-28 16:57:31	2017-03-03 20:18:27	t
1686	2305	\N	Одержимость, или Переворот в сфере коммуникаций GE	978-5-902862-86-4	Билл Лейн	http://www.mann-ivanov-ferber.ru/books/mif/039/	2017-03-01 07:10:57	2017-03-03 20:18:27	t
1679	1584	\N	Управление отношениями с клиентами	5-902862-25-6	Дон Пепперс	http://www.mann-ivanov-ferber.ru/books/mif/017/	2017-03-01 07:10:57	2017-03-03 20:19:00	t
1719	11572	\N	Техника принятия правильных решений		Даниэль Канеман	http://www.mann-ivanov-ferber.ru/books/texnika_prinyatiya_pravilnyx_reshenij/	2017-03-02 13:26:36	2017-03-03 20:19:17	t
258	16865	14	Разноцветный лес	978-5-00100-038-9	Магали Аттиогбе	http://www.mann-ivanov-ferber.ru/books/raznocvetnyj-les/	2017-02-28 16:57:22	2017-03-03 19:09:48	t
466	15053	14	Лето в деревне	978-5-00100-181-2	Зина Сурова	http://www.mann-ivanov-ferber.ru/books/leto-v-derevne/	2017-02-28 16:57:26	2017-03-03 19:26:00	t
586	10959	11	Стань умнее	978-5-00057-280-1	Дэн Хёрли	http://www.mann-ivanov-ferber.ru/books/umnee/	2017-02-28 16:57:28	2017-03-03 19:29:13	t
818	5678	9	Безумно просто	978-5-91657-755-6	Кен Сигалл	http://www.mann-ivanov-ferber.ru/books/paperbook/bezumno-prosto/	2017-02-28 16:57:31	2017-03-03 19:35:58	t
1091	15571	9	Мечта о «Тройке»	978-5-00057-658-8	  	http://www.mann-ivanov-ferber.ru/books/mechta-o-trojke/	2017-02-28 17:02:34	2017-03-03 19:42:08	t
1195	6883	14	Потешки и пестушки (CD)		  	http://www.mann-ivanov-ferber.ru/books/children/tales/	2017-02-28 17:02:36	2017-03-03 19:51:51	t
1428	6489	10	Маркетинг 3.0	978-5-91657-473-9	Филип Котлер	http://www.mann-ivanov-ferber.ru/books/paperbook/marketing-3-0/	2017-02-28 17:02:40	2017-03-03 19:56:19	t
1056	2692	9	Искусство делового письма	978-5-91657-122-6	Саша Карепина	http://www.mann-ivanov-ferber.ru/books/mif/idp/	2017-02-28 17:02:34	2017-03-03 20:02:36	t
1194	8019	9	18 минут	978-5-91657-893-5	Питер Брегман	http://www.mann-ivanov-ferber.ru/books/paperbook/18-minutes/	2017-02-28 17:02:36	2017-03-03 20:06:35	t
5	18457	14	Kumon. Математика. Задачи. Уровень 1	978-5-00100-251-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-zadachi-uroven-1/	2017-02-28 16:57:19	2017-03-03 18:46:01	t
26	17396	11	Однозадачность	978-5-00100-390-8	Девора Зак	http://www.mann-ivanov-ferber.ru/books/odnozadachnost/	2017-02-28 16:57:19	2017-03-03 18:46:02	t
12	18425	14	Цветные выходные. Чем заняться в хмурый день	978-5-00100-452-3	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/czvetnyie-vyixodnyie-chem-zanyatsya-v-xmuryij-den/	2017-02-28 16:57:19	2017-03-03 18:46:05	t
16	18406	14	Кто пришел потом?	978-5-00100-356-4	Антон Пуатье	http://www.mann-ivanov-ferber.ru/books/kto-prishel-potom/	2017-02-28 16:57:19	2017-03-03 18:46:03	t
22	18359	14	Слоненок, который хочет уснуть	978-5-00100-543-8	Карл-Йохан Форссен Эрлин	http://www.mann-ivanov-ferber.ru/books/slonenok-kotoryij-xochet-usnut/	2017-02-28 16:57:19	2017-03-03 18:46:03	t
11	17941	11	Меняем привычки	978-5-00100-553-7	М. Дж.  Райан	http://www.mann-ivanov-ferber.ru/books/menyaem-privyichki/	2017-02-28 16:57:19	2017-03-03 18:46:04	t
29	18361	14	Натвори что хочешь! Каракули	978-5-00100-498-1	Labor Ateliergemeinschaft	http://www.mann-ivanov-ferber.ru/books/natvori-chto-hochesh-karakuli/	2017-02-28 16:57:19	2017-03-03 18:46:05	t
34	17909	12	Портреты цветов от А до Я	978-5-00100-487-5	Билли Шоуэлл	http://www.mann-ivanov-ferber.ru/books/portretyi-czvetov-ot-a-do-ya/	2017-02-28 16:57:19	2017-03-03 18:46:05	t
38	18330	14	Межпланетный рыцарский турнир	978-5-00100-372-4	Максим Демин	http://www.mann-ivanov-ferber.ru/books/urokeryi-tablicza-umnozheniya/	2017-02-28 16:57:19	2017-03-03 18:48:01	t
32	17775	9	Книга продаж девелопера	978-5-00100-513-1	Сергей Разуваев	http://www.mann-ivanov-ferber.ru/books/kniga-prodazh-developera/	2017-02-28 16:57:19	2017-03-03 18:46:06	t
13	17703	14	Великие сооружения	978-5-00100-348-9	Розенн Ботуон	http://www.mann-ivanov-ferber.ru/books/velikie-sooruzheniya/	2017-02-28 16:57:19	2017-03-03 18:46:06	t
4	18459	14	Kumon. Математика. Задачи. Уровень 3	978-5-00100-253-6	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-zadachi-uroven-3/	2017-02-28 16:57:19	2017-03-03 18:46:07	t
30	17471	12	Творческий девичник	978-5-00100-314-4	Джулия Ротман	http://www.mann-ivanov-ferber.ru/books/tvorcheskij-devichnik/	2017-02-28 16:57:19	2017-03-03 18:46:07	t
31	17673	11	Мастерство	978-5-00100-482-0	Джордж Леонард	http://www.mann-ivanov-ferber.ru/books/masterstvo/	2017-02-28 16:57:19	2017-03-03 18:46:07	t
15	18417	\N	Подарочный пакет МИФа		\N	http://www.mann-ivanov-ferber.ru/books/podarochnyij-paket-mifa/	2017-02-28 16:57:19	2017-03-03 17:02:29	t
37	17339	11	Поцелуй лягушку!	978-5-00100-489-9	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/poczeluj-lyagushku/	2017-02-28 16:57:19	2017-03-03 18:48:02	t
33	18039	12	Живопись с нуля	978-5-00100-318-2	Клэр Ватсон Гарсия	http://www.mann-ivanov-ferber.ru/books/zhivopis-s-nulya/	2017-02-28 16:57:19	2017-03-03 18:48:01	t
20	18386	14	Цветные выходные. Чем заняться в ясный день	978-5-00100-453-0	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/czvetnyie-vyixodnyie-chem-zanyatsya-v-yasnyij-den/	2017-02-28 16:57:19	2017-03-03 18:48:02	t
39	17342	11	Тренируем мозг. Тетрадь для развития памяти и интеллекта №1	978-5-00100-320-5	Рюта Кавашима	http://www.mann-ivanov-ferber.ru/books/treniruem-mozg/	2017-02-28 16:57:19	2017-03-03 18:48:03	t
7	16692	10	Смешать, но не взбалтывать	978-5-00100-624-4	Александр Шумович	http://www.mann-ivanov-ferber.ru/books/smeshat-no-ne-vzbaltyvat/	2017-02-28 16:57:19	2017-03-03 18:48:03	t
18	17774	9	Управление на основе данных	978-5-00100-572-8	Тим Филлипс	http://www.mann-ivanov-ferber.ru/books/upravlenie-na-osnove-dannyix/	2017-02-28 16:57:19	2017-03-03 18:48:04	t
36	18335	14	Открываем космос	978-5-00100-331-1	Мартин Дженкинс	http://www.mann-ivanov-ferber.ru/books/otkryivaem-kosmos/	2017-02-28 16:57:19	2017-03-03 18:48:04	t
10	18407	14	Животные Юга	978-5-00100-338-0	Дитер Браун	http://www.mann-ivanov-ferber.ru/books/zhivotnyie-yuga/	2017-02-28 16:57:19	2017-03-03 18:48:05	t
8	18432	14	В мире животных. Стикербук	978-5-00100-581-0	Сара Уэйд	http://www.mann-ivanov-ferber.ru/books/v-mire-zhivotnyix-stikerbuk/	2017-02-28 16:57:19	2017-03-03 18:48:05	t
6	18458	14	Kumon. Математика. Задачи. Уровень 2	978-5-00100-252-9	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-zadachi-uroven-2/	2017-02-28 16:57:19	2017-03-03 18:48:06	t
23	17618	12	Творческие права	978-5-00100-332-8	Дэнни Грэгори	http://www.mann-ivanov-ferber.ru/books/tvorcheskie-prava/	2017-02-28 16:57:19	2017-03-03 18:48:06	t
19	18145	12	Отсюда туда	978-5-00100-580-3	Шон Джексон	http://www.mann-ivanov-ferber.ru/books/otsyuda-tuda/	2017-02-28 16:57:19	2017-03-03 18:48:07	t
24	18349	14	Удивительные поезда	978-5-00100-344-1	Стивен Бисти	http://www.mann-ivanov-ferber.ru/books/udivitelnyie-poezda/	2017-02-28 16:57:19	2017-03-03 18:48:07	t
25	16699	11	Привычка достигать	978-5-00100-079-2	Бернард Рос	http://www.mann-ivanov-ferber.ru/books/privychka-dostigat/	2017-02-28 16:57:19	2017-03-03 18:48:08	t
28	18248	14	Творческий год	978-5-00100-542-1	Джин Ван’т Хал	http://www.mann-ivanov-ferber.ru/books/tvorcheskij-god/	2017-02-28 16:57:19	2017-03-03 18:48:08	t
1691	2257	824	Уравнение счастья (audio CD)		Манфред Кетс де Врис	http://www.mann-ivanov-ferber.ru/books/audio/hapiness/	2017-03-02 13:26:22	2017-03-03 17:02:02	t
35	16761	9	Не всем достанется приз	978-5-00100-068-6	Брюс Тулган	http://www.mann-ivanov-ferber.ru/books/ne-vsem-dostanetsya-priz/	2017-02-28 16:57:19	2017-03-03 18:49:00	t
9	18431	14	Вокруг света. Стикербук	978-5-00100-582-7	Сара Уэйд	http://www.mann-ivanov-ferber.ru/books/vokrug-sveta-stikerbuk/	2017-02-28 16:57:19	2017-03-03 18:49:02	t
27	18187	12	Узор на кожуре банана	978-5-00100-456-1	  	http://www.mann-ivanov-ferber.ru/books/uzor-na-kozhure-banana/	2017-02-28 16:57:19	2017-03-03 18:46:02	t
60	17918	14	Kumon. 3D поделки из бумаги. Кошка и собака	978-5-00100-254-3	  	http://www.mann-ivanov-ferber.ru/books/children/kumon-3d-podelki-iz-bumagi-koshka-i-sobaka/	2017-02-28 16:57:20	2017-03-03 18:49:04	t
50	18175	14	Карл Мопс	978-5-00100-493-6	Фабиола Нонн	http://www.mann-ivanov-ferber.ru/books/karl-mops/	2017-02-28 16:57:19	2017-03-03 18:49:04	t
42	18300	12	Блокнот для идей МИФа А6 (белый)	978-5-00100-407-3	  	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-idej-mif-belyij/	2017-02-28 16:57:19	2017-03-03 18:51:03	t
55	17922	14	Животные в природе. Медведь	978-5-00100-465-3	  	http://www.mann-ivanov-ferber.ru/books/zhivotnyie-v-prirode-medved/	2017-02-28 16:57:19	2017-03-03 18:49:07	t
68	17914	14	Белый медведь		Дженни Десмонд	http://www.mann-ivanov-ferber.ru/books/belyij-medved/	2017-02-28 16:57:20	2017-03-03 17:02:13	t
62	17921	14	Kumon. 3D поделки из бумаги. Лев и мышь	978-5-00100-257-4	  	http://www.mann-ivanov-ferber.ru/books/kumon-3d-podelki-iz-bumagi-lev-i-myish/	2017-02-28 16:57:20	2017-03-03 18:50:06	t
51	17801	14	Фермер Вилли и первый снег	978-5-00100-324-3	Тед ван Лисхаут	http://www.mann-ivanov-ferber.ru/books/fermer-villi-i-pervyij-sneg/	2017-02-28 16:57:19	2017-03-03 18:50:07	t
49	18179	14	Длинное долгое путешествие	978-5-00100-481-3	Ян Валь	http://www.mann-ivanov-ferber.ru/books/dlinnoe-dolgoe-puteshestvie/	2017-02-28 16:57:19	2017-03-03 18:50:07	t
46	18161	14	Scratch для детей	978-5-00100-336-6	Мажед Маржи	http://www.mann-ivanov-ferber.ru/books/scratch-dlya-detej/	2017-02-28 16:57:19	2017-03-03 18:50:08	t
47	17746	12	Акварельное вдохновение	978-5-00100-333-5	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/akvarelnoe-vdohnovenie/	2017-02-28 16:57:19	2017-03-03 18:50:08	t
74	17759	9	Лидер и племя	978-5-00100-396-0	Дэйв Логан	http://www.mann-ivanov-ferber.ru/books/lider-i-plemya/	2017-02-28 16:57:20	2017-03-03 18:50:09	t
72	17417	10	Как растут бренды		Байрон Шарп	http://www.mann-ivanov-ferber.ru/books/kak-rastut-brendyi/	2017-02-28 16:57:20	2017-03-03 17:02:26	t
63	17804	14	Давай строить!	978-5-00100-199-7	  	http://www.mann-ivanov-ferber.ru/books/davaj-stroit/	2017-02-28 16:57:20	2017-03-03 18:51:03	t
149	16457	11	Ультрамышление	978-5-00100-020-4	Тревис Мейси	http://www.mann-ivanov-ferber.ru/books/ultra-koncentraciya/	2017-02-28 16:57:21	2017-03-03 19:00:08	t
1039	5518	11	Наживемся на кризисе капитализма	978-5-91657-394-7	Дмитрий Хотимский	http://www.mann-ivanov-ferber.ru/books/paperbook/nazhivemsya-na-krizisec/	2017-02-28 17:02:33	2017-03-03 18:51:13	t
78	17667	15	Глазами физика	978-5-00100-387-8	Уолтер Левин	http://www.mann-ivanov-ferber.ru/books/glazami-fizika/	2017-02-28 16:57:20	2017-03-03 18:51:14	t
52	18142	14	Фермер Вилли едет на рынок	978-5-00100-325-0	Тед ван Лисхаут	http://www.mann-ivanov-ferber.ru/books/fermer-villi-edet-na-ryinok/	2017-02-28 16:57:19	2017-03-03 18:51:14	t
69	17915	14	Синий кит	978-5-00100-405-9	Дженни Десмонд	http://www.mann-ivanov-ferber.ru/books/sinij-kit/	2017-02-28 16:57:20	2017-03-03 18:51:15	t
44	17770	11	Мозг с препятствиями	978-5-00100-468-4	Тео Цаусидис	http://www.mann-ivanov-ferber.ru/books/mozg-s-prepyatstviyami/	2017-02-28 16:57:19	2017-03-03 18:51:15	t
45	17911	12	Начни рисовать	978-5-00100-492-9	Эдвин Лутц	http://www.mann-ivanov-ferber.ru/books/nachni-risovat/	2017-02-28 16:57:19	2017-03-03 18:51:16	t
76	17924	12	О шрифте	978-5-00100-319-9	Эрик Шпикерманн	http://www.mann-ivanov-ferber.ru/books/o-shrifte/	2017-02-28 16:57:20	2017-03-03 18:51:16	t
75	17923	12	Где Уорхол?	978-5-00100-323-6	Кэтрин Ингрэм	http://www.mann-ivanov-ferber.ru/books/gde-uorxol/	2017-02-28 16:57:20	2017-03-03 18:51:17	t
73	17672	11	Золотые правила	978-5-00100-457-8	Боб Боуман	http://www.mann-ivanov-ferber.ru/books/zolotyie-pravila/	2017-02-28 16:57:20	2017-03-03 18:51:17	t
57	17769	11	Как разговаривать с мудаками	978-5-00100-490-5	Марк Гоулстон	http://www.mann-ivanov-ferber.ru/books/kak-razgovarivat-s-mudakami/	2017-02-28 16:57:20	2017-03-03 18:51:17	t
830	5908	9	Отдел продаж под ключ	978-5-91657-682-5	Сергей Капустин и Дмитрий Крутов	http://www.mann-ivanov-ferber.ru/books/paperbook/sales-department-under-key/	2017-02-28 16:57:31	2017-03-03 18:51:25	t
59	18057	14	Маленький театр Ребекки		Ребекка Дотремер	http://www.mann-ivanov-ferber.ru/books/malenkij-teatr-rebekki/	2017-02-28 16:57:20	2017-03-03 17:02:28	t
56	17936	14	Животные в природе. Волк	978-5-00100-464-6	  	http://www.mann-ivanov-ferber.ru/books/zhivotnyie-v-prirode-volk/	2017-02-28 16:57:20	2017-03-03 18:52:12	t
67	17896	14	Удивительное путешествие в мир животных	978-5-00100-298-7	Брендан Кирни	http://www.mann-ivanov-ferber.ru/books/udivitelnoe-puteshestvie-v-mir-zhivotnyix/	2017-02-28 16:57:20	2017-03-03 18:52:12	t
43	17277	11	Восходящая спираль	978-5-00100-347-2	Алекс Корб	http://www.mann-ivanov-ferber.ru/books/vosxodyashhaya-spiral/	2017-02-28 16:57:19	2017-03-03 18:52:16	t
53	17912	12	Удивительные коллекции		Стив Макдональд	http://www.mann-ivanov-ferber.ru/books/udivitelnyie-kollekczii/	2017-02-28 16:57:19	2017-03-03 17:03:39	t
58	17983	12	Цветовой квест	978-5-00100-399-1	Джоана Вебстер	http://www.mann-ivanov-ferber.ru/books/czvetovoj-kvest/	2017-02-28 16:57:20	2017-03-03 18:53:06	t
66	18310	9	45 татуировок продавана. Подарочный комплект		Максим Батырев (Комбат)	http://www.mann-ivanov-ferber.ru/books/45-tatuirovok-prodavana-podarochnyij-komplekt/	2017-02-28 16:57:20	2017-03-03 17:02:29	t
65	18058	14	Возвращение	978-5-00100-458-5	Аарон Бекер	http://www.mann-ivanov-ferber.ru/books/vozvrashhenie/	2017-02-28 16:57:20	2017-03-03 18:53:59	t
41	17865	11	Минуту внимания	978-5-00100-480-6	Сэм Хорн	http://www.mann-ivanov-ferber.ru/books/minutu-vnimaniya/	2017-02-28 16:57:19	2017-03-03 18:54:00	t
77	17877	14	Метаморфозы	978-5-00100-391-5	Фредерик Клеман	http://www.mann-ivanov-ferber.ru/books/metamorfozyi/	2017-02-28 16:57:20	2017-03-03 18:54:00	t
1695	6633	14	«Зоки и Бада». «Школа Зоков и Бады». «Зоки и Бада (аудиоспектакль)»		Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/set5/	2017-03-02 13:26:22	2017-03-03 17:02:03	t
84	17387	9	Культура для каждого	978-5-00100-274-1	Роберт Киган	http://www.mann-ivanov-ferber.ru/books/kultura-dlya-kazhdogo/	2017-02-28 16:57:20	2017-03-03 18:54:01	t
104	17898	14	Хильда и тролль	978-5-00100-368-7	Люк Пирсон	http://www.mann-ivanov-ferber.ru/books/xilda-i-troll/	2017-02-28 16:57:20	2017-03-03 18:54:44	t
79	18035	14	Новогодняя	978-5-00100-213-0	Юля Григорьева	http://www.mann-ivanov-ferber.ru/books/novogodnyaya/	2017-02-28 16:57:20	2017-03-03 18:54:12	t
88	17793	14	Как жили на Руси	978-5-00100-394-6	Елена Качур	http://www.mann-ivanov-ferber.ru/books/kak-zhili-na-rusi/	2017-02-28 16:57:20	2017-03-03 18:54:12	t
107	17475	12	Draw my life	978-5-00100-313-7	  	http://www.mann-ivanov-ferber.ru/books/istoriya-moej-zhizni/	2017-02-28 16:57:20	2017-03-03 18:59:41	t
99	17392	10	Делай новое!	978-5-00100-280-2	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/delaj-novoe/	2017-02-28 16:57:20	2017-03-03 18:54:44	t
105	17929	14	Год в лесу. Календарь 2017	978-5-00100-379-3	Евгения Салихова	http://www.mann-ivanov-ferber.ru/books/god-v-lesu-kalendar-2017/	2017-02-28 16:57:20	2017-03-03 18:54:45	t
82	17680	12	Планинг для творческих людей. Изумительные сады	978-5-00100-292-5	  	http://www.mann-ivanov-ferber.ru/books/planing-dlya-tvorcheskix-lyudej-izumitelnyie-sadyi/	2017-02-28 16:57:20	2017-03-03 18:54:45	t
83	17981	12	Невероятные лабиринты	978-5-00100-341-0	Гарет Мур	http://www.mann-ivanov-ferber.ru/books/neveroyatnyie-labirintyi/	2017-02-28 16:57:20	2017-03-03 18:54:46	t
87	17663	9	Управление продуктом в Scrum	978-5-00100-354-0	Роман Пихлер	http://www.mann-ivanov-ferber.ru/books/upravlenie-produktom-v-scrum/	2017-02-28 16:57:20	2017-03-03 18:54:47	t
112	17805	14	Уроки льва	978-5-00100-326-7	Джон Эйджи	http://www.mann-ivanov-ferber.ru/books/uroki-lva/	2017-02-28 16:57:20	2017-03-03 18:55:01	t
1697	5942	15	Великие моменты великих Игр	978-5-91657-731-0	  	http://www.mann-ivanov-ferber.ru/books/sport/olympischen/	2017-03-02 13:26:22	2017-03-03 18:55:11	t
1699	7433	15	Moneyball	978-5-91657-854-6	Майкл Льюис	http://www.mann-ivanov-ferber.ru/books/sport/moneyball/	2017-03-02 13:26:22	2017-03-03 18:55:12	t
116	17700	14	KUMON. Найди пару. Уровень 1	978-5-00100-230-7	  	http://www.mann-ivanov-ferber.ru/books/kumon-najdi-paru-uroven-1/	2017-02-28 16:57:20	2017-03-03 18:55:27	t
1693	5496	14	Школа Зоков и Бады	978-5-91657-665-8	Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/schkola-zokov-i-badi-mp3/	2017-03-02 13:26:22	2017-03-03 18:49:03	f
103	17937	14	Хильда и полуночный великан	978-5-00100-369-4	Люк Пирсон	http://www.mann-ivanov-ferber.ru/books/xilda-i-polunochnyij-velikan/	2017-02-28 16:57:20	2017-03-03 18:55:27	t
92	17498	11	Со мной хотят общаться	978-5-00100-312-0	Нина Зверева	http://www.mann-ivanov-ferber.ru/books/so-mnoj-xotyat-obshhatsya/	2017-02-28 16:57:20	2017-03-03 18:55:28	t
80	17682	12	Планинг для творческих людей. Необыкновенные путешествия	978-5-00100-293-2	  	http://www.mann-ivanov-ferber.ru/books/planing-dlya-tvorcheskix-lyudej-neobyiknovennyie-puteshestviya/	2017-02-28 16:57:20	2017-03-03 18:55:29	t
108	17861	5	Блокнот для записей МИФа (белый)		\N	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-zapisej-mifa-belyij/	2017-02-28 16:57:20	2017-03-03 17:03:39	t
85	17334	12	Большой творческий челендж	978-5-00100-261-1	Роза Робертс	http://www.mann-ivanov-ferber.ru/books/bolshoj-tvorcheskij-chelendzh/	2017-02-28 16:57:20	2017-03-03 18:54:01	t
115	17858	14	Kumon. Развитие мышления. Творческие способности	978-5-00100-278-9	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvitie-myshleniya-tvorcheskie-sposobnosti/	2017-02-28 16:57:20	2017-03-03 18:58:12	t
113	17856	14	Kumon. Развитие мышления. Пространственное мышление	978-5-00100-275-8	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvitie-myshleniya-prostranstvennoe-myshlenie/	2017-02-28 16:57:20	2017-03-03 18:58:13	t
86	18176	\N	Любителю волшебных историй. Подарочный комплект		Ребекка Дотремер	http://www.mann-ivanov-ferber.ru/books/lyubitelyu-volshebnyix-istorij/	2017-02-28 16:57:20	2017-03-03 17:02:29	t
81	17666	11	Книга Ленивого Гуру		Лоуренс Шортер	http://www.mann-ivanov-ferber.ru/books/kniga-lenivogo-guru/	2017-02-28 16:57:20	2017-03-03 17:03:39	t
101	17045	15	Статистика	978-5-00100-260-4	Грейди Клейн	http://www.mann-ivanov-ferber.ru/books/statistika/	2017-02-28 16:57:20	2017-03-03 18:59:08	t
114	17857	14	Kumon. Развитие мышления. Сходство и различие	978-5-00100-276-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvitie-myshleniya-shodstvo-i-razlichie/	2017-02-28 16:57:20	2017-03-03 18:59:08	t
1696	6566	14	Истории. Животные. Всякие вкусности (комплект из 3 книг)		Таро Гоми	http://www.mann-ivanov-ferber.ru/books/children/set4/	2017-03-02 13:26:22	2017-03-03 17:02:03	t
90	17999	12	Удивительные города. Настенный календарь — 2017	978-5-00100-401-1	Стив Макдональд	http://www.mann-ivanov-ferber.ru/books/paperbook/udivitelnyie-goroda-nastennyij-kalendar-2017/	2017-02-28 16:57:20	2017-03-03 18:59:43	t
106	17798	14	Чем они отличаются?	978-5-00100-306-9	Гийом Плантвен	http://www.mann-ivanov-ferber.ru/books/chem-oni-otlichayutsya/	2017-02-28 16:57:20	2017-03-03 18:59:42	t
93	17828	14	Ночная сказка	978-5-00100-241-3	Беатрис Корон	http://www.mann-ivanov-ferber.ru/books/nochnaya-skazka/	2017-02-28 16:57:20	2017-03-03 18:59:43	t
100	17405	15	Экономикс	978-5-00100-380-9	Майкл Гудвин	http://www.mann-ivanov-ferber.ru/books/ekonomiks/	2017-02-28 16:57:20	2017-03-03 18:59:44	t
95	17976	14	Зимние истории	978-5-00100-404-2	Сара Уэйд	http://www.mann-ivanov-ferber.ru/books/zimnie-istorii/	2017-02-28 16:57:20	2017-03-03 18:59:45	t
102	17823	14	Животные Севера	978-5-00100-337-3	Дитер Браун	http://www.mann-ivanov-ferber.ru/books/zhivotnyie-severa/	2017-02-28 16:57:20	2017-03-03 18:59:45	t
89	17958	14	Я что-то забыл, и сам не помню что	978-5-00100-299-4	Нельсон Деллис	http://www.mann-ivanov-ferber.ru/books/ya-chto-to-zabyil-i-sam-ne-pomnyu-chto/	2017-02-28 16:57:20	2017-03-03 18:59:46	t
97	17874	14	Звездная, звездная ночь	978-5-00100-355-7	Джимми Лиао	http://www.mann-ivanov-ferber.ru/books/zvezdnaya-zvezdnaya-noch/	2017-02-28 16:57:20	2017-03-03 18:59:46	t
110	17802	11	Тренируем мозг. Тетрадь для развития памяти и интеллекта №2	978-5-00100-321-2	Рюта Кавашима	http://www.mann-ivanov-ferber.ru/books/treniruem-mozg-2/	2017-02-28 16:57:20	2017-03-03 18:54:02	t
145	17698	14	KUMON. Давай вырезать! Забавные животные	978-5-00100-526-1	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-vyirezat-zabavnyie-zhivotnyie/	2017-02-28 16:57:21	2017-03-03 19:00:02	t
130	17809	14	Мир природы	978-5-00100-137-9	Аманда Вуд и Майк Джолли	http://www.mann-ivanov-ferber.ru/books/mir-prirodyi/	2017-02-28 16:57:21	2017-03-03 18:59:48	t
129	15631	9	Прыжок в мечту, или Продажи в B2B	978-5-00100-327-4	Михаил Воронин	http://www.mann-ivanov-ferber.ru/books/pryzhok-v-mechtu-ili-prodazhi-v-b2b/	2017-02-28 16:57:21	2017-03-03 18:59:49	t
121	17526	11	Под давлением	978-5-00100-334-2	Хендри Вейсингер	http://www.mann-ivanov-ferber.ru/books/pod-davleniem/	2017-02-28 16:57:21	2017-03-03 18:59:49	t
141	17337	12	Доведи идею до ума	978-5-00100-287-1	Нора Хертинг	http://www.mann-ivanov-ferber.ru/books/dovedi-ideyu-do-uma/	2017-02-28 16:57:21	2017-03-03 18:59:55	t
133	17130	9	Уроки лидерства	978-5-00100-217-8	Алекс Фергюсон	http://www.mann-ivanov-ferber.ru/books/uroki-liderstva/	2017-02-28 16:57:21	2017-03-03 18:59:56	t
156	17626	14	Мамазавр	978-5-00100-228-4	Стивен Ломп	http://www.mann-ivanov-ferber.ru/books/mamazavr/	2017-02-28 16:57:21	2017-03-03 18:59:56	t
150	17329	12	Острова	978-5-00100-242-0	Анита Грабось	http://www.mann-ivanov-ferber.ru/books/ostrova/	2017-02-28 16:57:21	2017-03-03 19:00:01	t
136	17318	15	Философия	978-5-00100-310-6	Пол Клейнман	http://www.mann-ivanov-ferber.ru/books/filosofiya/	2017-02-28 16:57:21	2017-03-03 19:00:01	t
123	17010	12	Привычка к творчеству	978-5-00100-590-2	Твайла Тарп	http://www.mann-ivanov-ferber.ru/books/privychka-k-tvorchestvu/	2017-02-28 16:57:21	2017-03-03 19:00:04	t
152	16763	15	Таинственные страницы	978-5-00100-130-0	Иван Ефишов	http://www.mann-ivanov-ferber.ru/books/tainstvennye-stranicy/	2017-02-28 16:57:21	2017-03-03 19:00:03	t
1700	7864	14	Большая книга LEGO®	978-5-91657-847-8	Аллан Бедфорд	http://www.mann-ivanov-ferber.ru/books/children/unofficial-lego-builders-guide/	2017-03-02 13:26:22	2017-03-03 19:00:11	t
120	17873	14	Сделай свою книгу	978-5-00100-085-3	Тоня Виатровски	http://www.mann-ivanov-ferber.ru/books/sdelaj-svoyu-knigu/	2017-02-28 16:57:20	2017-03-03 19:00:05	t
125	17819	14	Невозможное возможно. Лабиринты	978-5-00100-300-7	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/nevozmozhnoe-vozmozhno-labirinty/	2017-02-28 16:57:21	2017-03-03 19:00:06	t
135	17302	11	Сейчас!	978-5-00100-250-5	Эрик Бертран Ларссен	http://www.mann-ivanov-ferber.ru/books/sejchas/	2017-02-28 16:57:21	2017-03-03 19:00:07	t
134	17344	11	Как я изучаю языки	978-5-00100-247-5	Като Ломб	http://www.mann-ivanov-ferber.ru/books/kak-ya-izuchayu-yazyiki/	2017-02-28 16:57:21	2017-03-03 18:59:47	t
128	17834	14	Невозможное возможно. Найди отличия	978-5-00100-302-1	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/nevozmozhnoe-vozmozhno-najdi-otlichiya/	2017-02-28 16:57:21	2017-03-03 19:00:14	t
154	17634	14	Дерево желаний	978-5-00100-243-7	Кио Маклиар	http://www.mann-ivanov-ferber.ru/books/derevo-zhelanij/	2017-02-28 16:57:21	2017-03-03 19:00:11	t
153	16996	15	Педагогическая поэма	978-5-00100-197-3	Антон Макаренко	http://www.mann-ivanov-ferber.ru/books/pedagogicheskaya-poema/	2017-02-28 16:57:21	2017-03-03 19:00:12	t
151	17595	14	В очередь! Транспорт	978-5-00100-235-2	Томоко Омура	http://www.mann-ivanov-ferber.ru/books/v-ochered-transport/	2017-02-28 16:57:21	2017-03-03 19:00:13	t
144	16129	12	Поиск источника	978-5-00100-019-8	Джулия Кэмерон	http://www.mann-ivanov-ferber.ru/books/poisk-istochnika/	2017-02-28 16:57:21	2017-03-03 19:00:13	t
127	17835	14	Невозможное возможно. Головоломки	978-5-00100-303-8	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/nevozmozhnoe-vozmozhno-golovolomki/	2017-02-28 16:57:21	2017-03-03 19:00:17	t
140	17047	11	Брось себе вызов	978-5-00100-196-6	Грег Уайт	http://www.mann-ivanov-ferber.ru/books/bros-sebe-vyzov/	2017-02-28 16:57:21	2017-03-03 19:00:15	t
148	17697	14	Смотри!	978-5-00100-088-4	Ксавье Дэнё	http://www.mann-ivanov-ferber.ru/books/smotri/	2017-02-28 16:57:21	2017-03-03 19:00:16	t
138	17418	11	Планирование	978-5-00100-506-3	Кордула Нуссбаум	http://www.mann-ivanov-ferber.ru/books/planirovanie-prostye-praktiki/	2017-02-28 16:57:21	2017-03-03 19:00:18	t
143	17708	14	Банка с историями	978-5-00100-279-6	Эмили Ньюбургер	http://www.mann-ivanov-ferber.ru/books/banka-s-istoriyami/	2017-02-28 16:57:21	2017-03-03 19:00:18	t
142	17706	14	Кролик, который хочет уснуть	978-5-00100-511-7	Карл-Йохан Форссен Эрлин	http://www.mann-ivanov-ferber.ru/books/krolik-kotoryij-hochet-usnut/	2017-02-28 16:57:21	2017-03-03 19:00:52	t
132	16006	9	Мастер историй		Пол Смит	http://www.mann-ivanov-ferber.ru/books/master-istorij/	2017-02-28 16:57:21	2017-03-03 17:02:22	t
117	17701	14	KUMON. Найди пару. Уровень 2	978-5-00100-231-4	  	http://www.mann-ivanov-ferber.ru/books/kumon-najdi-paru-uroven-2/	2017-02-28 16:57:20	2017-03-03 19:00:51	t
238	17019	14	За покупками	978-5-00100-100-3	Элис Мелвин	http://www.mann-ivanov-ferber.ru/books/za-pokupkami/	2017-02-28 16:57:22	2017-03-03 19:00:52	t
126	17836	14	Невозможное возможно. От точки к точке	978-5-00100-301-4	Элизабет Голдинг	http://www.mann-ivanov-ferber.ru/books/nevozmozhnoe-vozmozhno-ot-tochki-k-tochke/	2017-02-28 16:57:21	2017-03-03 19:04:31	t
131	17340	13	Вечно уставший		Джейкоб Тейтельбаум	http://www.mann-ivanov-ferber.ru/books/vechno-ustavshij/	2017-02-28 16:57:21	2017-03-03 19:04:26	t
118	17892	14	Привет, Землянин!	978-5-00100-357-1	Марк тер Хорст	http://www.mann-ivanov-ferber.ru/book/privet-zemlyanin/	2017-02-28 16:57:20	2017-03-03 19:04:30	t
124	17558	12	Ни дня без кисти	978-5-00100-304-5	Кэрол Марин	http://www.mann-ivanov-ferber.ru/books/ni-dnya-bez-kisti/	2017-02-28 16:57:21	2017-03-03 19:04:30	t
122	17827	14	LEGO-архитектура	978-5-00100-307-6	Том Алфин	http://www.mann-ivanov-ferber.ru/books/lego-arhitektura/	2017-02-28 16:57:21	2017-03-03 19:04:32	t
139	17462	11	Уверенность в себе	978-5-00100-677-0	Ивонн Рубин	http://www.mann-ivanov-ferber.ru/books/uverennost-v-sebe-prostye-praktiki/	2017-02-28 16:57:21	2017-03-03 18:59:48	t
184	17196	12	Кради как художник. Творческий дневник	978-5-00100-455-4	Остин  Клеон	http://www.mann-ivanov-ferber.ru/books/kradi-kak-hudozhnik-tvorcheskij-dnevnik/	2017-02-28 16:57:21	2017-03-03 19:04:39	t
1042	5269	11	Искусство говорить и слушать	978-5-91657-580-4	Мортимер Адлер	http://www.mann-ivanov-ferber.ru/books/paperbook/how-speak/	2017-02-28 17:02:33	2017-03-03 19:04:34	t
188	17391	14	Весёлое путешествие	978-5-00057-834-6	Александра Балашова	http://www.mann-ivanov-ferber.ru/books/vesyoloe-puteshestvie/	2017-02-28 16:57:21	2017-03-03 19:04:34	t
167	17623	14	Транспорт. От телеги до ракеты	978-5-00100-244-4	Стефани Ледю	http://www.mann-ivanov-ferber.ru/books/transport-ot-telegi-do-rakety/	2017-02-28 16:57:21	2017-03-03 19:04:35	t
171	17597	14	Облака	978-5-00100-122-5	Линнея Крилен	http://www.mann-ivanov-ferber.ru/books/oblaka/	2017-02-28 16:57:21	2017-03-03 19:04:35	t
163	17547	12	Творческий приступ	978-5-00100-270-3	Яна Франк	http://www.mann-ivanov-ferber.ru/books/tvorcheskij-pristup/	2017-02-28 16:57:21	2017-03-03 19:04:36	t
189	17188	12	Книга гениальных идей	978-5-00100-221-5	Братья Маклеод	http://www.mann-ivanov-ferber.ru/books/kniga-genialnyh-idej/	2017-02-28 16:57:21	2017-03-03 19:04:37	t
195	17184	14	Волшебные цветы. Мой гербарий	978-5-00100-125-6	Стефани Циск	http://www.mann-ivanov-ferber.ru/books/volshebnye-cvety-moj-gerbarij/	2017-02-28 16:57:22	2017-03-03 19:04:37	t
160	16934	12	Снежинка. Ракушка. Звезда	978-5-00100-121-8	Алекс Беллос	http://www.mann-ivanov-ferber.ru/books/cnezhinka-rakushka-zvezda/	2017-02-28 16:57:21	2017-03-03 19:04:39	t
172	17594	14	В очередь!	978-5-00100-226-0	Томоко Омура	http://www.mann-ivanov-ferber.ru/books/v-ochered-zhivotnyie/	2017-02-28 16:57:21	2017-03-03 19:04:50	t
191	16936	15	Математика для взрослых	978-5-00100-126-3	Кьяртан Поскит	http://www.mann-ivanov-ferber.ru/books/matematika-dlya-vzroslyh/	2017-02-28 16:57:22	2017-03-03 19:04:40	t
192	17358	14	Отпечаток, точка, штрих		  	http://www.mann-ivanov-ferber.ru/books/otpechatok-tochka-shtrix/	2017-02-28 16:57:22	2017-03-03 19:04:49	t
173	17592	14	Кто прячется в море?	978-5-00100-208-6	Айна Бестард	http://www.mann-ivanov-ferber.ru/books/kto-pryachetsya-v-more/	2017-02-28 16:57:21	2017-03-03 19:04:49	t
1176	8262	15	Босиком по облакам	978-5-91657-243-8	Алексей Кочемасов	http://www.mann-ivanov-ferber.ru/books/special/clouds/	2017-02-28 17:02:36	2017-03-03 19:04:51	t
169	17205	9	У них так принято	978-5-00100-472-1	Росс Маккаммон	http://www.mann-ivanov-ferber.ru/books/u-nih-tak-prinyato/	2017-02-28 16:57:21	2017-03-03 19:05:14	t
186	17482	14	Мои друзья	978-5-00100-229-1	Неле Пальмтаг	http://www.mann-ivanov-ferber.ru/books/moi-druzya/	2017-02-28 16:57:21	2017-03-03 19:05:01	t
182	17491	14	Зато сам!		Татьяна Руссита	http://www.mann-ivanov-ferber.ru/books/zato-sam/	2017-02-28 16:57:21	2017-03-03 19:05:14	t
179	17271	12	Скетчи!	978-5-00100-462-2	Франс Белльвиль-Ван Стоун	http://www.mann-ivanov-ferber.ru/books/sketchi/	2017-02-28 16:57:21	2017-03-03 19:05:16	t
168	17600	14	Папа онлайн	978-5-00100-268-0	Филипп де Кемметер	http://www.mann-ivanov-ferber.ru/books/papa-online/	2017-02-28 16:57:21	2017-03-03 19:05:15	t
176	17556	14	Потрясающее шоу кролика-иллюзиониста	978-5-00100-177-5	Патрисия Гейс	http://www.mann-ivanov-ferber.ru/books/potryasayushhee-shou-krolika-illyuzionista/	2017-02-28 16:57:21	2017-03-03 19:05:16	t
194	17352	5	Блокнот для записей МИФа	978-5-00100-617-6	  	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-zapisej-mif/	2017-02-28 16:57:22	2017-03-03 19:05:18	t
187	17466	14	Невозможный блокнот для фантазёров и художников	978-5-00100-225-3	Юлия Змеева	http://www.mann-ivanov-ferber.ru/books/nevozmozhnyij-bloknot-dlya-fantazyorov-i-hudozhnikov/	2017-02-28 16:57:21	2017-03-03 19:05:17	t
180	17132	10	iМаркетинг	978-5-00100-288-8	Виталий Мышляев	http://www.mann-ivanov-ferber.ru/books/imarketing/	2017-02-28 16:57:21	2017-03-03 19:05:17	t
164	17601	5	Блокнот для записей МИФа (бирюзовый)	978-5-00100-206-2	  	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-zapisej-mifa-zelenyij/	2017-02-28 16:57:21	2017-03-03 19:05:18	t
190	17197	12	Как понять акварель	978-5-00100-395-3	Том Хоффманн	http://www.mann-ivanov-ferber.ru/books/kak-ponyat-akvarel/	2017-02-28 16:57:21	2017-03-03 19:05:29	t
185	17493	14	Игрушки из бумаги	978-5-00100-179-9	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/igrushki-iz-bumagi/	2017-02-28 16:57:21	2017-03-03 19:05:18	t
158	17636	14	Однажды в сказке	978-5-00100-089-1	Анна Лаваль	http://www.mann-ivanov-ferber.ru/books/odnazhdy-v-skazke/	2017-02-28 16:57:21	2017-03-03 19:05:19	t
175	15539	13	Ультра	978-5-00057-731-8	Рич Ролл	http://www.mann-ivanov-ferber.ru/books/ultra/	2017-02-28 16:57:21	2017-03-03 19:04:33	t
181	17177	14	Мик ищет друга	978-5-00100-140-9	Марьет Хаубертс	http://www.mann-ivanov-ferber.ru/books/mik-ishet-druga/	2017-02-28 16:57:21	2017-03-03 19:05:29	t
161	17350	14	Живая природа. За городом	978-5-00100-090-7	Каролин Пеллиссье	http://www.mann-ivanov-ferber.ru/books/zhivaya-priroda-za-gorodom/	2017-02-28 16:57:21	2017-03-03 19:05:30	t
177	16461	15	В активном поиске	978-5-00100-030-3	Азиз Ансари	http://www.mann-ivanov-ferber.ru/books/v-aktivnom-poiske/	2017-02-28 16:57:21	2017-03-03 19:05:30	t
193	16994	11	Укрощение амигдалы	978-5-00100-175-1	Джон Арден	http://www.mann-ivanov-ferber.ru/books/ukroshenie-amigdaly/	2017-02-28 16:57:22	2017-03-03 19:05:31	t
1139	11793	14	Нескучалка. Рисуем и играем в дороге		Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/neskuchalka_5-7/	2017-02-28 17:02:35	2017-03-03 17:03:50	t
183	17492	14	Дом для лис		Татьяна Руссита	http://www.mann-ivanov-ferber.ru/books/dom-dlya-lis/	2017-02-28 16:57:21	2017-03-03 19:07:28	t
166	17624	14	Искусство. От кроманьонца до тебя	978-5-00100-245-1	Стефани Ледю	http://www.mann-ivanov-ferber.ru/books/iskusstvo-ot-kromanoncza-do-tebya/	2017-02-28 16:57:21	2017-03-03 19:07:29	t
159	17351	14	Живая природа. В горах	978-5-00100-091-4	Каролин Пеллиссье	http://www.mann-ivanov-ferber.ru/books/zhivaya-priroda-v-gorax/	2017-02-28 16:57:21	2017-03-03 19:07:29	t
174	17478	14	Свобода учиться	978-5-00100-207-9	Питер Грей	http://www.mann-ivanov-ferber.ru/books/svoboda-uchitsya/	2017-02-28 16:57:21	2017-03-03 19:04:33	t
229	17227	14	Следуй за линией	978-5-00100-075-4	Лора Люнгквист	http://www.mann-ivanov-ferber.ru/books/sleduj-za-liniej/	2017-02-28 16:57:22	2017-03-03 19:07:33	t
215	16858	12	Рисовать — это круто	978-5-00100-097-6	Джон Хендрикс	http://www.mann-ivanov-ferber.ru/books/risovat-eto-kruto/	2017-02-28 16:57:22	2017-03-03 19:07:31	t
220	17159	14	Буквы	978-5-00057-986-2	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/bukvy/	2017-02-28 16:57:22	2017-03-03 19:07:32	t
208	17332	14	Сказочный лес	978-5-00100-173-7	Света Шендрик	http://www.mann-ivanov-ferber.ru/books/skazochnyij-les/	2017-02-28 16:57:22	2017-03-03 19:07:32	t
210	17127	15	Верховный алгоритм	978-5-00100-172-0	Педро Домингос	http://www.mann-ivanov-ferber.ru/books/verhovnyj-algoritm/	2017-02-28 16:57:22	2017-03-03 19:07:34	t
224	17170	14	Привет, весна!	978-5-00057-993-0	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/privet-vesna/	2017-02-28 16:57:22	2017-03-03 19:07:33	t
230	16932	12	Хирамеки	978-5-00100-123-2	Пенг и Ху	http://www.mann-ivanov-ferber.ru/books/hirameki/	2017-02-28 16:57:22	2017-03-03 19:07:34	t
216	16447	9	Как все испортить и разорить бизнес	978-5-00100-509-4	Святослав Бирюлин	http://www.mann-ivanov-ferber.ru/books/kak-vse-isportit-i-razorit-biznes/	2017-02-28 16:57:22	2017-03-03 19:07:48	t
214	17275	15	Неизведанный Байкал	978-5-00057-698-4	Валерий Малеев	http://www.mann-ivanov-ferber.ru/books/neizvedannyj-bajkal/	2017-02-28 16:57:22	2017-03-03 19:07:35	t
235	16115	15	Квантовая вселенная	978-5-00100-080-8	Брайан Кокс	http://www.mann-ivanov-ferber.ru/books/kvantovaya-vselennaya/	2017-02-28 16:57:22	2017-03-03 19:07:36	t
222	17161	14	Животные	978-5-00057-988-6	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/zhivotnye/	2017-02-28 16:57:22	2017-03-03 19:07:47	t
213	17224	14	По горячим следам	978-5-00100-414-1	Ганс Юрген Пресс	http://www.mann-ivanov-ferber.ru/books/po-goryachim-sledam/	2017-02-28 16:57:22	2017-03-03 19:07:48	t
218	16696	9	Сырок	978-5-00100-516-2	Борис Александров	http://www.mann-ivanov-ferber.ru/books/syrok/	2017-02-28 16:57:22	2017-03-03 19:08:04	t
212	16741	14	Испытание ребенком	978-5-00100-081-5	Джон Готтман	http://www.mann-ivanov-ferber.ru/books/ispytanie-rebenkom/	2017-02-28 16:57:22	2017-03-03 19:07:49	t
225	17171	14	Привет, лето!	978-5-00057-991-6	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/privet-leto/	2017-02-28 16:57:22	2017-03-03 19:07:50	t
203	16467	15	Фредерик Кук на вершине континента	978-5-00100-187-4	Дмитрий Шпаро	http://www.mann-ivanov-ferber.ru/books/frederik-kuk-na-vershine-kontinenta/	2017-02-28 16:57:22	2017-03-03 19:08:04	t
196	17360	14	Мам, дай фартук!	978-5-00100-508-7	Катерина Дронова	http://www.mann-ivanov-ferber.ru/books/mam-daj-fartuk/	2017-02-28 16:57:22	2017-03-03 19:08:05	t
199	16810	12	В поисках кадра	978-5-00100-108-9	Брайан Петерсон	http://www.mann-ivanov-ferber.ru/books/v-poiskah-kadra/	2017-02-28 16:57:22	2017-03-03 19:08:05	t
209	16147	11	Тишина	978-5-00100-359-5	Тит Нат Хан	http://www.mann-ivanov-ferber.ru/books/tishina/	2017-02-28 16:57:22	2017-03-03 19:08:25	t
219	17000	12	Творческий беспорядок	978-5-00100-120-1	Дарелл Годфри	http://www.mann-ivanov-ferber.ru/books/tvorcheskij-besporyadok/	2017-02-28 16:57:22	2017-03-03 19:08:06	t
223	17162	14	Игрушки	978-5-00057-989-3	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/igrushki/	2017-02-28 16:57:22	2017-03-03 19:08:25	t
236	16859	11	Быть, а не казаться	978-5-00100-668-8	Стивен Кови	http://www.mann-ivanov-ferber.ru/books/byt-a-ne-kazatsya/	2017-02-28 16:57:22	2017-03-03 19:08:26	t
200	16814	12	НАЧНИ СЕЙЧАС!	978-5-00100-094-5	Кейт Неккель	http://www.mann-ivanov-ferber.ru/books/nachni-sejchas/	2017-02-28 16:57:22	2017-03-03 19:07:30	t
227	17173	14	Привет, зима!	978-5-00057-992-3	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/privet-zima/	2017-02-28 16:57:22	2017-03-03 19:08:42	t
207	17268	12	Мания ботаника	978-5-00100-545-2	Зиффлин	http://www.mann-ivanov-ferber.ru/books/maniya-botanika/	2017-02-28 16:57:22	2017-03-03 19:08:43	t
231	17064	12	Сборище дудлов	978-5-00100-638-1	Зиффлин	http://www.mann-ivanov-ferber.ru/books/sborishe-dudlov/	2017-02-28 16:57:22	2017-03-03 19:08:45	t
228	16672	13	Руководство ультрамарафонца	978-5-00100-057-0	Хэл Кернер	http://www.mann-ivanov-ferber.ru/books/rukovodstvo-ultramarafonca/	2017-02-28 16:57:22	2017-03-03 19:08:44	t
206	17212	12	Пространство дудлов	978-5-00100-168-3	Зиффлин	http://www.mann-ivanov-ferber.ru/books/prostranstvo-dudlov/	2017-02-28 16:57:22	2017-03-03 19:08:45	t
217	16753	11	Магия утра	978-5-00100-358-8	Хэл Элрод	http://www.mann-ivanov-ferber.ru/books/magiya-utra/	2017-02-28 16:57:22	2017-03-03 19:08:46	t
211	16575	11	100 способов изменить жизнь	978-5-00100-343-4	Лариса Парфентьева	http://www.mann-ivanov-ferber.ru/books/100-sposobov-izmenit-zhizn/	2017-02-28 16:57:22	2017-03-03 19:09:07	t
237	17164	14	Играй!	978-5-00100-116-4	Ориол Риполл	http://www.mann-ivanov-ferber.ru/books/igraj/	2017-02-28 16:57:22	2017-03-03 19:08:47	t
233	17218	14	Витаминки	978-5-00100-144-7	Агнешка Совиньская	http://www.mann-ivanov-ferber.ru/books/vitaminki/	2017-02-28 16:57:22	2017-03-03 19:08:51	t
221	17160	14	Числа	978-5-00057-987-9	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/chisla/	2017-02-28 16:57:22	2017-03-03 19:08:51	t
202	17176	14	У козы теперь козленок	978-5-00100-141-6	Марьет Хаубертс	http://www.mann-ivanov-ferber.ru/books/u-kozy-teper-kozlenok/	2017-02-28 16:57:22	2017-03-03 19:08:52	t
205	17191	12	Переполох дудлов	978-5-00100-219-2	Зиффлин	http://www.mann-ivanov-ferber.ru/books/perepoloh-dudlov/	2017-02-28 16:57:22	2017-03-03 19:08:52	t
232	16453	13	Вилки вместо ножей	978-5-00100-031-0	Алона Пульде	http://www.mann-ivanov-ferber.ru/books/vilki-protiv-nozhej/	2017-02-28 16:57:22	2017-03-03 19:08:53	t
198	17281	14	Следуй за линией. Вокруг света	978-5-00100-076-1	Лора Люнгквист	http://www.mann-ivanov-ferber.ru/books/sleduj-za-liniej-vokrug-sveta/	2017-02-28 16:57:22	2017-03-03 19:09:05	t
1702	2171	9	Представьте себе!	5-315-00031-1	Том Питерс	http://www.mann-ivanov-ferber.ru/books/sse/reimagine/	2017-03-02 13:26:23	2017-03-03 19:09:06	t
226	17172	14	Привет, осень!	978-5-00057-994-7	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/privet-osen/	2017-02-28 16:57:22	2017-03-03 19:09:06	t
1561	2144	10	Уникальность теперь... или никогда	5-315-00026-5	Йеспер Кунде	http://www.mann-ivanov-ferber.ru/books/sse/unique-now/	2017-02-28 17:02:41	2017-03-03 19:07:30	t
268	16838	14	Создания большие и маленькие	978-5-00057-743-1	Люси Энгельман	http://www.mann-ivanov-ferber.ru/books/sozdaniya-bolshie-i-malenkie/	2017-02-28 16:57:23	2017-03-03 19:09:08	t
244	16808	12	Между надо и хочу	978-5-00100-412-7	Эль Луна	http://www.mann-ivanov-ferber.ru/books/mezhdu-nado-i-hochu/	2017-02-28 16:57:22	2017-03-03 19:09:10	t
249	16850	12	Нетронутая красота	978-5-00100-095-2	Клэр Скалли	http://www.mann-ivanov-ferber.ru/books/netronutaya-krasota/	2017-02-28 16:57:22	2017-03-03 19:09:11	t
241	16450	15	Симпсоны и их математические секреты	978-5-00100-034-1	Саймон Сингх	http://www.mann-ivanov-ferber.ru/books/simpsony-i-ih-matematicheskie-sekrety/	2017-02-28 16:57:22	2017-03-03 19:09:24	t
262	16342	15	Защити себя по методикам спецслужб	978-5-00100-017-4	Джейсон Хансон	http://www.mann-ivanov-ferber.ru/books/zashiti-sebya-po-metodikam-specsluzhb/	2017-02-28 16:57:23	2017-03-03 19:09:07	t
252	16313	10	Не очевидно	978-5-00100-033-4	Рохит Бхаргава	http://www.mann-ivanov-ferber.ru/books/ne-ochevidno/	2017-02-28 16:57:22	2017-03-03 19:09:21	t
267	16758	12	Удивительные строения	978-5-00100-061-7	Стив Макдональд	http://www.mann-ivanov-ferber.ru/books/udivitelnye-stroeniya/	2017-02-28 16:57:23	2017-03-03 19:09:21	t
263	16915	14	Гарольд	978-5-00100-082-2	Клаудия Болдт	http://www.mann-ivanov-ferber.ru/books/garold/	2017-02-28 16:57:23	2017-03-03 19:09:22	t
247	15855	15	Chineasy каждый день	978-5-00057-799-8	ШаоЛань Сюэ	http://www.mann-ivanov-ferber.ru/books/chineasy-kazhdyj-den/	2017-02-28 16:57:22	2017-03-03 19:09:22	t
243	16760	12	Вокруг света на велосипеде	978-5-00100-064-8	Шань Цзян	http://www.mann-ivanov-ferber.ru/books/vokrug-sveta-na-velosipede/	2017-02-28 16:57:22	2017-03-03 19:09:23	t
245	17016	14	Зверажуры	978-5-00100-101-0	Сара Деннис	http://www.mann-ivanov-ferber.ru/books/zverazhury/	2017-02-28 16:57:22	2017-03-03 19:09:24	t
242	16747	13	Энергия крахмала	978-5-00100-060-0	Джон Макдугалл и Мэри Макдугалл	http://www.mann-ivanov-ferber.ru/books/energiya-krahmala/	2017-02-28 16:57:22	2017-03-03 19:09:49	t
255	15547	12	Реальный репортер	978-5-00057-996-1	Дмитрий Соколов-Митрич	http://www.mann-ivanov-ferber.ru/books/realnyj-reporter/	2017-02-28 16:57:22	2017-03-03 19:09:34	t
274	16735	14	Kumon. Математика. Дроби. Уровень 4	978-5-00057-936-7	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-drobi-uroven-4/	2017-02-28 16:57:23	2017-03-03 19:10:08	t
269	16554	14	Школа искусств	978-5-00057-742-4	Тил Триггс	http://www.mann-ivanov-ferber.ru/books/shkola-iskusstv/	2017-02-28 16:57:23	2017-03-03 19:09:49	t
248	14889	9	Все начальники делают это	978-5-00057-818-6	Брюс Тулган	http://www.mann-ivanov-ferber.ru/books/27-problem-menedzhera/	2017-02-28 16:57:22	2017-03-03 19:10:09	t
278	14377	10	Экспресс-маркетинг	978-5-00057-730-1	Александр Левитас	http://www.mann-ivanov-ferber.ru/books/bystryj-marketing/	2017-02-28 16:57:23	2017-03-03 19:09:50	t
257	16864	14	Разноцветные джунгли	978-5-00100-039-6	Магали Аттиогбе	http://www.mann-ivanov-ferber.ru/books/raznocvetnye-dzhungli/	2017-02-28 16:57:22	2017-03-03 19:10:06	t
259	16343	11	Лучше поздно, чем никогда	978-5-00100-032-7	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/luchshe-pozdno-chem-nikogda/	2017-02-28 16:57:22	2017-03-03 19:10:08	t
276	16733	14	Kumon. Математика. Деление. Уровень 4	978-5-00057-935-0	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-delenie-uroven-4/	2017-02-28 16:57:23	2017-03-03 19:10:15	t
254	16694	12	642 стильные идеи, что нарисовать	978-5-00100-029-7	  	http://www.mann-ivanov-ferber.ru/books/642-stilnye-idei-chto-narisovat/	2017-02-28 16:57:22	2017-03-03 19:10:09	t
266	16366	11	Триггеры	978-5-00100-011-2	Маршалл Голдсмит	http://www.mann-ivanov-ferber.ru/books/triggery/	2017-02-28 16:57:23	2017-03-03 19:10:13	t
251	17023	14	Жизнь минимотов	978-5-00100-072-3	Годлен де Розамель	http://www.mann-ivanov-ferber.ru/books/zhizn-minimotov/	2017-02-28 16:57:22	2017-03-03 19:10:10	t
271	16754	14	Космос	978-5-00100-025-9	Дмитрий Костюков	http://www.mann-ivanov-ferber.ru/books/kosmosbook/	2017-02-28 16:57:23	2017-03-03 19:10:11	t
250	15543	9	Развитие бизнеса	978-5-00057-704-2	Верн Харниш	http://www.mann-ivanov-ferber.ru/books/razvitie-biznesa/	2017-02-28 16:57:22	2017-03-03 19:10:12	t
272	14957	15	Голая статистика	978-5-00057-953-4	Чарльз Уилан	http://www.mann-ivanov-ferber.ru/books/golaya-statistika/	2017-02-28 16:57:23	2017-03-03 19:10:10	t
277	16073	15	Парадокс страсти	978-5-00100-362-5	Дин Делис	http://www.mann-ivanov-ferber.ru/books/paradoks-strasti/	2017-02-28 16:57:23	2017-03-03 19:10:12	t
256	16135	11	Одна привычка в неделю	978-5-00100-550-6	Бретт Блюменталь	http://www.mann-ivanov-ferber.ru/books/1-privychka-v-nedelyu/	2017-02-28 16:57:22	2017-03-03 19:10:16	t
264	16469	12	От точки к точке	978-5-00100-474-5	Гарет Мур	http://www.mann-ivanov-ferber.ru/books/ot-tochki-k-tochke/	2017-02-28 16:57:23	2017-03-03 19:10:13	t
240	16684	12	Портреты фруктов и овощей	978-5-00100-473-8	Билли Шоуэлл	http://www.mann-ivanov-ferber.ru/books/portrety-fruktov-i-ovoshej/	2017-02-28 16:57:22	2017-03-03 19:09:10	t
275	16734	14	Kumon. Математика. Умножение. Уровень 4	978-5-00057-934-3	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-umnozhenie-uroven-4/	2017-02-28 16:57:23	2017-03-03 19:10:15	t
253	17007	14	Детектив Пьер распутывает дело	978-5-00100-086-0	Хиро Камигаки и IC4DESIGN	http://www.mann-ivanov-ferber.ru/books/detektiv-per-rasputyvaet-delo/	2017-02-28 16:57:22	2017-03-03 19:10:14	t
273	16736	14	Kumon. Математика. Дроби. Уровень 5	978-5-00057-937-4	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-drobi-uroven-5/	2017-02-28 16:57:23	2017-03-03 19:09:20	t
299	15548	11	Внимательный мозг	978-5-00057-830-8	Дэниел Сигел	http://www.mann-ivanov-ferber.ru/books/vnimatelnyj-mozg/	2017-02-28 16:57:23	2017-03-03 19:10:32	t
316	16093	5	Ветер уносит цветы	978-5-00057-859-9	Ольга Головешкина	http://www.mann-ivanov-ferber.ru/books/veter-unosit-cvety/	2017-02-28 16:57:23	2017-03-03 19:10:33	t
314	14966	9	Размышления о менеджменте	978-5-00057-681-6	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/razmyshlenija-o-menedzhmente/	2017-02-28 16:57:23	2017-03-03 19:10:48	t
301	15909	9	Бизнес как игра	978-5-00100-575-9	Сергей Абдульманов	http://www.mann-ivanov-ferber.ru/books/biznes-kak-igra/	2017-02-28 16:57:23	2017-03-03 19:10:49	t
310	16287	14	Без ума от обезьян	978-5-00057-887-2	Оуэн Дэйви	http://www.mann-ivanov-ferber.ru/books/bez-uma-ot-obezyan/	2017-02-28 16:57:23	2017-03-03 19:10:50	t
296	16154	14	Что у него в голове?	978-5-00057-800-1	Эмбер и Энди Анковски	http://www.mann-ivanov-ferber.ru/books/chto-u-nego-v-golove/	2017-02-28 16:57:23	2017-03-03 19:10:49	t
287	16319	9	Лабиринты стратегии	978-5-00057-956-5	Александр Паньков	http://www.mann-ivanov-ferber.ru/books/labirinty-strategii/	2017-02-28 16:57:23	2017-03-03 19:10:51	t
297	14972	15	Креативный класс	978-5-00057-733-2	Ричард Флорида	http://www.mann-ivanov-ferber.ru/books/kreativnyj-klass/	2017-02-28 16:57:23	2017-03-03 19:10:52	t
1750	18014	14	Настоящему детективу. Подарочный комплект		Юлия Луговская	http://www.mann-ivanov-ferber.ru/books/malenkomu-detektivu/	2017-03-02 13:26:47	2017-03-03 19:10:52	t
294	16664	14	Творческая мастерская	978-5-00057-958-9	Ракель Дорли	http://www.mann-ivanov-ferber.ru/books/tvorcheskaya-masterskaya/	2017-02-28 16:57:23	2017-03-03 19:10:53	t
304	16327	14	Животные-врачи	978-5-00057-886-5	Энджи Триус	http://www.mann-ivanov-ferber.ru/books/zhivotnye-vrachi/	2017-02-28 16:57:23	2017-03-03 19:10:53	t
286	16368	14	Великоляпная история	978-5-00057-304-4	Патрик Макдоннел	http://www.mann-ivanov-ferber.ru/books/velikolyapnaya-istoriya/	2017-02-28 16:57:23	2017-03-03 19:10:51	t
293	15649	12	642 идеи, о чем еще написать	978-5-00057-720-2	  	http://www.mann-ivanov-ferber.ru/books/642-idei-o-chem-eshe-napisat/	2017-02-28 16:57:23	2017-03-03 19:10:54	t
291	15627	2	Быть начальником — это нормально	978-5-00100-501-8	Брюс Тулган	http://www.mann-ivanov-ferber.ru/books/byt-nachalnikom-eto-normalno/	2017-02-28 16:57:23	2017-03-03 19:10:54	t
302	16300	14	Где же торт?	978-5-00057-881-0	Тэ Тён Кин	http://www.mann-ivanov-ferber.ru/books/gde-zhe-tort/	2017-02-28 16:57:23	2017-03-03 19:10:55	t
281	15899	13	Нация фастфуда	978-5-00057-981-7	Эрик Шлоссер	http://www.mann-ivanov-ferber.ru/books/naciya-fastfuda/	2017-02-28 16:57:23	2017-03-03 19:10:56	t
300	15799	15	Школа будущего	978-5-00057-734-9	Кен Робинсон	http://www.mann-ivanov-ferber.ru/books/shkola-budushego/	2017-02-28 16:57:23	2017-03-03 19:10:56	t
308	16075	12	Удивительные города	978-5-00057-878-0	Стив Макдональд	http://www.mann-ivanov-ferber.ru/books/udivitelnye-goroda/	2017-02-28 16:57:23	2017-03-03 19:10:55	t
285	16757	14	Я бы так не смог	978-5-00057-944-2	Станислав Востоков	http://www.mann-ivanov-ferber.ru/books/ya-by-tak-ne-smog/	2017-02-28 16:57:23	2017-03-03 19:10:57	t
305	16301	14	Как собрать мотоцикл	978-5-00057-871-1	Мартин Содомка	http://www.mann-ivanov-ferber.ru/books/kak-sobrat-motocikl/	2017-02-28 16:57:23	2017-03-03 19:10:57	t
315	15132	12	Учись слушать	978-5-00057-679-3	Марина Москвина	http://www.mann-ivanov-ferber.ru/books/uchis-slushat/	2017-02-28 16:57:23	2017-03-03 19:11:14	t
309	16295	14	Тоби и гиганты ледникового периода	978-5-00057-860-5	Джо Лиллингтон	http://www.mann-ivanov-ferber.ru/books/tobi-i-giganty-lednikovogo-perioda/	2017-02-28 16:57:23	2017-03-03 19:11:15	t
1110	16950	14	KUMON на украинском языке. Простые линии	978-5-00057-545-1	  	http://www.mann-ivanov-ferber.ru/books/kumon-na-ukrainskom-yazyke-prostye-linii/	2017-02-28 17:02:35	2017-03-03 17:03:50	t
283	16706	14	Фантазариум	978-5-00057-955-8	Жофи Барабаш	http://www.mann-ivanov-ferber.ru/books/fantazarium/	2017-02-28 16:57:23	2017-03-03 19:13:07	t
307	6609	12	Выходит продюсер	978-5-00057-885-8	Александр Роднянский	http://www.mann-ivanov-ferber.ru/books/paperbook/producer/	2017-02-28 16:57:23	2017-03-03 19:10:58	t
290	15854	11	На пределе	978-5-00100-546-9	Эрик Бертран Ларссен	http://www.mann-ivanov-ferber.ru/books/na-predele/	2017-02-28 16:57:23	2017-03-03 19:13:26	t
1704	2330	9	Потребители будущего		Мартин Реймонд	http://www.mann-ivanov-ferber.ru/books/sse/tomorrow/	2017-03-02 13:26:23	2017-03-03 19:13:15	t
295	16067	14	Ты можешь больше, чем ты думаешь		Томас Армстронг	http://www.mann-ivanov-ferber.ru/books/ty-umnee-chem-kazhetsya/	2017-02-28 16:57:23	2017-03-03 19:13:16	t
1109	12869	9	Дневник хеджера	978-5-00057-466-9	Бартон Биггс	http://www.mann-ivanov-ferber.ru/books/dnevnik_hedzhera/	2017-02-28 17:02:35	2017-03-03 19:13:16	t
1751	18016	14	Большим и маленьким мечтателям. Подарочный комплект		Кио Маклиар	http://www.mann-ivanov-ferber.ru/books/tomu-kto-verit-v-chudesa/	2017-03-02 13:26:47	2017-03-03 19:13:25	t
303	16298	14	Животные-архитекторы	978-5-00057-813-1	Даниэль Нассар	http://www.mann-ivanov-ferber.ru/books/zhivotnye-arhitektory/	2017-02-28 16:57:23	2017-03-03 19:13:25	t
317	15274	15	Санта действительно существует?	978-5-00057-703-5	Эрик Каплан	http://www.mann-ivanov-ferber.ru/books/ded-moroz-sushestvuet/	2017-02-28 16:57:23	2017-03-03 19:10:32	t
311	16078	14	Снег	978-5-00057-833-9	Марк Кассино, Джон Нельсон	http://www.mann-ivanov-ferber.ru/books/sneg/	2017-02-28 16:57:23	2017-03-03 17:03:42	t
313	15360	11	Момент истины	978-5-00057-724-0	Сайен Бейлок	http://www.mann-ivanov-ferber.ru/books/moment-istiny/	2017-02-28 16:57:23	2017-03-03 19:14:28	t
298	16322	14	Творчество с малышами	978-5-00100-558-2	Наталья Костикова	http://www.mann-ivanov-ferber.ru/books/tvorchestvo-s-malyshami/	2017-02-28 16:57:23	2017-03-03 19:13:08	t
280	16791	14	Хронология	978-5-00057-861-2	Петер Гюс	http://www.mann-ivanov-ferber.ru/books/hronologiya/	2017-02-28 16:57:23	2017-03-03 19:14:29	t
289	16737	14	Kumon. Математика. Обыкновенные дроби. Уровень 6	978-5-00057-938-1	  	http://www.mann-ivanov-ferber.ru/books/kumon-matematika-obyknovennye-drobi-uroven-6/	2017-02-28 16:57:23	2017-03-03 19:13:08	t
391	15677	14	Большая книга природы	978-5-00057-669-4	Никола Дэвис	http://www.mann-ivanov-ferber.ru/books/bolshaya-kniga-prirody/	2017-02-28 16:57:25	2017-03-03 19:14:30	t
356	15457	12	Я, ты, мы	978-5-00057-706-6	Лиза Кьюрри	http://www.mann-ivanov-ferber.ru/books/ya-ty-my/	2017-02-28 16:57:24	2017-03-03 19:14:31	t
333	18010	14	Фанату комиксов. Подарочный комплект		Люк Пирсон	http://www.mann-ivanov-ferber.ru/books/fanatu-komiksov/	2017-02-28 16:57:24	2017-03-03 19:14:31	t
345	15976	14	Путешествие	978-5-00057-772-1	Аарон Бекер	http://www.mann-ivanov-ferber.ru/books/puteshestvie/	2017-02-28 16:57:24	2017-03-03 17:03:42	t
338	15917	15	Стильное путешествие налегке	978-5-00057-771-4	Анна Шарлай	http://www.mann-ivanov-ferber.ru/books/stilnoe-puteshestvie-nalegke/	2017-02-28 16:57:24	2017-03-03 19:15:21	t
1071	5977	9	Моя жизнь, мои достижения	978-591657-724-2	Генри Форд	http://www.mann-ivanov-ferber.ru/books/history/my-life-and-work/	2017-02-28 17:02:34	2017-03-03 19:15:21	t
344	17960	14	Адвент-календарь «Как Дед Мороз шапку искал»	978-5-00100-374-8	Ася Ванякина	http://www.mann-ivanov-ferber.ru/books/advent-kalendar-kak-ded-moroz-shapku-iskal/	2017-02-28 16:57:24	2017-03-03 19:15:22	t
339	14668	15	Мы — это музыка	978-5-00057-660-1	Виктория Уильямсон	http://www.mann-ivanov-ferber.ru/books/muzika-eto-mi/	2017-02-28 16:57:24	2017-03-03 19:15:23	t
353	15914	14	KUMON. Лабиринты. Транспорт	978-5-00057-716-5	\N	http://www.mann-ivanov-ferber.ru/books/kumon-labirinty-transport/	2017-02-28 16:57:24	2017-03-03 17:03:42	t
1497	2453	11	Как быстро привести дела в порядок	978-5-91657-161-5	Дэвид Аллен	http://www.mann-ivanov-ferber.ru/books/mif/readyforanything/	2017-02-28 17:02:40	2017-03-03 19:14:32	t
348	15979	14	Цветной календарь 2016	978-5-00057-745-5	Зина Сурова	http://www.mann-ivanov-ferber.ru/books/cvetnoj-kalendar-2016/	2017-02-28 16:57:24	2017-03-03 19:16:11	t
331	16011	14	KUMON. Учимся складывать. Простые примеры	978-5-00057-752-3	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-skladyvat-prostye-primery/	2017-02-28 16:57:24	2017-03-03 19:16:11	t
330	16012	14	KUMON. Учимся вычитать. Простые примеры	978-5-00057-753-0	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-vychitat-prostye-primery/	2017-02-28 16:57:24	2017-03-03 19:16:20	t
327	16013	14	KUMON. Учимся вычитать	978-5-00057-754-7	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-vychitat/	2017-02-28 16:57:24	2017-03-03 19:16:20	t
336	18018	14	Маленькому изобретателю. Подарочный комплект		Дэвид Маколи	http://www.mann-ivanov-ferber.ru/books/nabor-pochemuchki/	2017-02-28 16:57:24	2017-03-03 19:16:21	t
349	15978	14	С Новым годом!	978-5-00057-801-8	Елена Долгова	http://www.mann-ivanov-ferber.ru/books/s-novym-godom/	2017-02-28 16:57:24	2017-03-03 19:16:29	t
341	15632	11	Еженедельник Номера 1	978-5-00100-461-5	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/ezhenedelnik-nomera-1/	2017-02-28 16:57:24	2017-03-03 19:16:10	t
326	16014	14	KUMON. Учимся умножать	978-5-00057-756-1	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-umnozhat/	2017-02-28 16:57:23	2017-03-03 19:16:30	t
332	16010	14	KUMON. Учимся складывать	978-5-00057-751-6	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-skladyvat/	2017-02-28 16:57:24	2017-03-03 19:16:30	t
1753	18019	14	Настоящему непоседе. Подарочный комплект		Ася Ванякина	http://www.mann-ivanov-ferber.ru/books/dlya-veselyix-igr/	2017-03-02 13:26:47	2017-03-03 19:16:36	t
324	16052	14	Спасательные машины	978-5-00057-641-0	Стивен Бисти	http://www.mann-ivanov-ferber.ru/books/spasatelnye-mashiny/	2017-02-28 16:57:23	2017-03-03 19:16:37	t
354	15913	14	KUMON. Игры с числами от 1 до 70	978-5-00057-719-6	  	http://www.mann-ivanov-ferber.ru/books/kumon-igry-s-chislami-ot-1-do-70/	2017-02-28 16:57:24	2017-03-03 19:22:12	t
337	15531	9	Тайм-менеджмент	978-5-00057-709-7	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/tajm-menedzhment/	2017-02-28 16:57:24	2017-03-03 19:22:13	t
351	15735	14	Почему я?	978-5-00057-723-3	Айджа Майрок	http://www.mann-ivanov-ferber.ru/books/pochemu-ya/	2017-02-28 16:57:24	2017-03-03 19:22:13	t
343	15454	13	Здоровая, счастливая, сексуальная	978-5-00100-426-4	Кэйти Силкокс	http://www.mann-ivanov-ferber.ru/books/zdorovaya-schastlivaya-seksualnaya/	2017-02-28 16:57:24	2017-03-03 19:22:14	t
321	15812	15	Из космоса границ не видно	978-5-00057-831-5	Рон Гаран	http://www.mann-ivanov-ferber.ru/books/iz-kosmosa-granic-ne-vidno/	2017-02-28 16:57:23	2017-03-03 19:22:15	t
346	15951	14	Большая книга поездов	978-5-00057-781-3	Маттиас де Леу	http://www.mann-ivanov-ferber.ru/books/bolshaya-kniga-poezdov/	2017-02-28 16:57:24	2017-03-03 19:22:34	t
350	15792	9	Госслужба на 100%	978-5-00057-729-5	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/gossluzhba-na-100/	2017-02-28 16:57:24	2017-03-03 19:22:34	t
334	18013	14	3D поделки. Подарочный комплект		  	http://www.mann-ivanov-ferber.ru/books/davaj-delat-podelki/	2017-02-28 16:57:24	2017-03-03 19:22:35	t
347	15537	11	Без жалости к себе	978-5-00100-547-6	Эрик Бертран Ларссен	http://www.mann-ivanov-ferber.ru/books/ty-mozhesh-bolshe/	2017-02-28 16:57:24	2017-03-03 19:22:36	t
355	15911	14	KUMON. Волшебные поделки	978-5-00057-717-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-volshebnye-podelki/	2017-02-28 16:57:24	2017-03-03 19:22:36	t
319	15797	12	Вторжение дудлов	978-5-00100-410-3	Зиффлин	http://www.mann-ivanov-ferber.ru/books/vtorzhenie-dudlov/	2017-02-28 16:57:23	2017-03-03 19:22:37	t
323	16097	9	Как привести дела в порядок	978-5-00100-418-9	Дэвид Аллен	http://www.mann-ivanov-ferber.ru/books/mif/gettingthingsdone/	2017-02-28 16:57:23	2017-03-03 19:22:38	t
322	14965	15	Размышления о политике	978-5-00057-680-9	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/razmyshlenija-o-politike/	2017-02-28 16:57:23	2017-03-03 19:22:52	t
329	16050	14	Придумано девочками	978-5-00057-773-8	Кэтрин Тиммеш	http://www.mann-ivanov-ferber.ru/books/pridumano-devochkami/	2017-02-28 16:57:24	2017-03-03 19:16:29	t
342	15706	15	Становление Стива Джобса	978-5-00057-787-5	Брент Шлендер	http://www.mann-ivanov-ferber.ru/books/stanovlenie-stiva-dzhobsa/	2017-02-28 16:57:24	2017-03-03 19:14:30	t
335	18015	14	Будущему художнику. Подарочный комплект		Майкл Берд	http://www.mann-ivanov-ferber.ru/books/budushhemu-xudozhniku/	2017-02-28 16:57:24	2017-03-03 19:14:31	t
362	15455	15	Искусство войны в иллюстрациях	978-5-00057-960-2	Джессика Хэги	http://www.mann-ivanov-ferber.ru/books/iskusstvo-vojny-v-illyustraciyah/	2017-02-28 16:57:24	2017-03-03 19:22:54	t
395	14974	11	Живи с чувством	978-5-00100-052-5	Даниэлла Лапорт	http://www.mann-ivanov-ferber.ru/books/karta-zhelanij/	2017-02-28 16:57:25	2017-03-03 19:22:54	t
382	17699	14	KUMON. Давай клеить! Вкусные задания	978-5-00100-527-8	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-kleit-vkusnyie-zadaniya/	2017-02-28 16:57:24	2017-03-03 19:22:55	t
368	15888	14	KUMON. Первые шаги. Давай клеить! Весёлые истории	978-5-00100-634-3	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-kleit-vesyolye-istorii/	2017-02-28 16:57:24	2017-03-03 19:22:56	t
1705	2467	15	Настоящему мужчине. Гид по стилю	978-5-91657-202-5	Оскар Лениус	http://www.mann-ivanov-ferber.ru/books/special/g-guide/	2017-03-02 13:26:24	2017-03-03 19:23:01	t
359	15282	15	Вопрос на засыпку	978-5-00057-700-4	Джон Фарндон	http://www.mann-ivanov-ferber.ru/books/vopros-na-zasypku/	2017-02-28 16:57:24	2017-03-03 19:23:02	t
367	15889	14	KUMON. Первые шаги. Давай сложим картинки! Весёлые истории	978-5-00100-559-9	  	http://www.mann-ivanov-ferber.ru/books/kumon-slozhim-kartinki-vesyolye-istorii/	2017-02-28 16:57:24	2017-03-03 19:23:02	t
393	15565	14	Мир вокруг	978-5-00057-638-0	Ален Грэ	http://www.mann-ivanov-ferber.ru/books/mir-vokryg/	2017-02-28 16:57:25	2017-03-03 19:23:20	t
365	15821	14	Как собрать самолет	978-5-00057-929-9	Мартин Содомка	http://www.mann-ivanov-ferber.ru/books/kak-sobrat-samolet/	2017-02-28 16:57:24	2017-03-03 19:23:21	t
361	15461	13	Витамания	978-5-00057-678-6	Кэтрин Прайс	http://www.mann-ivanov-ferber.ru/books/vitamaniya/	2017-02-28 16:57:24	2017-03-03 19:23:22	t
370	15886	14	KUMON. Первые шаги. Давай рисовать! Весёлые истории	978-5-00100-600-8	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-risovat-vesyolye-istorii/	2017-02-28 16:57:24	2017-03-03 19:23:22	t
363	15175	15	Кексы в кружке	978-5-00057-601-4	Мима Синклер	http://www.mann-ivanov-ferber.ru/books/keksy-v-kruzhke/	2017-02-28 16:57:24	2017-03-03 19:23:23	t
394	15566	14	Времена года	978-5-00057-639-7	Ален Грэ	http://www.mann-ivanov-ferber.ru/books/vremena-goda/	2017-02-28 16:57:25	2017-03-03 19:23:24	t
366	15507	14	Ближе к природе	978-5-00057-692-2	Клэр Уокер Лесли	http://www.mann-ivanov-ferber.ru/books/blizhe-k-prirode/	2017-02-28 16:57:24	2017-03-03 19:23:25	t
385	15370	9	До последнего квадратного метра	978-5-00057-685-4	Сергей Разуваев	http://www.mann-ivanov-ferber.ru/books/do-poslednego-kvadratnogo-metra/	2017-02-28 16:57:24	2017-03-03 19:23:26	t
357	15920	14	KUMON. Учимся раскрашивать. В зоопарке	978-5-00057-718-9	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-raskrashivat-v-zooparke/	2017-02-28 16:57:24	2017-03-03 19:22:53	t
374	17781	14	3 года вместе с ребёнком	978-5-00100-176-8	Бетси Франко	http://www.mann-ivanov-ferber.ru/books/3-goda-vmeste-s-rebyonkom/	2017-02-28 16:57:24	2017-03-03 19:23:27	t
364	15820	14	Как собрать автомобиль	978-5-00100-595-7	Мартин Содомка	http://www.mann-ivanov-ferber.ru/books/kak-sobrat-avtomobil/	2017-02-28 16:57:24	2017-03-03 19:23:34	t
372	17797	14	Звездная ночь Ван Гога	978-5-00100-632-9	Майкл Берд	http://www.mann-ivanov-ferber.ru/books/zvezdnaya-noch-van-goga-i-drugie-istorii-o-tom-kak-rozhdaetsya-iskusstvo/	2017-02-28 16:57:24	2017-03-03 19:23:35	t
383	15154	15	Мои путешествия. Следующие 10 лет	978-5-00100-132-4	Федор Конюхов	http://www.mann-ivanov-ferber.ru/books/moi-puteshestviya-sleduyushie-10-let/	2017-02-28 16:57:24	2017-03-03 19:23:36	t
377	17739	14	Как построить дом	978-5-00100-633-6	Мартин Содомка	http://www.mann-ivanov-ferber.ru/books/kak-postroit-dom/	2017-02-28 16:57:24	2017-03-03 19:23:36	t
378	17719	14	Профессор Астрокот и его приключения в мире физики	978-5-00100-285-7	Доминик Воллиман	http://www.mann-ivanov-ferber.ru/books/professor-astrokot-i-ego-priklyucheniya-v-mire-fiziki/	2017-02-28 16:57:24	2017-03-03 19:23:37	t
371	17803	14	JavaScript для детей	978-5-00100-597-1	Ник Морган	http://www.mann-ivanov-ferber.ru/books/javascript-dlya-detej/	2017-02-28 16:57:24	2017-03-03 19:23:37	t
373	17788	14	Развивающие игры от Таро Гоми	978-5-00100-290-1	Таро Гоми	http://www.mann-ivanov-ferber.ru/books/razvivayushhie-igryi-ot-taro-gomi/	2017-02-28 16:57:24	2017-03-03 19:23:38	t
376	15383	13	7 минут на фитнес	978-5-00057-676-2	Бретт Клика	http://www.mann-ivanov-ferber.ru/books/7-minut-na-fitnes/	2017-02-28 16:57:24	2017-03-03 19:23:38	t
379	15207	15	Мозг и тело	978-5-00057-662-5	Сайен Бейлок	http://www.mann-ivanov-ferber.ru/books/mozg-i-telo/	2017-02-28 16:57:24	2017-03-03 19:23:39	t
380	15749	14	Как обустроить детскую	978-5-00057-664-9	Татьяна Макурова	http://www.mann-ivanov-ferber.ru/books/kak-obustroit-detskuyu/	2017-02-28 16:57:24	2017-03-03 19:23:40	t
375	15550	9	Как управляют лучшие	978-5-00057-828-5	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/kak-upravlyayut-luchshie/	2017-02-28 16:57:24	2017-03-03 19:23:40	t
387	15287	15	Мозг во сне	978-5-00057-667-0	Андреа Рок	http://www.mann-ivanov-ferber.ru/books/mozg-vo-sne/	2017-02-28 16:57:24	2017-03-03 19:23:41	t
1580	2462	15	Разумная промышленная политика		Константин Анатольевич Бабкин	http://www.mann-ivanov-ferber.ru/books/paperbook/rpp/	2017-02-28 17:02:42	2017-03-03 19:23:41	t
389	15746	14	Веселый зоопарк	978-5-00057-949-7	Полина Нестерова	http://www.mann-ivanov-ferber.ru/books/veselyj-zoopark/	2017-02-28 16:57:25	2017-03-03 19:23:42	t
384	15251	15	Размножение в неволе	978-5-00057-682-3	Эстер Перель	http://www.mann-ivanov-ferber.ru/books/razmnozhenie-v-nevole/	2017-02-28 16:57:24	2017-03-03 19:23:43	t
369	15887	14	KUMON. Первые шаги. Давай вырезать! Весёлые истории	978-5-00100-599-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-vyrezat-vesyolye-istorii/	2017-02-28 16:57:24	2017-03-03 19:22:53	t
435	14673	15	Сёрфинг	978-5-00057-446-1	Никита Замеховский-Мегалокарди	http://www.mann-ivanov-ferber.ru/books/surfing/	2017-02-28 16:57:25	2017-03-03 19:23:55	t
406	15585	14	KUMON. Лабиринты. Животные	978-5-00057-897-1	  	http://www.mann-ivanov-ferber.ru/books/kumon-labirinty-zhivotnye/	2017-02-28 16:57:25	2017-03-03 19:23:56	t
405	15581	14	KUMON. Волшебные линии	978-5-00100-587-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-volshebnye-linii/	2017-02-28 16:57:25	2017-03-03 19:23:56	t
411	13805	11	Как победить страх	978-5-00057-874-2	Ольга Соломатина	http://www.mann-ivanov-ferber.ru/books/kak_pobedit_strah/	2017-02-28 16:57:25	2017-03-03 19:23:57	t
415	17393	9	Аудит продаж	978-5-00100-330-4	Сергей Разуваев	http://www.mann-ivanov-ferber.ru/books/audit-prodazh/	2017-02-28 16:57:25	2017-03-03 19:23:58	t
429	17347	14	Замечательные соседи	978-5-00100-142-3	Элен Лассер	http://www.mann-ivanov-ferber.ru/books/zamechatelnyie-sosedi/	2017-02-28 16:57:25	2017-03-03 19:23:58	t
423	13443	9	Сознательный капитализм	978-5-00057-477-5	Джон Макки	http://www.mann-ivanov-ferber.ru/books/soznatelnij_kapitalizm/	2017-02-28 16:57:25	2017-03-03 19:24:10	t
418	15320	14	KUMON. Готовимся к школе. Учимся вырезать	978-5-00057-766-0	  	http://www.mann-ivanov-ferber.ru/books/gotovimsya-k-shkole-uchimsya-vyrezat/	2017-02-28 16:57:25	2017-03-03 19:24:11	t
422	15180	14	Занимательная зоогеография	978-5-00100-127-0	Валерий Малеев	http://www.mann-ivanov-ferber.ru/books/zanimatelnaya-zoogeografiya/	2017-02-28 16:57:25	2017-03-03 19:24:11	t
408	15580	14	KUMON. Учимся раскрашивать	978-5-00057-761-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-raskrashivat/	2017-02-28 16:57:25	2017-03-03 19:24:12	t
430	17320	15	Кому верить?	978-5-00100-236-9	Брайан Клегг	http://www.mann-ivanov-ferber.ru/books/komu-verit/	2017-02-28 16:57:25	2017-03-03 19:24:13	t
436	15324	14	Дудлпедия. Открытия и изобретения	978-5-00057-580-2	  	http://www.mann-ivanov-ferber.ru/books/dudlpediya-otkrytiya-i-izobreteniya/	2017-02-28 16:57:25	2017-03-03 19:24:13	t
397	15374	15	Новая жизнь старых вещей	978-5-00057-671-7	Вольфганг Хекль	http://www.mann-ivanov-ferber.ru/books/novaya-zhizn-staryh-veshhej/	2017-02-28 16:57:25	2017-03-03 19:24:15	t
417	15321	14	KUMON. Готовимся к школе. Учимся клеить	978-5-00057-767-7	  	http://www.mann-ivanov-ferber.ru/books/gotovimsya-k-shkole-uchimsya-kleit/	2017-02-28 16:57:25	2017-03-03 19:24:23	t
433	14969	11	Лайфхак на каждый день	978-5-00100-471-4	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/lajfhak-na-kazhdyj-den/	2017-02-28 16:57:25	2017-03-03 19:24:24	t
410	17510	12	Рисунок с нуля	978-5-00100-288-8	Клэр Ватсон Гарсия	http://www.mann-ivanov-ferber.ru/books/risunok-s-nulya/	2017-02-28 16:57:25	2017-03-03 19:24:24	t
401	14718	15	Не бери в голову	978-5-00057-623-6	Крис Пэйли	http://www.mann-ivanov-ferber.ru/books/ne-beri-v-golovu/	2017-02-28 16:57:25	2017-03-03 19:23:55	t
425	14885	11	От срочного к важному	978-5-00057-571-0	Стив Макклетчи	http://www.mann-ivanov-ferber.ru/books/ot-srochnogo-k-vazhnomu/	2017-02-28 16:57:25	2017-03-03 19:24:25	t
412	15313	14	KUMON. Развивающие наклейки KUMON. В зоопарке	978-5-00057-759-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvivayushie-naklejki-v-zooparke/	2017-02-28 16:57:25	2017-03-03 19:24:26	t
404	15557	14	LookBook	978-5-00057-640-3	Елена Бевандиц	http://www.mann-ivanov-ferber.ru/books/look-book/	2017-02-28 16:57:25	2017-03-03 19:24:34	t
1708	2541	15	Настоящему мужчине. Гид по стилю (в футляре)	978-5-91657-034-2	Оскар Лениус	http://www.mann-ivanov-ferber.ru/books/special/g-guidef/	2017-03-02 13:26:24	2017-03-03 19:24:35	t
416	15199	14	Монстры триаса	978-5-00057-581-9	Айзек Ленкивиц	http://www.mann-ivanov-ferber.ru/books/monstry-triasa/	2017-02-28 16:57:25	2017-03-03 19:24:35	t
517	14495	11	А у меня получится?	978-5-00057-418-8	Саймон Хартли	http://www.mann-ivanov-ferber.ru/books/u-menya-poluchitsya/	2017-02-28 16:57:26	2017-03-03 19:24:36	t
399	15271	14	Дорожное бинго	978-5-00057-616-8	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/dorozhnoe-bingo/	2017-02-28 16:57:25	2017-03-03 19:24:36	t
1707	2510	10	Без бюджета		Игорь Манн	http://www.mann-ivanov-ferber.ru/books/paperbook/bebu/	2017-03-02 13:26:24	2017-03-03 19:24:40	t
428	17361	14	Приключение	978-5-00100-222-2	Аарон Бекер	http://www.mann-ivanov-ferber.ru/books/priklyuchenie/	2017-02-28 16:57:25	2017-03-03 19:24:41	t
426	14651	15	Чемоданное настроение	978-5-00057-558-1	Дарья Сиротина	http://www.mann-ivanov-ferber.ru/books/chemodannoe-nastroenie/	2017-02-28 16:57:25	2017-03-03 19:24:42	t
420	15318	14	KUMON. Готовимся к школе. Учимся раскрашивать	978-5-00057-765-3	  	http://www.mann-ivanov-ferber.ru/books/gotovimsya-k-shkole-uchimsya-raskrashivat/	2017-02-28 16:57:25	2017-03-03 19:24:55	t
402	13440	11	Скорочтение	978-5-00100-409-7	Питер Камп	http://www.mann-ivanov-ferber.ru/books/molnienosnoe_chtenie/	2017-02-28 16:57:25	2017-03-03 19:24:55	t
434	17313	14	Вокруг света. Над землей и под землей	978-5-00100-027-3	Анн-Софи Боманн	http://www.mann-ivanov-ferber.ru/books/vokrug-sveta/	2017-02-28 16:57:25	2017-03-03 19:24:56	t
413	15366	15	В лучшем виде	978-5-00057-552-9	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/v-luchshem-vide/	2017-02-28 16:57:25	2017-03-03 19:24:57	t
421	15317	14	KUMON. Готовимся к школе. Учим числа и фигуры	978-5-00057-606-9	  	http://www.mann-ivanov-ferber.ru/books/gotovimsya-k-shkole-uchimsya-schitat-ot-1-do-30/	2017-02-28 16:57:25	2017-03-03 19:24:57	t
414	14646	15	Красота в квадрате	978-5-00057-921-3	Алекс Беллос	http://www.mann-ivanov-ferber.ru/books/vselennaya-chisel/	2017-02-28 16:57:25	2017-03-03 19:24:57	t
398	15272	14	Бинго для малышей	978-5-00057-615-1	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/bingo-dlya-malyshej/	2017-02-28 16:57:25	2017-03-03 19:24:58	t
432	17328	14	Необычный дом	978-5-00100-185-0	Полина Нестерова	http://www.mann-ivanov-ferber.ru/books/neobyichnyij-dom/	2017-02-28 16:57:25	2017-03-03 19:25:08	t
403	14758	12	Артбук	978-5-00057-643-4	Кэти Джонсон	http://www.mann-ivanov-ferber.ru/books/sketchbuk-vashej-zhizni/	2017-02-28 16:57:25	2017-03-03 19:25:08	t
407	15584	14	KUMON. Учимся рисовать	978-5-00057-629-8	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-risovat/	2017-02-28 16:57:25	2017-03-03 19:25:09	t
427	15323	14	Дудлпедия. В мире людей и животных	978-5-00057-579-6	  	http://www.mann-ivanov-ferber.ru/books/dudlpediya-v-mire-lyudej-i-zhivotnyh/	2017-02-28 16:57:25	2017-03-03 19:25:09	t
470	14943	14	Я — робот	978-5-00057-515-4	Вивьен Шварц	http://www.mann-ivanov-ferber.ru/books/ya-robot/	2017-02-28 16:57:26	2017-03-03 19:25:27	t
448	14688	11	Работай легко	978-5-00057-530-7	Карсон Тейт	http://www.mann-ivanov-ferber.ru/books/rabotai-prosto/	2017-02-28 16:57:25	2017-03-03 19:25:28	t
458	14654	15	Со всеми и ни с кем	978-5-00057-550-5	Майкл Харрис	http://www.mann-ivanov-ferber.ru/books/konec-odinochestva/	2017-02-28 16:57:26	2017-03-03 19:25:29	t
475	13456	15	Быть или иметь?	978-5-00057-465-2	Тим Кассер	http://www.mann-ivanov-ferber.ru/books/schaste_ne_v_dengah/	2017-02-28 16:57:26	2017-03-03 19:25:29	t
445	14686	15	Будущее: рассекречено	978-5-00057-589-5	Мэтью Берроуз	http://www.mann-ivanov-ferber.ru/books/budushhee-rassekrecheno/	2017-02-28 16:57:25	2017-03-03 19:25:30	t
476	14486	9	Путь торговли	978-5-00057-421-8	Олег Макаров	http://www.mann-ivanov-ferber.ru/books/put-torgovli/	2017-02-28 16:57:26	2017-03-03 19:25:30	t
465	15047	14	Программирование для детей	978-5-00100-073-0	  	http://www.mann-ivanov-ferber.ru/books/programmirovanie-dlya-detej/	2017-02-28 16:57:26	2017-03-03 19:25:31	t
459	15141	9	Генерация прорывных идей в бизнесе	978-5-00057-557-4	Евгений Петров	http://www.mann-ivanov-ferber.ru/books/generaciya-proryvnyh-idej-v-biznese/	2017-02-28 16:57:26	2017-03-03 19:25:10	t
469	10306	11	О чем мечтать	978-5-00100-579-7	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/i_could_do_anything/	2017-02-28 16:57:26	2017-03-03 19:25:31	t
467	12809	9	Хороший рост — плохой рост	978-5-00057-494-2	Роберт  Саттон	http://www.mann-ivanov-ferber.ru/books/masshtabirovanie_biznesa/	2017-02-28 16:57:26	2017-03-03 19:25:32	t
468	12160	11	Рисовый штурм и еще 21 способ мыслить нестандартно	978-5-00100-419-6	Майкл Микалко	http://www.mann-ivanov-ferber.ru/books/igri_uma/	2017-02-28 16:57:26	2017-03-03 19:25:32	t
454	15178	14	Стокгольм	978-5-00100-119-5	Александра Балашова	http://www.mann-ivanov-ferber.ru/books/stokgolm/	2017-02-28 16:57:26	2017-03-03 19:25:33	t
464	14678	15	Игра	978-5-00057-512-3	Стюарт Браун	http://www.mann-ivanov-ferber.ru/books/igra/	2017-02-28 16:57:26	2017-03-03 19:25:34	t
441	14921	11	Творческая связь	978-5-00057-497-3	Натали Роджерс	http://www.mann-ivanov-ferber.ru/books/tvorcheskaja-svjaz/	2017-02-28 16:57:25	2017-03-03 19:25:48	t
451	14582	9	Кризис — это возможность	978-5-00057-463-8	Скотт Стейнберг	http://www.mann-ivanov-ferber.ru/books/krizis-eto-vozmozhnost/	2017-02-28 16:57:25	2017-03-03 19:25:59	t
453	14883	11	Договорись с собой… и другими достойными оппонентами	978-5-00057-574-1	Уильям Юри	http://www.mann-ivanov-ferber.ru/books/kak-dogovoritsja-s-soboj-i-drugimi-dostojnymi-opponentami/	2017-02-28 16:57:26	2017-03-03 19:25:59	t
463	14923	15	Сократ	978-5-00057-549-9	Борис Стадничук	http://www.mann-ivanov-ferber.ru/books/uchitel-filosof-voin/	2017-02-28 16:57:26	2017-03-03 19:26:01	t
455	14748	14	Затерянные во льдах	978-5-00100-050-1	Уильям Грилл	http://www.mann-ivanov-ferber.ru/books/zateryannye-vo-ldax/	2017-02-28 16:57:26	2017-03-03 19:26:01	t
447	15179	14	Увлекательная астрономия	978-5-00100-432-5	Елена Качур	http://www.mann-ivanov-ferber.ru/books/uvlekatelnaya-astronomiya/	2017-02-28 16:57:25	2017-03-03 19:26:02	t
460	14539	9	В здоровом бизнесе — здоровый дух	978-5-00057-539-0	Рич Карлгаард	http://www.mann-ivanov-ferber.ru/books/v-zdorovom-biznese-zdorovyj-duh/	2017-02-28 16:57:26	2017-03-03 19:26:13	t
461	15135	14	Малышу виднее	978-5-00057-514-7	Дебора Соломон	http://www.mann-ivanov-ferber.ru/books/malishu-vidnee/	2017-02-28 16:57:26	2017-03-03 19:26:13	t
437	15267	14	Литературные дудлы	978-5-00057-489-8	Дженнифер Адамс	http://www.mann-ivanov-ferber.ru/books/literaturnye-dudly/	2017-02-28 16:57:25	2017-03-03 19:26:14	t
457	14587	11	Делай меньше	978-5-00057-544-4	Фергус О'Коннел	http://www.mann-ivanov-ferber.ru/books/delaj-menshe/	2017-02-28 16:57:26	2017-03-03 19:26:14	t
456	14681	11	Практика малых дел	978-5-00057-495-9	Марк Санборн	http://www.mann-ivanov-ferber.ru/books/praktika-malih-del/	2017-02-28 16:57:26	2017-03-03 19:26:15	t
438	15260	14	Математика — это красиво!	978-5-00057-957-2	Анна Вельтман	http://www.mann-ivanov-ferber.ru/books/matematika-eto-krasivo/	2017-02-28 16:57:25	2017-03-03 19:26:16	t
474	14578	11	Лучше совершенства	978-5-00057-445-4	Элизабет Ломбардо	http://www.mann-ivanov-ferber.ru/books/luchshe-sovershenstva/	2017-02-28 16:57:26	2017-03-03 19:26:16	t
452	14759	11	Что ты выберешь?	978-5-00057-806-3	Тал Бен-Шахар	http://www.mann-ivanov-ferber.ru/books/chto-ty-vyberesh/	2017-02-28 16:57:25	2017-03-03 19:26:17	t
477	12605	11	Майндсайт	978-5-00057-424-9	Дэниел Сигел	http://www.mann-ivanov-ferber.ru/books/vzglyad_v_sebya/	2017-02-28 16:57:26	2017-03-03 19:26:17	t
444	14805	12	Рисование. Полное руководство	978-5-00057-918-3	Джованни Чиварди	http://www.mann-ivanov-ferber.ru/books/enciklopediya-hudozhnika/	2017-02-28 16:57:25	2017-03-03 19:26:18	t
472	14549	9	От застоя к росту	978-5-00057-420-1	Иехезкель Маданес	http://www.mann-ivanov-ferber.ru/books/ot-zastoya-k-rostu/	2017-02-28 16:57:26	2017-03-03 19:26:19	t
1498	2671	11	В поисках счастья	978-5-91657-157-8	Мартин Селигман	http://www.mann-ivanov-ferber.ru/books/paperbook/authentichappiness/	2017-02-28 17:02:40	2017-03-03 19:26:19	t
446	14545	9	Слушать нельзя указывать	978-5-00057-575-8	Эдгар Г. Шейн	http://www.mann-ivanov-ferber.ru/books/slushat-nelzya-ukazyvat/	2017-02-28 16:57:25	2017-03-03 19:26:20	t
471	12865	15	Ближе к воде	978-5-00057-498-0	Уоллес Николс	http://www.mann-ivanov-ferber.ru/books/blizhe_k_vode/	2017-02-28 16:57:26	2017-03-03 19:26:20	t
442	14580	9	Гибкие продажи	978-5-00057-468-3	Джил Конрат	http://www.mann-ivanov-ferber.ru/books/gibkie-prodazhi/	2017-02-28 16:57:25	2017-03-03 19:26:20	t
443	14792	11	Нарушай правила!	978-5-00057-535-2	Марти Ньюмейер	http://www.mann-ivanov-ferber.ru/books/narushaj-pravila/	2017-02-28 16:57:25	2017-03-03 19:26:21	t
450	15055	14	Чей бок?		Татьяна Руссита	http://www.mann-ivanov-ferber.ru/books/chej-bok/	2017-02-28 16:57:25	2017-03-03 19:26:21	t
473	12122	11	Сердце перемен	978-5-00057-409-6	Чип Хиз  и Дэн Хиз	http://www.mann-ivanov-ferber.ru/books/razum_protiv_emocij/	2017-02-28 16:57:26	2017-03-03 19:26:22	t
479	14929	14	Творческое воспитание	978-5-00057-778-3	Джин Ван’т Хал	http://www.mann-ivanov-ferber.ru/books/tvorcheskoe-vospitanie/	2017-02-28 16:57:26	2017-03-03 19:26:23	t
510	18411	12	Творческие права. Подарочный комплект		Дэнни Грэгори	http://www.mann-ivanov-ferber.ru/books/tvorcheskie-prava-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:26:24	t
513	18408	11	Начни. Подарочный комплект		Джон Эйкафф	http://www.mann-ivanov-ferber.ru/books/nachni-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:26:24	t
495	16826	11	Почему никто не рассказал мне это в 20?	978-5-00100-678-7	Тина  Силиг	http://www.mann-ivanov-ferber.ru/books/pochemu-nikto-ne-rasskazal-mne-eto-v-20/	2017-02-28 16:57:26	2017-03-03 19:26:25	t
481	14913	14	Что снится семечку?	978-5-00057-430-0	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/chto-snitsja-semechku/	2017-02-28 16:57:26	2017-03-03 19:26:25	t
484	14743	14	Сам себе ученый!	978-5-00100-598-8	Хелейн Беккер	http://www.mann-ivanov-ferber.ru/books/sam-sebe-uchenij/	2017-02-28 16:57:26	2017-03-03 19:26:26	t
486	14658	11	Как разговаривать с кем угодно	978-5-00100-099-0	Марк Роудз	http://www.mann-ivanov-ferber.ru/books/razgovor-eto-vozmozhnost/	2017-02-28 16:57:26	2017-03-03 19:26:27	t
483	14908	14	Яйцо любит тишину	978-5-00057-429-4	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/jajco-ljubit-tishinu/	2017-02-28 16:57:26	2017-03-03 19:26:28	t
480	14745	11	Развитие силы воли	978-5-00057-449-2	Уолтер Мишел	http://www.mann-ivanov-ferber.ru/books/razvitie-sily-voli/	2017-02-28 16:57:26	2017-03-03 19:26:29	t
494	14737	9	Размещение акций	978-5-00057-447-8	Антон Мальков	http://www.mann-ivanov-ferber.ru/books/razmeshhenie-akcij/	2017-02-28 16:57:26	2017-03-03 19:26:29	t
487	12882	13	Источник энергии	978-5-00057-462-1	Дэниел Брауни	http://www.mann-ivanov-ferber.ru/books/upravlenie_energiej/	2017-02-28 16:57:26	2017-03-03 19:26:30	t
497	14639	14	Отто в городе	978-5-00057-279-5	Том Шамп	http://www.mann-ivanov-ferber.ru/books/otto-v-gorode/	2017-02-28 16:57:26	2017-03-03 19:26:41	t
505	14232	12	Включите сердце и мозги	978-5-00057-456-0	Дария Бикбаева	http://www.mann-ivanov-ferber.ru/books/ta-dam/	2017-02-28 16:57:26	2017-03-03 19:26:42	t
501	12611	9	Методика RAIN	978-5-00057-410-2	Майк Шульц	http://www.mann-ivanov-ferber.ru/books/prodayushie_dialogi/	2017-02-28 16:57:26	2017-03-03 19:26:43	t
498	12583	15	Шесть великих идей	978-5-00057-309-9	Мортимер Адлер	http://www.mann-ivanov-ferber.ru/books/shest_velikih_idej/	2017-02-28 16:57:26	2017-03-03 19:26:44	t
1709	2781	15	Суперфрикономика	978-5-91657-097-7	Стивен Левитт	http://www.mann-ivanov-ferber.ru/books/paperbook/superfreakonomics2/	2017-03-02 13:26:24	2017-03-03 19:26:44	t
516	14508	14	Кости и скелеты	978-5-00057-353-2	Стив Дженкинс	http://www.mann-ivanov-ferber.ru/books/kosti-i-skelety/	2017-02-28 16:57:26	2017-03-03 19:26:45	t
490	12252	9	Презентация в стиле дзен	978-5-00057-426-3	Гарр Рейнольдс	http://www.mann-ivanov-ferber.ru/books/prezentaciya_v_stile_dzen/	2017-02-28 16:57:26	2017-03-03 19:26:46	t
492	12825	15	Мудрость Ганди	978-5-00057-450-8	Махатма Ганди	http://www.mann-ivanov-ferber.ru/books/pravila_gandi/	2017-02-28 16:57:26	2017-03-03 19:26:46	t
918	18426	14	Турнир изобретателей роботов	978-5-00100-377-9	Максим Демин	http://www.mann-ivanov-ferber.ru/books/turnir-izobretatelej-robotov/	2017-02-28 17:02:19	2017-03-03 19:26:47	t
493	13108	11	Финансовый ежедневник: как привести деньги в порядок	978-5-00100-340-3	Алексей Герасимов	http://www.mann-ivanov-ferber.ru/books/finansovyj_ezhednevnik/	2017-02-28 16:57:26	2017-03-03 19:26:47	t
511	18410	11	Привычка достигать. Подарочный комплект	978-5-00100-079-2	Бернард Рос	http://www.mann-ivanov-ferber.ru/books/privyichka-dostigat-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:26:48	t
482	14909	14	У камня своя история	978-5-00057-428-7	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/u-kamnja-svoja-istorija/	2017-02-28 16:57:26	2017-03-03 19:26:48	t
504	14641	14	Гигантский транспорт	978-5-00057-642-7	Стивен Бисти	http://www.mann-ivanov-ferber.ru/books/gigantskij-transport/	2017-02-28 16:57:26	2017-03-03 19:26:49	t
500	12263	11	Говори и показывай	978-5-00057-425-6	Дэн Роэм	http://www.mann-ivanov-ferber.ru/books/govori_i_pokazyvaj/	2017-02-28 16:57:26	2017-03-03 19:27:04	t
491	13098	9	Большая игра в бизнес	978-5-00057-422-5	Джек Стэк	http://www.mann-ivanov-ferber.ru/books/biznes_eto_igra/	2017-02-28 16:57:26	2017-03-03 19:27:04	t
509	18412	12	Портреты цветов. Подарочный комплект	978-5-00100-487-5	Билли Шоуэлл	http://www.mann-ivanov-ferber.ru/books/portretyi-czvetov-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:27:05	t
1268	2759	10	Маркетинговая машина	978-5-91657-002-1	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/mif/marketing100cont/	2017-02-28 17:02:37	2017-03-03 19:27:11	t
485	12023	9	Великие, а не большие	978-5-00057-412-6	Бо Бёрлингем	http://www.mann-ivanov-ferber.ru/books/nebolshie_giganti/	2017-02-28 16:57:26	2017-03-03 19:27:12	t
499	13091	15	Везде как дома	978-5-00057-434-8	Линн Мартин	http://www.mann-ivanov-ferber.ru/books/moj_adres_ne_dom_i_ne_ulica/	2017-02-28 16:57:26	2017-03-03 19:27:12	t
1710	2792	15	Google. Прошлое, настоящее, будущее	978-5-91657-066-3	Джанет Лау	http://www.mann-ivanov-ferber.ru/books/paperbook/googlespeaks2/	2017-03-02 13:26:24	2017-03-03 19:26:23	t
515	12579	11	Что тебя останавливает?	978-5-00057-417-1	Сью Хэдфилд	http://www.mann-ivanov-ferber.ru/books/ne_otkladyvaj_zhizn_na_potom/	2017-02-28 16:57:26	2017-03-03 19:27:13	t
502	14633	14	Великие здания	978-5-00057-298-6	Патрик Диллон	http://www.mann-ivanov-ferber.ru/books/velikie-zdaniya/	2017-02-28 16:57:26	2017-03-03 19:27:14	t
488	11414	9	Практика менеджмента	978-5-00057-373-0	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/praktika_menedzhmenta/	2017-02-28 16:57:26	2017-03-03 19:27:14	t
508	18414	12	Фанату блокнотов. Подарочный комплект	978-5-00100-373-1	  	http://www.mann-ivanov-ferber.ru/books/fanatu-bloknotov-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:27:14	t
514	14644	14	Город над землей и под землей	978-5-00057-666-3	Анн-Софи Боманн	http://www.mann-ivanov-ferber.ru/books/gorod-nad-zemlej-i-pod-zemlej/	2017-02-28 16:57:26	2017-03-03 19:27:15	t
545	14468	14	Мир вокруг	978-5-00057-349-5	Эд Эмберли	http://www.mann-ivanov-ferber.ru/books/mir-vokrug/	2017-02-28 16:57:27	2017-03-03 19:27:16	t
532	14478	14	KUMON. Учимся писать прописные буквы английского алфавита	978-5-00100-008-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-pisat-propisnie-angliyskie/	2017-02-28 16:57:27	2017-03-03 19:27:17	t
518	10404	15	Лидеры, которые изменили Россию	978-5-00100-210-9	Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/lidery_kotorye_izmenili_rossiyu/	2017-02-28 16:57:27	2017-03-03 19:27:18	t
523	14512	14	Учим цвета и счет	978-5-00057-217-7	  	http://www.mann-ivanov-ferber.ru/books/uchim-cveta-i-schet/	2017-02-28 16:57:27	2017-03-03 19:27:19	t
536	14507	14	KUMON. Учимся клеить. Пазлы-аппликации	978-5-00100-583-4	  	http://www.mann-ivanov-ferber.ru/books/pazly-applikacii/	2017-02-28 16:57:27	2017-03-03 19:27:30	t
535	14509	14	Сравни!	978-5-00057-354-9	Стив Дженкинс	http://www.mann-ivanov-ferber.ru/books/sravni/	2017-02-28 16:57:27	2017-03-03 19:27:30	t
540	11744	11	Инструменты развития	978-5-00057-369-3	Алан Фокс	http://www.mann-ivanov-ferber.ru/books/chelovecheskie_otnoshenija/	2017-02-28 16:57:27	2017-03-03 19:27:31	t
547	14298	15	Книга Нового года и Рождества	978-5-00057-757-8	Галина Егоренкова	http://www.mann-ivanov-ferber.ru/books/kniga_novogo_goda_i_rozhdestva/	2017-02-28 16:57:27	2017-03-03 19:27:31	t
533	14479	14	KUMON. Учимся писать строчные буквы английского алфавита	978-5-00100-009-9	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-pisat-strochnie-angliyskie/	2017-02-28 16:57:27	2017-03-03 19:27:32	t
526	14470	14	Бесконечная книга: Тами и Сами	978-5-00057-383-9	Натали Ратковски	http://www.mann-ivanov-ferber.ru/books/beskonechnaya-kniga-tami-i-sami/	2017-02-28 16:57:27	2017-03-03 19:27:32	t
527	14471	14	Книга моих стихов	978-5-00057-379-2	Маша Лукашкина	http://www.mann-ivanov-ferber.ru/books/kniga-moix-stixov/	2017-02-28 16:57:27	2017-03-03 19:27:33	t
552	11923	15	Почему Америка и Россия не слышат друг друга?	978-5-00057-312-9	Анджела Стент	http://www.mann-ivanov-ferber.ru/books/russia_vs_usa/	2017-02-28 16:57:27	2017-03-03 19:27:34	t
1494	3014	14	Не набрасывайтесь на мармелад!	978-5-91657-295-7	Хоаким де Посада и Эллен Зингер	http://www.mann-ivanov-ferber.ru/books/paperbook/sweetsuccess/	2017-02-28 17:02:40	2017-03-03 19:27:34	t
525	14510	14	Учим предметы и формы	978-5-00057-218-4	  	http://www.mann-ivanov-ferber.ru/books/uchim-predmety-i-formy/	2017-02-28 16:57:27	2017-03-03 19:27:35	t
541	13949	11	Скорочтение на практике	978-5-00100-507-0	Павел Палагин	http://www.mann-ivanov-ferber.ru/books/skorochtenie_na_praktike/	2017-02-28 16:57:27	2017-03-03 19:27:35	t
542	13735	11	Размышления о личном развитии	978-5-00057-922-0	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/razmyshleniya_o_lichnom_razvitii/	2017-02-28 16:57:27	2017-03-03 19:27:42	t
524	14511	14	Учим животных и противоположности	978-5-00057-216-0	  	http://www.mann-ivanov-ferber.ru/books/uchim-zhivotnyx-i-protivopolozhnosti/	2017-02-28 16:57:27	2017-03-03 19:27:43	t
539	14481	15	Поэзия обычных дней	978-5-00057-375-4	Леонид Агутин	http://www.mann-ivanov-ferber.ru/books/poeziya-obychnyx-dnej/	2017-02-28 16:57:27	2017-03-03 19:27:44	t
554	12184	11	Развитие интуиции	978-5-00057-297-9	Гай Клакстон	http://www.mann-ivanov-ferber.ru/books/razvitie_intuicii/	2017-02-28 16:57:27	2017-03-03 19:27:44	t
543	13101	15	На пути из третьего мира в первый	978-5-00057-968-8	Ли Куан Ю	http://www.mann-ivanov-ferber.ru/books/na_puti_iz_tretego_mira_v_pervyj/	2017-02-28 16:57:27	2017-03-03 19:27:45	t
531	14506	14	KUMON. Учимся определять время. Час и полчаса	978-5-00100-385-4	  	http://www.mann-ivanov-ferber.ru/books/uchimsya-opredelyat-vremya-chas/	2017-02-28 16:57:27	2017-03-03 19:27:46	t
530	14505	14	KUMON. Учимся определять время. Минуты	978-5-00100-316-8	  	http://www.mann-ivanov-ferber.ru/books/uchimsya-opredelyat-vremya-minuti/	2017-02-28 16:57:27	2017-03-03 19:27:46	t
537	12867	12	1 страница в день	978-5-00100-361-8	Адам Куртц	http://www.mann-ivanov-ferber.ru/books/stranica_v_den/	2017-02-28 16:57:27	2017-03-03 19:27:47	t
529	14483	12	642 идеи, о чем написать	978-5-00057-862-9	  	http://www.mann-ivanov-ferber.ru/books/642-idei-o-chem-napisat/	2017-02-28 16:57:27	2017-03-03 19:27:48	t
1368	3349	11	Как читать книги (в кожаном переплете)	 978-5-91657-204-9	Мортимер Адлер	http://www.mann-ivanov-ferber.ru/books/special/howkojga/	2017-02-28 17:02:39	2017-03-03 19:27:48	t
639	11248	15	Еда без правил	978-5-00057-199-6	Тамар Адлер	http://www.mann-ivanov-ferber.ru/books/eda_bes_pravil/	2017-02-28 16:57:28	2017-03-03 19:30:21	t
553	12193	14	Эмоциональный интеллект ребенка	978-5-00100-317-5	Джон Готтман	http://www.mann-ivanov-ferber.ru/books/emocionalnyj_intellekt_dlya_detej/	2017-02-28 16:57:27	2017-03-03 19:27:15	t
528	14484	12	642 идеи, что нарисовать	978-5-00057-363-1	  	http://www.mann-ivanov-ferber.ru/books/642-idei-chto-narisovat/	2017-02-28 16:57:27	2017-03-03 19:27:49	t
521	14608	14	Рисуем круглый год	978-5-00057-299-3	Таро Гоми	http://www.mann-ivanov-ferber.ru/books/risuem-kruglyj-god/	2017-02-28 16:57:27	2017-03-03 19:27:50	t
538	14502	15	Наедине с собой	978-5-00057-285-6	Сенека	http://www.mann-ivanov-ferber.ru/books/naedine-s-soboj/	2017-02-28 16:57:27	2017-03-03 19:27:51	t
522	14482	14	Нииланг: история мальчика, который дорого продавал свои фантазии	978-5-00057-272-6	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/niilang/	2017-02-28 16:57:27	2017-03-03 19:28:04	t
546	12873	11	Эссенциализм	978-5-00100-505-6	Грег МакКеон	http://www.mann-ivanov-ferber.ru/books/hozyain_svoej_zhizni/	2017-02-28 16:57:27	2017-03-03 19:28:05	t
544	14469	14	Смешные лица	978-5-00057-350-1	Эд Эмберли	http://www.mann-ivanov-ferber.ru/books/smeshnye-lica/	2017-02-28 16:57:27	2017-03-03 19:28:09	t
569	11190	11	Важно не то, кто ты есть, а то, кем ты хочешь стать	978-5-00057-175-0	Пол Арден	http://www.mann-ivanov-ferber.ru/books/vsegda_stremis_k_bolshemu/	2017-02-28 16:57:27	2017-03-03 19:28:17	t
589	18098	11	Секретный подарочный комплект		  	http://www.mann-ivanov-ferber.ru/books/sekretnyij-podarochnyj-komplekt/	2017-02-28 16:57:28	2017-03-03 19:28:17	t
565	14463	14	Как объяснить ребенку математику	978-5-00100-556-8	Кэрол Вордерман	http://www.mann-ivanov-ferber.ru/books/kak-obyasnit-rebenku-matematiku/	2017-02-28 16:57:27	2017-03-03 19:28:18	t
570	12854	15	Chineasy	978-5-00057-215-3	ШаоЛань Сюэ	http://www.mann-ivanov-ferber.ru/books/chineasy/	2017-02-28 16:57:27	2017-03-03 19:28:18	t
579	14321	14	Замечательное время: зима	978-5-00057-325-9	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/zamechatelnoe_vremya_zima/	2017-02-28 16:57:28	2017-03-03 19:28:19	t
574	14411	12	Мои 5 лет	978-5-00057-790-5	  	http://www.mann-ivanov-ferber.ru/books/moi-5-let/	2017-02-28 16:57:27	2017-03-03 19:28:20	t
561	18099	11	Золотые правила. Подарочный комплект	978-5-00100-457-8	Боб Боуман	http://www.mann-ivanov-ferber.ru/books/zolotyie-pravila-podarochnyj-komplekt/	2017-02-28 16:57:27	2017-03-03 19:28:20	t
588	11212	9	Легко не будет	978-5-00057-255-9	Бен Хоровиц	http://www.mann-ivanov-ferber.ru/books/legrko_ne_budet/	2017-02-28 16:57:28	2017-03-03 19:28:21	t
580	12014	15	Магия чисел	978-5-00100-070-9	Артур Бенджамин	http://www.mann-ivanov-ferber.ru/books/matemagiya/	2017-02-28 16:57:28	2017-03-03 19:28:22	t
558	11544	15	Художники, писатели, мыслители, мечтатели	978-5-00057-257-3	Джеймс Гулливер Хэнкок	http://www.mann-ivanov-ferber.ru/books/paperbook/50-velikih-hudozhnikov/	2017-02-28 16:57:27	2017-03-03 19:28:34	t
557	11637	9	Больше добра — больше прибыли	978-5-00057-278-8	Идо Леффлер	http://www.mann-ivanov-ferber.ru/books/bolshe_dobra_bolshe_pribyli/	2017-02-28 16:57:27	2017-03-03 19:28:34	t
593	13866	14	Картины. Моя большая выставка	978-5-00100-267-3	  	http://www.mann-ivanov-ferber.ru/books/kartiny_moya_bolshaya_vystavka/	2017-02-28 16:57:28	2017-03-03 19:28:35	t
1380	3664	15	Добавьте в корзину. Проектирование прибыльных веб-сайтов. Повышение эффективности интернет-рекламы.		Брайан и Джеффри Айзенберг	http://www.mann-ivanov-ferber.ru/books/special/komplectmarketing/	2017-02-28 17:02:39	2017-03-03 19:28:35	t
590	13144	14	Почему?	978-5-00057-903-9	Кэтрин Рипли	http://www.mann-ivanov-ferber.ru/books/pochemu/	2017-02-28 16:57:28	2017-03-03 19:28:36	t
563	13769	9	Автор бизнеса	978-5-00057-343-3	Вячеслав Семенчук	http://www.mann-ivanov-ferber.ru/books/avtor_biznesa/	2017-02-28 16:57:27	2017-03-03 19:28:37	t
592	13650	14	Планета Земля	978-5-00100-053-2	Елена Качур	http://www.mann-ivanov-ferber.ru/books/planeta_zemlya/	2017-02-28 16:57:28	2017-03-03 19:28:37	t
587	13192	15	Кухня нараспашку	978-5-00057-247-4	Ольга Бакланова	http://www.mann-ivanov-ferber.ru/books/kuhnya_naraspashku/	2017-02-28 16:57:28	2017-03-03 19:28:38	t
583	14289	14	Супербумага	978-5-00057-194-1	Лидия Крук	http://www.mann-ivanov-ferber.ru/books/superbumaga/	2017-02-28 16:57:28	2017-03-03 19:28:38	t
581	10675	9	Думай как дизайнер	978-5-00057-314-3	Жанна Лидтка	http://www.mann-ivanov-ferber.ru/books/dizain_myshlenie_dlya_menegerov/	2017-02-28 16:57:28	2017-03-03 19:28:39	t
596	10421	9	Запускаем инновации	978-5-00057-252-8	Гийс Ван Вульфен	http://www.mann-ivanov-ferber.ru/books/innovacii/	2017-02-28 16:57:28	2017-03-03 19:28:49	t
584	14288	14	Большая книга игр для тебя и меня	978-5-00057-195-8	Лидия Крук	http://www.mann-ivanov-ferber.ru/books/bolshaya_kniga_igr/	2017-02-28 16:57:28	2017-03-03 19:28:54	t
567	11738	15	Господь – мой брокер	978-5-00057-261-0	Кристофер Бакли	http://www.mann-ivanov-ferber.ru/books/gospod_moj_broker/	2017-02-28 16:57:27	2017-03-03 19:28:55	t
571	12879	11	Музыка мозга	978-5-00057-268-9	Аннет Прен	http://www.mann-ivanov-ferber.ru/books/muzika_mozga/	2017-02-28 16:57:27	2017-03-03 19:28:16	t
562	16212	12	365 дней очень творческого человека (красный)	978-5-91657-432-6	Яна Франк	http://www.mann-ivanov-ferber.ru/books/365-red/	2017-02-28 16:57:27	2017-03-03 19:28:55	t
573	13674	15	За все хорошее!	978-5-00057-266-5	Алексей Меринов (художник)	http://www.mann-ivanov-ferber.ru/books/za_vse_horoshee/	2017-02-28 16:57:27	2017-03-03 19:29:08	t
568	11697	9	Вовлекай и властвуй	978-5-00057-344-0	Кевин Вербах	http://www.mann-ivanov-ferber.ru/books/igrajte-i-pobezhdajte/	2017-02-28 16:57:27	2017-03-03 19:29:08	t
576	11578	15	Пироговедение для начинающих	978-5-00057-288-7	Ирина Чадеева	http://www.mann-ivanov-ferber.ru/books/pirogovedenie_dlya_nachinayushih/	2017-02-28 16:57:27	2017-03-03 19:29:09	t
564	14461	14	Прописи для левшей	978-5-00057-293-1	Ника Дубровская	http://www.mann-ivanov-ferber.ru/books/propisi-dlya-levshej/	2017-02-28 16:57:27	2017-03-03 19:29:09	t
575	13472	15	Швейцарская кухня	978-5-00057-296-2	Любовь и Максим Куштуевы	http://www.mann-ivanov-ferber.ru/books/shvejcarskaya_kuhnya/	2017-02-28 16:57:27	2017-03-03 19:29:10	t
585	10662	10	Стратегия блокбастера	978-5-00057-249-8	Анита Элберс	http://www.mann-ivanov-ferber.ru/books/blockbastery/	2017-02-28 16:57:28	2017-03-03 19:29:11	t
566	12054	15	Мне некогда!	978-5-00057-324-2	Бриджид Шульте	http://www.mann-ivanov-ferber.ru/books/mne_nekogda/	2017-02-28 16:57:27	2017-03-03 19:29:11	t
582	10173	15	Путевые заметки	978-5-00057-274-0	Илья Варламов	http://www.mann-ivanov-ferber.ru/books/fotoputeshestvija_s_ilej_varlamovym/	2017-02-28 16:57:28	2017-03-03 19:29:12	t
578	11690	10	От кликов к продажам	978-5-00057-205-4	Бенджи Рэбхэн	http://www.mann-ivanov-ferber.ru/books/ot_klikov_k_prodazham/	2017-02-28 16:57:28	2017-03-03 19:29:12	t
560	12158	11	Великие мысли	978-5-00057-263-4	Стивен Кови	http://www.mann-ivanov-ferber.ru/books/velikie_misli/	2017-02-28 16:57:27	2017-03-03 19:29:13	t
594	18097	12	Поиск источника. Подарочный комплект	978-5-00100-019-8	Джулия Кэмерон	http://www.mann-ivanov-ferber.ru/books/poisk-istochnika-podarochnyj-komplekt/	2017-02-28 16:57:28	2017-03-03 19:29:14	t
601	10262	9	Пирамида эффективности	978-5-00057-223-8	Тамара Майлс	http://www.mann-ivanov-ferber.ru/books/maksimalnaya_produktivnost/	2017-02-28 16:57:28	2017-03-03 19:29:33	t
612	13398	14	KUMON. Математика. Деление. Уровень 3	978-5-00100-044-0	  	http://www.mann-ivanov-ferber.ru/books/delenie_uroven_3/	2017-02-28 16:57:28	2017-03-03 19:29:33	t
618	13387	14	KUMON. Математика. Вычитание. Уровень 1	978-5-00100-043-3	  	http://www.mann-ivanov-ferber.ru/books/vychitanie_uroven_1/	2017-02-28 16:57:28	2017-03-03 19:29:34	t
624	12120	14	Мыша в городе	978-5-00057-109-5	Люси Казенс	http://www.mann-ivanov-ferber.ru/books/misha_v_gorode/	2017-02-28 16:57:28	2017-03-03 19:29:44	t
622	12118	14	Мыша на море	978-5-00057-111-8	Люси Казенс	http://www.mann-ivanov-ferber.ru/books/misha_na_more/	2017-02-28 16:57:28	2017-03-03 19:29:45	t
640	10620	11	От слов к делу!	978-5-00057-172-9	Ричард Ньютон	http://www.mann-ivanov-ferber.ru/books/mechtay_delay_zhivi/	2017-02-28 16:57:28	2017-03-03 19:29:46	t
634	11626	14	KUMON. Давай клеить!	978-5-00100-001-3	  	http://www.mann-ivanov-ferber.ru/books/davaj_kleit/	2017-02-28 16:57:28	2017-03-03 19:29:46	t
635	11625	14	KUMON. Давай вырезать!	978-5-00100-430-1	  	http://www.mann-ivanov-ferber.ru/books/davaj_virezat/	2017-02-28 16:57:28	2017-03-03 19:29:47	t
629	7385	11	Практика визуального мышления	978-5-91657-828-7	Дэн Роэм	http://www.mann-ivanov-ferber.ru/books/paperbook/unfolding_the_napkin/	2017-02-28 16:57:28	2017-03-03 19:29:47	t
617	11693	13	Еда и мозг	978-5-00100-215-4	Дэвид Перлмуттер	http://www.mann-ivanov-ferber.ru/books/eda_i_mozg/	2017-02-28 16:57:28	2017-03-03 19:29:48	t
632	11628	14	KUMON. Давай сложим картинки!	978-5-00100-003-7	  	http://www.mann-ivanov-ferber.ru/books/davaj_slozhim_kartinki/	2017-02-28 16:57:28	2017-03-03 19:29:49	t
613	11445	15	Другое дело	978-5-91657-984-0	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/drugoe_delo/	2017-02-28 16:57:28	2017-03-03 19:29:49	t
611	11303	9	Работа мечты	978-5-00057-222-1	Ричард Шеридан	http://www.mann-ivanov-ferber.ru/books/rabota_mechti/	2017-02-28 16:57:28	2017-03-03 19:29:50	t
608	10560	11	Почему мы ошибаемся	978-5-00057-211-5	Джозеф Халлинан	http://www.mann-ivanov-ferber.ru/books/pochemu_my_oshibaemsya/	2017-02-28 16:57:28	2017-03-03 19:29:51	t
614	13390	14	KUMON. Математика. Умножение. Уровень 3	978-5-00100-048-8	  	http://www.mann-ivanov-ferber.ru/books/umnozhenie_uroven_3/	2017-02-28 16:57:28	2017-03-03 19:29:51	t
636	11127	9	Не откладывай на завтра	978-5-00057-204-7	Тимоти Пичил	http://www.mann-ivanov-ferber.ru/books/ne_otkladyvaj_na_zavtra/	2017-02-28 16:57:28	2017-03-03 19:29:52	t
604	13107	11	Короче	978-5-00057-243-6	Джо Маккормак	http://www.mann-ivanov-ferber.ru/books/koroche/	2017-02-28 16:57:28	2017-03-03 19:29:52	t
615	13389	14	KUMON. Математика. Вычитание. Уровень 2	978-5-00057-239-9	  	http://www.mann-ivanov-ferber.ru/books/vychitanie_uroven_2/	2017-02-28 16:57:28	2017-03-03 19:29:53	t
628	10415	11	Кирпичи 2.0	978-5-00057-226-9	Данияр Сугралинов	http://www.mann-ivanov-ferber.ru/books/kirpichi_2/	2017-02-28 16:57:28	2017-03-03 19:29:53	t
638	10425	10	Стратегия фокусирования	978-5-00057-190-3	Эл Райс	http://www.mann-ivanov-ferber.ru/books/strategiya_fokusirovaniya/	2017-02-28 16:57:28	2017-03-03 19:29:15	t
616	13388	14	KUMON. Математика. Сложение. Уровень 2	978-5-00100-047-1	  	http://www.mann-ivanov-ferber.ru/books/slozhenie_uroven_2/	2017-02-28 16:57:28	2017-03-03 19:29:54	t
623	12119	14	Мыша в больнице	978-5-00057-112-5	Люси Казенс	http://www.mann-ivanov-ferber.ru/books/misha_v_bolnice/	2017-02-28 16:57:28	2017-03-03 19:29:55	t
631	11301	11	Микрорешения	978-5-00057-202-3	Кэролайн Арнольд	http://www.mann-ivanov-ferber.ru/books/bolshoe_v_malom/	2017-02-28 16:57:28	2017-03-03 19:29:55	t
600	11330	14	KUMON. Лабиринты. Вокруг света	978-5-00100-006-8	  	http://www.mann-ivanov-ferber.ru/books/labirinti_vokrug_sveta/	2017-02-28 16:57:28	2017-03-03 19:30:14	t
609	8688	15	Армянская кухня	978-5-00057-180-4	Анна Мелкумян	http://www.mann-ivanov-ferber.ru/books/special/armenian_cuisine/	2017-02-28 16:57:28	2017-03-03 19:30:15	t
610	10066	15	Говорит командир корабля	978-5-00057-201-6	Патрик Смит	http://www.mann-ivanov-ferber.ru/books/kniga_chasto_letajushhego_passazhira/	2017-02-28 16:57:28	2017-03-03 19:30:16	t
597	13765	14	Книга моей семьи	978-5-00057-225-2	Сатеник Анастасян	http://www.mann-ivanov-ferber.ru/books/kniga_moej_semi/	2017-02-28 16:57:28	2017-03-03 19:30:16	t
625	12121	14	Мыша в детском саду	978-5-00057-110-1	Люси Казенс	http://www.mann-ivanov-ferber.ru/books/misha_v_detskom_sadu/	2017-02-28 16:57:28	2017-03-03 19:30:17	t
633	11627	14	KUMON. Давай рисовать!	978-5-00100-002-0	  	http://www.mann-ivanov-ferber.ru/books/davaj_risovat/	2017-02-28 16:57:28	2017-03-03 19:30:17	t
607	10841	9	Джони Айв	978-5-00057-224-5	Линдер Кани	http://www.mann-ivanov-ferber.ru/books/jony_ive/	2017-02-28 16:57:28	2017-03-03 19:30:18	t
619	13377	14	KUMON. Математика. Сложение и вычитание. Уровень 3	978-5-00100-045-7	  	http://www.mann-ivanov-ferber.ru/books/slozhenie_i_vychitanie_uroven_3/	2017-02-28 16:57:28	2017-03-03 19:30:19	t
626	11581	13	В форме за 100 дней	978-5-00057-174-3	Хайнрих Бергмюллер	http://www.mann-ivanov-ferber.ru/books/v_forme_za_100_dnej/	2017-02-28 16:57:28	2017-03-03 19:30:20	t
637	10058	9	Стартап без купюр	978-5-00057-145-3	Екатерина Иноземцева	http://www.mann-ivanov-ferber.ru/books/startap_bez_kupur/	2017-02-28 16:57:28	2017-03-03 19:30:20	t
17	16310	14	Переходный возраст	978-5-00100-021-1	Лоуренс Стейнберг	http://www.mann-ivanov-ferber.ru/books/perehodnyj-vozrast/	2017-02-28 16:57:19	2017-03-03 19:30:22	t
2	17947	9	Канбан	978-5-00100-530-8	Дэвид Андерсон	http://www.mann-ivanov-ferber.ru/books/kanban/	2017-02-28 16:57:19	2017-03-03 19:30:22	t
630	11055	10	Покупатель на крючке	978-5-00057-207-8	Нир Эяль	http://www.mann-ivanov-ferber.ru/books/pokupatel_na_kryuchke/	2017-02-28 16:57:28	2017-03-03 19:30:23	t
621	10471	9	Начни с малого	978-5-00057-178-1	Фред Де Люка	http://www.mann-ivanov-ferber.ru/books/nachni_s_malogo/	2017-02-28 16:57:28	2017-03-03 19:30:23	t
606	10304	11	Мечтать не вредно	978-5-00100-609-1	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/mechtat_ne_vredno/	2017-02-28 16:57:28	2017-03-03 19:30:24	t
605	10670	10	Взлом маркетинга	978-5-00100-421-9	Фил Барден	http://www.mann-ivanov-ferber.ru/books/vzlom_marketinga/	2017-02-28 16:57:28	2017-03-03 19:30:24	t
645	10467	9	Системность во всем	978-5-00057-185-9	Сэм Карпентер	http://www.mann-ivanov-ferber.ru/books/sistemnost_vo_vsem/	2017-02-28 16:57:28	2017-03-03 19:30:26	t
660	9989	11	Уроки импровизации	978-5-00057-173-6	Патриция Райан Мэдсон	http://www.mann-ivanov-ferber.ru/books/uroki_improvizacii/	2017-02-28 16:57:29	2017-03-03 19:30:26	t
646	11097	10	Продающие рассылки	978-5-00057-200-9	Ян Броди	http://www.mann-ivanov-ferber.ru/books/ubeditelnie_pisma/	2017-02-28 16:57:28	2017-03-03 19:30:27	t
983	14542	15	Карандаш надежды	978-5-00057-555-0	Адам Браун	http://www.mann-ivanov-ferber.ru/books/karandash-nadezhdy/	2017-02-28 17:02:28	2017-03-03 19:30:27	t
672	7492	15	Лучшие рецепты	978-5-00057-134-7	Александр Дюма (отец)	http://www.mann-ivanov-ferber.ru/books/special/best_recipes/	2017-02-28 16:57:29	2017-03-03 19:30:28	t
661	6920	9	Яндекс.Книга	978-5-00057-092-0	Дмитрий Соколов-Митрич	http://www.mann-ivanov-ferber.ru/books/paperbook/yandexbook/	2017-02-28 16:57:29	2017-03-03 19:30:25	t
653	9391	15	100 лет авиации	978-5-00057-013-5	Питер Элмонд	http://www.mann-ivanov-ferber.ru/books/100_let_aviacii/	2017-02-28 16:57:29	2017-03-03 19:30:40	t
657	11254	10	Горячие поклонники	978-5-00057-171-2	Кен Бланшар	http://www.mann-ivanov-ferber.ru/books/goryachie_poklonniki/	2017-02-28 16:57:29	2017-03-03 19:30:40	t
652	9540	13	Ешь правильно, беги быстро	978-5-00100-264-2	Скотт Джурек	http://www.mann-ivanov-ferber.ru/books/esh_pravilno_begi_bystro/	2017-02-28 16:57:29	2017-03-03 19:30:41	t
663	11074	11	Мастерство учителя	978-5-00057-926-8	Дуг Лемов	http://www.mann-ivanov-ferber.ru/books/masterstvo_uchitelya/	2017-02-28 16:57:29	2017-03-03 19:30:41	t
1277	4054	10	Анатомия сарафанного маркетинга	978-5-91657-654-2	Эмануил  Розен 	http://www.mann-ivanov-ferber.ru/books/mif/the-anatomy-of-buzz/	2017-02-28 17:02:37	2017-03-03 19:30:42	t
643	11580	9	Иные продажи	978-5-00057-191-0	Александр  Деревицкий	http://www.mann-ivanov-ferber.ru/books/inye_prodazhi/	2017-02-28 16:57:28	2017-03-03 19:30:42	t
649	10557	12	Зачем мы пишем?	978-5-00057-203-0	Мередит Маран	http://www.mann-ivanov-ferber.ru/books/pochemu_my_pishem/	2017-02-28 16:57:29	2017-03-03 19:30:42	t
667	10813	12	Покажи свою работу!	978-5-00100-286-4	Остин  Клеон	http://www.mann-ivanov-ferber.ru/books/pokaji_svoju_rabotu/	2017-02-28 16:57:29	2017-03-03 19:30:43	t
670	11176	15	Книга 2.0	978-5-00057-169-9	Джейсон Меркоски	http://www.mann-ivanov-ferber.ru/books/kniga_2.0/	2017-02-28 16:57:29	2017-03-03 19:30:44	t
644	10273	13	Полезная еда	978-5-00057-807-0	Колин Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/ya_nikogo_ne_em/	2017-02-28 16:57:28	2017-03-03 19:30:44	t
656	11295	11	Важные годы	978-5-00057-847-6	Мэг Джей	http://www.mann-ivanov-ferber.ru/books/opredelyayushhie_10_let/	2017-02-28 16:57:29	2017-03-03 19:30:45	t
658	10379	12	Спасите котика!	978-5-00100-265-9	Блейк Снайдер	http://www.mann-ivanov-ferber.ru/books/spasite_kota/	2017-02-28 16:57:29	2017-03-03 19:30:46	t
676	10145	12	Вы сможете рисовать через 30 дней	978-5-00100-422-6	Марк Кистлер	http://www.mann-ivanov-ferber.ru/books/you_can_draw_in_30_days/	2017-02-28 16:57:29	2017-03-03 19:30:46	t
650	9980	13	Путь опережающего кулака	978-5-00057-789-9	Брюс Ли	http://www.mann-ivanov-ferber.ru/books/put_operezhayushego_kulaka/	2017-02-28 16:57:29	2017-03-03 19:30:47	t
669	10417	11	Найти себя	978-5-00057-133-0	Боб Дойч	http://www.mann-ivanov-ferber.ru/books/vera_v_sebya/	2017-02-28 16:57:29	2017-03-03 19:30:47	t
677	10249	11	Правила мозга	978-5-00057-141-5	Джон Медина	http://www.mann-ivanov-ferber.ru/books/pravila_mozga/	2017-02-28 16:57:29	2017-03-03 19:30:48	t
659	12216	14	Поиграем?!	978-5-00057-159-0	  	http://www.mann-ivanov-ferber.ru/books/poigraem_5_6_7/	2017-02-28 16:57:29	2017-03-03 19:30:59	t
651	10409	9	Долой продуктивность!	978-5-00057-183-5	Стивер Роббинс	http://www.mann-ivanov-ferber.ru/books/vy_mozhete_byt_produktivnee/	2017-02-28 16:57:29	2017-03-03 19:30:59	t
654	10387	13	Аюрведа	978-5-00057-985-5	Томас Ярема	http://www.mann-ivanov-ferber.ru/books/ayurveda/	2017-02-28 16:57:29	2017-03-03 19:31:00	t
679	10374	9	Управление жизненным циклом корпораций	978-5-00100-578-0	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/upravlenie_zhiznennym_ciklom_korporacii/	2017-02-28 16:57:29	2017-03-03 19:31:00	t
678	10419	10	Интернет-маркетинг по науке	978-5-00057-122-4	Дэн Заррелла	http://www.mann-ivanov-ferber.ru/books/internet_marketing_po_nauke/	2017-02-28 16:57:29	2017-03-03 19:31:01	t
665	9991	14	Айсберг на ковре, или Во что поиграть с ребенком?	978-5-00057-947-3	Ася Ванякина	http://www.mann-ivanov-ferber.ru/books/aisberg_na_kovre/	2017-02-28 16:57:29	2017-03-03 19:31:03	t
662	11130	11	Сомнение	978-5-00057-198-9	Слава Баранский	http://www.mann-ivanov-ferber.ru/books/somnenie/	2017-02-28 16:57:29	2017-03-03 19:31:03	t
680	10152	9	Переговоры	 978-5-00057-102-6	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/peregovory/	2017-02-28 16:57:29	2017-03-03 19:31:04	t
671	10436	10	Искренний сервис	978-5-00100-517-9	Максим Недякин	http://www.mann-ivanov-ferber.ru/books/iskrennij_servis/	2017-02-28 16:57:29	2017-03-03 19:31:05	t
675	8684	13	100 самых полезных продуктов	978-5-00057-126-2	  	http://www.mann-ivanov-ferber.ru/books/special/healthy_foods/	2017-02-28 16:57:29	2017-03-03 19:31:06	t
982	14659	10	По рекомендации	978-5-00057-473-7	Джон Янч	http://www.mann-ivanov-ferber.ru/books/po-rekomendacii/	2017-02-28 17:02:28	2017-03-03 19:31:06	t
642	7149	15	100 лучших ароматов	978-5-91657-949-9	Лука Турин	http://www.mann-ivanov-ferber.ru/books/paperbook/little-book-perfumes/	2017-02-28 16:57:28	2017-03-03 19:31:08	t
674	10254	9	О чем говорят цифры	978-5-00057-118-7	Том Дэвенпорт	http://www.mann-ivanov-ferber.ru/books/o_chem_govoryat_cifry/	2017-02-28 16:57:29	2017-03-03 19:31:08	t
648	10411	11	Осознанность	978-5-00100-423-3	Марк Уильямс	http://www.mann-ivanov-ferber.ru/books/osoznannost/	2017-02-28 16:57:29	2017-03-03 19:31:17	t
699	9693	13	Здоровые рецепты доктора Ионовой	978-500057-066-1	Лидия Ионова	http://www.mann-ivanov-ferber.ru/books/zdorovye_recepty_doktora_ionovoy/	2017-02-28 16:57:29	2017-03-03 19:32:17	t
690	9972	14	Начинающий инвестор	978-500057-072-2	Гейл Карлиц	http://www.mann-ivanov-ferber.ru/books/nachinayushiy_investor/	2017-02-28 16:57:29	2017-03-03 19:31:45	t
712	10386	15	Мультиварка: 100 здоровых завтраков и ужинов	978-500057-037-1	Соня Руденко	http://www.mann-ivanov-ferber.ru/books/special/helthy_breakfast/	2017-02-28 16:57:29	2017-03-03 19:31:46	t
708	9048	9	Ctrl Alt Delete	978-500057-021-0	Митч Джоэл	http://www.mann-ivanov-ferber.ru/books/ctrl_alt_delete/	2017-02-28 16:57:29	2017-03-03 19:31:57	t
687	11132	14	Поверь в свое дитя	978-5-00057-097-5	Сесиль Лупан	http://www.mann-ivanov-ferber.ru/books/pover_v_svoyo_ditya/	2017-02-28 16:57:29	2017-03-03 19:31:58	t
439	11750	12	Путь наименьшего сопротивления	978-5-00057-578-9	Роберт Фритц	http://www.mann-ivanov-ferber.ru/books/put_naimenshego_soprotivleniya/	2017-02-28 16:57:25	2017-03-03 19:31:59	t
714	9744	11	Разреши себе мечтать	978-500057-063-0	Уитни Джонсон	http://www.mann-ivanov-ferber.ru/books/razreshi_sebe_mechtat/	2017-02-28 16:57:29	2017-03-03 19:32:00	t
706	10427	9	Власть, влияние и политика в организациях	978-5-91657-950-5	Джеффри Пфеффер	http://www.mann-ivanov-ferber.ru/books/vlast_vliyanie_i_politika_v_organizaciyah/	2017-02-28 16:57:29	2017-03-03 19:32:01	t
695	9869	11	Правила Брэнсона	978-5-00057-085-2	Ричард Брэнсон	http://www.mann-ivanov-ferber.ru/books/pravila_brensona/	2017-02-28 16:57:29	2017-03-03 19:32:13	t
701	9318	9	Неудержимые	978-500057-030-2	Билл Шлей	http://www.mann-ivanov-ferber.ru/books/neuderzhimye/	2017-02-28 16:57:29	2017-03-03 19:32:14	t
697	10154	10	Как писать так, чтобы вам доверяли	978-5-00057-080-7	Кеннет Роуман	http://www.mann-ivanov-ferber.ru/books/kak_pisat_tak_chtoby_vam_doverjali/	2017-02-28 16:57:29	2017-03-03 19:32:15	t
716	9381	12	Слово дизайнеру	978-500057-023-4	Сара Бейдер	http://www.mann-ivanov-ferber.ru/books/slovo_dizayneru/	2017-02-28 16:57:30	2017-03-03 19:32:15	t
718	10544	11	Психология мотивации	978-5-91657-974-1	Хайди Грант Хэлворсон	http://www.mann-ivanov-ferber.ru/books/mif/focus/	2017-02-28 16:57:30	2017-03-03 19:32:16	t
705	9641	10	Социальные медиа — это бред!	978-500057-070-8	Брэндон Мендельсон	http://www.mann-ivanov-ferber.ru/books/socialnye_media_eto_bred/	2017-02-28 16:57:29	2017-03-03 19:32:45	t
713	10385	15	Мультиварка: готовим два блюда сразу	978-500057-067-8	Марина Ярославцева	http://www.mann-ivanov-ferber.ru/books/special/multicookings/	2017-02-28 16:57:29	2017-03-03 19:31:59	t
691	7474	10	Контент — это валюта	978-5-00057-077-7	Джон Вюббен	http://www.mann-ivanov-ferber.ru/books/paperbook/content-is-currency/	2017-02-28 16:57:29	2017-03-03 19:32:18	t
693	10212	14	Самолеты из бумаги	978-5-00057-096-8	Джон Коллинз	http://www.mann-ivanov-ferber.ru/books/samolety_iz_bumagi/	2017-02-28 16:57:29	2017-03-03 19:32:18	t
700	10213	14	Собери свою галактику	978-5-00057-095-1	Иоахим Кланг	http://www.mann-ivanov-ferber.ru/books/soberi_svoju_galaktiku/	2017-02-28 16:57:29	2017-03-03 19:32:19	t
711	7494	15	Как научиться готовить	978-500057-065-4	Андрей Азаров	http://www.mann-ivanov-ferber.ru/books/special/cooking/	2017-02-28 16:57:29	2017-03-03 19:32:20	t
682	10279	11	Развитие мозга	978-5-00100-428-8	Роджер Сайп	http://www.mann-ivanov-ferber.ru/books/razvitie_mozga/	2017-02-28 16:57:29	2017-03-03 19:32:20	t
688	10382	9	Искусство управлять	978-5-00100-014-3	Крис Макгофф	http://www.mann-ivanov-ferber.ru/books/iskusstvo_upravljat/	2017-02-28 16:57:29	2017-03-03 19:32:21	t
520	12805	11	БУДЬ лучшей версией себя	978-5-00100-416-5	Дэн Вальдшмидт	http://www.mann-ivanov-ferber.ru/books/preodolevaya_sebya/	2017-02-28 16:57:27	2017-03-03 19:32:22	t
704	9332	11	Бизнес в позе лотоса	978-500057-031-9	Ризван Вирк	http://www.mann-ivanov-ferber.ru/books/biznes_v_poze_lotosa/	2017-02-28 16:57:29	2017-03-03 19:32:17	t
685	10373	9	Управляя изменениями	978-5-00100-510-0	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/upravljaja_izmenenijami/	2017-02-28 16:57:29	2017-03-03 19:32:23	t
719	10302	12	Визуальные заметки	978-5-00100-626-8	Майк Роуди	http://www.mann-ivanov-ferber.ru/books/paperbook/the-sketchnote-handbook/	2017-02-28 16:57:30	2017-03-03 19:32:24	t
696	8438	11	Разговор по существу	978-5-00057-078-4	Сьюзан Скотт	http://www.mann-ivanov-ferber.ru/books/paperbook/fierce-conversations/	2017-02-28 16:57:29	2017-03-03 19:32:24	t
709	7392	15	Удовольствие от x	978-5-00057-917-6	Стивен Строгац	http://www.mann-ivanov-ferber.ru/books/paperbook/joy-x/	2017-02-28 16:57:29	2017-03-03 19:32:25	t
703	10481	11	Номер 1. Как стать лучшим в том, что ты делаешь	978-5-00057-912-1	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/nomer_odin/	2017-02-28 16:57:29	2017-03-03 19:32:25	t
694	10010	15	Brainiac	978-5-00057-119-4	Кен Дженнингс	http://www.mann-ivanov-ferber.ru/books/brainiac/	2017-02-28 16:57:29	2017-03-03 19:32:35	t
686	10558	14	Мой ребенок — интроверт	978-5-00057-135-4	Марти Лэйни	http://www.mann-ivanov-ferber.ru/books/rebenok_introvert/	2017-02-28 16:57:29	2017-03-03 19:32:36	t
683	9800	11	Эффективные письменные деловые коммуникации	978-5-91657-940-6	Брайан Гарнер	http://www.mann-ivanov-ferber.ru/books/effektivnye_kommunikacii/	2017-02-28 16:57:29	2017-03-03 19:31:17	t
717	9686	12	Слово архитектору	978-500057-024-1	Лаура Дашкес	http://www.mann-ivanov-ferber.ru/books/slovo_arhitektoru/	2017-02-28 16:57:30	2017-03-03 19:32:45	t
715	10482	12	Опять творческий кризис?	978-500057-025-8	Алекс Корнелл	http://www.mann-ivanov-ferber.ru/books/opyat_tvorcheskyi_krizis/	2017-02-28 16:57:29	2017-03-03 19:32:22	t
603	13582	14	Улица сквозь время	978-5-00057-220-7	Стив Нун	http://www.mann-ivanov-ferber.ru/books/ulica_skvoz_vremya/	2017-02-28 16:57:28	2017-03-03 19:40:11	t
684	9797	9	Эффективность на работе	978-5-91657-939-0	Harvard Business Review	http://www.mann-ivanov-ferber.ru/books/effektivnost_na_rabote/	2017-02-28 16:57:29	2017-03-03 19:32:46	t
707	8170	9	Маркетплейс 3.0	978-5-91657-926-0	Хироси Микитани	http://www.mann-ivanov-ferber.ru/books/paperbook/marketplace/	2017-02-28 16:57:29	2017-03-03 19:32:47	t
710	7382	11	Царь горы	978-500057-062-3	По Бронсон и Эшли Мерримен	http://www.mann-ivanov-ferber.ru/books/paperbook/top-dog-the-science-of-winning-and-losing/	2017-02-28 16:57:29	2017-03-03 19:31:31	t
1041	5160	9	На пике возможностей	978-5-91657-648-1	Роберт  Поузен	http://www.mann-ivanov-ferber.ru/books/mif/peak/	2017-02-28 17:02:33	2017-03-03 19:33:00	t
750	7466	11	Легкий способ перестать опаздывать	978-5-91657-981-9	Диана де Лонзор	http://www.mann-ivanov-ferber.ru/books/psychologies/never-be-late-again/	2017-02-28 16:57:30	2017-03-03 19:33:01	t
759	8418	11	Начни		Джон Эйкафф	http://www.mann-ivanov-ferber.ru/books/paperbook/start/	2017-02-28 16:57:30	2017-03-03 19:33:01	t
746	9326	14	Как устроен человек	978-5-00100-386-1	Елена Качур	http://www.mann-ivanov-ferber.ru/books/kak_ustroen_chelovek/	2017-02-28 16:57:30	2017-03-03 19:33:02	t
758	8590	9	Формула времени	978-5-91657-924-6	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/mif/outlook-2013/	2017-02-28 16:57:30	2017-03-03 19:33:03	t
747	8414	10	Заразительный	978-5-00100-015-0	Йона Бергер	http://www.mann-ivanov-ferber.ru/books/paperbook/contagious/	2017-02-28 16:57:30	2017-03-03 19:33:04	t
736	7365	10	Продающий контент	978-5-91657-895-9	Ли Одден	http://www.mann-ivanov-ferber.ru/books/mif/optimize/	2017-02-28 16:57:30	2017-03-03 19:33:14	t
757	8112	10	Законы влияния	978-5-91657-930-7	Сьюзан Вайншенк	http://www.mann-ivanov-ferber.ru/books/paperbook/how-get-people-do-stuff/	2017-02-28 16:57:30	2017-03-03 19:33:14	t
738	8042	9	Успешный детский клуб	978-5-91657-943-7	Зарина Ивантер	http://www.mann-ivanov-ferber.ru/books/paperbook/detskiy-klub/	2017-02-28 16:57:30	2017-03-03 19:33:15	t
737	7224	13	Ешьте это, а не то	978-5-91657-857-7	Олеся Гиевская	http://www.mann-ivanov-ferber.ru/books/paperbook/eat_tthis_not_that/	2017-02-28 16:57:30	2017-03-03 19:33:26	t
745	8773	10	Клад для копирайтера	978-5-91657-826-3	Элина Слободянюк	http://www.mann-ivanov-ferber.ru/books/paperbook/treasure-copywriter/	2017-02-28 16:57:30	2017-03-03 19:33:26	t
1713	5228	10	Брендинг территорий	978-5-91657-655-9	 Кейт Динни	http://www.mann-ivanov-ferber.ru/books/paperbook/city-branding/	2017-03-02 13:26:28	2017-03-03 19:33:27	t
749	7499	11	Психология инвестиций	978-5-91657-868-3	Карл Ричардс	http://www.mann-ivanov-ferber.ru/books/sse/behavior-gap/	2017-02-28 16:57:30	2017-03-03 19:33:27	t
742	9241	11	Mr. Leader	978-500057-004-3	Владимир Воронов	http://www.mann-ivanov-ferber.ru/books/mr_leader/	2017-02-28 16:57:30	2017-03-03 19:33:28	t
751	7743	15	Заметки авиапассажира	978-5-91657-877-5	Андрей Бильжо	http://www.mann-ivanov-ferber.ru/books/paperbook/notes/	2017-02-28 16:57:30	2017-03-03 19:33:28	t
725	9161	9	Персонализация продаж	978-500057-007-4	Александр  Деревицкий	http://www.mann-ivanov-ferber.ru/books/personalizaciya_prodazh/	2017-02-28 16:57:30	2017-03-03 19:33:29	t
729	8440	11	Легкий способ быстро выучить иностранный язык с помощью музыки	978-500057-006-7	Сусанна Зарайская	http://www.mann-ivanov-ferber.ru/books/paperbook/language-music/	2017-02-28 16:57:30	2017-03-03 19:33:29	t
755	9162	15	Здоровее будешь	 978-5-91657-983-3	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/zdorovee_budesh/	2017-02-28 16:57:30	2017-03-03 19:33:30	t
727	9532	9	Макротренды в бизнесе	978-5-91657-918-5	Брайан Солис	http://www.mann-ivanov-ferber.ru/books/makrotrendy_v_biznese/	2017-02-28 16:57:30	2017-03-03 19:33:40	t
753	9072	11	Спасти заложника	978-5-00057-093-7	Джордж Колризер	http://www.mann-ivanov-ferber.ru/books/spasti_zalozhnika/	2017-02-28 16:57:30	2017-03-03 19:33:40	t
731	9077	15	Инфографика	978-5-91657-850-8	Дэвид Маккэндлесс	http://www.mann-ivanov-ferber.ru/books/infografika/	2017-02-28 16:57:30	2017-03-03 19:33:41	t
740	9373	9	Бухгалтерия без авралов и проблем	978-5-00057-014-2	Павел Меньшиков	http://www.mann-ivanov-ferber.ru/books/buhgalteriya_bez_avralov_i_problem/	2017-02-28 16:57:30	2017-03-03 19:33:41	t
756	8584	14	Книга моих историй	978-5-91657-965-9	Луи Стоуэлл	http://www.mann-ivanov-ferber.ru/books/children/write-your-own-story-book/	2017-02-28 16:57:30	2017-03-03 19:33:42	t
720	8350	11	Легкий способ начать новую жизнь	978-5-91657-944-4	Нейл Фьоре	http://www.mann-ivanov-ferber.ru/books/psychologies/awaken-your-strongest-self/	2017-02-28 16:57:30	2017-03-03 19:33:43	t
735	8299	9	Мастера слова	978-5-91657-958-1	Джерри Вайсман	http://www.mann-ivanov-ferber.ru/books/secrets_of_the_great/winning-strategies-for-power-presentations/	2017-02-28 16:57:30	2017-03-03 19:33:43	t
732	9706	9	К черту все! Берись и делай!	978-5-00100-548-3	Ричард Брэнсон	http://www.mann-ivanov-ferber.ru/books/k_chertu_vse/	2017-02-28 16:57:30	2017-03-03 19:33:44	t
724	8445	15	Эффект плато	978-5-91657-994-9	Боб Салливан, Хью Томпсон	http://www.mann-ivanov-ferber.ru/books/paperbook/the-plateau-effect/	2017-02-28 16:57:30	2017-03-03 19:33:44	t
730	8043	11	Ловушки мышления	978-5-00100-371-7	Чип Хиз  и Дэн Хиз	http://www.mann-ivanov-ferber.ru/books/paperbook/decisive/	2017-02-28 16:57:30	2017-03-03 19:33:45	t
723	8739	9	Горшочек, не вари!	978-500057-020-3	Марк Хёрст	http://www.mann-ivanov-ferber.ru/books/paperbook/bit-literacy/	2017-02-28 16:57:30	2017-03-03 19:33:46	t
728	9329	13	Ваш первый марафон	978-5-91657-979-6	Грете Вайтц	http://www.mann-ivanov-ferber.ru/books/vash_pervyj_marafon/	2017-02-28 16:57:30	2017-03-03 19:33:46	t
754	9185	14	Мы – звездная пыль	978-5-91657-964-2	Элин Келси	http://www.mann-ivanov-ferber.ru/books/my_zvezdnaya_pyl/	2017-02-28 16:57:30	2017-03-03 19:33:47	t
733	9131	11	Помнить все	978-5-00057-964-0	Артур Думчев	http://www.mann-ivanov-ferber.ru/books/pomnit_vse/	2017-02-28 16:57:30	2017-03-03 19:33:47	t
722	10068	15	Россия в цифрах: 2012-2013	978-5-91657-896-6	Михаил Фирсанов	http://www.mann-ivanov-ferber.ru/books/rossiya_v_cifrah/	2017-02-28 16:57:30	2017-03-03 19:34:03	t
748	7485	9	Поднимая планку	978-5-91657-962-8	Джейсон Вумек	http://www.mann-ivanov-ferber.ru/books/paperbook/your-best-just-got-better/	2017-02-28 16:57:30	2017-03-03 19:34:04	t
752	8835	10	Визуальный молоток	978-5-91657-980-2	Лаура Райс	http://www.mann-ivanov-ferber.ru/books/vizualnyi_molotok/	2017-02-28 16:57:30	2017-03-03 19:34:05	t
1712	4990	12	Сотвори и продай	978-5-91657-529-3	 Светлана Воинская	http://www.mann-ivanov-ferber.ru/books/paperbook/create-and-sell/	2017-03-02 13:26:27	2017-03-03 19:34:06	t
739	9518	9	Залоговик	978-500057-028-9	Николай Вольхин	http://www.mann-ivanov-ferber.ru/books/zalogovik/	2017-02-28 16:57:30	2017-03-03 19:32:59	t
767	7352	14	KUMON. Волшебные лабиринты	978-5-00100-431-8	  	http://www.mann-ivanov-ferber.ru/books/children/amazing-mazes/	2017-02-28 16:57:30	2017-03-03 19:34:07	t
768	7351	14	KUMON. Простые линии	978-5-00100-635-0	  	http://www.mann-ivanov-ferber.ru/books/children/my-first-book-tracing/	2017-02-28 16:57:30	2017-03-03 19:34:08	t
775	7359	14	KUMON. Учимся клеить	978-5-00100-636-7	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-pasting/	2017-02-28 16:57:30	2017-03-03 19:34:08	t
780	7481	9	Выступление без подготовки	978-5-91657-915-4	Андрей Седнев	http://www.mann-ivanov-ferber.ru/books/paperbook/magic-of-impromptu-speaking/	2017-02-28 16:57:31	2017-03-03 19:34:19	t
774	7360	14	KUMON. Мои первые поделки	978-5-00100-512-4	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-easy-crafts/	2017-02-28 16:57:30	2017-03-03 19:34:24	t
776	7358	14	KUMON. Учимся вырезать	978-5-00100-637-4	  	http://www.mann-ivanov-ferber.ru/books/children/my-first-book-cutting/	2017-02-28 16:57:30	2017-03-03 19:34:24	t
790	8151	14	Если хочешь быть здоров	978-5-00100-433-2	Елена Качур	http://www.mann-ivanov-ferber.ru/books/children/if-you-want-be-healthy/	2017-02-28 16:57:31	2017-03-03 19:34:25	t
762	7356	14	KUMON. Учимся считать от 1 до 120	978-5-00057-900-8	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-numbers-1-120/	2017-02-28 16:57:30	2017-03-03 19:34:26	t
773	7854	9	Дневник успешного человека	978-5-91657-276-6	Александр Левитас	http://www.mann-ivanov-ferber.ru/books/paperbook/diary-of-a-successful-person/	2017-02-28 16:57:30	2017-03-03 19:34:27	t
1714	11703	9	Нанимай с головой		Лу Адлер	http://www.mann-ivanov-ferber.ru/books/nanimaj_s_golovoj/	2017-03-02 13:26:28	2017-03-03 19:34:40	t
792	8174	9	Кодекс выживания	978-5-91657-827-0	Дэвид Хэнна	http://www.mann-ivanov-ferber.ru/books/paperbook/code/	2017-02-28 16:57:31	2017-03-03 19:34:41	t
779	7600	15	Пироговедение	978-5-91657-856-0	Ирина Чадеева	http://www.mann-ivanov-ferber.ru/books/special/pirogovedenie/	2017-02-28 16:57:31	2017-03-03 19:34:41	t
789	7684	12	Учись видеть	978-5-00057-875-9	Марина Москвина	http://www.mann-ivanov-ferber.ru/books/paperbook/learn-to-see/	2017-02-28 16:57:31	2017-03-03 19:34:42	t
798	6789	9	Месяц в небе	978-5-91657-821-8	Инна Кузнецова	http://www.mann-ivanov-ferber.ru/books/mif/month-sky/	2017-02-28 16:57:31	2017-03-03 19:34:54	t
784	14236	11	Ключ	978-5-00057-091-3	Джо Витале	http://www.mann-ivanov-ferber.ru/books/klyuch/	2017-02-28 16:57:31	2017-03-03 19:34:55	t
786	8114	11	Миллион для моей дочери	978-5-91657-829-4	Владимир Савенок	http://www.mann-ivanov-ferber.ru/books/paperbook/million-dlya-moey-docheri/	2017-02-28 16:57:31	2017-03-03 19:34:56	t
787	8157	9	HR-квест	978-5-91657-897-3	Михаил Воронин	http://www.mann-ivanov-ferber.ru/books/paperbook/hr-quest/	2017-02-28 16:57:31	2017-03-03 19:34:56	t
772	7631	15	Стихи с натуры	978-5-91657-863-8	Глеб Солнцев	http://www.mann-ivanov-ferber.ru/books/special/poetry/	2017-02-28 16:57:30	2017-03-03 19:35:06	t
777	7637	9	Переговоры без поражения	978-5-91657-838-6	Роджер Фишер	http://www.mann-ivanov-ferber.ru/books/golden_library/gettingtoyes/	2017-02-28 16:57:30	2017-03-03 19:35:10	t
788	7807	9	Хозяин слова	978-5-91657-861-4	Игорь Родченко	http://www.mann-ivanov-ferber.ru/books/paperbook/words/	2017-02-28 16:57:31	2017-03-03 19:35:10	t
763	7635	9	Доставляя счастье	978-5-91657-836-2	Тони Шей	http://www.mann-ivanov-ferber.ru/books/golden_library/deliveringhappiness/	2017-02-28 16:57:30	2017-03-03 19:35:11	t
765	7354	14	KUMON. Простые лабиринты	978-5-00100-594-0	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-easy-mazes/	2017-02-28 16:57:30	2017-03-03 19:35:11	t
796	7339	11	Искусство обучать	978-5-00100-315-1	Джули Дирксен	http://www.mann-ivanov-ferber.ru/books/paperbook/design-how-people-learn/	2017-02-28 16:57:31	2017-03-03 19:35:12	t
793	6720	10	Как работать где хочешь, сколько хочешь и получать стабильный доход	978-5-91657-815-7	Скотт Фокс	http://www.mann-ivanov-ferber.ru/books/paperbook/click-millionaires/	2017-02-28 16:57:31	2017-03-03 19:35:13	t
791	7562	9	45 татуировок менеджера	978-5-00100-679-4	Максим Батырев (Комбат)	http://www.mann-ivanov-ferber.ru/books/paperbook/tattoos/	2017-02-28 16:57:31	2017-03-03 19:35:13	t
794	15878	15	Капитал	978-5-00100-149-2	Карл Маркс	http://www.mann-ivanov-ferber.ru/books/kapital/	2017-02-28 16:57:31	2017-03-03 19:35:15	t
1108	11708	10	Креативность требует смелости	978-5-00057-164-4	 Ларс Валлентин	http://www.mann-ivanov-ferber.ru/books/kreativnost_trebuet_smelosti/	2017-02-28 17:02:35	2017-03-03 19:35:15	t
781	8260	14	Зоки и Бада. Большая книга для рисования	978-5-91657-925-3	Елена Кубышева	http://www.mann-ivanov-ferber.ru/books/children/drawing-zoki-i-bada/	2017-02-28 16:57:31	2017-03-03 19:35:16	t
769	8837	14	Придумай свою подпись	978-5-91657-954-3	Ника Дубровская	http://www.mann-ivanov-ferber.ru/books/pridumaj_svoju_podpis/	2017-02-28 16:57:30	2017-03-03 19:34:07	t
760	9046	15	Экономика всего	978-5-00100-470-7	Александр Аузан	http://www.mann-ivanov-ferber.ru/books/ekonomika_vsego/	2017-02-28 16:57:30	2017-03-03 19:35:16	t
770	8651	14	Занималки. Зима	978-5-91657-975-8	Зина Сурова	http://www.mann-ivanov-ferber.ru/books/children/winter/	2017-02-28 16:57:30	2017-03-03 19:35:27	t
783	7029	14	Про хвосты, носы и уши	978-5-91657-799-0	Стив Дженкинс	http://www.mann-ivanov-ferber.ru/books/children/tail/	2017-02-28 16:57:31	2017-03-03 19:35:28	t
785	8312	9	Уоррен Баффет. Как 5 долларов превратить в 50 миллиардов	978-5-91657-870-6	Роберт Хагстром	http://www.mann-ivanov-ferber.ru/books/paperbook/warren-buffett/	2017-02-28 16:57:31	2017-03-03 19:35:28	t
797	7192	9	Игра на победу	978-5-91657-843-0	Алан Лафли	http://www.mann-ivanov-ferber.ru/books/paperbook/paying-to-win/	2017-02-28 16:57:31	2017-03-03 19:35:29	t
766	7353	14	KUMON. Увлекательные лабиринты	978-5-00100-529-2	  	http://www.mann-ivanov-ferber.ru/books/children/my-first-book-mazes/	2017-02-28 16:57:30	2017-03-03 19:35:29	t
782	7267	14	В мире жуков	978-5-91657-800-3	Стив Дженкинс	http://www.mann-ivanov-ferber.ru/books/children/the-beetle-book/	2017-02-28 16:57:31	2017-03-03 19:35:30	t
795	7372	11	Психология достижений	978-5-91657-842-3	Хайди Грант Хэлворсон	http://www.mann-ivanov-ferber.ru/books/mif/succeed-how-we-can-reach-our-goals/	2017-02-28 16:57:31	2017-03-03 19:35:30	t
831	5516	13	Секреты быстрого плавания для пловцов и триатлетов	978-5-91657-711-2	Шейла Таормина	http://www.mann-ivanov-ferber.ru/books/sport/swimspeedsecrets/	2017-02-28 16:57:31	2017-03-03 19:35:32	t
803	7344	11	От знаний к навыкам	978-5-00057-891-9	Дуг Лемов	http://www.mann-ivanov-ferber.ru/books/mif/practice-perfect/	2017-02-28 16:57:31	2017-03-03 19:35:32	t
814	6694	9	Мастер звонка	978-5-00057-714-1	Евгений Жигилий	http://www.mann-ivanov-ferber.ru/books/paperbook/call/	2017-02-28 16:57:31	2017-03-03 19:35:33	t
664	11699	11	Круглая методика	978-5-00057-181-1	Юлия Чемеринская	http://www.mann-ivanov-ferber.ru/books/kruglaja_metodika/	2017-02-28 16:57:29	2017-03-03 19:35:33	t
1298	5329	10	Выдающийся сервис, отличная прибыль	978-5-91657-581-1	Леонардо Ингильери	http://www.mann-ivanov-ferber.ru/books/mif/exceptional-service/	2017-02-28 17:02:38	2017-03-03 19:35:34	t
837	5577	11	Эмоциональный интеллект	978-5-00100-415-8	Дэниел Гоулман	http://www.mann-ivanov-ferber.ru/books/psychologies/emotional-intelligence/	2017-02-28 16:57:31	2017-03-03 19:35:35	t
812	6432	11	Искусство влияния	978-5-91657-753-2	Марк Гоулстон	http://www.mann-ivanov-ferber.ru/books/paperbook/real-influence/	2017-02-28 16:57:31	2017-03-03 19:35:35	t
815	5442	14	Сделайте ваших детей успешными	978-5-91657-663-4	Джим  Роджерс	http://www.mann-ivanov-ferber.ru/books/paperbook/gift-my-children/	2017-02-28 16:57:31	2017-03-03 19:35:36	t
835	5472	14	Истории. Альбом для развития креативности	978-5-00057-603-8	Таро Гоми	http://www.mann-ivanov-ferber.ru/books/children/story-doodles-place-mats/	2017-02-28 16:57:31	2017-03-03 19:35:36	t
802	7014	11	Преимущества интровертов	978-5-91657-817-1	Марти Лэйни	http://www.mann-ivanov-ferber.ru/books/paperbook/introvert-advantage/	2017-02-28 16:57:31	2017-03-03 19:35:38	t
828	5779	10	E-mail маркетинг	978-5-00057-634-2	Дмитрий Кот	http://www.mann-ivanov-ferber.ru/books/mif/e-mail-marketing/	2017-02-28 16:57:31	2017-03-03 19:35:39	t
806	6692	9	Умение слушать	 978-5-91657-818-8	Бернард Феррари	http://www.mann-ivanov-ferber.ru/books/mif/oower-listening/	2017-02-28 16:57:31	2017-03-03 19:35:40	t
799	7088	15	Рублевка: Player’s handbook	978-5-91657-853-9	Валерий Панюшкин	http://www.mann-ivanov-ferber.ru/books/paperbook/players-handbook/	2017-02-28 16:57:31	2017-03-03 19:35:40	t
805	7659	15	Справедливость	978-5-91657-814-0	Майкл Сэндел	http://www.mann-ivanov-ferber.ru/books/paperbook/justice/	2017-02-28 16:57:31	2017-03-03 19:35:40	t
826	3593	12	Профессия — иллюстратор	978-5-00057-711-0	Натали Ратковски	http://www.mann-ivanov-ferber.ru/books/paperbook/beginillustration/	2017-02-28 16:57:31	2017-03-03 19:35:41	t
829	5963	10	Психология убеждения	978-5-00100-549-0	Роберт Чалдини	http://www.mann-ivanov-ferber.ru/books/paperbook/yes/	2017-02-28 16:57:31	2017-03-03 19:35:42	t
822	10181	13	Позный метод бега	978-5-91657-781-5	Николай Романов	http://www.mann-ivanov-ferber.ru/books/sport/pose-running/	2017-02-28 16:57:31	2017-03-03 19:35:43	t
819	6696	10	Маркетинг в социальных сетях	978-5-00100-603-9	Дамир Халилов	http://www.mann-ivanov-ferber.ru/books/mif/social-media-marketing/	2017-02-28 16:57:31	2017-03-03 19:35:43	t
810	5957	15	Джентльмен	978-5-91657-715-0	Бернхард Ретцель	http://www.mann-ivanov-ferber.ru/books/paperbook/gentleman/	2017-02-28 16:57:31	2017-03-03 19:35:45	t
801	6576	14	Животные	978-5-91657-790-7	Эд Эмберли	http://www.mann-ivanov-ferber.ru/books/children/book-animals/	2017-02-28 16:57:31	2017-03-03 19:35:45	t
809	6684	9	Путь хеджера	978-5-91657-763-1	Бартон Биггс	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/a-hedge-fund-tale-of-reach-and-gras/	2017-02-28 16:57:31	2017-03-03 19:35:55	t
813	6469	15	Как люди думают	978-5-00100-475-2	Дмитрий Чернышев	http://www.mann-ivanov-ferber.ru/books/paperbook/think/	2017-02-28 16:57:31	2017-03-03 19:35:59	t
824	5130	9	Вау!-проекты	978-5-91657-686-3	Том Питерс	http://www.mann-ivanov-ferber.ru/books/paperbook/fifty-ways/	2017-02-28 16:57:31	2017-03-03 19:35:59	t
804	7524	14	Увлекательная физика	978-5-00100-596-4	Елена Качур	http://www.mann-ivanov-ferber.ru/books/children/physics/	2017-02-28 16:57:31	2017-03-03 19:36:00	t
820	7357	14	KUMON. Игры с числами от 1 до 150	978-5-00100-211-6	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-number-games-1-150/	2017-02-28 16:57:31	2017-03-03 19:36:01	t
832	7649	11	Харизма лидера	978-5-00057-747-9	Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/secrets_of_the_great/charismatic-leader/	2017-02-28 16:57:31	2017-03-03 19:36:01	t
834	11197	11	Жизнь без ограничений	978-5-00100-577-3	Джо Витале	http://www.mann-ivanov-ferber.ru/books/zhizn_bez_ogranichenij/	2017-02-28 16:57:31	2017-03-03 19:36:03	t
827	6481	11	Лидер есть в каждом	978-5-91657-424-1	Сет Годин	http://www.mann-ivanov-ferber.ru/books/paperbook/lider-est/	2017-02-28 16:57:31	2017-03-03 19:36:04	t
1035	5570	12	Воплощение идей	978-5-91657-676-4	Скотт Белски	http://www.mann-ivanov-ferber.ru/books/paperbook/making-ideas-happen/	2017-02-28 17:02:33	2017-03-03 19:36:04	t
808	6568	11	Искусство объяснять	978-5-00100-605-3	Ли ЛеФевер	http://www.mann-ivanov-ferber.ru/books/paperbook/art-explanation/	2017-02-28 16:57:31	2017-03-03 19:36:05	t
825	5770	\N	iPhone 5. Наглядное руководство		Гай Харт-Дэвис	http://www.mann-ivanov-ferber.ru/books/selection/apple/iphone_5/	2017-02-28 16:57:31	2017-03-03 17:03:48	t
836	5444	14	Животные. Альбом для развития креативности	978-5-91657-645-0	Таро Гоми	http://www.mann-ivanov-ferber.ru/books/children/anima-doodles-place-mats/	2017-02-28 16:57:31	2017-03-03 19:37:07	t
823	6611	15	Система Кудрина	978-5-91657-784-6	Евгения Письменная	http://www.mann-ivanov-ferber.ru/books/paperbook/kudrin/	2017-02-28 16:57:31	2017-03-03 19:37:07	t
1036	5959	10	Высокие технологии работы с клиентами	978-5-91657-700-6	Мика Соломон	http://www.mann-ivanov-ferber.ru/books/mif/high-tech/	2017-02-28 17:02:33	2017-03-03 19:37:08	t
833	10157	9	Выйди из зоны комфорта. Измени свою жизнь	978-5-00100-365-6	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/paperbook/eat_that_frog/	2017-02-28 16:57:31	2017-03-03 19:35:31	t
860	4706	9	Работай меньше, успевай больше	978-5-91657-528-6	Керри Глисон	http://www.mann-ivanov-ferber.ru/books/mif/personal-efficiency-program/	2017-02-28 16:57:32	2017-03-03 19:37:09	t
877	6499	9	Психология успешных продаж	978-5-91657-383-1	Дэвид Мэттсон	http://www.mann-ivanov-ferber.ru/books/paperbook/psikhologiya-uspeshnykh-prodazh/	2017-02-28 16:57:32	2017-03-03 19:37:10	t
854	5131	9	Код Дурова	978-5-91657-546-0	Николай Кононов	http://www.mann-ivanov-ferber.ru/books/paperbook/kod-durova/	2017-02-28 16:57:32	2017-03-03 19:37:10	t
861	8449	11	Высшая цель	978-5-00057-890-2	Майкл Рэй	http://www.mann-ivanov-ferber.ru/books/the_highest_goal/	2017-02-28 16:57:32	2017-03-03 19:37:11	t
844	5291	15	Из третьего мира — в первый	978-5-00057-967-1	Ли Куан Ю	http://www.mann-ivanov-ferber.ru/books/history/fromthird/	2017-02-28 16:57:32	2017-03-03 19:37:11	t
859	4764	14	Зоки и Бада	978-5-00100-540-7	Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/zoki-i-bada/	2017-02-28 16:57:32	2017-03-03 19:37:12	t
841	5167	10	Возвращенцы	978-5-00100-246-8	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/paperbook/vozvraschenie/	2017-02-28 16:57:31	2017-03-03 19:37:13	t
875	6804	10	Как привлечь гостей в ресторан	978-5-91657-593-4	Илья Лазерсон	http://www.mann-ivanov-ferber.ru/books/paperbook/restaurant/	2017-02-28 16:57:32	2017-03-03 19:37:19	t
848	5288	11	Миллионер без диплома	978-5-91657-602-3	Майкл Эллсберг	http://www.mann-ivanov-ferber.ru/books/paperbook/education-millionaires/	2017-02-28 16:57:32	2017-03-03 19:37:20	t
1715	5338	12	Дизайн привычных вещей	978-5-91657-625-2	Дональд Норман 	http://www.mann-ivanov-ferber.ru/books/paperbook/design-everyday-things/	2017-03-02 13:26:28	2017-03-03 19:37:20	t
843	10117	12	Кради как художник	978-5-00100-551-3	Остин  Клеон	http://www.mann-ivanov-ferber.ru/books/paperbook/steal-artist/	2017-02-28 16:57:32	2017-03-03 19:37:21	t
853	5270	9	Как зарабатывать деньги в интернете	978-5-91657-579-8	Андрей  Рябых	http://www.mann-ivanov-ferber.ru/books/paperbook/true-moneymaker/	2017-02-28 16:57:32	2017-03-03 19:37:30	t
876	4444	9	Стив Джобс. Уроки лидерства	978-5-91657-441-8	Уильям Саймон	http://www.mann-ivanov-ferber.ru/books/paperbook/ileadership/	2017-02-28 16:57:32	2017-03-03 19:37:31	t
872	7376	13	Lift	978-5-91657-514-9	Игорь Калинаускас	http://www.mann-ivanov-ferber.ru/books/paperbook/lift/	2017-02-28 16:57:32	2017-03-03 19:37:32	t
852	5445	14	Ежедневник счастливой мамы	978-5-00100-024-2	Зарина Ивантер	http://www.mann-ivanov-ferber.ru/books/special/ezhednevnik-schastlivoi-mamy-1/	2017-02-28 16:57:32	2017-03-03 19:37:32	t
842	10095	11	Сила воли	978-5-00100-429-5	Келли Макгонигал	http://www.mann-ivanov-ferber.ru/books/mif/thewillpowerinstinct/	2017-02-28 16:57:32	2017-03-03 19:37:33	t
838	5066	9	Управляя рисками	978-5-91657-547-7	Питер Норман	http://www.mann-ivanov-ferber.ru/books/paperbook/riskcontrollers/	2017-02-28 16:57:31	2017-03-03 19:37:59	t
863	4080	10	Вынос мозга	978-5-91657-360-2	Мартин Линдстром	http://www.mann-ivanov-ferber.ru/books/paperbook/brandwashed/	2017-02-28 16:57:32	2017-03-03 19:37:59	t
849	5253	9	Бизнес в стиле Virgin	978-5-0057-653-3	Ричард Брэнсон	http://www.mann-ivanov-ferber.ru/books/paperbook/virgin/	2017-02-28 16:57:32	2017-03-03 19:37:59	t
850	5275	9	Правила выдающейся карьеры	 978-5-91657-568-2	Стивен Кови	http://www.mann-ivanov-ferber.ru/books/paperbook/great/	2017-02-28 16:57:32	2017-03-03 19:38:06	t
855	4683	14	Красная Шапочка	978-5-91657-500-2	Шарль  Перро	http://www.mann-ivanov-ferber.ru/books/children/redhood/	2017-02-28 16:57:32	2017-03-03 19:38:07	t
856	4748	10	Продающая упаковка	978-5-91657-479-1	 Ларс Валлентин	http://www.mann-ivanov-ferber.ru/books/paperbook/packaging-sense/	2017-02-28 16:57:32	2017-03-03 19:38:07	t
869	4662	9	Бизнес. Перезагрузка	978-5-91657-494-4	 Николай Мрочковский	http://www.mann-ivanov-ferber.ru/books/paperbook/business-reboot/	2017-02-28 16:57:32	2017-03-03 19:38:08	t
865	4460	9	Сам себе МВА	978-5-00100-610-7	Джош Кауфман	http://www.mann-ivanov-ferber.ru/books/mif/personal-mba/	2017-02-28 16:57:32	2017-03-03 19:37:09	t
870	4598	15	Семейный ужин	978-5-91657-337-4	Ферран Адрия	http://www.mann-ivanov-ferber.ru/books/special/the-family-meal/	2017-02-28 16:57:32	2017-03-03 19:38:08	t
874	4373	9	Мелкие ставки	978-5-91657-402-9	 Питер Симс	http://www.mann-ivanov-ferber.ru/books/paperbook/littlebets/	2017-02-28 16:57:32	2017-03-03 19:38:09	t
846	5439	11	Психология позитивных изменений	978-5-91657-604-7	Джеймс Прохазка	http://www.mann-ivanov-ferber.ru/books/paperbook/changing-for-good/	2017-02-28 16:57:32	2017-03-03 19:38:10	t
847	3607	9	Ритейл от первого лица	978-5-91657-582-8	 Евгений Бутман 	http://www.mann-ivanov-ferber.ru/books/paperbook/retail/	2017-02-28 16:57:32	2017-03-03 19:38:10	t
873	4172	10	Сарафанный маркетинг	978-5-00100-640-4	Энди Серновиц	http://www.mann-ivanov-ferber.ru/books/mif/wordofmouthmarketing/	2017-02-28 16:57:32	2017-03-03 19:38:11	t
867	4673	9	Dream Team	978-5-91657-481-4	 Владимир Герасичев	http://www.mann-ivanov-ferber.ru/books/paperbook/dreamteam/	2017-02-28 16:57:32	2017-03-03 19:38:12	t
858	4972	11	Интроверты	978-5-00100-591-9	Сьюзан Кейн	http://www.mann-ivanov-ferber.ru/books/paperbook/quiet/	2017-02-28 16:57:32	2017-03-03 19:38:13	t
868	7638	11	Никогда не ешьте в одиночку	978-5-91657-643-6	Кейт Феррацци	http://www.mann-ivanov-ferber.ru/books/golden_library/never-eat-alone/	2017-02-28 16:57:32	2017-03-03 19:38:13	t
862	6271	13	Здоровые привычки	978-5-00100-382-3	Лидия Ионова	http://www.mann-ivanov-ferber.ru/books/paperbook/healthy_habits/	2017-02-28 16:57:32	2017-03-03 19:38:14	t
390	15747	14	Город	978-5-00057-948-0	Владимир Юденков	http://www.mann-ivanov-ferber.ru/books/gorod/	2017-02-28 16:57:25	2017-03-03 19:38:14	t
866	4861	9	Веди людей за собой	978-5-91657-495-1	Дэвид Новак	http://www.mann-ivanov-ferber.ru/books/paperbook/vedi-ludej-za-soboj/	2017-02-28 16:57:32	2017-03-03 19:38:26	t
878	3959	9	Оставь свой след	978-5-91657-340-4	Блейк Майкоски	http://www.mann-ivanov-ferber.ru/books/paperbook/startsomethingthatmatters/	2017-02-28 16:57:32	2017-03-03 19:38:35	t
892	4027	9	Гарвардская школа переговоров	978-5-91657-369-5	Уильям Юри	http://www.mann-ivanov-ferber.ru/books/paperbook/positiveno/	2017-02-28 16:57:32	2017-03-03 19:38:36	t
887	4051	15	Железный Путин: взгляд с Запада	978-5-91657-359-6	Ангус  Роксборо	http://www.mann-ivanov-ferber.ru/books/paperbook/putin/	2017-02-28 16:57:32	2017-03-03 19:38:36	t
894	3405	10	Маркетинг без бюджета	978-5-00100-454-7	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/paperbook/marketbezbud/	2017-02-28 16:57:32	2017-03-03 19:38:37	t
908	1729	9	Тайм-драйв	978-5-00057-303-7	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/mif/005/	2017-02-28 16:57:33	2017-03-03 19:38:38	t
912	2181	10	Маркетинг от потребителя	978-5-00057-974-9	Роджер Бест	http://www.mann-ivanov-ferber.ru/books/sse/mbmanagement/	2017-02-28 16:57:33	2017-03-03 19:38:38	t
911	2355	9	К выступлению готов!	978-5-00100-544-5	Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/mif/044/	2017-02-28 16:57:33	2017-03-03 19:38:38	t
888	3314	15	Обнаженная натура	978-5-91657-195-0	Вадим Нардин	http://www.mann-ivanov-ferber.ru/books/special/fotoartny/	2017-02-28 16:57:32	2017-03-03 19:38:49	t
902	2385	9	Вышел хеджер из тумана	978-5-91657-483-8	Бартон Биггс	http://www.mann-ivanov-ferber.ru/books/mif/hedgehogging/	2017-02-28 16:57:32	2017-03-03 19:38:50	t
895	3350	9	Арифметика продаж. Руководство по управлению продавцами.	978-5-91657-313-8	Тимур  Асланов	http://www.mann-ivanov-ferber.ru/books/mif/aclanovnabor/	2017-02-28 16:57:32	2017-03-03 19:38:51	t
907	2561	15	Речи, которые изменили Россию		Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/special/speechesru/	2017-02-28 16:57:33	2017-03-03 19:38:57	t
901	3315	13	Мастерство езды на маунтинбайке	978-5-91657-231-5	Брайан  Лопес	http://www.mann-ivanov-ferber.ru/books/sport/mounskil/	2017-02-28 16:57:32	2017-03-03 19:38:34	t
885	2495	9	Издержки вниз – продажи вверх	978-5-91657-354-1	Боб Файфер	http://www.mann-ivanov-ferber.ru/books/mif/048/	2017-02-28 16:57:32	2017-03-03 19:38:57	t
915	1996	9	Говори на языке диаграмм	978-5-00100-262-8	Джин Желязны	http://www.mann-ivanov-ferber.ru/books/mif/026/	2017-02-28 16:57:33	2017-03-03 19:38:57	t
905	3552	9	Deadline	978-5-00100-667-1	Том ДеМарко	http://www.mann-ivanov-ferber.ru/books/biznesroman/deadline1/	2017-02-28 16:57:32	2017-03-03 19:38:58	t
896	3455	9	Пять пороков команды	978-5-00100-204-8	Патрик Ленсиони	http://www.mann-ivanov-ferber.ru/books/biznesroman/arshipfable/	2017-02-28 16:57:32	2017-03-03 19:38:59	t
886	4025	9	Размещение акций: структурирование и ценообразование	978-5-91657-355-8	Антон Мальков	http://www.mann-ivanov-ferber.ru/books/paperbook/razmeschenie-akcij/	2017-02-28 16:57:32	2017-03-03 19:39:11	t
910	2507	9	Камасутра для оратора	978-5-00100-607-7	Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/mif/050/	2017-02-28 16:57:33	2017-03-03 19:39:11	t
891	3606	14	Гении и аутсайдеры	978-5-00100-411-0	Малькольм Гладуэлл	http://www.mann-ivanov-ferber.ru/books/paperbook/story-succes/	2017-02-28 16:57:32	2017-03-03 19:39:12	t
913	2261	9	СПИН-продажи	978-5-00100-611-4	Нил Рекхэм	http://www.mann-ivanov-ferber.ru/books/mif/034/	2017-02-28 16:57:33	2017-03-03 19:39:13	t
916	1663	10	Маркетинг на 100%: ремикс	978-5-00057-848-3	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/mif/002/	2017-02-28 16:57:33	2017-03-03 19:39:13	t
881	3442	9	Новая цель	978-5-00100-397-7	Ди Джейкоб	http://www.mann-ivanov-ferber.ru/books/biznesroman/velcty/	2017-02-28 16:57:32	2017-03-03 19:39:14	t
900	3173	9	Доставляя счастье	978-5-00057-924-4	Тони Шей	http://www.mann-ivanov-ferber.ru/books/paperbook/deliveringhappiness/	2017-02-28 16:57:32	2017-03-03 19:39:15	t
883	3900	9	Уходим в отрыв	978-5-91657-306-0	Кэмерон Герольд	http://www.mann-ivanov-ferber.ru/books/mif/double-double/	2017-02-28 16:57:32	2017-03-03 19:39:16	t
897	16248	12	365 дней очень творческого человека (бордовый)	978-5-91657-747-1	Яна Франк	http://www.mann-ivanov-ferber.ru/books/365-bordo/	2017-02-28 16:57:32	2017-03-03 19:39:16	t
904	4303	13	Откровенно. Автобиография		Андре Агасси	http://www.mann-ivanov-ferber.ru/books/sport/autobiography/	2017-02-28 16:57:32	2017-03-03 19:39:17	t
890	3385	10	Facebook: как найти 100 000 друзей для вашего бизнеса бесплатно	978-5-91657-239-1	Андрей  Албитов	http://www.mann-ivanov-ferber.ru/books/paperbook/kakfacebook/	2017-02-28 16:57:32	2017-03-03 19:39:17	t
903	2917	15	Одураченные случайностью	978-5-00100-273-4	Нассим Николас Талеб	http://www.mann-ivanov-ferber.ru/books/paperbook/fooledbyrandomness/	2017-02-28 16:57:32	2017-03-03 19:39:18	t
898	2981	12	365 дней очень творческого человека (голубой)	978-5-91657-746-4	Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/365/	2017-02-28 16:57:32	2017-03-03 19:39:19	t
884	3949	9	Управление проектами	978-5-00100-305-2	Вадим Богданов	http://www.mann-ivanov-ferber.ru/books/paperbook/upravlenie-project/	2017-02-28 16:57:32	2017-03-03 19:39:19	t
880	3656	9	Больше денег от вашего бизнеса	978-5-00100-420-2	Александр Левитас	http://www.mann-ivanov-ferber.ru/books/mif/moremoney/	2017-02-28 16:57:32	2017-03-03 19:39:20	t
906	2624	12	Муза и Чудовище	978-5-91657-410-4	Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/muza/	2017-02-28 16:57:33	2017-03-03 19:39:21	t
899	3115	11	Как читать книги	978-5-00100-569-8	Мортимер Адлер	http://www.mann-ivanov-ferber.ru/books/paperbook/howtoreadabook/	2017-02-28 16:57:32	2017-03-03 19:39:21	t
893	3163	13	Полное погружение	978-5-00057-975-6	Терри  Лафлин	http://www.mann-ivanov-ferber.ru/books/sport/totalimmersion/	2017-02-28 16:57:32	2017-03-03 19:39:22	t
914	2239	9	Стратегия и толстый курильщик	978-5-902862-73-4	Дэвид Майстер	http://www.mann-ivanov-ferber.ru/books/mif/033/	2017-02-28 16:57:33	2017-03-03 19:38:35	t
506	18416	11	Номер 1. Подарочный комплект	978-5-00057-912-1	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/nomer-1-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:39:23	t
3	18173	11	Тренируем мозг. Тетрадь для развития памяти и интеллекта №3	978-5-00100-588-9	Рюта Кавашима	http://www.mann-ivanov-ferber.ru/books/treniruem-mozg-3/	2017-02-28 16:57:19	2017-03-03 19:39:23	t
602	13584	14	Город сквозь время	978-5-00057-219-1	Стив Нун	http://www.mann-ivanov-ferber.ru/books/gorod_skvoz_vremya/	2017-02-28 16:57:28	2017-03-03 19:39:24	t
239	17103	14	Как объяснить ребенку науку	978-5-00100-077-8	Кэрол Вордерман	http://www.mann-ivanov-ferber.ru/books/kak-obyasnit-rebenku-nauku/	2017-02-28 16:57:22	2017-03-03 19:39:25	t
942	14574	11	Уверенность в себе	978-5-00057-448-5	Элис Мьюир	http://www.mann-ivanov-ferber.ru/books/uverennost-v-sebe/	2017-02-28 17:02:22	2017-03-03 19:39:26	t
440	14449	15	Психология		Пол Клейнман	http://www.mann-ivanov-ferber.ru/books/psihologiya-uznat-za-60-sekund/	2017-02-28 16:57:25	2017-03-03 19:39:29	t
340	15686	9	Открывая организации будущего	978-5-00100-413-4	Фредерик Лалу	http://www.mann-ivanov-ferber.ru/books/novyj-vzglyad-na-organizacii/	2017-02-28 16:57:24	2017-03-03 19:39:30	t
932	15860	11	Следующий уровень	978-5-00057-798-1	Александр Кравцов	http://www.mann-ivanov-ferber.ru/books/sleduyushij-uroven/	2017-02-28 17:02:20	2017-03-03 19:39:30	t
938	15176	14	Как это построено	978-5-00057-364-8	Дэвид Маколи	http://www.mann-ivanov-ferber.ru/books/kak-eto-postroeno/	2017-02-28 17:02:21	2017-03-03 19:39:31	t
111	17855	14	Kumon. Развитие мышления. Логика	978-5-00100-277-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvitie-myshleniya-logika/	2017-02-28 16:57:20	2017-03-03 19:39:31	t
162	17203	12	Жизнь как конструктор		Айше Берсел	http://www.mann-ivanov-ferber.ru/books/zhizn-kak-konstruktor/	2017-02-28 16:57:21	2017-03-03 19:39:33	t
197	16687	15	Как хочет женщина	978-5-00100-642-8	Эмили Нагоски	http://www.mann-ivanov-ferber.ru/books/kak-hochet-zhenshina/	2017-02-28 16:57:22	2017-03-03 19:39:34	t
358	14953	9	Scrum	978-5-00100-424-0	Джефф Сазерленд	http://www.mann-ivanov-ferber.ru/books/scrum/	2017-02-28 16:57:24	2017-03-03 19:39:34	t
400	14866	13	Transcend	978-5-00057-748-6	Рэймонд Курцвейл	http://www.mann-ivanov-ferber.ru/books/nauka-protiv-stareniya/	2017-02-28 16:57:25	2017-03-03 19:39:35	t
388	15656	14	Профессор Астрокот и его путешествие в космос	978-5-00100-364-9	Доминик Воллиман	http://www.mann-ivanov-ferber.ru/books/professor-astrokot-i-ego-puteshestvie-v-kosmos/	2017-02-28 16:57:24	2017-03-03 19:39:35	t
944	14390	15	Мои путешествия	978-5-00057-307-5	Федор Конюхов	http://www.mann-ivanov-ferber.ru/books/moi-puteshestviya/	2017-02-28 17:02:22	2017-03-03 19:39:36	t
940	14719	10	Бизнес-копирайтинг	978-5-00100-147-8	Денис Каплунов	http://www.mann-ivanov-ferber.ru/books/biznes-kopirajting/	2017-02-28 17:02:22	2017-03-03 19:39:37	t
318	16111	14	Великие путешествия	978-5-00057-803-2	Елена Качур	http://www.mann-ivanov-ferber.ru/books/velikie-puteshestviya/	2017-02-28 16:57:23	2017-03-03 19:39:38	t
933	15530	12	Фотографируй каждый день	978-5-00057-705-9	Сьюзан Таттл	http://www.mann-ivanov-ferber.ru/books/fotografiruj-kazhdyj-den/	2017-02-28 17:02:21	2017-03-03 19:39:38	t
409	15314	14	KUMON. Развивающие наклейки KUMON. Транспорт	978-5-00057-758-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-razvivayushie-naklejki-transport/	2017-02-28 16:57:25	2017-03-03 19:39:39	t
925	16902	14	В гнезде так шумно!	978-5-00057-945-9	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/v-gnezde-tak-shumno/	2017-02-28 17:02:20	2017-03-03 19:39:40	t
936	14979	11	Не отвлекайте меня!	978-5-00057-863-6	Эдвард М. Хэлловэлл	http://www.mann-ivanov-ferber.ru/books/ne-otvlekajte-menja/	2017-02-28 17:02:21	2017-03-03 19:39:40	t
360	15694	14	Кто прячется в лесу?	978-5-00100-042-6	Айна Бестард	http://www.mann-ivanov-ferber.ru/books/kto-pryachetsya-v-lesu/	2017-02-28 16:57:24	2017-03-03 19:39:41	t
926	16899	14	Бабочка не спешит	978-5-00057-946-6	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/babochka-ne-speshit/	2017-02-28 17:02:20	2017-03-03 19:40:00	t
279	12247	12	Взлом креатива	978-5-00100-639-8	Майкл Микалко	http://www.mann-ivanov-ferber.ru/books/vzlom_kreativa/	2017-02-28 16:57:23	2017-03-03 19:40:01	t
1230	5441	10	Практика создания товарных знаков	978-5-91657-545-3	Иван  Васильев	http://www.mann-ivanov-ferber.ru/books/paperbook/practice-creating-trademarks/	2017-02-28 17:02:37	2017-03-03 19:40:01	t
930	15640	13	Мозг на пенсии	978-5-00057-793-6	Андре Алеман	http://www.mann-ivanov-ferber.ru/books/mozg-na-pensii/	2017-02-28 17:02:20	2017-03-03 19:39:22	t
945	11970	12	Дом, милый дом	978-5-00057-262-7	Дебора Нидлман	http://www.mann-ivanov-ferber.ru/books/dom_milyj_dom/	2017-02-28 17:02:22	2017-03-03 19:40:02	t
941	12259	10	Нейромаркетинг в действии	978-5-00100-263-5	Дэвид Льюис	http://www.mann-ivanov-ferber.ru/books/mozg_potrebitelya/	2017-02-28 17:02:22	2017-03-03 19:40:03	t
923	16131	11	SUMO	978-5-00100-059-4	Пол Макги	http://www.mann-ivanov-ferber.ru/books/sumo/	2017-02-28 17:02:20	2017-03-03 19:40:03	t
519	18061	11	На пределе. Подарочный комплект	978-5-00057-812-4	Эрик Бертран Ларссен	http://www.mann-ivanov-ferber.ru/books/na-predele-podarochnyij-komplekt/	2017-02-28 16:57:27	2017-03-03 19:40:04	t
928	16130	9	Менеджмент	978-5-00057-954-1	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/management/	2017-02-28 17:02:20	2017-03-03 19:40:05	t
920	18623	9	Бирюзовый подарочный комплект	978-5-00100-413-4	Фредерик Лалу	http://www.mann-ivanov-ferber.ru/books/biryuzovyij_podarochnyij_komplekt/	2017-02-28 17:02:19	2017-03-03 19:40:06	t
921	18413	13	Здоровая, счастливая, сексуальная. Подарочный комплект	978-5-00100-426-4	Кэйти Силкокс	http://www.mann-ivanov-ferber.ru/books/zdorovaya-schastlivaya-seksualnaya-podarochnyij-komplekt/	2017-02-28 17:02:19	2017-03-03 19:40:07	t
507	18415	11	Мечтать не вредно. Подарочный комплект	978-5-00100-609-1	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/mechtat-ne-vredno-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 19:40:07	t
929	15710	11	Обновление	978-5-00057-735-6	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/obnovlenie/	2017-02-28 17:02:20	2017-03-03 19:40:08	t
909	2589	11	Никогда не ешьте в одиночку	978-5-00100-367-0	Кейт Феррацци	http://www.mann-ivanov-ferber.ru/books/mif/nevereatalone/	2017-02-28 16:57:33	2017-03-03 19:40:09	t
953	4259	9	Переговоры без поражения	978-5-00057-969-5	Роджер Фишер	http://www.mann-ivanov-ferber.ru/books/mif/gettingtoyes/	2017-02-28 17:02:23	2017-03-03 19:40:10	t
951	4398	12	Муза, где твои крылья?	978-5-91657-650-4	Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/muse-where-are-your-wings/	2017-02-28 17:02:23	2017-03-03 19:40:12	t
949	9075	15	В поисках себя	978-5-00057-306-8	Жан Беливо	http://www.mann-ivanov-ferber.ru/books/v_poiskah_sebya/	2017-02-28 17:02:22	2017-03-03 19:40:13	t
800	10178	12	Разреши себе творить	978-5-91657-710-5	Натали Ратковски	http://www.mann-ivanov-ferber.ru/books/paperbook/creation/	2017-02-28 16:57:31	2017-03-03 19:40:14	t
764	7355	14	KUMON. Учимся считать от 1 до 30	978-5-00100-384-7	  	http://www.mann-ivanov-ferber.ru/books/children/my-book-numbers-1-30/	2017-02-28 16:57:30	2017-03-03 19:40:14	t
721	10073	13	Китайское исследование	978-5-00057-776-9	Колин Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/healthy_eating/the-china-study/	2017-02-28 16:57:30	2017-03-03 19:40:15	t
879	3501	9	Rework	978-5-00057-930-5	Джейсон Фрайд и Дэвид Хайнемайер Хенссон	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/rework1/	2017-02-28 16:57:32	2017-03-03 19:40:16	t
947	8991	13	Захотела и смогла	978-5-91657-982-6	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/zahotela_i_smogla/	2017-02-28 17:02:22	2017-03-03 19:40:16	t
839	5514	14	Находилки	978-5-00100-400-4	Зина Сурова	http://www.mann-ivanov-ferber.ru/books/children/nahodilki/	2017-02-28 16:57:31	2017-03-03 19:40:17	t
946	5997	15	Камчатка, которую я люблю	978-5-00057-139-2	Игорь Шпиленок	http://www.mann-ivanov-ferber.ru/books/special/backwater-district/	2017-02-28 17:02:22	2017-03-03 19:40:17	t
980	14893	10	Zag	978-5-00057-570-3	Марти Ньюмейер	http://www.mann-ivanov-ferber.ru/books/otlichajtes/	2017-02-28 17:02:28	2017-03-03 19:40:18	t
978	12612	11	Писать профессионально	978-5-00057-672-4	Хиллари Реттиг	http://www.mann-ivanov-ferber.ru/books/ya_pisatel/	2017-02-28 17:02:27	2017-03-03 19:40:19	t
975	15204	9	Работа рулит!	978-5-00057-877-3	Ласло Бок	http://www.mann-ivanov-ferber.ru/books/rabota-rulit/	2017-02-28 17:02:27	2017-03-03 19:40:19	t
201	16910	13	Китайское исследование: простые и быстрые рецепты	978-5-00100-169-0	Дэл Шруф	http://www.mann-ivanov-ferber.ru/books/kitajskoe-issledovanie-prostye-i-bystrye-recepty/	2017-02-28 16:57:22	2017-03-03 19:40:20	t
977	14961	9	Менеджерами не рождаются	978-5-00057-673-1	Денни Стригл	http://www.mann-ivanov-ferber.ru/books/menedzhery-vy-menja-slyshite/	2017-02-28 17:02:27	2017-03-03 19:40:20	t
960	17005	11	Час тишины	978-5-00100-135-5	Дэвид Хорсагер	http://www.mann-ivanov-ferber.ru/books/chas-tishiny/	2017-02-28 17:02:25	2017-03-03 19:40:21	t
966	15692	11	Большая восьмерка	978-5-00057-788-2	Ричард Джон	http://www.mann-ivanov-ferber.ru/books/bolshaya-vosmerka/	2017-02-28 17:02:26	2017-03-03 19:40:22	t
972	15462	9	Убеждение	978-5-00057-707-3	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/ubezhdenie/	2017-02-28 17:02:27	2017-03-03 19:40:22	t
964	15809	9	Искусство стратегии	978-5-00057-932-9	Дэвид Б. Йоффи	http://www.mann-ivanov-ferber.ru/books/iskusstvo-strategii/	2017-02-28 17:02:26	2017-03-03 19:40:23	t
974	15564	14	Транспорт	978-5-00057-637-3	Ален Грэ	http://www.mann-ivanov-ferber.ru/books/transport/	2017-02-28 17:02:27	2017-03-03 19:40:36	t
969	16062	14	Календарь интересных событий	978-5-00057-746-2	Ася Ванякина	http://www.mann-ivanov-ferber.ru/books/kalendar-interesnyh-sobytij/	2017-02-28 17:02:27	2017-03-03 19:40:37	t
292	16667	14	Природа над землей и под землей	978-5-00100-291-8	Анн-Софи Боманн	http://www.mann-ivanov-ferber.ru/books/priroda-nad-zemlej-i-pod-zemlej/	2017-02-28 16:57:23	2017-03-03 19:40:37	t
178	17039	15	13.8. В поисках истинного возраста Вселенной и теории всего	978-5-00100-205-5	Джон Гриббин	http://www.mann-ivanov-ferber.ru/books/138-v-poiskah-istinnogo-vozrasta-vselennoj-i-teorii-vsego/	2017-02-28 16:57:21	2017-03-03 19:40:38	t
261	15863	15	Интеллектуальный инсульт	978-5-00100-022-8	Кирилл Николаев	http://www.mann-ivanov-ferber.ru/books/intellektualnyj-insult/	2017-02-28 16:57:23	2017-03-03 19:40:39	t
967	18011	14	Маленькому Чевостику. Подарочный комплект		Елена Качур	http://www.mann-ivanov-ferber.ru/books/malenkomu-chevostiku/	2017-02-28 17:02:27	2017-03-03 19:40:39	t
681	11284	14	Занималки. Лето	978-5-00057-136-1	Зина Сурова	http://www.mann-ivanov-ferber.ru/books/zanimalki_leto/	2017-02-28 16:57:29	2017-03-03 19:40:40	t
961	16805	9	Рекрутинг на 100%	978-5-00100-109-6	Ильгиз Валинуров	http://www.mann-ivanov-ferber.ru/books/rekruting-na-100/	2017-02-28 17:02:25	2017-03-03 19:40:51	t
962	16452	11	Мир в каждом шаге	978-5-00100-078-5	Тит Нат Хан	http://www.mann-ivanov-ferber.ru/books/mir-v-kazhdom-shage/	2017-02-28 17:02:26	2017-03-03 19:40:51	t
970	15638	11	Дышите свободно	978-5-00057-774-5	Мелва Грин	http://www.mann-ivanov-ferber.ru/books/dyshite-svobodno/	2017-02-28 17:02:27	2017-03-03 19:40:52	t
109	17931	14	Ежедневник SelfMama	978-5-00100-297-0	Оксана Татарина	http://www.mann-ivanov-ferber.ru/books/ezhednevnik-selfmama/	2017-02-28 16:57:20	2017-03-03 19:40:09	t
959	17748	5	Блокнот для записей МИФа (желтый)	978-5-00100-206-2	  	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-zapisej-mifa-zheltyij/	2017-02-28 17:02:24	2017-03-03 19:40:53	t
955	2840	11	Я слышу вас насквозь	978-5-00100-665-7	Марк Гоулстон	http://www.mann-ivanov-ferber.ru/books/mif/justlisten/	2017-02-28 17:02:23	2017-03-03 19:40:54	t
948	10536	9	Remote. Офис не обязателен	978-500057-038-8	Джейсон Фрайд и Дэвид Хайнемайер Хенссон	http://www.mann-ivanov-ferber.ru/books/paperbook/remote-office-not-required/	2017-02-28 17:02:22	2017-03-03 19:40:12	t
1021	7898	9	Продажи большим компаниям	978-5-91657-901-7	Джил Конрат	http://www.mann-ivanov-ferber.ru/books/mif/selling-big-companies/	2017-02-28 17:02:32	2017-03-03 19:40:55	t
984	14755	15	Аристотель для всех	978-5-00057-519-2	Мортимер Адлер	http://www.mann-ivanov-ferber.ru/books/aristotel-dlya-vseh/	2017-02-28 17:02:28	2017-03-03 19:40:56	t
1033	6709	12	Гениальность на заказ		Марк Леви	http://www.mann-ivanov-ferber.ru/books/mif/accidental-genius/	2017-02-28 17:02:32	2017-03-03 19:40:56	t
1029	7199	15	Эта странная жизнь	978-5-91657-834-8	Даниил Гранин	http://www.mann-ivanov-ferber.ru/books/paperbook/life/	2017-02-28 17:02:32	2017-03-03 19:40:57	t
771	8588	11	Эмоциональный интеллект. Российская практика	978-5-00057-872-8	Сергей Шабанов	http://www.mann-ivanov-ferber.ru/books/psychologies/russian-practice/	2017-02-28 16:57:30	2017-03-03 19:40:57	t
1031	6197	9	Обнимите своих сотрудников	978-5-91657-739-6	Джек  Митчелл	http://www.mann-ivanov-ferber.ru/books/mif/hug-your-people/	2017-02-28 17:02:32	2017-03-03 19:40:58	t
1028	7472	9	Нешаблонное мышление	 978-5-91657-833-1	Джон О'Кифф	http://www.mann-ivanov-ferber.ru/books/mif/business-beyond-box/	2017-02-28 17:02:32	2017-03-03 19:40:59	t
985	14477	12	Твори целый день	978-5-00057-511-6	Лиза Конгдон	http://www.mann-ivanov-ferber.ru/books/tvorchestvo-eto-rabota/	2017-02-28 17:02:28	2017-03-03 19:40:55	t
1025	7628	9	Чемпионы продаж	978-5-91657-851-5	Мэттью Диксон	http://www.mann-ivanov-ferber.ru/books/mif/challenger-sale/	2017-02-28 17:02:32	2017-03-03 19:41:00	t
1019	6495	9	Путь истинного лидера	978-5-91657-952-9	Его Святейшество Далай-лама XIV	http://www.mann-ivanov-ferber.ru/books/put-istinnogo-lidera/	2017-02-28 17:02:31	2017-03-03 19:41:00	t
572	18096	11	Книга Ленивого Гуру. Подарочный комплект		Лоуренс Шортер	http://www.mann-ivanov-ferber.ru/books/kniga-lenivogo-guru-podarochnyj-komplekt/	2017-02-28 16:57:27	2017-03-03 19:41:01	t
1023	7844	14	Хулиганская тетрадь	978-5-91657-859-1	Ника Дубровская	http://www.mann-ivanov-ferber.ru/books/children/hooligan-book/	2017-02-28 17:02:32	2017-03-03 19:41:01	t
1016	8421	11	Мастерство общения	 978-500057-022-7	Пол Макги	http://www.mann-ivanov-ferber.ru/books/mif/how-succeed-people/	2017-02-28 17:02:31	2017-03-03 19:41:02	t
1014	10018	10	Продающее письмо	978-5-91657-921-5	Дэн Кеннеди	http://www.mann-ivanov-ferber.ru/books/prodayuschee_pismo/	2017-02-28 17:02:31	2017-03-03 19:41:02	t
1009	10151	9	Мотивация	 978-5-00057-100-2	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/motivacija/	2017-02-28 17:02:31	2017-03-03 19:41:03	t
1008	11133	11	Подарок моря	978-5-00057-153-8	Энн-Морроу Линдберг	http://www.mann-ivanov-ferber.ru/books/podarok_morya/	2017-02-28 17:02:31	2017-03-03 19:41:04	t
1022	4217	13	Правила долголетия	978-5-91657-929-1	Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/paperbook/thebluezones/	2017-02-28 17:02:32	2017-03-03 19:41:04	t
1004	10407	11	Непобедимый разум	978-5-00057-184-2	Алекс Ликерман	http://www.mann-ivanov-ferber.ru/books/nepobedimyj_razum/	2017-02-28 17:02:30	2017-03-03 19:41:05	t
1716	5471	9	Еженедельник успешных продаж	978-5-91657-597-2	 Николай Мрочковский	http://www.mann-ivanov-ferber.ru/books/special/weekly-sales-success/	2017-03-02 13:26:29	2017-03-03 19:41:05	t
1007	10251	15	Наука сна	978-5-00057-189-7	Дэвид Рэндалл	http://www.mann-ivanov-ferber.ru/books/nauka_sna/	2017-02-28 17:02:30	2017-03-03 19:41:06	t
666	10258	9	Утерянное искусство красноречия	 978-5-00057-138-5	Ричард Доуиз	http://www.mann-ivanov-ferber.ru/books/uteryannoe_iskusstvo_krasnorechiya/	2017-02-28 16:57:29	2017-03-03 19:41:06	t
989	11140	9	Эмоциональный интеллект в переговорах	978-5-00057-366-2	Роджер Фишер	http://www.mann-ivanov-ferber.ru/books/emocii_v_peregovorah/	2017-02-28 17:02:29	2017-03-03 19:41:07	t
1001	10403	12	Рисуй каждый день	978-5-00057-232-0	Натали Ратковски	http://www.mann-ivanov-ferber.ru/books/odin_god_s_natali/	2017-02-28 17:02:30	2017-03-03 19:41:08	t
1000	10469	12	Кино без бюджета	978-5-00057-206-1	Роберт Родригес	http://www.mann-ivanov-ferber.ru/books/kino_bez_budzheta/	2017-02-28 17:02:29	2017-03-03 19:41:09	t
992	12814	11	Мозг: краткое руководство	978-5-00057-368-6	Джек Льюис	http://www.mann-ivanov-ferber.ru/books/vash_mozg_mozhet_bolshe/	2017-02-28 17:02:29	2017-03-03 19:41:10	t
1012	10563	12	Как быть интересным	978-5-00057-142-2	Джессика Хэги	http://www.mann-ivanov-ferber.ru/books/kak_stat_interesnym/	2017-02-28 17:02:31	2017-03-03 19:41:10	t
1002	12089	14	Большая книга Мыши	978-5-00057-113-2	Люси Казенс	http://www.mann-ivanov-ferber.ru/books/bolshaya_kniga_mishi/	2017-02-28 17:02:30	2017-03-03 19:41:10	t
1006	12215	14	Поиграем?!	978-5-00057-158-3	  	http://www.mann-ivanov-ferber.ru/books/poigraem_4_5_6/	2017-02-28 17:02:30	2017-03-03 19:41:11	t
1015	10287	11	Стрессоустойчивость	978-5-91657-951-2	Шэрон Мельник	http://www.mann-ivanov-ferber.ru/books/paperbook/success-under-stress/	2017-02-28 17:02:31	2017-03-03 19:41:11	t
998	12250	11	Максимальная концентрация	978-5-00057-289-4	Люси Джо Палладино	http://www.mann-ivanov-ferber.ru/books/maksimalnaya_koncentraciya/	2017-02-28 17:02:29	2017-03-03 19:41:12	t
994	11514	15	Искусство чтения	978-5-00057-331-0	Томас Фостер	http://www.mann-ivanov-ferber.ru/books/chitaj_kak_professor/	2017-02-28 17:02:29	2017-03-03 19:41:13	t
991	11710	11	Развитие памяти	978-5-00057-315-0	Гарри Лорейн	http://www.mann-ivanov-ferber.ru/books/razvitie_pamyati/	2017-02-28 17:02:29	2017-03-03 19:41:14	t
986	13273	15	Гимнастика души	978-5-00057-361-7	Владимир Шахиджанян	http://www.mann-ivanov-ferber.ru/books/gimnastika_dushi/	2017-02-28 17:02:29	2017-03-03 19:41:14	t
996	14328	14	365 дней вместе	978-5-00057-291-7	Юлия Луговская	http://www.mann-ivanov-ferber.ru/books/365_dnej_vmeste/	2017-02-28 17:02:29	2017-03-03 19:41:15	t
817	6020	14	Зоки и Бада. Сладкие рецепты	978-5-91657-788-4 	Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/recipes/	2017-02-28 16:57:31	2017-03-03 19:41:16	t
1101	12577	13	Бегайте быстрее, дольше и без травм	978-5-00057-392-1	Николай Романов	http://www.mann-ivanov-ferber.ru/books/beg_na_vsyu_zhizn/	2017-02-28 17:02:35	2017-03-03 19:41:30	t
1082	16136	15	Почему E=mc²?	978-5-00057-950-3	Брайан Кокс	http://www.mann-ivanov-ferber.ru/books/pochemu-emc2/	2017-02-28 17:02:34	2017-03-03 19:41:30	t
1067	14392	10	Фидбэк	978-5-00057-404-1	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/fidbek/	2017-02-28 17:02:34	2017-03-03 19:41:31	t
1079	2930	10	Фиолетовая корова	978-5-00057-990-9	Сет Годин	http://www.mann-ivanov-ferber.ru/books/mif/purplecow/	2017-02-28 17:02:34	2017-03-03 19:41:33	t
1054	3152	13	Железный человек есть в каждом	978-5-91657-783-9	Джон Кэллос	http://www.mann-ivanov-ferber.ru/books/sport/ironman/	2017-02-28 17:02:34	2017-03-03 19:41:34	t
1051	3728	9	Ключевые переговоры	978-5-91657-315-2	Керри Паттерсон	http://www.mann-ivanov-ferber.ru/books/mif/conversationstools/	2017-02-28 17:02:33	2017-03-03 19:41:34	t
1058	2376	\N	Компании, которые изменили мир		Джонатан Мэнтл	http://www.mann-ivanov-ferber.ru/books/special/companies/	2017-02-28 17:02:34	2017-03-03 19:41:31	t
1075	3244	9	Эффективный руководитель	978-5-00100-627-5	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/paperbook/theeffectiveexecutive/	2017-02-28 17:02:34	2017-03-03 19:41:35	t
1048	5457	10	Хороший год	978-5-91657-275-9	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/special/good-year/	2017-02-28 17:02:33	2017-03-03 19:41:36	t
1076	4060	9	Первые 90 дней	978-5-00100-613-8	Майкл Уоткинс	http://www.mann-ivanov-ferber.ru/books/mif/firstdays/	2017-02-28 17:02:34	2017-03-03 19:41:37	t
1046	3889	9	Привлечение инвестиций в стартап	978-5-91657-307-7	Брэд  Фелд	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/besmarter/	2017-02-28 17:02:33	2017-03-03 19:41:38	t
1074	4927	11	Бла-бла-бла	978-5-91657-408-1	Дэн Роэм	http://www.mann-ivanov-ferber.ru/books/paperbook/blahblahblah/	2017-02-28 17:02:34	2017-03-03 19:41:38	t
1045	4642	9	Мечтай, создавай, изменяй!	 978-5-91657-407-4	 Сара Лейси	http://www.mann-ivanov-ferber.ru/books/paperbook/brilliant-crazy-cocky/	2017-02-28 17:02:33	2017-03-03 19:41:39	t
1073	3935	9	Слон на танцполе	978-5-91657-586-6	 Евгений Карасюк	http://www.mann-ivanov-ferber.ru/books/paperbook/slon/	2017-02-28 17:02:34	2017-03-03 19:41:40	t
1104	15058	13	Голубые зоны	978-5-00057-567-3	Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/golubye-zony/	2017-02-28 17:02:35	2017-03-03 19:41:41	t
1063	17944	9	Неприятие перемен	978-5-00100-615-2	Роберт Киган	http://www.mann-ivanov-ferber.ru/books/nepriyatie-peremen/	2017-02-28 17:02:34	2017-03-03 19:41:41	t
1070	6577	14	Веселые отпечатки	978-5-91657-789-1	Эд Эмберли	http://www.mann-ivanov-ferber.ru/books/children/drawing-book/	2017-02-28 17:02:34	2017-03-03 19:41:42	t
1098	15116	9	Проактивные продажи	978-5-00057-582-6	Альберт Тютин	http://www.mann-ivanov-ferber.ru/books/proaktivnye-prodazhi/	2017-02-28 17:02:34	2017-03-03 19:41:42	t
1106	14436	15	Гармония волны		Никита Замеховский-Мегалокарди	http://www.mann-ivanov-ferber.ru/books/garmoniya-volni/	2017-02-28 17:02:35	2017-03-03 19:41:43	t
1068	16372	12	Выходит продюсер	978-5-91657-721-1	Александр Роднянский	http://www.mann-ivanov-ferber.ru/books/paperbook/vyhodit-prodyuser/	2017-02-28 17:02:34	2017-03-03 19:41:17	t
1107	13070	10	Маркетинг без диплома	978-5-00057-464-5	Джон Янч	http://www.mann-ivanov-ferber.ru/books/prikladnoj_marketing/	2017-02-28 17:02:35	2017-03-03 19:41:43	t
1103	14872	9	Всемирная история кадровой индустрии	978-5-00057-595-6	Татьяна Баскина	http://www.mann-ivanov-ferber.ru/books/vsemirnaja-istorija-kadrovoj-industrii/	2017-02-28 17:02:35	2017-03-03 19:41:55	t
1089	16095	15	Открытия, которые изменили мир	978-5-00057-869-8	Джон Кейжу	http://www.mann-ivanov-ferber.ru/books/otkrytiya-kotorye-izmenili-mir/	2017-02-28 17:02:34	2017-03-03 19:41:56	t
1094	15114	13	Другой ты!	978-5-00057-599-4	Валихан Тен	http://www.mann-ivanov-ferber.ru/books/different-you/	2017-02-28 17:02:34	2017-03-03 19:41:57	t
1044	5235	13	Правила долголетия	978-5-91657-550-7	Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/special/regulation-longevity/	2017-02-28 17:02:33	2017-03-03 19:41:58	t
1087	16346	11	Новый год прокрастинатора	978-5-00057-775-2	Эс Джей Скотт	http://www.mann-ivanov-ferber.ru/books/novyj-god-prokrastinatora/	2017-02-28 17:02:34	2017-03-03 19:41:58	t
1092	17615	9	Во главе трансформации		Гарри Грувер	http://www.mann-ivanov-ferber.ru/books/vo-glave-transformaczii/	2017-02-28 17:02:34	2017-03-03 19:41:59	t
1085	15892	9	Полная вовлеченность	978-5-00057-941-1	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/polnaya-vovlechennost/	2017-02-28 17:02:34	2017-03-03 19:42:00	t
1072	5286	9	Великие по собственному выбору	978-5-00100-499-8	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/paperbook/great-choice/	2017-02-28 17:02:34	2017-03-03 19:42:00	t
1055	3146	13	Бег с Лидьярдом	978-5-00100-266-6	Артур Лидьярд	http://www.mann-ivanov-ferber.ru/books/sport/lydiard/	2017-02-28 17:02:34	2017-03-03 19:42:01	t
1099	14970	9	Управление в эпоху кризиса	978-5-00057-618-2	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/upravlenie-v-jepohu-krizisa/	2017-02-28 17:02:34	2017-03-03 19:42:09	t
1097	17481	12	Кеды и кроссовки		Дэниел Джерош и Хенрик Клингел	http://www.mann-ivanov-ferber.ru/books/kedyi-i-krossovki/	2017-02-28 17:02:34	2017-03-03 19:42:09	t
1061	1684	9	Война за таланты	978-5-91657-286-5	Эд Майклз	http://www.mann-ivanov-ferber.ru/books/mif/003/	2017-02-28 17:02:34	2017-03-03 19:42:10	t
952	5485	11	Визуальное мышление	 978-5-91657-587-3	Дэн Роэм	http://www.mann-ivanov-ferber.ru/books/paperbook/back-napkin/	2017-02-28 17:02:23	2017-03-03 19:42:10	t
1083	11291	9	Элементы власти		Терри Бэкон	http://www.mann-ivanov-ferber.ru/books/elementi_vlasti/	2017-02-28 17:02:34	2017-03-03 19:42:21	t
1086	15522	9	Вместо MBA	978-5-00057-699-1	Джек Уэлч	http://www.mann-ivanov-ferber.ru/books/vmesto-mba/	2017-02-28 17:02:34	2017-03-03 19:42:22	t
1152	9526	9	Комплект «Лучшая практика по стратегии»	978-5-91657-991-8	Чан Ким и Рене Моборн	http://www.mann-ivanov-ferber.ru/books/luchaya_praktika_po_stratigii/	2017-02-28 17:02:35	2017-03-03 19:42:23	t
1163	8354	10	Основа убеждений	978-5-91657-894-2	Том Асакер	http://www.mann-ivanov-ferber.ru/books/paperbook/the-business-of-belief/	2017-02-28 17:02:35	2017-03-03 19:42:24	t
1165	8931	13	Плыть, ехать, бежать	978-5-91657-993-2	Алистер Браунли	http://www.mann-ivanov-ferber.ru/books/plyt_ehat_bezhat/	2017-02-28 17:02:35	2017-03-03 19:42:24	t
1167	8442	9	Patagonia – бизнес в стиле серфинг	978-5-91657-931-4	Ивон Шуинар	http://www.mann-ivanov-ferber.ru/books/paperbook/let-my-people-go-surfing/	2017-02-28 17:02:36	2017-03-03 19:42:25	t
1169	9339	14	Книги!	978-5-91657-937-6	Маррей Маккейн	http://www.mann-ivanov-ferber.ru/books/children/knigi/	2017-02-28 17:02:36	2017-03-03 19:42:25	t
1136	11191	11	Никаких ограничений	978-5-00057-253-5	Джо Витале	http://www.mann-ivanov-ferber.ru/books/nikakih_ogranichenij/	2017-02-28 17:02:35	2017-03-03 19:42:26	t
1133	10277	11	Ваше предназначение	978-5-00057-149-1	Роберт Стивен Каплан	http://www.mann-ivanov-ferber.ru/books/vashe_prednaznachenie/	2017-02-28 17:02:35	2017-03-03 19:42:26	t
1112	16948	14	KUMON на украинском языке. Учимся клеить	978-5-00057-852-0	  	http://www.mann-ivanov-ferber.ru/books/kumon-na-ukrainskom-yazyke-uchimsya-kleit/	2017-02-28 17:02:35	2017-03-03 19:42:36	t
1168	7463	11	Мастер вождения автомобиля	978-5-91657-867-6	Александр Каминский	http://www.mann-ivanov-ferber.ru/books/paperbook/driving/	2017-02-28 17:02:36	2017-03-03 19:42:36	t
1174	8775	14	Эксперименты профессора Николя	978-5-91657-934-5	Николай Ганайлюк	http://www.mann-ivanov-ferber.ru/books/experimenty_doktora_nikola/	2017-02-28 17:02:36	2017-03-03 19:42:37	t
1173	7488	14	Ваш ребенок может все	978-5-91657-142-4	Пэг Доусон	http://www.mann-ivanov-ferber.ru/books/paperbook/smart-scattered/	2017-02-28 17:02:36	2017-03-03 19:42:37	t
1157	9522	9	Комплект «Ключевые навыки»	978-5-91657-986-4	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/kluchevie_naviki/	2017-02-28 17:02:35	2017-03-03 19:42:38	t
1160	8150	15	Инфографика	78-5-91657-904-8	Мартин Тоузленд	http://www.mann-ivanov-ferber.ru/books/paperbook/infographica/	2017-02-28 17:02:35	2017-03-03 19:42:39	t
1156	9523	9	Комплект «Осуществление желаний»	978-5-91657-992-5	Джо Витале	http://www.mann-ivanov-ferber.ru/books/osushestvlenie_zhelaniy/	2017-02-28 17:02:35	2017-03-03 19:42:47	t
1144	11448	9	И ботаники делают бизнес - 2	978-5-00057-165-1	Максим Котин	http://www.mann-ivanov-ferber.ru/books/i_botaniki_delayut_biznes_2/	2017-02-28 17:02:35	2017-03-03 19:42:48	t
1146	10947	9	12 недель в году	978-5-00057-143-9	Брайан Моран	http://www.mann-ivanov-ferber.ru/books/12_nedel_v_godu/	2017-02-28 17:02:35	2017-03-03 19:42:48	t
1137	10843	11	Искусство учиться	978-5-00057-212-2	Джош Вайцкин	http://www.mann-ivanov-ferber.ru/books/iskusstvo_obuchenija/	2017-02-28 17:02:35	2017-03-03 19:42:49	t
1143	10256	11	Территория заблуждений	 978-5-00057-120-0	Рольф Добелли	http://www.mann-ivanov-ferber.ru/books/territoriya_zabluzhdeniy/	2017-02-28 17:02:35	2017-03-03 19:42:49	t
1142	10264	15	Пир Льда и Огня	978-5-00057-123-1	Челси Монро-Кассель и Сариэн Лерер	http://www.mann-ivanov-ferber.ru/books/pir_lda_i_ognya/	2017-02-28 17:02:35	2017-03-03 19:42:50	t
1151	7809	15	Сможет ли Россия конкурировать?	978-5-91657-903-1	Лорен Грэхэм	http://www.mann-ivanov-ferber.ru/books/paperbook/lonely-ideas-can-russia-compete/	2017-02-28 17:02:35	2017-03-03 19:42:50	t
1124	11761	15	AirPano: мир с высоты	978-5-00057-275-7	AirPano	http://www.mann-ivanov-ferber.ru/books/luchshie_fotografii_airpano/	2017-02-28 17:02:35	2017-03-03 19:42:51	t
1140	10361	15	Сёрф-сказки	978-5-00057-107-1	Никита Замеховский-Мегалокарди	http://www.mann-ivanov-ferber.ru/books/surf_skazki/	2017-02-28 17:02:35	2017-03-03 19:42:52	t
1123	11430	9	Профессиональный девелопмент недвижимости	978-5-00057-327-3	Ричард Пейзер	http://www.mann-ivanov-ferber.ru/books/professionalnyj_development_nedvizhimosti/	2017-02-28 17:02:35	2017-03-03 19:42:52	t
1125	14303	15	Всё простое — правда...	978-5-00057-310-5	  	http://www.mann-ivanov-ferber.ru/books/vse_prostoe_pravda/	2017-02-28 17:02:35	2017-03-03 19:43:05	t
1128	14290	14	Нескучалка. Календарь 2015	978-5-00057-290-0	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/neskuchalka_kalendar/	2017-02-28 17:02:35	2017-03-03 19:43:15	t
1132	8692	14	Замечательный календарь 2015	978-5-00057-235-1	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/children/calendar/	2017-02-28 17:02:35	2017-03-03 19:43:16	t
1127	13063	14	Как все успеть	978-5-00057-258-0	Марина Ярославцева	http://www.mann-ivanov-ferber.ru/books/kak_vse_uspet/	2017-02-28 17:02:35	2017-03-03 19:43:16	t
1121	11120	13	Соль, сахар и жир	978-5-00057-323-5	Майкл Мосс	http://www.mann-ivanov-ferber.ru/books/paperbook/sol-sahar-i-zhir/	2017-02-28 17:02:35	2017-03-03 19:43:17	t
1120	11231	12	Рисуйте свободно!	978-5-00057-269-6	Барбара Дайан Берри	http://www.mann-ivanov-ferber.ru/books/risujte_svobodno/	2017-02-28 17:02:35	2017-03-03 19:43:18	t
1114	16938	14	KUMON на украинском языке. Простые лабиринты	978-5-00057-546-8	  	http://www.mann-ivanov-ferber.ru/books/kumon-na-ukrainskom-yazyke-prostye-labirinty/	2017-02-28 17:02:35	2017-03-03 19:43:27	t
1117	11915	11	Депрессия отменяется	978-5-00057-413-3	Ричард О’Коннор	http://www.mann-ivanov-ferber.ru/books/depressiya_otmenyaetsya/	2017-02-28 17:02:35	2017-03-03 19:43:28	t
1130	8734	14	Зубная книга	978-5-91657-955-0	Ивона Радюнц	http://www.mann-ivanov-ferber.ru/books/children/das-wackelzahnbuch/	2017-02-28 17:02:35	2017-03-03 19:43:34	t
1116	11925	10	Бери и делай!	978-5-00057-402-7	Дэвид Ньюман	http://www.mann-ivanov-ferber.ru/books/marketing_bez_lishnix_slov/	2017-02-28 17:02:35	2017-03-03 19:43:34	t
1147	9032	11	Разожги огонь!	978-500057-039-5	Даниэлла Лапорт	http://www.mann-ivanov-ferber.ru/books/razgovory_u_kostra/	2017-02-28 17:02:35	2017-03-03 19:43:06	t
1171	9262	14	Звучание цвета	978-500057-016-6	Джимми Лиао	http://www.mann-ivanov-ferber.ru/books/children/zvuchanie-cveta/	2017-02-28 17:02:36	2017-03-03 19:43:35	t
1154	9521	9	Комплект «Сделай себя сам»	978-5-91657-985-7	Тина  Силиг	http://www.mann-ivanov-ferber.ru/books/sdelai_sebya_sam/	2017-02-28 17:02:35	2017-03-03 19:42:22	t
1238	7015	11	Ваша группа поддержки	978-5-91657-766-2	Кейт Феррацци	http://www.mann-ivanov-ferber.ru/books/mif/support/	2017-02-28 17:02:37	2017-03-03 19:43:36	t
1233	7398	9	Вау!-проекты. Преврати себя в бренд (комплект из 2 книг)		Том Питерс	http://www.mann-ivanov-ferber.ru/books/special/set7/	2017-02-28 17:02:37	2017-03-03 19:43:36	t
1198	14271	11	Секрет притяжения	978-5-00057-188-0	Джо Витале	http://www.mann-ivanov-ferber.ru/books/sekret_prityazheniya/	2017-02-28 17:02:36	2017-03-03 19:43:35	t
1231	7400	13	Библия велосипедиста. Секреты быстрого плавания. Позный метод бега (комплект из 3 книг)		Джо Фрил	http://www.mann-ivanov-ferber.ru/books/special/set9/	2017-02-28 17:02:37	2017-03-03 19:43:47	t
1220	7225	11	Гибкое сознание	978-5-91657-822-5	Кэрол Дуэк	http://www.mann-ivanov-ferber.ru/books/mif/mindset/	2017-02-28 17:02:36	2017-03-03 19:43:47	t
1179	8419	15	Истории про еду с рисунками и рецептами автора	978-5-91657-876-8	Андрей Бильжо	http://www.mann-ivanov-ferber.ru/books/paperbook/eda/	2017-02-28 17:02:36	2017-03-03 19:43:59	t
1241	7003	9	Искусство заключать сделки	978-5-91657-778-5	Дональд Трамп	http://www.mann-ivanov-ferber.ru/books/paperbook/trump/	2017-02-28 17:02:37	2017-03-03 19:44:03	t
1239	6445	15	Прототипирование	978-5-91657-725-9	Тодд Заки Варфел	http://www.mann-ivanov-ferber.ru/books/rosenfeld/prototyping/	2017-02-28 17:02:37	2017-03-03 19:44:03	t
1299	5196	9	Стартап за $100	978-5-91657-541-5	Крис Гильбо	http://www.mann-ivanov-ferber.ru/books/paperbook/100-startup/	2017-02-28 17:02:38	2017-03-03 19:52:30	t
1224	7211	15	Новый цифровой мир	978-5-91657-824-9	Эрик Шмидт	http://www.mann-ivanov-ferber.ru/books/paperbook/the-new-digital-age/	2017-02-28 17:02:36	2017-03-03 19:44:04	t
1215	6860	14	Лучшие города мира	 978-5-91657-795-2	Уоррен Элсмор	http://www.mann-ivanov-ferber.ru/books/children/brick_city/	2017-02-28 17:02:36	2017-03-03 19:44:24	t
1199	2094	9	Инструменты McKinsey	978-5-902862-56-7	Итан Расиел	http://www.mann-ivanov-ferber.ru/books/instrumenty_mckinsey/	2017-02-28 17:02:36	2017-03-03 19:44:25	t
1237	7018	9	Правила эффективного лидерства	978-5-91657-794-5 	Стивен Кови	http://www.mann-ivanov-ferber.ru/books/paperbook/predictable-results/	2017-02-28 17:02:37	2017-03-03 19:44:25	t
1236	6401	13	Естественный бег	978-5-91657-782-2 	Дэнни Эбшир	http://www.mann-ivanov-ferber.ru/books/sport/natural-running/	2017-02-28 17:02:37	2017-03-03 19:44:26	t
1208	5493	9	Все о распределении активов	978-5-91657-736-5	Ричард  Ферри	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/vse-o-rspr-aktivov/	2017-02-28 17:02:36	2017-03-03 19:44:36	t
1222	7340	9	Управление для тех, кто не любит управлять	978-5-91657-810-2	Девора Зак	http://www.mann-ivanov-ferber.ru/books/paperbook/managing-for-people-who-hate-managing/	2017-02-28 17:02:36	2017-03-03 19:44:36	t
1187	14399	10	Интернет-маркетинг	978-5-699-54355-7	Федор Вирин	http://www.mann-ivanov-ferber.ru/books/internet-marketing/	2017-02-28 17:02:36	2017-03-03 17:03:51	t
1219	7550	11	Психология личной эффективности	 978-5-91657-765-5	Нейл Фьоре	http://www.mann-ivanov-ferber.ru/books/mif/now-habit-work/	2017-02-28 17:02:36	2017-03-03 19:51:41	t
1186	8302	11	Психология богатства	978-5-91657-947-5	Саидмурод Давлатов	http://www.mann-ivanov-ferber.ru/books/paperbook/psychology-wealth/	2017-02-28 17:02:36	2017-03-03 19:51:42	t
1188	9123	14	Ежедневник счастливой мамы		Зарина Ивантер	http://www.mann-ivanov-ferber.ru/books/ezhednevnik-schastlivoi-mamy_2/	2017-02-28 17:02:36	2017-03-03 19:51:43	t
1183	7636	11	Сила воли	978-5-91657-839-3	Келли Макгонигал	http://www.mann-ivanov-ferber.ru/books/golden_library/thewillpowerinstinct/	2017-02-28 17:02:36	2017-03-03 19:51:43	t
1193	8996	14	В мире жуков. Про хвосты, носы и уши		Стив Дженкинс	http://www.mann-ivanov-ferber.ru/books/set15/	2017-02-28 17:02:36	2017-03-03 19:51:48	t
1207	9044	13	Правила долголетия	978-5-91657-929-1	Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/pravila_dolgoletiya_leather/	2017-02-28 17:02:36	2017-03-03 19:51:49	t
1205	7484	14	Правила счастливых семей	978-5-91657-916-1	Джон Миллер	http://www.mann-ivanov-ferber.ru/books/paperbook/parenting-qbq-way/	2017-02-28 17:02:36	2017-03-03 19:51:49	t
1197	7387	15	Великий переход	978-5-91657-892-8	Николас Карр	http://www.mann-ivanov-ferber.ru/books/paperbook/big-switch/	2017-02-28 17:02:36	2017-03-03 19:51:50	t
1210	7581	15	Правила Черчилля	978-5-91657-855-3	Джеймс  Хьюмс	http://www.mann-ivanov-ferber.ru/books/secrets_of_the_great/the-wit-wisdom-of-winston-churchill/	2017-02-28 17:02:36	2017-03-03 19:51:51	t
1192	8997	14	Увлекательная физика. Если хочешь быть здоров		Елена Качур	http://www.mann-ivanov-ferber.ru/books/set16/	2017-02-28 17:02:36	2017-03-03 19:51:51	t
1211	7346	15	Кванты	978-5-91657-848-5	Скотт Паттерсон	http://www.mann-ivanov-ferber.ru/books/paperbook/the-quants/	2017-02-28 17:02:36	2017-03-03 19:51:52	t
1201	8923	11	Карьера для интровертов. Интроверты		Нэнси Энковиц	http://www.mann-ivanov-ferber.ru/books/set13/	2017-02-28 17:02:36	2017-03-03 19:51:53	t
1229	6705	15	Развязка	978-5-91657-761-7	Джон Молдин	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/endgame/	2017-02-28 17:02:37	2017-03-03 19:51:53	t
1181	8237	9	Бизнес с душой	978-5-91657-935-2	Том Эренфельд	http://www.mann-ivanov-ferber.ru/books/paperbook/the-startup-garden/	2017-02-28 17:02:36	2017-03-03 19:51:54	t
1204	8920	14	Веселые отпечатки. Животные (комплект из двух книг)		Эд Эмберли	http://www.mann-ivanov-ferber.ru/books/set10/	2017-02-28 17:02:36	2017-03-03 19:52:04	t
1297	5320	11	Путь к процветанию	978-5-91657-605-4	Мартин Селигман	http://www.mann-ivanov-ferber.ru/books/psychologies/flourish/	2017-02-28 17:02:38	2017-03-03 19:52:19	t
1295	5242	10	Платформа: как стать заметным в Интернете	978-5-91657-601-6	Хайятт Майкл	http://www.mann-ivanov-ferber.ru/books/paperbook/platform/	2017-02-28 17:02:38	2017-03-03 19:52:27	t
1286	5498	9	Deadline. Управление проектами (комплект из 2 книг)		Том ДеМарко	http://www.mann-ivanov-ferber.ru/books/special/komplekt-upravleniedeadline/	2017-02-28 17:02:37	2017-03-03 19:52:27	t
1272	5473	14	Всякие вкусности. Альбом для развития креативности	978-5-91657-647-4	Таро Гоми	http://www.mann-ivanov-ferber.ru/books/children/yummy-doodles-place-mats/	2017-02-28 17:02:37	2017-03-03 19:52:28	t
1293	4847	9	Процессный подход к управлению	978-5-91657-554-5	Владимир Репин	http://www.mann-ivanov-ferber.ru/books/paperbook/the-process-approach-to-management/	2017-02-28 17:02:37	2017-03-03 19:52:28	t
1282	5118	15	Трафик	978-5-91657-613-9	Том Вандербильт	http://www.mann-ivanov-ferber.ru/books/paperbook/traffic/	2017-02-28 17:02:37	2017-03-03 19:52:19	t
1302	4848	10	Стимулирование продаж	978-5-91657-427-2	Родди Маллин	http://www.mann-ivanov-ferber.ru/books/paperbook/sales-promotion/	2017-02-28 17:02:38	2017-03-03 19:52:29	t
1243	6443	9	Ключевые идеи. Майкл Портер	 978-5-91657-758-7	Джоан Магретта	http://www.mann-ivanov-ferber.ru/books/paperbook/understanding-michael-porter/	2017-02-28 17:02:37	2017-03-03 19:52:30	t
1227	6800	\N	Контентная стратегия для мобильных устройств	978-5-91657-802-7	Карен Макгрейн	http://www.mann-ivanov-ferber.ru/books/book-apart/content-strategy-for-mobile/	2017-02-28 17:02:37	2017-03-03 19:44:04	t
1304	5171	10	Сторителлинг	978-5-91657-507-1	Аннет Симмонс	http://www.mann-ivanov-ferber.ru/books/paperbook/storytelling/	2017-02-28 17:02:38	2017-03-03 19:52:31	t
1280	5474	13	Рожденный бежать	978-5-91657-454-8	 Кристофер Макдугл	http://www.mann-ivanov-ferber.ru/books/sport/born-run/	2017-02-28 17:02:37	2017-03-03 19:52:40	t
1276	5461	9	Starbucks навсегда	978-5-91657-677-1	 Говард Шульц при участии Джоанны Гордон	http://www.mann-ivanov-ferber.ru/books/paperbook/onward/	2017-02-28 17:02:37	2017-03-03 19:52:40	t
1285	8451	11	Проактивное мышление	 978-5-91657-977-2	Джон Миллер	http://www.mann-ivanov-ferber.ru/books/paperbook/the_question_behind_the_question/	2017-02-28 17:02:37	2017-03-03 19:52:41	t
1265	5791	10	Pinterest для бизнеса	978-5-91657-695-5	Бет Хайден	http://www.mann-ivanov-ferber.ru/books/paperbook/pinterest-for-business/	2017-02-28 17:02:37	2017-03-03 19:52:42	t
1279	4098	9	Искусство быть хорошим руководителем	 978-5-91657-668-9	Роберт  Саттон	http://www.mann-ivanov-ferber.ru/books/paperbook/goodboss/	2017-02-28 17:02:37	2017-03-03 19:52:43	t
1275	5496	14	Школа Зоков и Бады	978-5-91657-665-8	Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/children/schkola-zokov-i-badi/	2017-02-28 17:02:37	2017-03-03 19:52:44	t
1269	5170	10	Маркетинг, основанный на данных	978-5-91657-666-5	Марк Джеффри	http://www.mann-ivanov-ferber.ru/books/paperbook/data-driven-marketing/	2017-02-28 17:02:37	2017-03-03 19:52:44	t
1251	5489	9	Всё об индикаторах рынка	978-5-91657-720-4	Майкл  Синсиэр	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/vse-ob-indikat-rinka/	2017-02-28 17:02:37	2017-03-03 19:52:52	t
1266	5849	9	Все об инвестировании	978-5-91657-662-7	Эсме  Фаербер	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/all-about-investing/	2017-02-28 17:02:37	2017-03-03 19:52:53	t
1261	5490	9	Все об акциях	978-5-91657-685-6	Эсме  Фаербер	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/vse-ob-akciyah/	2017-02-28 17:02:37	2017-03-03 19:52:53	t
1263	5912	15	Что нельзя купить за деньги	978-5-91657-702-0	Майкл Сэндел	http://www.mann-ivanov-ferber.ru/books/paperbook/moral-limits-markets/	2017-02-28 17:02:37	2017-03-03 19:52:54	t
1249	3537	9	Slide:ology	978-5-91657-241-4	Нэнси  Дуарте	http://www.mann-ivanov-ferber.ru/books/paperbook/slideology/	2017-02-28 17:02:37	2017-03-03 19:52:55	t
1258	6014	10	Маркетинг в Твиттере	978-5-91657-705-1	Марк Шефер	http://www.mann-ivanov-ferber.ru/books/paperbook/the-tao-of-twitter/	2017-02-28 17:02:37	2017-03-03 19:52:55	t
1288	5236	9	От хорошего к великому. Как гибнут великие (комплект из 2 книг)		Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/special/komplekt/	2017-02-28 17:02:37	2017-03-03 19:53:12	t
1259	6273	11	Эмоциональный интеллект в бизнесе	978-5-91657-729-7	Дэниел Гоулман	http://www.mann-ivanov-ferber.ru/books/paperbook/working-emotional-intelligence/	2017-02-28 17:02:37	2017-03-03 19:53:13	t
1271	5517	10	Сила простоты	978-5-91657-670-2	Джек  Траут	http://www.mann-ivanov-ferber.ru/books/mif/sila-prostoty/	2017-02-28 17:02:37	2017-03-03 19:53:14	t
1246	5906	9	Выступление в стиле TED	978-5-91657-703-7	Джереми Донован	http://www.mann-ivanov-ferber.ru/books/paperbook/ted/	2017-02-28 17:02:37	2017-03-03 19:53:14	t
1334	8576	9	Организация кадрового учета и расчета зарплаты		Е.А. Грянина	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/secrety-zp/	2017-02-28 17:02:38	2017-03-03 19:53:31	t
1332	3921	9	Речи, которые изменили мир (в кожаном переплете)		Саймон Себаг  Монтефиоре	http://www.mann-ivanov-ferber.ru/books/special/speeches-kozha/	2017-02-28 17:02:38	2017-03-03 19:53:31	t
1344	8347	11	Как стать богатым	978-5-904522-29-2	Дональд Трамп	http://www.mann-ivanov-ferber.ru/books/paperbook/kak-stat-bogatym/	2017-02-28 17:02:38	2017-03-03 19:53:31	t
1351	5112	9	Формируем стойкость	978-5-91657-289-6	Мэри Линн Палли	http://www.mann-ivanov-ferber.ru/books/navigator-for-the-leader/how-thrive-times-change/	2017-02-28 17:02:38	2017-03-03 19:53:42	t
1329	3924	15	Лидеры, которые изменили мир (в кожаном переплете)		Брайан Муни	http://www.mann-ivanov-ferber.ru/books/special/leaders1/	2017-02-28 17:02:38	2017-03-03 19:53:42	t
1357	5059	15	Джулиан Ассанж	978-5-91657-363-3	 Джулиан Ассанж	http://www.mann-ivanov-ferber.ru/books/paperbook/julian-assange/	2017-02-28 17:02:38	2017-03-03 19:53:42	t
1320	5179	10	Клиентология	978-5-91657-559-0	 Филип Грейвс 	http://www.mann-ivanov-ferber.ru/books/paperbook/consumer-ology/	2017-02-28 17:02:38	2017-03-03 19:53:43	t
1346	4734	15	Образование против таланта	978-5-91657-415-9	Кен Робинсон	http://www.mann-ivanov-ferber.ru/books/paperbook/out-our-minds/	2017-02-28 17:02:38	2017-03-03 19:53:44	t
1325	5186	15	Главный рубильник	978-5-91657-532-3	Тим Ву	http://www.mann-ivanov-ferber.ru/books/paperbook/master-switch/	2017-02-28 17:02:38	2017-03-03 19:53:44	t
1326	4739	9	Как гибнут великие	978-5-91657-533-0	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/paperbook/how-the-mighty-fall_1/	2017-02-28 17:02:38	2017-03-03 19:53:45	t
1366	8092	9	1С:Бухгалтерия 8. Учебная версия (+CD)	978-5-9677-1880-9	Фирма «1С»	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/1c-buhgalteriya-8/	2017-02-28 17:02:39	2017-03-03 19:54:14	t
1319	9061	11	Осуществление желаний	978-5-91657-459-3	Джо Витале	http://www.mann-ivanov-ferber.ru/books/osushhestvlenie_zhelanij/	2017-02-28 17:02:38	2017-03-03 19:53:46	t
1311	5176	9	Джек Уэлч	978-5-91657-469-2	Джек Уэлч	http://www.mann-ivanov-ferber.ru/books/history/jack-straight-from-the-gut/	2017-02-28 17:02:38	2017-03-03 19:53:46	t
1290	5192	\N	Слова, которые изменили мир	978-5-91657-553-8	  	http://www.mann-ivanov-ferber.ru/books/special/slova-kotorye-izmenily-mir/	2017-02-28 17:02:37	2017-03-03 19:52:43	t
1257	11000	\N	Правила лидеров. Топ-50		Артем Аветисян	http://www.mann-ivanov-ferber.ru/books/pravila_liderov/	2017-02-28 17:02:37	2017-03-03 19:53:02	t
1312	5106	9	5 граней лидерства	978-5-91657-425-8	Скотт Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/paperbook/5dleadership/	2017-02-28 17:02:38	2017-03-03 19:53:53	t
1316	5067	10	Пишем убедительно	978-5-91657-519-4	Саша Карепина	http://www.mann-ivanov-ferber.ru/books/mif/write-persuasively/	2017-02-28 17:02:38	2017-03-03 19:53:53	t
1356	6252	10	Buyology:	978-5-91657-401-2	Мартин Линдстром	http://www.mann-ivanov-ferber.ru/books/paperbook/buyology/	2017-02-28 17:02:38	2017-03-03 19:53:54	t
1354	4816	10	Маркетинг профессиональных услуг	978-5-91657-508-8	Майк Шульц	http://www.mann-ivanov-ferber.ru/books/paperbook/professional-services-marketing/	2017-02-28 17:02:38	2017-03-03 19:53:54	t
1352	5111	9	Развиваем способность к изменениям	978-5-91657-292-6	Керри Банкер	http://www.mann-ivanov-ferber.ru/books/navigator-for-the-leader/helping-people-manage-transition/	2017-02-28 17:02:38	2017-03-03 19:54:02	t
1314	3703	9	Все об инвестировании в золото	978-5-91657-395-4	Джон Джагерсон	http://www.mann-ivanov-ferber.ru/books/paperbook/allaboutinvestingingold/	2017-02-28 17:02:38	2017-03-03 19:54:03	t
1323	5028	9	Правила Zappos	978-5-91657-531-6	 Джозеф Мичелли	http://www.mann-ivanov-ferber.ru/books/paperbook/zappos-experience/	2017-02-28 17:02:38	2017-03-03 19:54:03	t
1327	4274	15	До смерти здоров	978-5-91657-499-9	Эй Джей Джейкобс	http://www.mann-ivanov-ferber.ru/books/paperbook/ddh1/	2017-02-28 17:02:38	2017-03-03 19:54:04	t
1309	5093	9	Метод тыквы	978-5-91657-577-4	Майк Микаловиц	http://www.mann-ivanov-ferber.ru/books/paperbook/pumpkin-plan/	2017-02-28 17:02:38	2017-03-03 19:54:04	t
1359	5159	9	Заработная плата в 2013 году	 978-5-91657-610-8	Елена Воробьева	http://www.mann-ivanov-ferber.ru/books/paperbook/zarabotnayaplata/	2017-02-28 17:02:38	2017-03-03 19:54:05	t
1369	3919	13	Триатлон	978-5-91657-333-6	Игорь Сысоев	http://www.mann-ivanov-ferber.ru/books/sport/olimp/	2017-02-28 17:02:39	2017-03-03 19:54:13	t
1336	8574	9	Кадровый учет и зарплата. Издание 3		Е.А. Грянина	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/kadroviy-uchet/	2017-02-28 17:02:38	2017-03-03 19:53:26	t
1349	5114	9	Тренируем адаптивность	978-5-91657-294-0	Аллан Каларко	http://www.mann-ivanov-ferber.ru/books/navigator-for-the-leader/responding-effectively-change/	2017-02-28 17:02:38	2017-03-03 19:54:15	t
1342	4889	10	Практика управления Mayo Clinic	978-5-91657-748-8	Леонард Берри	http://www.mann-ivanov-ferber.ru/books/mif/mayo-clinic/	2017-02-28 17:02:38	2017-03-03 19:54:30	t
1341	4305	13	Жизнь без границ	978-5-91657-548-4	Крисси Веллингтон	http://www.mann-ivanov-ferber.ru/books/sport/lifewithoutlimits/	2017-02-28 17:02:38	2017-03-03 19:54:30	t
1339	8570	9	Учет расчетов по НДС. Издание 3		С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/uchet-raschetov-nds/	2017-02-28 17:02:38	2017-03-03 19:54:31	t
1337	8573	9	Учет основных средств. Издание 3		С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/uchet-sredstv/	2017-02-28 17:02:38	2017-03-03 19:54:31	t
1322	4910	10	Ключевые цифры	978-5-91657-534-7	Димитри Маекс	http://www.mann-ivanov-ferber.ru/books/mif/sexy-little-numbers/	2017-02-28 17:02:38	2017-03-03 19:54:42	t
1308	5083	11	Вся правда о неправде	978-5-91657-539-2	Дэн Ариели	http://www.mann-ivanov-ferber.ru/books/paperbook/pravdaonepravde/	2017-02-28 17:02:38	2017-03-03 19:54:43	t
1317	4851	9	Манифест лидера	978-5-91657-429-6	Гэри  Хэмел	http://www.mann-ivanov-ferber.ru/books/paperbook/what-matters-now/	2017-02-28 17:02:38	2017-03-03 19:54:45	t
1362	8098	9	Хозяйственные операции в «1С:Бухгалтерии 8» (редакция 2.0)	978-5-9677-1366-8	Д.В. Чистов	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/hosyaystvennie-operacii/	2017-02-28 17:02:39	2017-03-03 19:53:45	t
1392	4267	9	Стартап	978-5-91657-421-0	Гай Кавасаки	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/art-start/	2017-02-28 17:02:39	2017-03-03 19:54:47	t
1429	6472	15	Карта роста	978-5-91657-506-4	Джим О’Нил	http://www.mann-ivanov-ferber.ru/books/paperbook/karta-rosta/	2017-02-28 17:02:40	2017-03-03 19:54:47	t
1403	4245	9	Неизвестный Стив	978-5-91657-440-1	Стив Возняк	http://www.mann-ivanov-ferber.ru/books/paperbook/i/	2017-02-28 17:02:39	2017-03-03 19:54:59	t
1218	5491	9	Все о стратегиях инвестирования на фондовом рынке	978-5-91657-738-9	Дэвид  Браун	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/vse-o-strategiyah/	2017-02-28 17:02:36	2017-03-03 19:55:12	t
1382	7381	15	Скрытая власть	978-5-91657-433-3	Эрик Дж. Вейнер	http://www.mann-ivanov-ferber.ru/books/paperbook/shadow-market/	2017-02-28 17:02:39	2017-03-03 19:55:13	t
1408	6569	15	Секреты Ватикана	978-5-91657-396-1	Коррадо Ауджиас	http://www.mann-ivanov-ferber.ru/books/paperbook/i-segreti-del-vaticano/	2017-02-28 17:02:39	2017-03-03 19:55:17	t
1399	3831	9	Дизайн-мышление в бизнесе	978-5-91657-331-2	Тим Браун	http://www.mann-ivanov-ferber.ru/books/paperbook/changebydesign/	2017-02-28 17:02:39	2017-03-03 19:55:18	t
1377	4458	9	Slide:Ology. Resonate		Нэнси  Дуарте	http://www.mann-ivanov-ferber.ru/books/special/komplects3/	2017-02-28 17:02:39	2017-03-03 19:55:18	t
1426	3789	9	Компания мечты	 978-5-91657-288-9	Кевин Круз	http://www.mann-ivanov-ferber.ru/books/mif/we/	2017-02-28 17:02:39	2017-03-03 19:55:33	t
1414	6503	9	Приводим жизнь в порядок	978-5-91657-470-8	Дэвид Аллен	http://www.mann-ivanov-ferber.ru/books/paperbook/privodim-zhizn-v-poryadok/	2017-02-28 17:02:39	2017-03-03 19:55:33	t
1434	3876	13	Как рыба в воде	978-5-91657-277-3	Терри  Лафлин	http://www.mann-ivanov-ferber.ru/books/sport/guide-swimming/	2017-02-28 17:02:40	2017-03-03 19:55:34	t
1391	4555	10	Откровения рекламного агента	978-5-91657-465-4	Дэвид Огилви	http://www.mann-ivanov-ferber.ru/books/paperbook/confession-advertising-man/	2017-02-28 17:02:39	2017-03-03 19:55:34	t
1376	7495	12	Скетчбуки от Яны Франк		Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/sketchbook/	2017-02-28 17:02:39	2017-03-03 19:54:46	t
1406	3710	9	Успешные переговоры	978-5-91657-437-1	Стюарт Даймонд	http://www.mann-ivanov-ferber.ru/books/paperbook/successful-negotiations/	2017-02-28 17:02:39	2017-03-03 19:55:40	t
1396	3245	11	Инвестировать – это просто	978-5-91657-435-7	Владимир Савенок	http://www.mann-ivanov-ferber.ru/books/paperbook/v-savenok/	2017-02-28 17:02:39	2017-03-03 19:55:43	t
1397	4544	9	Баффет — инвесторам	978-5-91657-891-1	Лаура Риттенхаус	http://www.mann-ivanov-ferber.ru/books/paperbook/buffetbites/	2017-02-28 17:02:39	2017-03-03 19:55:43	t
1389	3780	15	Пелевин и поколение пустоты	978-5-91657-304-6	Сергей Полотовский	http://www.mann-ivanov-ferber.ru/books/paperbook/pelevin/	2017-02-28 17:02:39	2017-03-03 19:55:44	t
1404	5434	10	Повышение конверсии веб-сайта	978-5-91657-327-5	 Халид Салех	http://www.mann-ivanov-ferber.ru/books/paperbook/povishenie-konversii/	2017-02-28 17:02:39	2017-03-03 19:55:44	t
1421	6292	15	Феномен полиглотов	978-5-91657-502-6	Майкл Эрард	http://www.mann-ivanov-ferber.ru/books/paperbook/babel-no-more/	2017-02-28 17:02:39	2017-03-03 19:55:45	t
1381	4494	9	Миллионеры из App Store	978-5-91657-477-7	 Крис Стивенс	http://www.mann-ivanov-ferber.ru/books/paperbook/appillionaires/	2017-02-28 17:02:39	2017-03-03 19:55:45	t
1384	7378	9	Миллиардер из Кремниевой долины	978-5-91657-361-9	Пол Аллен	http://www.mann-ivanov-ferber.ru/books/paperbook/idea-man/	2017-02-28 17:02:39	2017-03-03 19:55:50	t
1401	6792	15	Мифы экономики	978-5-91657-874-4	Сергей Гуриев	http://www.mann-ivanov-ferber.ru/books/paperbook/myths-economy/	2017-02-28 17:02:39	2017-03-03 19:55:50	t
1394	4269	15	Дикая природа России	978-5-91657-436-4	Валерий Малеев	http://www.mann-ivanov-ferber.ru/books/special/wildrussia/	2017-02-28 17:02:39	2017-03-03 19:55:51	t
1373	3978	10	Контент-маркетинг	978-5-91657-328-2	Майкл Стелзнер	http://www.mann-ivanov-ferber.ru/books/paperbook/launch/	2017-02-28 17:02:39	2017-03-03 19:55:51	t
1412	6511	15	Новое дворянство: Очерки истории ФСБ	978-5-91657-439-5	Андрей Солдатов	http://www.mann-ivanov-ferber.ru/books/paperbook/new-nobility/	2017-02-28 17:02:39	2017-03-03 19:55:52	t
1432	4111	9	iКона. Стив Джобс	978-5-91657-374-9	Джеффри Янг	http://www.mann-ivanov-ferber.ru/books/paperbook/icon/	2017-02-28 17:02:40	2017-03-03 19:55:57	t
1420	4028	9	Resonate	978-5-91657-358-9	Нэнси  Дуарте	http://www.mann-ivanov-ferber.ru/books/paperbook/resonate/	2017-02-28 17:02:39	2017-03-03 19:55:57	t
1430	4092	11	Быть счастливее	978-5-91657-351-0	Тал Бен-Шахар	http://www.mann-ivanov-ferber.ru/books/paperbook/happier/	2017-02-28 17:02:40	2017-03-03 19:56:10	t
1417	6473	9	Удача в бизнесе	978-5-91657-623-8	Тор Мюллер	http://www.mann-ivanov-ferber.ru/books/paperbook/udacha-v-biznese/	2017-02-28 17:02:39	2017-03-03 19:56:11	t
1416	6482	9	Трудно быть боссом	978-5-91657-399-2	Линда Хилл	http://www.mann-ivanov-ferber.ru/books/paperbook/trudno-byt-bossom/	2017-02-28 17:02:39	2017-03-03 19:56:12	t
1387	4122	9	Удачные переговоры	978-5-91657-398-5	Ричард Шелл	http://www.mann-ivanov-ferber.ru/books/paperbook/bargainingforadvantage/	2017-02-28 17:02:39	2017-03-03 19:56:12	t
1386	4405	9	Мой первый бизнес	978-5-91657-390-9	 Джеймс Каан	http://www.mann-ivanov-ferber.ru/books/mif/start-your-business-in-7-days/	2017-02-28 17:02:39	2017-03-03 19:56:13	t
1370	3719	9	Построенные навечно (в кожаном переплете)		Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/special/built-to-last-kozha/	2017-02-28 17:02:39	2017-03-03 19:56:18	t
1409	4071	9	Друкер на каждый день. 366 советов успешному менеджеру	978-5-91657-364-0	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/paperbook/drucker/	2017-02-28 17:02:39	2017-03-03 19:56:19	t
1436	3929	9	Startup Weekend	978-5-91657-341-1	Марк Нейджер, Клинт Нильсен и Фрэнк Нурига	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/fromconcepttocreation/	2017-02-28 17:02:40	2017-03-03 19:56:20	t
1446	3761	15	Опыт путешествий	978-5-91657-287-2	Адриан Гилл	http://www.mann-ivanov-ferber.ru/books/paperbook/gillisfurtheraway/	2017-02-28 17:02:40	2017-03-03 19:56:21	t
1499	2962	15	Фрикономика	 978-5-91657-523-1	Стивен Левитт	http://www.mann-ivanov-ferber.ru/books/paperbook/freaconomics/	2017-02-28 17:02:40	2017-03-03 19:56:21	t
1491	3737	9	Правила прибыльных стартапов	978-5-91657-194-3	Верн Харниш	http://www.mann-ivanov-ferber.ru/books/mif/rockefeller-habits/	2017-02-28 17:02:40	2017-03-03 19:56:22	t
1493	3026	11	Правила Джобса	978-5-91657-301-5	Кармин Галло	http://www.mann-ivanov-ferber.ru/books/paperbook/theinnovationsecretsofstevejobs/	2017-02-28 17:02:40	2017-03-03 19:56:22	t
1475	3786	9	WOW-результат: бери и делай!	978-5-91657-305-3	Наталья Ковальцева	http://www.mann-ivanov-ferber.ru/books/paperbook/wow/	2017-02-28 17:02:40	2017-03-03 19:56:23	t
1470	3344	9	Бережливое производство + шесть сигм в сфере услуг	978-5-91657-217-9	Майкл Джордж	http://www.mann-ivanov-ferber.ru/books/paperbook/berelivoe/	2017-02-28 17:02:40	2017-03-03 19:56:23	t
1489	3170	13	Библия велосипедиста	978-5-91657-185-1	Джо Фрил	http://www.mann-ivanov-ferber.ru/books/sport/cyclist/	2017-02-28 17:02:40	2017-03-03 19:56:24	t
1473	5423	10	Проектирование прибыльных веб-сайтов	978-5-91657-192-9	Лэнс Лавдэй	http://www.mann-ivanov-ferber.ru/books/paperbook/webdforroi-1/	2017-02-28 17:02:40	2017-03-03 19:56:25	t
1484	3337	9	Цель-2. Дело не в везении	978-5-91657-346-6	Элияху Голдратт	http://www.mann-ivanov-ferber.ru/books/biznesroman/celdel/	2017-02-28 17:02:40	2017-03-03 19:56:25	t
1467	3313	15	Далеко, далеко	978-5-91657-154-7	Сергей Доля	http://www.mann-ivanov-ferber.ru/books/special/dalekoko/	2017-02-28 17:02:40	2017-03-03 19:56:26	t
1454	3665	15	Всегда на связи	 978-5-91657-273-5	Брайан Чен	http://www.mann-ivanov-ferber.ru/books/paperbook/alwayson/	2017-02-28 17:02:40	2017-03-03 19:56:26	t
1486	5420	10	Повышение эффективности интернет-рекламы	978-5-91657-163-9	Тим Эш	http://www.mann-ivanov-ferber.ru/books/paperbook/landingoptimization-1/	2017-02-28 17:02:40	2017-03-03 19:56:33	t
1456	5201	13	Энергия жизни	978-5-91657-551-4	 Брендон Берчард	http://www.mann-ivanov-ferber.ru/books/paperbook/life-energy/	2017-02-28 17:02:40	2017-03-03 19:56:34	t
1457	3714	12	12 времен года	978-5-91657-280-3	Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/12-vremen-goda/	2017-02-28 17:02:40	2017-03-03 19:56:42	t
1462	3720	13	Раздельное питание	978-5-91657-270-4	Ли Дюбель	http://www.mann-ivanov-ferber.ru/books/paperbook/properfood/	2017-02-28 17:02:40	2017-03-03 19:56:42	t
1465	4079	15	Формула №1.	978-5-91657-366-4	Том Бауэр	http://www.mann-ivanov-ferber.ru/books/paperbook/formula1/	2017-02-28 17:02:40	2017-03-03 19:56:43	t
1495	3157	13	Библия триатлета	978-5-91657-184-4	Джо Фрил	http://www.mann-ivanov-ferber.ru/books/sport/triathletestrainingbible/	2017-02-28 17:02:40	2017-03-03 19:56:44	t
1449	3819	9	Финансовые услуги: перезагрузка	978-5-91657-269-8	Регги де Феникс	http://www.mann-ivanov-ferber.ru/books/paperbook/reinventing/	2017-02-28 17:02:40	2017-03-03 19:56:45	t
1478	4110	9	Как стать бизнесменом	978-5-91657-361-9	 Олег Тиньков	http://www.mann-ivanov-ferber.ru/books/paperbook/kak-stat-biznesmenom/	2017-02-28 17:02:40	2017-03-03 19:56:45	t
1453	3556	9	Правила прибыльных стартапов	978-5-91657-254-4	Верн Харниш	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/mastrockrhabits/	2017-02-28 17:02:40	2017-03-03 19:56:46	t
1443	3094	9	Магия Pixar	978-5-91657-278-0	Дэвид Прайс	http://www.mann-ivanov-ferber.ru/books/paperbook/thepixartouch/	2017-02-28 17:02:40	2017-03-03 19:56:56	t
1440	5667	10	Маркетинг без бюджета. Хороший год (комплект из 2 книг)		Игорь Манн	http://www.mann-ivanov-ferber.ru/books/special/set2/	2017-02-28 17:02:40	2017-03-03 19:56:57	t
1482	3478	9	Стартап без бюджета	978-5-91657-316-9	Майк Микаловиц	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/tbb2/	2017-02-28 17:02:40	2017-03-03 19:56:57	t
1459	3721	9	Управление стартапом	978-5-91657-279-7	Кэтрин Кэтлин	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/upravlenie-startapom/	2017-02-28 17:02:40	2017-03-03 19:56:58	t
1468	3623	15	На все четыре стороны	978-5-91657-262-9	Адриан Гилл	http://www.mann-ivanov-ferber.ru/books/paperbook/navse4stor/	2017-02-28 17:02:40	2017-03-03 19:56:59	t
1481	3369	9	Фанки идеи	978-5-91657-233-9	Альф Рен	http://www.mann-ivanov-ferber.ru/books/paperbook/franki/	2017-02-28 17:02:40	2017-03-03 19:57:00	t
1480	4026	9	Как преодолеть НЕТ	978-5-91657-367-1	Уильям Юри	http://www.mann-ivanov-ferber.ru/books/paperbook/gettingpastno/	2017-02-28 17:02:40	2017-03-03 19:57:00	t
1451	3471	9	Поиск бизнес-модели	978-5-91657-296-4	Джон Маллинс	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/tthlb/	2017-02-28 17:02:40	2017-03-03 19:57:01	t
1447	4594	9	Уоррен Баффет	978-5-91657-302-2	Элис Шрёдер	http://www.mann-ivanov-ferber.ru/books/history/warlife2/	2017-02-28 17:02:40	2017-03-03 19:57:02	t
1490	3202	15	Испалец в колесе	 978-5-91657-205-6	Джон Леннон	http://www.mann-ivanov-ferber.ru/books/paperbook/ispalezvkolece/	2017-02-28 17:02:40	2017-03-03 19:57:02	t
1500	3040	9	Вверх!	978-5-91657-144-8	Инна Кузнецова	http://www.mann-ivanov-ferber.ru/books/mif/vverh/	2017-02-28 17:02:40	2017-03-03 19:57:03	t
1444	4635	15	Покорение южного полюса. Гонка лидеров	978-5-91657-323-7	Роланд Хантфорд	http://www.mann-ivanov-ferber.ru/books/special/last-placeon-earth/	2017-02-28 17:02:40	2017-03-03 19:57:04	t
1496	3002	10	Маркетинг за МКАДом	978-5-91657-199-8	Сергей Разуваев	http://www.mann-ivanov-ferber.ru/books/paperbook/mkad/	2017-02-28 17:02:40	2017-03-03 19:56:20	t
1564	2140	10	Просто лучше	5-315-00043-5	Патрик Бервайз	http://www.mann-ivanov-ferber.ru/books/sse/simply-better/	2017-02-28 17:02:41	2017-03-03 19:57:19	t
1560	2161	9	Основы. Дизайн	5-315-00053-2	Том Питерс	http://www.mann-ivanov-ferber.ru/books/sse/tp-design/	2017-02-28 17:02:41	2017-03-03 19:57:05	t
1553	2230	10	Волшебство по расчету	978-5-902862-57-4	Джим Тейлор	http://www.mann-ivanov-ferber.ru/books/mif/032/	2017-02-28 17:02:41	2017-03-03 19:57:20	t
1556	2108	9	Бизнес в стиле фанк	978-5-91657-281-0	Кьелл Нордстрем	http://www.mann-ivanov-ferber.ru/books/sse/funky-business/	2017-02-28 17:02:41	2017-03-03 19:57:20	t
1555	2012	9	Путь Черепах	978-5-902862-55-0	Куртис Фейс	http://www.mann-ivanov-ferber.ru/books/mif/028/	2017-02-28 17:02:41	2017-03-03 19:57:30	t
1550	2185	10	PR высокого полета	978-5-902862-11-6	Инна Алексеева	http://www.mann-ivanov-ferber.ru/books/mif/036/	2017-02-28 17:02:41	2017-03-03 19:57:30	t
1548	2253	10	Корпоративные блоги	978-5-902862-76-5	Нэнси Флин	http://www.mann-ivanov-ferber.ru/books/mif/037/	2017-02-28 17:02:41	2017-03-03 19:57:31	t
1545	2314	9	Лидерство через конфликт	 978-5-902862-72-7	Марк Герзон	http://www.mann-ivanov-ferber.ru/books/sse/leading-conflict/	2017-02-28 17:02:41	2017-03-03 19:57:32	t
1542	2326	9	Бизнес по науке	978-5-91657-005-2	Гордон М.  Байндер	http://www.mann-ivanov-ferber.ru/books/sse/scn/	2017-02-28 17:02:41	2017-03-03 19:57:40	t
1540	3810	10	Пришел, увидел, убедил	978-5-91657-312-1	Стефани Палмер	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/goodinaroom/	2017-02-28 17:02:41	2017-03-03 19:57:54	t
1521	2827	9	Десять секретов продаж		Радмило Лукич	http://www.mann-ivanov-ferber.ru/books/paperbook/10lawsofselling/	2017-02-28 17:02:41	2017-03-03 19:58:01	t
1532	2554	9	Mary Kay: Путь к успеху	978-5-91657-175-2	Мэри Кэй Эш	http://www.mann-ivanov-ferber.ru/books/paperbook/themarykayway/	2017-02-28 17:02:41	2017-03-03 19:58:02	t
1537	2435	9	Как я стал боссом		Дэвид Новак	http://www.mann-ivanov-ferber.ru/books/mif/046/	2017-02-28 17:02:41	2017-03-03 19:58:03	t
1533	2549	9	СПИН-продажи. Практическое руководство		Нил Рекхэм	http://www.mann-ivanov-ferber.ru/books/mif/spinfieldbook/	2017-02-28 17:02:41	2017-03-03 19:58:03	t
1507	2936	9	Управление продажами	978-5-91657-136-3	Радмило Лукич	http://www.mann-ivanov-ferber.ru/books/paperbook/salesmanagement/	2017-02-28 17:02:41	2017-03-03 19:58:04	t
1538	2416	9	Эффект импульса	 978-5-91657-011-3	Жан-Клод Лареш 	http://www.mann-ivanov-ferber.ru/books/sse/momentum/	2017-02-28 17:02:41	2017-03-03 19:58:10	t
1551	2297	\N	Афоризмы о пути к успеху (mp3)		  	http://www.mann-ivanov-ferber.ru/books/audio/009a/	2017-02-28 17:02:41	2017-03-03 19:57:29	t
1524	2796	9	iПрезентация	978-5-91657-329-9	Кармин Галло	http://www.mann-ivanov-ferber.ru/books/paperbook/presentationsecretsofstevejobs2/	2017-02-28 17:02:41	2017-03-03 19:58:11	t
1530	2576	11	Работа 2.0: прорыв к свободному времени	978-5-91657-064-9	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/mif/work20/	2017-02-28 17:02:41	2017-03-03 19:58:12	t
1508	2949	9	Незаменимый	 978-5-91657-125-7	Сет Годин	http://www.mann-ivanov-ferber.ru/books/paperbook/linchpin/	2017-02-28 17:02:41	2017-03-03 19:58:12	t
1529	2540	12	Все, что мужчины знают о женщинах		  	http://www.mann-ivanov-ferber.ru/books/paperbook/mw/	2017-02-28 17:02:41	2017-03-03 19:58:13	t
1516	2927	9	Переговоры о зарплате	978-5-91657-117-2	Даниэль Поро	http://www.mann-ivanov-ferber.ru/books/paperbook/101salarysecrets/	2017-02-28 17:02:41	2017-03-03 19:58:13	t
1527	2670	9	Первая волна мирового финансового кризиса: промежуточные итоги	 978-5-91657-030-4	Джордж  Сорос	http://www.mann-ivanov-ferber.ru/books/paperbook/reflectionsofthecrashof2008/	2017-02-28 17:02:41	2017-03-03 19:58:14	t
1518	2477	9	Прогноз продаж		Радмило Лукич	http://www.mann-ivanov-ferber.ru/books/paperbook/salesforecast/	2017-02-28 17:02:41	2017-03-03 19:58:22	t
1510	3448	9	Я так и знал!	978-5-91657-309-1	Элияху Голдратт	http://www.mann-ivanov-ferber.ru/books/biznesroman/isnitobvious/	2017-02-28 17:02:41	2017-03-03 19:58:29	t
1512	2823	10	Настольная книга копирайтера	978-5-91657-100-4	Элина Слободянюк	http://www.mann-ivanov-ferber.ru/books/mif/copywriter/	2017-02-28 17:02:41	2017-03-03 19:58:36	t
1505	2680	11	Личное развитие	978-5-9573-2259-7	Стивен Павлина	http://www.mann-ivanov-ferber.ru/books/mif/pavlinapersonaldevelopment/	2017-02-28 17:02:41	2017-03-03 19:58:37	t
1504	2648	11	Призвание	978-5-91657-123-3	Кен Робинсон	http://www.mann-ivanov-ferber.ru/books/paperbook/theelement/	2017-02-28 17:02:41	2017-03-03 19:58:37	t
1514	2810	10	Арифметика маркетинга для первых лиц	978-5-91657-165-3	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/mif/abcofmarketing/	2017-02-28 17:02:41	2017-03-03 19:58:38	t
1544	2341	9	Смерть священным коровам!	978-5-902862-96-3	Бо  Фрезер	http://www.mann-ivanov-ferber.ru/books/mif/041/	2017-02-28 17:02:41	2017-03-03 19:58:38	t
1563	2050	9	Влейте в нее свое сердце	5-315-00023-0	Говард Шульц	http://www.mann-ivanov-ferber.ru/books/sse/starbucks/	2017-02-28 17:02:41	2017-03-03 19:57:19	t
1574	2049	15	Netократия	5-315-00029-X	Александр Бард	http://www.mann-ivanov-ferber.ru/books/sse/netocracy/	2017-02-28 17:02:42	2017-03-03 19:58:56	t
1582	1920	9	Почему гордость важнее денег	978-5-902862-30-7	Йон Катценбах	http://www.mann-ivanov-ferber.ru/books/mif/019/	2017-02-28 17:02:42	2017-03-03 19:59:07	t
1636	18118	11	Решение проблем по методикам спецслужб		Морган Джонс	http://www.mann-ivanov-ferber.ru/books/reshenie-problem-po-metodikam-speczsluzhb/	2017-02-28 17:02:42	2017-03-03 19:59:08	t
1635	18119	15	Сейчас. Физика времени		Ричард Мюллер	http://www.mann-ivanov-ferber.ru/books/fizika-vremeni/	2017-02-28 17:02:42	2017-03-03 19:59:08	t
1633	18121	15	Союз непохожих		Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/soyuz-nepoxozhix/	2017-02-28 17:02:42	2017-03-03 19:59:09	t
1631	18147	12	Уроки классического рисунка		Джульетта Аристид	http://www.mann-ivanov-ferber.ru/books/uroki-klassicheskogo-risunka/	2017-02-28 17:02:42	2017-03-03 19:59:18	t
1630	18166	11	Не жалей ни о чем		Найджел Камберленд	http://www.mann-ivanov-ferber.ru/books/ne-zhalej-ni-o-chem/	2017-02-28 17:02:42	2017-03-03 19:59:19	t
1628	18168	12	От точки к точке. Животные	978-5-00100-602-2	Гарет Мур	http://www.mann-ivanov-ferber.ru/books/ot-tochki-k-tochke-zhivotnyie/	2017-02-28 17:02:42	2017-03-03 19:59:20	t
1595	18483	9	Открытое мышление		Институт Арбингера	http://www.mann-ivanov-ferber.ru/books/otkryitoe-myishlenie/	2017-02-28 17:02:42	2017-03-03 19:59:20	t
1626	18312	14	Отпустите их		Джули Литкотт-Хеймс	http://www.mann-ivanov-ferber.ru/books/otpustite-ix/	2017-02-28 17:02:42	2017-03-03 19:59:28	t
1625	18316	9	Кто		Джефф Смарт	http://www.mann-ivanov-ferber.ru/books/kto/	2017-02-28 17:02:42	2017-03-03 19:59:29	t
1623	18325	15	Стратегические игры		Авинаш Диксит	http://www.mann-ivanov-ferber.ru/books/strategicheskie-igryi/	2017-02-28 17:02:42	2017-03-03 19:59:30	t
1622	18328	15	Эпоха криптовалют		Пол Винья	http://www.mann-ivanov-ferber.ru/books/epoxa-kriptovalyut/	2017-02-28 17:02:42	2017-03-03 19:59:30	t
1620	18350	12	Автор, ножницы, бумага		Николай Кононов	http://www.mann-ivanov-ferber.ru/books/avtor-nozhniczyi-bumaga-kak-byistro-pisat-vpechatlyayushhie-tekstyi/	2017-02-28 17:02:42	2017-03-03 19:59:31	t
1618	18352	12	Твоя жизнь в искусстве		Эшли Ле Куэр	http://www.mann-ivanov-ferber.ru/books/tvoya-zhizn-v-iskusstve/	2017-02-28 17:02:42	2017-03-03 19:59:41	t
1617	18354	12	Импрессионисты. Часть 1		  	http://www.mann-ivanov-ferber.ru/books/impressionistyi-chast-1/	2017-02-28 17:02:42	2017-03-03 19:59:42	t
1616	18355	12	Импрессионисты. Часть 2		  	http://www.mann-ivanov-ferber.ru/books/impressionistyi-chast-2/	2017-02-28 17:02:42	2017-03-03 19:59:43	t
1614	18387	11	Как запоминать (почти) всё и всегда		Роб Иставэй	http://www.mann-ivanov-ferber.ru/books/kak-zapominat-pochti-vsyo-i-vsegda/	2017-02-28 17:02:42	2017-03-03 19:59:43	t
1612	18394	11	Преодоление страха		Дорис Идинг	http://www.mann-ivanov-ferber.ru/books/preodolenie-straxa/	2017-02-28 17:02:42	2017-03-03 19:59:50	t
1610	18398	15	Наказание наградой		Альфи Кон	http://www.mann-ivanov-ferber.ru/books/paperbook/nakazanie-nagradoj/	2017-02-28 17:02:42	2017-03-03 19:59:50	t
1609	18399	15	Голая экономика		Чарльз Уилан	http://www.mann-ivanov-ferber.ru/books/paperbook/golaya-ekonomika/	2017-02-28 17:02:42	2017-03-03 19:59:51	t
1559	2167	9	Основы. Тренды	5-315-00051-6	Том Питерс	http://www.mann-ivanov-ferber.ru/books/sse/tp-trends/	2017-02-28 17:02:41	2017-03-03 19:58:48	t
1576	2170	9	Рефрейминг организаций	5-315-00035-4	Ли Болмэн	http://www.mann-ivanov-ferber.ru/books/sse/reframing/	2017-02-28 17:02:42	2017-03-03 19:58:50	t
1519	2669	\N	Жизнь и работа за рубежом		Сергей Сандер	http://www.mann-ivanov-ferber.ru/books/paperbook/sander/	2017-02-28 17:02:41	2017-03-03 19:58:28	t
1607	18422	2	От шелка до кремния		Джеффри Гартен	http://www.mann-ivanov-ferber.ru/books/ot-shelka-do-kremniya/	2017-02-28 17:02:42	2017-03-03 19:59:51	t
1605	18460	12	Захвати меня		Адам Куртц	http://www.mann-ivanov-ferber.ru/books/zaxvati-menya/	2017-02-28 17:02:42	2017-03-03 19:59:52	t
1602	18469	11	Умение отпускать		Рональд Швеппе	http://www.mann-ivanov-ferber.ru/books/umenie-otpuskat/	2017-02-28 17:02:42	2017-03-03 19:59:52	t
1604	18463	12	Василий Кандинский		  	http://www.mann-ivanov-ferber.ru/books/vasilij-kandinskij/	2017-02-28 17:02:42	2017-03-03 19:59:58	t
1596	18481	15	Nudge		Ричард Талер	http://www.mann-ivanov-ferber.ru/books/nudge/	2017-02-28 17:02:42	2017-03-03 19:59:58	t
1570	2088	11	Обретая Я	5-315-00037-0	Эрминия Ибарра	http://www.mann-ivanov-ferber.ru/books/sse/working-identily/	2017-02-28 17:02:41	2017-03-03 19:59:59	t
1601	18471	11	Здоровый мозг		Дэвид Перлмуттер	http://www.mann-ivanov-ferber.ru/books/zdorovyij-mozg/	2017-02-28 17:02:42	2017-03-03 20:00:12	t
1584	1823	9	Великолепные мероприятия	978-5-902862-32-1	Александр Шумович	http://www.mann-ivanov-ferber.ru/books/mif/012/	2017-02-28 17:02:42	2017-03-03 19:58:49	t
1599	18474	9	Софт за 30 дней		Кен Швабер	http://www.mann-ivanov-ferber.ru/books/soft-za-30-dnej/	2017-02-28 17:02:42	2017-03-03 20:00:12	t
1598	18476	9	Частные деньги для вашего бизнеса		Олег Иванов	http://www.mann-ivanov-ferber.ru/books/chastnyie-dengi-dlya-vashego-biznesa/	2017-02-28 17:02:42	2017-03-03 20:00:17	t
1593	18523	14	Python для детей	978-5-00100-616-9	Джейсон Бриггс	http://www.mann-ivanov-ferber.ru/books/python-dlya-detej/	2017-02-28 17:02:42	2017-03-03 20:00:18	t
1587	18651	9	Неизбалованный		Рон Либер	http://www.mann-ivanov-ferber.ru/books/neizbalovannyij/	2017-02-28 17:02:42	2017-03-03 20:00:30	t
1589	18649	9	Работа в радость		Деннис Бакке	http://www.mann-ivanov-ferber.ru/books/rabota-v-radost/	2017-02-28 17:02:42	2017-03-03 20:00:39	t
1591	18626	14	Глубоко, глубоко в океан		Сара Юн	http://www.mann-ivanov-ferber.ru/books/gluboko-gluboko-v-okean/	2017-02-28 17:02:42	2017-03-03 20:00:39	t
1592	18624	14	Высоко, высоко к Луне		Сара Юн	http://www.mann-ivanov-ferber.ru/books/vyisoko_vyisoko_k_lune/	2017-02-28 17:02:42	2017-03-03 20:00:40	t
1586	18653	11	Эмоциональная гибкость		Сьюзен Дэвид	http://www.mann-ivanov-ferber.ru/books/emoczionalnaya_gibkost/	2017-02-28 17:02:42	2017-03-03 20:00:40	t
1572	2084	9	Менеджмент от А до Я	5-315-00047-8	Бенгт Карлёф	http://www.mann-ivanov-ferber.ru/books/sse/a-z-management/	2017-02-28 17:02:41	2017-03-03 20:00:38	t
282	16002	15	Простые вопросы	978-5-00100-612-1	Владимир Антонец	http://www.mann-ivanov-ferber.ru/books/prostye-voprosy/	2017-02-28 16:57:23	2017-03-03 20:00:41	t
845	5076	11	Легкий способ перестать откладывать дела на потом	978-5-91657-573-6	Нейл Фьоре	http://www.mann-ivanov-ferber.ru/books/paperbook/easy-way/	2017-02-28 16:57:32	2017-03-03 20:00:42	t
1064	15803	11	На одной волне	978-5-00057-907-7	Эми Бэнкс	http://www.mann-ivanov-ferber.ru/books/na-odnoj-volne/	2017-02-28 17:02:34	2017-03-03 20:00:40	t
1038	5500	9	Охота на покупателя	978-5-91657-678-8	Александр  Деревицкий	http://www.mann-ivanov-ferber.ru/books/paperbook/ohotanapokypatel/	2017-02-28 17:02:33	2017-03-03 20:00:42	t
1347	4824	10	Партизанский маркетинг	978-5-91657-485-2	 Левинсон К.	http://www.mann-ivanov-ferber.ru/books/mif/guerrilla-marketing/	2017-02-28 17:02:38	2017-03-03 20:00:43	t
40	17864	13	Кишечник и мозг	978-5-00100-491-2	Дэвид Перлмуттер	http://www.mann-ivanov-ferber.ru/books/kishechnik-i-mozg/	2017-02-28 16:57:19	2017-03-03 20:00:43	t
1034	5820	9	Правила Кавасаки	978-5-91657-709-9	Гай Кавасаки	http://www.mann-ivanov-ferber.ru/books/paperbook/rules-kawasaki/	2017-02-28 17:02:33	2017-03-03 20:00:44	t
1666	10056	9	Персональный ребрендинг	978-500057-064-7	Дори Кларк	http://www.mann-ivanov-ferber.ru/books/personalnyj_rebrending/	2017-02-28 17:03:48	2017-03-03 20:00:56	t
137	17284	14	Тридцать миллионов слов	978-5-00100-224-6	Дана Саскинд	http://www.mann-ivanov-ferber.ru/books/tridczat-millionov-slov/	2017-02-28 16:57:21	2017-03-03 20:00:57	t
1646	17953	9	Неизбежно	978-5-00100-618-3	Кевин Келли	http://www.mann-ivanov-ferber.ru/books/neizbezhno/	2017-02-28 17:02:43	2017-03-03 20:00:57	t
1663	11286	11	Сила эмпатии	978-5-00057-234-4	Донни Эбенштейн	http://www.mann-ivanov-ferber.ru/books/sila_empatii/	2017-02-28 17:03:46	2017-03-03 20:00:58	t
641	9924	13	Лэнс Армстронг	978-5-00057-083-8	Рид Алберготти	http://www.mann-ivanov-ferber.ru/books/lance_armstrong/	2017-02-28 16:57:28	2017-03-03 20:00:58	t
647	12087	14	Увлекательная химия	978-5-00057-978-7	Елена Качур	http://www.mann-ivanov-ferber.ru/books/uvlekatelnaya_himiya/	2017-02-28 16:57:28	2017-03-03 20:00:59	t
165	17041	11	Гормоны счастья	978-5-00100-214-7	Лоретта Грациано Бройнинг	http://www.mann-ivanov-ferber.ru/books/gormony-schastya/	2017-02-28 16:57:21	2017-03-03 20:01:00	t
555	10208	15	Чем заняться вечером с семьей на даче без интернета	978-5-00057-919-0	Дмитрий Чернышев	http://www.mann-ivanov-ferber.ru/books/kniga_zagadok_i_golovolomok/	2017-02-28 16:57:27	2017-03-03 20:01:00	t
1638	18040	12	Мечтать не вредно. Творческий блокнот		  	http://www.mann-ivanov-ferber.ru/books/mechtat-ne-vredno/	2017-02-28 17:02:42	2017-03-03 20:01:01	t
1645	17956	15	Кому нужна математика?		Нелли Литвак	http://www.mann-ivanov-ferber.ru/book/komu-nuzhna-matematika/	2017-02-28 17:02:43	2017-03-03 20:01:06	t
1069	9692	15	О чем Эйнштейн рассказал своему повару	978-5-00057-305-1	Роберт Вольке	http://www.mann-ivanov-ferber.ru/books/chto_einstein_rasskazal_svoemu_povaru/	2017-02-28 17:02:34	2017-03-03 20:01:06	t
1640	18037	12	Лучшее время начать	978-5-00100-628-2	Джулия Кэмерон	http://www.mann-ivanov-ferber.ru/books/luchshee-vremya-nachat/	2017-02-28 17:02:42	2017-03-03 20:01:07	t
1642	18031	15	Книга радости		Его Святейшество Далай-лама XIV	http://www.mann-ivanov-ferber.ru/books/kniga-radosti/	2017-02-28 17:02:42	2017-03-03 20:01:07	t
1644	18025	9	Постигая Agile		Эндрю Стеллман	http://www.mann-ivanov-ferber.ru/books/postigaya-agile/	2017-02-28 17:02:42	2017-03-03 20:01:08	t
54	17868	9	45 татуировок продавана	978-5-00100-479-0	Максим Батырев (Комбат)	http://www.mann-ivanov-ferber.ru/books/tatuirovki-prodavana/	2017-02-28 16:57:19	2017-03-03 20:01:08	t
1658	17508	15	Как не ошибаться	978-5-00100-466-0	Джордан Элленберг	http://www.mann-ivanov-ferber.ru/books/kak-ne-oshibatsya/	2017-02-28 17:02:43	2017-03-03 20:01:09	t
1650	17870	9	Фасилитация на практике		Томас Кайзер	http://www.mann-ivanov-ferber.ru/books/fasilitacziya-na-praktike/	2017-02-28 17:02:43	2017-03-03 20:01:09	t
320	16064	14	Чудеса в кармашке, или Поиски Деда Мороза	978-5-00057-837-7	Ася Ванякина	http://www.mann-ivanov-ferber.ru/books/chudesa-v-karmashke-ili-poiski-deda-moroza/	2017-02-28 16:57:23	2017-03-03 20:01:10	t
1652	17773	9	Человек решающий		Деннис Бакке	http://www.mann-ivanov-ferber.ru/book/chelovek-reshayushhij/	2017-02-28 17:02:43	2017-03-03 20:01:14	t
1653	17671	15	Ритм вселенной		Стивен Строгац	http://www.mann-ivanov-ferber.ru/books/ritm-vselennoj/	2017-02-28 17:02:43	2017-03-03 20:01:15	t
1661	15523	11	Кошелек или жизнь	978-5-00057-737-0	Вики Робин	http://www.mann-ivanov-ferber.ru/books/koshelek-ili-zhizn/	2017-02-28 17:03:45	2017-03-03 20:01:16	t
1113	13951	12	Handmade	978-5-00057-485-0	Кари Чапин	http://www.mann-ivanov-ferber.ru/books/biznes_svoimi_rukami/	2017-02-28 17:02:35	2017-03-03 20:01:16	t
598	11035	12	Литературный мастер-класс	978-5-00057-259-7	Юрген Вольф	http://www.mann-ivanov-ferber.ru/books/sekreti_velikih_pisatelej/	2017-02-28 16:57:28	2017-03-03 20:01:17	t
449	14669	9	Методология Адизеса	978-5-00057-518-5	Шохам Адизес	http://www.mann-ivanov-ferber.ru/books/metodologiya-adizesa/	2017-02-28 16:57:25	2017-03-03 20:01:18	t
1656	17606	13	Переходи на растительное		Лани Мюлрат	http://www.mann-ivanov-ferber.ru/books/perexodi-na-rastitelnoe/	2017-02-28 17:02:43	2017-03-03 20:01:29	t
1655	17619	15	Квантовый век		Брайан Клегг	http://www.mann-ivanov-ferber.ru/books/kvantovyij-vek/	2017-02-28 17:02:43	2017-03-03 20:01:36	t
1648	17907	9	Заряженные на результат		Нил Доши и Линдси Макгрегор	http://www.mann-ivanov-ferber.ru/books/zaryazhennyie-na-rezultat/	2017-02-28 17:02:43	2017-03-03 20:01:36	t
288	15794	10	Согласовано!	978-5-00057-797-4	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/soglasovano/	2017-02-28 16:57:23	2017-03-03 20:01:39	t
1668	3884	9	Отношение определяет результат	978-5-91657-540-8	Дов  Сайдман	http://www.mann-ivanov-ferber.ru/books/paperbook/how/	2017-02-28 17:03:50	2017-03-03 20:01:39	t
1664	9316	12	Писать легко	978-500057-001-2	Ольга Соломатина	http://www.mann-ivanov-ferber.ru/books/pisat_legko/	2017-02-28 17:03:48	2017-03-03 20:01:39	t
968	18012	14	Умнее папы. Подарочный комплект		Мартин Содомка	http://www.mann-ivanov-ferber.ru/books/umnee-mamyi/	2017-02-28 17:02:27	2017-03-03 20:01:41	t
1669	2065	9	От хорошего к великому	978-5-00100-363-2	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/sse/good-great/	2017-02-28 17:04:17	2017-03-03 20:01:41	t
981	15263	14	Мое любимое животное		Катрин Грив	http://www.mann-ivanov-ferber.ru/books/moe-lyubimoe-zhivotnoe/	2017-02-28 17:02:28	2017-03-03 20:01:51	t
1013	10260	14	Ребенок-оптимист	978-5-00057-923-7	Мартин Селигман	http://www.mann-ivanov-ferber.ru/books/rebenok_optimist/	2017-02-28 17:02:31	2017-03-03 20:01:52	t
924	16903	14	Жук всегда осторожен	978-5-00100-062-4	Дианна Астон	http://www.mann-ivanov-ferber.ru/books/zhuk-vsegda-ostorozhen/	2017-02-28 17:02:20	2017-03-03 20:01:40	t
957	2769	13	Жизнь на полной мощности!	978-5-00057-925-1	Джим  Лоэр	http://www.mann-ivanov-ferber.ru/books/mif/pfem/	2017-02-28 17:02:23	2017-03-03 20:02:00	t
1372	7641	10	Клиенты на всю жизнь	978-5-91657-641-2	Карл Сьюэлл	http://www.mann-ivanov-ferber.ru/books/golden_library/customers-life/	2017-02-28 17:02:39	2017-03-03 20:02:01	t
1573	2059	9	Построенные навечно	5-315-00049-4	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/sse/built-last/	2017-02-28 17:02:41	2017-03-03 20:02:01	t
1442	3740	10	Продающие тексты	978-5-91657-261-2	Сергей Бернадский	http://www.mann-ivanov-ferber.ru/books/mif/sellingtexts/	2017-02-28 17:02:40	2017-03-03 20:02:02	t
1010	10048	15	Лидерство во льдах	 978-5-00057-140-8	Альфред Лансинг	http://www.mann-ivanov-ferber.ru/books/liderstvo_vo_ldah/	2017-02-28 17:02:31	2017-03-03 20:02:03	t
1037	3655	10	Обнимите своих клиентов	978-5-00057-876-6	Джек  Митчелл	http://www.mann-ivanov-ferber.ru/books/mif/hugyourcustomers/	2017-02-28 17:02:33	2017-03-03 20:02:03	t
1017	7470	9	Нет отбоя от клиентов	978-5-91657-941-3	Майкл Порт	http://www.mann-ivanov-ferber.ru/books/paperbook/book-yourself-solid-illustrated/	2017-02-28 17:02:31	2017-03-03 20:02:04	t
1011	10298	15	Остаться в живых	978-5-00057-094-4	Лоуренс Гонсалес	http://www.mann-ivanov-ferber.ru/books/ostatsya_v_zhivyh/	2017-02-28 17:02:31	2017-03-03 20:02:16	t
997	13111	9	Формула менеджмента	978-5-00057-284-9	Тимур Дергунов	http://www.mann-ivanov-ferber.ru/books/formula_menedzhmenta/	2017-02-28 17:02:29	2017-03-03 20:02:17	t
993	11004	9	Ловушка времени	978-5-00057-248-1	Алек Маккензи	http://www.mann-ivanov-ferber.ru/books/lovushka_vremeni/	2017-02-28 17:02:29	2017-03-03 20:02:17	t
1005	10375	14	Художник есть в каждом	978-5-00057-179-8	Джулия Кэмерон	http://www.mann-ivanov-ferber.ru/books/put_hudozhnika_dlja_roditelej/	2017-02-28 17:02:30	2017-03-03 20:02:18	t
954	4399	10	Огилви о рекламе	978-5-00057-931-2	Дэвид Огилви	http://www.mann-ivanov-ferber.ru/books/paperbook/ogilvi-o-reklame/	2017-02-28 17:02:23	2017-03-03 20:02:18	t
995	14394	14	ДИВНОЗАРЫ	978-5-00057-230-6	Франческо Пито	http://www.mann-ivanov-ferber.ru/books/divnozary/	2017-02-28 17:02:29	2017-03-03 20:02:19	t
1024	5960	15	Weber. Философия гриля	978-5-91657-749-5	Джейми Первиэнс	http://www.mann-ivanov-ferber.ru/books/special/weber/	2017-02-28 17:02:32	2017-03-03 20:02:20	t
988	12886	14	Юный инвестор	978-5-00057-378-5	Кэтрин Бейтман	http://www.mann-ivanov-ferber.ru/books/yunyj_investor/	2017-02-28 17:02:29	2017-03-03 20:02:20	t
979	14714	15	Не отступать и не сдаваться	978-5-00057-612-0	Луи Замперини	http://www.mann-ivanov-ferber.ru/books/ne-otstupat-i-ne-sdavatsya/	2017-02-28 17:02:27	2017-03-03 20:02:21	t
965	14917	15	Искусственный интеллект	978-5-00057-810-0	Ник Бостром	http://www.mann-ivanov-ferber.ru/books/iskusstvennyj-intellekt/	2017-02-28 17:02:26	2017-03-03 20:02:22	t
950	3205	9	Мастерство презентации	978-5-00057-902-2	Алексей Каптерев	http://www.mann-ivanov-ferber.ru/books/paperbook/presentationsecrets/	2017-02-28 17:02:23	2017-03-03 20:02:23	t
990	14374	15	Властелины Doom	978-5-00057-372-3	Дэвид Кушнер	http://www.mann-ivanov-ferber.ru/books/vlasteliny-doom/	2017-02-28 17:02:29	2017-03-03 20:02:23	t
976	14787	9	Продавец нового времени	978-5-00057-621-2	Джон Янч	http://www.mann-ivanov-ferber.ru/books/prodavec-novogo-vremeni/	2017-02-28 17:02:27	2017-03-03 20:02:24	t
935	15650	12	Долгие прогулки	978-5-00057-721-9	Джулия Кэмерон	http://www.mann-ivanov-ferber.ru/books/vstupaya-v-etot-mir/	2017-02-28 17:02:21	2017-03-03 20:02:24	t
971	15644	13	Без сахара	978-5-00057-727-1	Джейкоб Тейтельбаум	http://www.mann-ivanov-ferber.ru/books/bez-sahara/	2017-02-28 17:02:27	2017-03-03 20:02:26	t
934	16020	12	Антихаос	978-5-00057-866-7	Элизабет Джеймс	http://www.mann-ivanov-ferber.ru/books/geometriya-eto-krasivo/	2017-02-28 17:02:21	2017-03-03 20:02:26	t
943	13449	15	Просто Рич	978-5-00057-367-9	Рич Девос	http://www.mann-ivanov-ferber.ru/books/istorii_i_uroki_osnovatelya_amway/	2017-02-28 17:02:22	2017-03-03 20:02:31	t
931	15805	12	Литературный марафон	978-5-00057-959-6	Крис Бейти	http://www.mann-ivanov-ferber.ru/books/literaturnyj-marafon/	2017-02-28 17:02:20	2017-03-03 20:02:31	t
973	14873	12	Визуальные заметки на практике	978-5-00057-645-8	Майк Роуди	http://www.mann-ivanov-ferber.ru/books/sketchnoting-na-praktike/	2017-02-28 17:02:27	2017-03-03 20:02:32	t
999	8743	14	Разноцветная природа	978-5-91657-330-5	Франческо Пито	http://www.mann-ivanov-ferber.ru/books/children/la-nature-en-couleurs/	2017-02-28 17:02:29	2017-03-03 20:02:32	t
927	16018	12	На год мудрее	978-5-00100-018-1	Майк Медалья	http://www.mann-ivanov-ferber.ru/books/na-god-mudree/	2017-02-28 17:02:20	2017-03-03 20:02:33	t
963	15858	12	Жил-был я…	978-5-00057-879-7	Лавиния Бэккер	http://www.mann-ivanov-ferber.ru/books/zhil-byl-ya/	2017-02-28 17:02:26	2017-03-03 20:02:33	t
1502	3316	13	От 800 метров до марафона	978-500057-060-9	Джек  Дэниелс	http://www.mann-ivanov-ferber.ru/books/sport/rovdomar/	2017-02-28 17:02:41	2017-03-03 20:02:34	t
1084	16055	15	Кому что достанется — и почему	978-5-00057-952-7	Элвин Рот	http://www.mann-ivanov-ferber.ru/books/komu-chto-dostaetsya-i-pochemu/	2017-02-28 17:02:34	2017-03-03 20:02:35	t
1050	5515	9	Секреты великих ораторов	978-5-91657-649-8	Джеймс  Хьюмс	http://www.mann-ivanov-ferber.ru/books/paperbook/sekrety-velikikh-oratorov/	2017-02-28 17:02:33	2017-03-03 20:02:35	t
1047	7644	9	Тайм-драйв	978-5-91657-642-9	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/golden_library/taim-draiv/	2017-02-28 17:02:33	2017-03-03 20:02:44	t
1043	5060	9	Революционный продукт	978-5-91657-536-1	Гай Кавасаки	http://www.mann-ivanov-ferber.ru/books/paperbook/rulesforrevolutionaries/	2017-02-28 17:02:33	2017-03-03 20:02:45	t
1053	16236	12	365 дней очень творческого человека (морской волны)	978-5-91657-747-1	Яна Франк	http://www.mann-ivanov-ferber.ru/books/365-wave/	2017-02-28 17:02:34	2017-03-03 20:02:45	t
1032	6084	15	Бенджамин Франклин. Биография	978-5-91657-672-6	Уолтер Айзексон	http://www.mann-ivanov-ferber.ru/books/history/benjamin-franklin/	2017-02-28 17:02:32	2017-03-03 20:02:46	t
1020	7889	13	Рецепты здоровья и долголетия	978-5-91657-959-8	Лиэнн Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/paperbook/the_china_study_cookbook/	2017-02-28 17:02:32	2017-03-03 20:02:47	t
1141	9932	14	Вот так книга!	978-500057-073-9	Боб Стэк	http://www.mann-ivanov-ferber.ru/books/vot_tak_kniga/	2017-02-28 17:02:35	2017-03-03 17:03:50	t
1159	10005	14	ЖИНЕВОТЫ	978-5-91657-953-6	Франческо Пито	http://www.mann-ivanov-ferber.ru/books/zhinevoti/	2017-02-28 17:02:35	2017-03-03 20:05:22	t
1153	9524	9	Комплект «Самые важные книги о бизнесе»	978-5-91657-989-5	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/samie_vazhnie_knigi_o_biznisi/	2017-02-28 17:02:35	2017-03-03 20:05:27	t
1170	8568	15	Иллюстрированный Трудовой кодекс Российской Федерации		Алексей Меринов (художник)	http://www.mann-ivanov-ferber.ru/books/paperbook/tkrf/	2017-02-28 17:02:36	2017-03-03 20:05:28	t
1150	10473	14	Веселое сафари	978-5-91657-933-8	Лаура Хэмблтон	http://www.mann-ivanov-ferber.ru/books/veseloe_safari/	2017-02-28 17:02:35	2017-03-03 20:05:28	t
1078	2854	11	Цельная жизнь	978-5-91657-319-0	Лес Хьюитт	http://www.mann-ivanov-ferber.ru/books/mif/thepoweroffocus/	2017-02-28 17:02:34	2017-03-03 20:05:29	t
1118	14609	12	Свадебный органайзер №1	978-5-00057-432-4	Дария Бикбаева	http://www.mann-ivanov-ferber.ru/books/cvadebnyj-organajzer-nomer-odin/	2017-02-28 17:02:35	2017-03-03 20:05:30	t
1135	10405	15	Правила дорожного движения Российской Федерации с рисунками Андрея Бильжо	978-5-00057-108-8	Андрей Бильжо	http://www.mann-ivanov-ferber.ru/books/pdd/	2017-02-28 17:02:35	2017-03-03 20:05:39	t
1062	18635	14	Садовник и куст	978-5-00100-339-7	Катарина Макурова	http://www.mann-ivanov-ferber.ru/books/sadovnik-i-kust/	2017-02-28 17:02:34	2017-03-03 20:02:34	t
1111	16949	14	KUMON на украинском языке. Учимся вырезать	978-5-00057-547-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-na-ukrainskom-yazyke-uchimsya-vyrezat/	2017-02-28 17:02:35	2017-03-03 20:05:40	t
1105	13734	14	Секреты высыпающейся мамы	978-5-00057-492-8	Трейси Хогг	http://www.mann-ivanov-ferber.ru/books/pochemu_vash_rebenok_tak_sebya_vedet/	2017-02-28 17:02:35	2017-03-03 20:05:40	t
1093	14863	15	Интерстеллар	978-5-00057-536-9	Кип Торн	http://www.mann-ivanov-ferber.ru/books/interstellar/	2017-02-28 17:02:34	2017-03-03 20:05:41	t
1096	16044	15	Пироговедение для детей		Ирина Чадеева	http://www.mann-ivanov-ferber.ru/books/pirogovedenie-dlya-detej/	2017-02-28 17:02:34	2017-03-03 20:05:41	t
1100	14796	9	Школа B2B-продаж	978-5-00057-491-1	Михаил Казанцев	http://www.mann-ivanov-ferber.ru/books/shkola-b2b-prodazh/	2017-02-28 17:02:34	2017-03-03 20:05:56	t
1095	15202	11	Правило четырех секунд	978-5-00057-650-2	Питер Брегман	http://www.mann-ivanov-ferber.ru/books/pravilo-chetyreh-sekund/	2017-02-28 17:02:34	2017-03-03 20:05:57	t
1102	14675	10	Эффективная реклама в Яндекс.Директ	978-5-00057-604-5	Константин Живенков	http://www.mann-ivanov-ferber.ru/books/effektivnaya-reklama-v-yandeks-direkt/	2017-02-28 17:02:35	2017-03-03 20:05:57	t
1090	15975	14	Календарь ожидания Нового года	978-5-00057-728-8	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/kalendar-ozhidaniya-novogo-goda/	2017-02-28 17:02:34	2017-03-03 20:05:58	t
1077	18498	9	Стратегия голубого океана	978-5-00057-835-3	Чан Ким и Рене Моборн	http://www.mann-ivanov-ferber.ru/books/paperbook/blueoceanstrategy-mp3/	2017-02-28 17:02:34	2017-03-03 20:05:59	t
1057	2480	9	Команды менеджеров		Рэймонд Мередит Белбин	http://www.mann-ivanov-ferber.ru/books/paperbook/managementteams/	2017-02-28 17:02:34	2017-03-03 20:06:05	t
1088	14802	10	Сервис, который приносит прибыль	978-5-00057-736-3	Ричард Оуэн	http://www.mann-ivanov-ferber.ru/books/loyalnost-na-praktike/	2017-02-28 17:02:34	2017-03-03 20:06:05	t
1129	8742	14	Разноцветная ферма	978-5-91657-356-5	Франческо Пито	http://www.mann-ivanov-ferber.ru/books/children/la-ferme-en-couleurs/	2017-02-28 17:02:35	2017-03-03 20:06:06	t
1081	16745	9	Психология переговоров	978-5-00100-067-9	Маргарет Нил	http://www.mann-ivanov-ferber.ru/books/psihologiya-peregovorov/	2017-02-28 17:02:34	2017-03-03 20:06:06	t
1066	13094	11	Психология вредных привычек	978-5-00057-478-2	Ричард О’Коннор	http://www.mann-ivanov-ferber.ru/books/nastrojka_mozga/	2017-02-28 17:02:34	2017-03-03 20:06:07	t
1065	16156	14	Энциклопедия Монтессори	978-5-00057-785-1	Тим Селдин	http://www.mann-ivanov-ferber.ru/books/enciklopediya-montessori/	2017-02-28 17:02:34	2017-03-03 20:06:08	t
1155	9525	9	Комплект «Лучшие книги по продажам»	978-5-91657-990-1	Нил Рекхэм	http://www.mann-ivanov-ferber.ru/books/luchie_knigi_po_prodazham/	2017-02-28 17:02:35	2017-03-03 20:06:08	t
1240	7044	11	Мысли по-крупному и не тормози!	978-5-91657-796-9	Дональд Трамп	http://www.mann-ivanov-ferber.ru/books/paperbook/trump-the-art-of-the-deal/	2017-02-28 17:02:37	2017-03-03 20:06:17	t
1185	8457	9	Разверните ваш корабль	978-5-91657-845-4	Дэвид Марке	http://www.mann-ivanov-ferber.ru/books/mif/turn-ship-around/	2017-02-28 17:02:36	2017-03-03 20:06:26	t
1115	12196	9	Конструктор делового письма	978-5-00057-427-0	Саша Карепина	http://www.mann-ivanov-ferber.ru/books/periodicheskaya_sistema_delovoj_perepiski/	2017-02-28 17:02:35	2017-03-03 20:06:27	t
1212	7896	9	Скоринговые карты для оценки кредитных рисков	978-5-91657-899-7	Наим Сиддики	http://www.mann-ivanov-ferber.ru/books/paperbook/credit-risk-scorecards/	2017-02-28 17:02:36	2017-03-03 20:06:33	t
1180	8528	9	Большие данные	978-5-91657-936-9	Виктор Майер-Шенбергер	http://www.mann-ivanov-ferber.ru/books/paperbook/big-data/	2017-02-28 17:02:36	2017-03-03 20:06:34	t
1235	6634	9	Сердце компании	978-5-91657-742-6	Патрик Ленсиони	http://www.mann-ivanov-ferber.ru/books/paperbook/advantage/	2017-02-28 17:02:37	2017-03-03 20:06:34	t
1223	6718	10	Интернет-маркетинг: лучшие бесплатные инструменты	978-5-91657-816-4	Джим Кокрум	http://www.mann-ivanov-ferber.ru/books/paperbook/free-marketing/	2017-02-28 17:02:36	2017-03-03 20:06:35	t
1189	7632	9	Стратегия голубого океана	978-5-91657-840-9	Чан Ким и Рене Моборн	http://www.mann-ivanov-ferber.ru/books/golden_library/blueoceanstrateg/	2017-02-28 17:02:36	2017-03-03 20:06:36	t
1216	6700	15	Птицы России	978-5-91657-804-1	Валерий Малеев	http://www.mann-ivanov-ferber.ru/books/special/birds/	2017-02-28 17:02:36	2017-03-03 20:06:36	t
1200	8924	14	Большая книга LEGO®. Лучшие города мира. Построй из LEGO®		Аллан Бедфорд	http://www.mann-ivanov-ferber.ru/books/set14/	2017-02-28 17:02:36	2017-03-03 20:06:42	t
1217	7558	9	Будущее глазами одного из самых влиятельных инвесторов в мире	978-5-91657-846-1	Джим  Роджерс	http://www.mann-ivanov-ferber.ru/books/paperbook/street-smarts/	2017-02-28 17:02:36	2017-03-03 20:06:42	t
1182	7012	14	Карандаш и Самоделкин на острове динозавров	978-5-91657-803-4	Валентин Постников	http://www.mann-ivanov-ferber.ru/books/children/pencil/	2017-02-28 17:02:36	2017-03-03 20:06:54	t
1175	7479	13	Палеодиета	978-5-91657-948-2	Лорен Кордейн	http://www.mann-ivanov-ferber.ru/books/paperbook/the_paleo_diet_revised/	2017-02-28 17:02:36	2017-03-03 20:06:55	t
1166	8303	10	Контент, маркетинг и рок-н-ролл	978-5-91657-862-1	Денис Каплунов	http://www.mann-ivanov-ferber.ru/books/mif/content/	2017-02-28 17:02:36	2017-03-03 20:06:55	t
1191	8998	14	Зоки и Бада. Зоки и Бада. Большая книга для рисования		Ирина и Леонид Тюхтяевы	http://www.mann-ivanov-ferber.ru/books/set17/	2017-02-28 17:02:36	2017-03-03 20:06:56	t
1184	7634	9	От хорошего к великому	978-5-91657-837-9	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/golden_library/good-great/	2017-02-28 17:02:36	2017-03-03 20:07:00	t
1145	10207	9	Делегирование и управление	978-5-00057-101-9	Брайан Трейси	http://www.mann-ivanov-ferber.ru/books/delegirovanie_i_upravlenie/	2017-02-28 17:02:35	2017-03-03 20:07:00	t
1209	5979	15	Кофе	978-5-91657-733-4	Питер Херноу	http://www.mann-ivanov-ferber.ru/books/paperbook/latteart/	2017-02-28 17:02:36	2017-03-03 20:07:01	t
1206	7389	11	Брать или отдавать?	978-5-91657-890-4	Адам Грант	http://www.mann-ivanov-ferber.ru/books/paperbook/give-and-take/	2017-02-28 17:02:36	2017-03-03 20:07:01	t
1196	14304	11	Пробуждение сознания	978-5-91657-461-6	Джо Витале	http://www.mann-ivanov-ferber.ru/books/probuzhdenie_soznaniya/	2017-02-28 17:02:36	2017-03-03 20:07:03	t
1162	9165	11	Найти свое призвание	978-500057-006-7	Кен Робинсон	http://www.mann-ivanov-ferber.ru/books/najti_svoe_prizvanie/	2017-02-28 17:02:35	2017-03-03 20:07:03	t
1158	8447	9	Правила лучших CEO	 978-500057-071-5	Уильям Торндайк	http://www.mann-ivanov-ferber.ru/books/sse/outsiders/	2017-02-28 17:02:35	2017-03-03 20:07:04	t
1172	7394	15	Технологии, которые изменят мир	978-5-91657-902-4	Мартин Форд	http://www.mann-ivanov-ferber.ru/books/paperbook/the-lights-in-the-tunnel/	2017-02-28 17:02:36	2017-03-03 17:03:51	t
1149	9379	9	Бизнес-тренинг: как это делается	 978-5-00057-079-1	Дмитрий Григорьев	http://www.mann-ivanov-ferber.ru/books/blestyashhiy_biznes_trening/	2017-02-28 17:02:35	2017-03-03 20:07:04	t
1134	8681	15	Хорошие манеры и деловой этикет	978-5-00057-260-3	Елена Бер	http://www.mann-ivanov-ferber.ru/books/special/horoshie-manery/	2017-02-28 17:02:35	2017-03-03 20:07:05	t
1138	10285	9	Укрощение больших данных	978-5-00057-146-0	Билл Фрэнкс	http://www.mann-ivanov-ferber.ru/books/ukroschenie_bolshih_dannyh/	2017-02-28 17:02:35	2017-03-03 20:07:16	t
1122	13804	9	Персональный бренд: создание и продвижение	978-5-00057-321-1	Андрей  Рябых	http://www.mann-ivanov-ferber.ru/books/personalnij_brend/	2017-02-28 17:02:35	2017-03-03 20:07:16	t
1131	11310	9	Цифровой банк	978-5-00057-277-1	Крис Скиннер	http://www.mann-ivanov-ferber.ru/books/cifrovoy_bank/	2017-02-28 17:02:35	2017-03-03 20:07:17	t
1202	8922	15	Дикая природа России. Птицы России		Валерий Малеев	http://www.mann-ivanov-ferber.ru/books/set12/	2017-02-28 17:02:36	2017-03-03 20:07:26	t
1126	11135	14	Иностранный как родной	978-5-00057-256-6	Наоми Штайнер	http://www.mann-ivanov-ferber.ru/books/inostrannyj_kak_rodnoj/	2017-02-28 17:02:35	2017-03-03 20:07:26	t
1119	14434	9	Пять ключевых вопросов Друкера	978-5-00057-376-1	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/pyat-klyuchevyh-voprosov-drukera/	2017-02-28 17:02:35	2017-03-03 20:07:27	t
1213	8144	15	Мудрость толпы	978-5-91657-914-7	Джеймс Шуровьески	http://www.mann-ivanov-ferber.ru/books/paperbook/the-wisdom-of-crowds/	2017-02-28 17:02:36	2017-03-03 20:07:27	t
1178	8145	11	Прокачай себя!	978-5-91657-945-1	Джон  Норкросс	http://www.mann-ivanov-ferber.ru/books/mif/changeology/	2017-02-28 17:02:36	2017-03-03 20:07:28	t
1221	7518	9	Уроки выдающихся лидеров	 978-5-91657-762-4	Билл Джордж	http://www.mann-ivanov-ferber.ru/books/secrets_of_the_great/true_north/	2017-02-28 17:02:36	2017-03-03 20:06:09	t
1284	5443	15	Иллюстрированный Уголовный кодекс Российской Федерации	978-5-91657-659-7	Алексей Меринов (художник)	http://www.mann-ivanov-ferber.ru/books/paperbook/ukrf/	2017-02-28 17:02:37	2017-03-03 20:07:29	t
1315	4292	10	Преодоление пропасти	978-5-91657-537-8	Джеффри Мур	http://www.mann-ivanov-ferber.ru/books/mif/crossing-chasm/	2017-02-28 17:02:38	2017-03-03 20:07:29	t
1225	6564	9	Оценка персонала методом ассессмент-центра	978-5-91657-793-8	Елена Барышникова	http://www.mann-ivanov-ferber.ru/books/paperbook/ocenka-personala/	2017-02-28 17:02:36	2017-03-03 20:07:30	t
1247	6380	9	Искусство визуализации в бизнесе	978-5-91657-737-2	Нейтан Яу	http://www.mann-ivanov-ferber.ru/books/paperbook/visualize-this/	2017-02-28 17:02:37	2017-03-03 20:07:30	t
1324	4854	9	Блестящие совещания	978-5-91657-535-4	 Ди Келси и Пэм Пламб	http://www.mann-ivanov-ferber.ru/books/paperbook/great-meetings/	2017-02-28 17:02:38	2017-03-03 20:07:31	t
1321	4896	12	Год жизни леволапика	978-5-91657-362-6	Яна Франк	http://www.mann-ivanov-ferber.ru/books/paperbook/god-zhizni-levolapika/	2017-02-28 17:02:38	2017-03-03 20:07:29	t
1296	5279	9	Что вам делать со стратегией?	978-5-91657-607-8	Тигран Арутюнян	http://www.mann-ivanov-ferber.ru/books/paperbook/what-do-you-do-strategy/	2017-02-28 17:02:38	2017-03-03 20:07:31	t
1294	5354	10	Эффективное коммерческое предложение	978-5-91657-619-1	Денис Каплунов	http://www.mann-ivanov-ferber.ru/books/paperbook/effectivmoe-kommercheskoe/	2017-02-28 17:02:38	2017-03-03 20:07:32	t
1287	5497	13	Правила долголетия. Возраст счастья (комплект из 2 книг)		Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/special/komplekt-agehealth/	2017-02-28 17:02:37	2017-03-03 20:07:33	t
1310	4775	15	Поведенческая экономика	 978-5-91657-549-1	Дэн Ариели	http://www.mann-ivanov-ferber.ru/books/paperbook/predictably-irrational/	2017-02-28 17:02:38	2017-03-03 20:07:33	t
1303	5237	10	Правила Apple	978-5-91657-567-5	Кармин Галло	http://www.mann-ivanov-ferber.ru/books/paperbook/the-apple-expirience/	2017-02-28 17:02:38	2017-03-03 20:07:34	t
1307	3250	10	Маркетинг в социальных медиа	 978-5-91657-416-6	 Джейсон Фоллс 	http://www.mann-ivanov-ferber.ru/books/paperbook/no-bullshit-social-media/	2017-02-28 17:02:38	2017-03-03 20:07:34	t
1301	5347	10	Искусство создания рекламных посланий	 978-5-91657-609-2	Джозеф Шугерман	http://www.mann-ivanov-ferber.ru/books/paperbook/theultimateguide/	2017-02-28 17:02:38	2017-03-03 20:07:35	t
1278	4050	9	Столкновение культур	978-5-91657-664-1	Ричард  Льюис	http://www.mann-ivanov-ferber.ru/books/paperbook/whenculturescollide/	2017-02-28 17:02:37	2017-03-03 20:07:35	t
1289	5202	9	Управление спросом	978-5-91657-622-1	Адриан Сливотски	http://www.mann-ivanov-ferber.ru/books/paperbook/demand/	2017-02-28 17:02:37	2017-03-03 20:07:46	t
1281	4761	12	Дерзкая простота мысли	978-5-91657-524-8	Морис  Саатчи	http://www.mann-ivanov-ferber.ru/books/paperbook/brutal-simplicity-thought/	2017-02-28 17:02:37	2017-03-03 20:07:47	t
1292	5127	9	Офис в стиле фанк	978-5-91657-603-0	Кали Ресслер и Джоди Томпсон	http://www.mann-ivanov-ferber.ru/books/paperbook/office-funky/	2017-02-28 17:02:37	2017-03-03 20:07:53	t
1260	5839	10	Формула эффекта	978-5-91657-671-9	Крис Броган и Джулиен Смит	http://www.mann-ivanov-ferber.ru/books/mif/impact-equation/	2017-02-28 17:02:37	2017-03-03 20:08:05	t
1273	5440	13	Эффективное плавание	 978-5-91657-653-5	Адам Янг, Пол Ньюсом	http://www.mann-ivanov-ferber.ru/books/sport/swim-smooth/	2017-02-28 17:02:37	2017-03-03 20:08:06	t
1274	5495	11	Сделай себя сам	978-5-91657-660-3	Тина  Силиг	http://www.mann-ivanov-ferber.ru/books/mif/what-i-wish/	2017-02-28 17:02:37	2017-03-03 20:08:06	t
1270	6100	9	Тайм-драйв. Никогда не ешьте в одиночку. Клиенты на всю жизнь (комплект из 3 книг)		Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/special/gold/	2017-02-28 17:02:37	2017-03-03 20:08:14	t
1255	6565	9	От хорошего к великому. Как гибнут великие. Великие по собственному выбору (комплект из 3 книг)		Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/special/set3/	2017-02-28 17:02:37	2017-03-03 20:08:17	t
1253	6113	15	Прорывные экономики	978-5-91657-704-4	Ручир Шарма	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/breakout-nations/	2017-02-28 17:02:37	2017-03-03 20:08:18	t
1234	6799	15	Год, прожитый по-библейски	978-5-91657-809-6	Эй Джей Джейкобс	http://www.mann-ivanov-ferber.ru/books/paperbook/the-year-of-living-biblically/	2017-02-28 17:02:37	2017-03-03 20:08:18	t
1262	5901	9	Руководство разумного инвестора	978-5-91657-697-9	Джон Богл	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/the-little-book-of-common-sense-investing/	2017-02-28 17:02:37	2017-03-03 20:08:22	t
1242	4860	13	Самые сложные гонки на выносливость	 978-5-91657-734-1	Ричард  Хоад	http://www.mann-ivanov-ferber.ru/books/sport/world-toughest-endurance-challenges/	2017-02-28 17:02:37	2017-03-03 20:08:23	t
1244	6858	12	Муза, где твои крылья? 365 дней очень творческого человека (зеленый). Муза и чудовище (комплект из трех книг)		Яна Франк	http://www.mann-ivanov-ferber.ru/books/special/set6/	2017-02-28 17:02:37	2017-03-03 20:08:23	t
1318	5077	9	Совет на миллион	978-5-91657-376-3	 Брендон Берчард	http://www.mann-ivanov-ferber.ru/books/paperbook/millionaire-messenger/	2017-02-28 17:02:38	2017-03-03 20:08:34	t
1254	5513	14	Собери свой город	978-5-91657-679-5	Иоахим Кланг	http://www.mann-ivanov-ferber.ru/books/children/lego/	2017-02-28 17:02:37	2017-03-03 20:08:35	t
1228	6683	11	Парадокс перфекциониста	978-5-91657-754-9	Тал Бен-Шахар	http://www.mann-ivanov-ferber.ru/books/paperbook/pursuit-perfect/	2017-02-28 17:02:37	2017-03-03 20:08:35	t
1313	9219	9	Практический годовой отчет за 2013 год		С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/prakticheskij_godovoj_otchet/	2017-02-28 17:02:38	2017-03-03 20:08:35	t
1283	5224	9	Уроки дизайна от Apple	978-5-91657-644-3	Джон Эдсон	http://www.mann-ivanov-ferber.ru/books/paperbook/design-apple/	2017-02-28 17:02:37	2017-03-03 20:08:36	t
1335	8575	9	Банк и касса. Издание 3		С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/bank-i-kassa/	2017-02-28 17:02:38	2017-03-03 20:08:43	t
1333	8577	9	Кадровый учет и управление персоналом		Е.А. Грянина	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/secrety-ku/	2017-02-28 17:02:38	2017-03-03 20:08:48	t
1385	7374	9	Управляя менеджерами	978-5-91657-392-3	Август-Вильгельм Шеер	http://www.mann-ivanov-ferber.ru/books/paperbook/managing-managers/	2017-02-28 17:02:39	2017-03-03 20:08:48	t
1413	6504	15	Последние 100 дней	978-5-91657-661-0	Кристофер Хитченс	http://www.mann-ivanov-ferber.ru/books/paperbook/mortality/	2017-02-28 17:02:39	2017-03-03 20:08:50	t
1402	4043	9	Менеджмент. Вызовы XXI века	978-5-91657-365-7	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/paperbook/challenges/	2017-02-28 17:02:39	2017-03-03 20:08:50	t
1405	5427	10	YouTube для бизнеса	978-5-91657-393-0	Майкл Миллер	http://www.mann-ivanov-ferber.ru/books/paperbook/youtubeforbusiness-1/	2017-02-28 17:02:39	2017-03-03 20:08:51	t
1348	8319	11	Найди свой путь к богатству		Наполеон Хилл	http://www.mann-ivanov-ferber.ru/books/paperbook/the-master-key-to-riches/	2017-02-28 17:02:38	2017-03-03 20:08:52	t
1361	8097	9	Расчеты по оплате труда	 978-5-9677-1626-3	Е.А. Грянина	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/sekreti/	2017-02-28 17:02:39	2017-03-03 20:08:53	t
1345	4962	15	Мир в 2050 году	978-5-91657-518-7	Дэниел Франклин	http://www.mann-ivanov-ferber.ru/books/paperbook/the-world-in-2050/	2017-02-28 17:02:38	2017-03-03 20:08:53	t
1350	5113	9	Усиливаем стрессоустойчивость	978-5-91657-293-3	Видула Бал	http://www.mann-ivanov-ferber.ru/books/navigator-for-the-leader/managing-leadership-stress/	2017-02-28 17:02:38	2017-03-03 20:08:54	t
1358	6276	11	Как быть богатым	978-5-91657-370-1	Патриция Хоран	http://www.mann-ivanov-ferber.ru/books/paperbook/how-be-rich/	2017-02-28 17:02:38	2017-03-03 20:08:58	t
1355	4687	9	Длинный хвост	978-5-91657-498-2	Крис  Андерсон	http://www.mann-ivanov-ferber.ru/books/paperbook/longtail/	2017-02-28 17:02:38	2017-03-03 20:08:59	t
1410	6537	9	Наш Айсберг тает	978-5-91657-449-4	Джон Коттер	http://www.mann-ivanov-ferber.ru/books/paperbook/nash-aysberg-taet/	2017-02-28 17:02:39	2017-03-03 20:08:59	t
1328	3589	9	Бизнес-процессы	978-5-91657-521-7	Владимир Репин	http://www.mann-ivanov-ferber.ru/books/paperbook/business-processes/	2017-02-28 17:02:38	2017-03-03 20:09:00	t
1422	6290	15	Цифровое пиратство	978-5-91657-509-5	Даррен Тодд	http://www.mann-ivanov-ferber.ru/books/paperbook/pirate-nation/	2017-02-28 17:02:39	2017-03-03 20:09:06	t
1378	3948	9	Стартап без бюджета. Rework. Управление стартапом		Майк Микаловиц	http://www.mann-ivanov-ferber.ru/books/special/start/	2017-02-28 17:02:39	2017-03-03 20:08:37	t
1415	6501	10	Продай свою идею!	978-5-91657-468-5	Сэм Харрисон	http://www.mann-ivanov-ferber.ru/books/paperbook/proday-svoyu-ideyu/	2017-02-28 17:02:39	2017-03-03 20:09:07	t
1393	3673	9	Преврати себя в бренд!	978-5-91657-555-2	Том Питерс	http://www.mann-ivanov-ferber.ru/books/paperbook/turnyourselfintoabrand/	2017-02-28 17:02:39	2017-03-03 20:09:08	t
1388	4556	11	Упрости себе жизнь	978-5-91657-406-7	 Эрин Доланд 	http://www.mann-ivanov-ferber.ru/books/mif/unclutteryourlifeinoneweek/	2017-02-28 17:02:39	2017-03-03 20:09:21	t
1383	7379	11	Думай как миллиардер	978-5-904522-30-8	Дональд Трамп	http://www.mann-ivanov-ferber.ru/books/paperbook/trump-think-like-a-billionaire/	2017-02-28 17:02:39	2017-03-03 20:09:22	t
1371	3718	9	От хорошего к великому (в кожаном переплете)	978-5-91657-272-8	Джим Коллинз	http://www.mann-ivanov-ferber.ru/books/special/good-to-great-kozha/	2017-02-28 17:02:39	2017-03-03 20:09:33	t
1363	8094	9	Бухгалтерский и налоговый учет в «1С:Бухгалтерии 8»	978-5-9677-1367-5	С.А. Харитонов	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/nalogoviy-uchet/	2017-02-28 17:02:39	2017-03-03 20:09:00	t
1364	8095	9	1С:Предприятие 8.2. Версия для обучения программированию» (+CD)	978-5-9677-1103-9	Фирма «1С»	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/versiya-dlya-obucheniya-programmirovaniyu/	2017-02-28 17:02:39	2017-03-03 20:09:38	t
1250	12239	\N	Дневники подопытного кролика		Эй Джей Джейкобс	http://www.mann-ivanov-ferber.ru/books/dnevniki_podopytnogo_krolika/	2017-02-28 17:02:37	2017-03-03 20:08:33	t
1343	4525	9	Переворот	 978-5-91657-417-3	Люк Уильямс	http://www.mann-ivanov-ferber.ru/books/paperbook/disrupt/	2017-02-28 17:02:38	2017-03-03 20:09:39	t
1340	4702	9	Время действовать	978-5-91657-525-5	Саймон Мэйнуоринг	http://www.mann-ivanov-ferber.ru/books/paperbook/we-first/	2017-02-28 17:02:38	2017-03-03 20:09:40	t
1338	8572	9	Учет производственных операций. Издание 3		Е.В. Самарина	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/uchet-operaciy/	2017-02-28 17:02:38	2017-03-03 20:09:50	t
1330	3923	15	Речи, которые изменили Россию (в кожаном переплете)		Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/special/speeches-ru/	2017-02-28 17:02:38	2017-03-03 20:09:51	t
1331	3922	15	Компании, которые изменили мир (в кожаном переплете)		Джонатан Мэнтл	http://www.mann-ivanov-ferber.ru/books/special/companies1/	2017-02-28 17:02:38	2017-03-03 20:10:03	t
1400	4489	9	Как подготовиться к переговорам за час	978-5-91657-412-8	 Пьер Касс	http://www.mann-ivanov-ferber.ru/books/paperbook/hour/	2017-02-28 17:02:39	2017-03-03 20:10:14	t
1418	6470	10	Управление взаимоотношениями с клиентами	978-5-904522-11-7	  	http://www.mann-ivanov-ferber.ru/books/paperbook/upravlenie-vzaimootnosheniyami-s-klientami/	2017-02-28 17:02:39	2017-03-03 20:09:07	t
1374	4314	10	Точки контакта	978-5-91657-482-1	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/paperbook/pointofcontact/	2017-02-28 17:02:39	2017-03-03 20:10:15	t
1513	2763	9	Как поддерживать дела в порядке	978-5-91657-807-2	Дэвид Аллен	http://www.mann-ivanov-ferber.ru/books/mif/makingitallwork/	2017-02-28 17:02:41	2017-03-03 20:10:16	t
1506	2734	9	Позитивная иррациональность	 978-5-91657-120-2	Дэн Ариели	http://www.mann-ivanov-ferber.ru/books/paperbook/perfectlyirrational/	2017-02-28 17:02:41	2017-03-03 20:10:16	t
1487	3578	9	И ботаники делают бизнес		Максим Котин	http://www.mann-ivanov-ferber.ru/books/apps/appsbotan/	2017-02-28 17:02:40	2017-03-03 20:10:29	t
1450	3772	9	Рунетология	978-5-91657-303-9	Максим Спиридонов	http://www.mann-ivanov-ferber.ru/books/paperbook/runetology/	2017-02-28 17:02:40	2017-03-03 20:10:30	t
1461	3669	13	Я здесь, чтобы победить	978-5-91657-258-2	Крис Маккормак	http://www.mann-ivanov-ferber.ru/books/sport/imheretowin/	2017-02-28 17:02:40	2017-03-03 20:10:31	t
1476	4416	14	Лидер во мне	978-5-91657-409-8	Стивен Кови	http://www.mann-ivanov-ferber.ru/books/paperbook/leader-me/	2017-02-28 17:02:40	2017-03-03 20:10:32	t
1471	3378	9	Электрические методы обогащения	978-5-91657-238-4	Павел  Черкашин	http://www.mann-ivanov-ferber.ru/books/paperbook/elekmetobog/	2017-02-28 17:02:40	2017-03-03 20:10:32	t
1458	3357	11	Ментальные ловушки на работе	978-5-91657-322-0	Марк Гоулстон	http://www.mann-ivanov-ferber.ru/books/mif/gooyowatw/	2017-02-28 17:02:40	2017-03-03 20:10:34	t
1460	3695	9	Стартап вокруг клиента	978-5-91657-274-2	Патрик Власковиц	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/tocustomerdevelopment/	2017-02-28 17:02:40	2017-03-03 20:10:34	t
1466	3567	9	Ангелы, драконы и стервятники	978-5-91657-214-8	Саймон Экланд	http://www.mann-ivanov-ferber.ru/books/luchiernoctar/invetirctapov/	2017-02-28 17:02:40	2017-03-03 20:10:43	t
1452	3639	9	Внутри Coca-cola	978-5-91657-263-6	Невил Исделл	http://www.mann-ivanov-ferber.ru/books/paperbook/insidecocacola/	2017-02-28 17:02:40	2017-03-03 20:10:44	t
1464	3713	15	Далеко, далеко…		Сергей Доля	http://www.mann-ivanov-ferber.ru/books/apps/daleko-daleko/	2017-02-28 17:02:40	2017-03-03 20:10:44	t
1469	5310	15	iPad 2. Исчерпывающее руководство	 978-5-91657-317-6	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/rukovodstvoipad2-1/	2017-02-28 17:02:40	2017-03-03 20:10:54	t
1455	3648	11	Цельная жизнь для студентов	978-5-91657-242-1	Лес Хьюитт	http://www.mann-ivanov-ferber.ru/books/mif/thepoweroffocusstudents/	2017-02-28 17:02:40	2017-03-03 20:10:57	t
1439	5666	10	Маркетинг на 100%. Хороший год (комплект из 2 книг)		Игорь Манн	http://www.mann-ivanov-ferber.ru/books/special/set/	2017-02-28 17:02:40	2017-03-03 20:10:57	t
1437	4587	15	Настоящему мужчине. Путеводитель по мужскому стилю	978-5-91657-338-1	Алан Флассер	http://www.mann-ivanov-ferber.ru/books/special/dressingtheman2/	2017-02-28 17:02:40	2017-03-03 20:10:58	t
1398	4390	9	ИКЕА: собери свою мечту	978-5-91657-389-3	 Андерс Дальвиг	http://www.mann-ivanov-ferber.ru/books/paperbook/ikeaadutytogrow/	2017-02-28 17:02:39	2017-03-03 20:11:10	t
1485	5411	10	Добавьте в корзину	978-5-91657-193-6	Брайан и Джеффри Айзенберг	http://www.mann-ivanov-ferber.ru/books/paperbook/caaction-1/	2017-02-28 17:02:40	2017-03-03 20:11:11	t
1427	6269	11	Избавь свою жизнь от хлама!	978-5-91657-404-3	Эндрю Меллен	http://www.mann-ivanov-ferber.ru/books/paperbook/unstuff-your-life/	2017-02-28 17:02:39	2017-03-03 20:11:12	t
1483	3134	9	Переговоры, которые работают	978-5-91657-178-3	Стюарт Даймонд	http://www.mann-ivanov-ferber.ru/books/paperbook/gettingmore/	2017-02-28 17:02:40	2017-03-03 20:11:12	t
1431	6255	10	Гипнотические рекламные тексты	978-5-91657-486-9	Джо Витале	http://www.mann-ivanov-ferber.ru/books/paperbook/hypnotic-advertising-texts/	2017-02-28 17:02:40	2017-03-03 20:11:13	t
1441	5284	15	Секреты великих ораторов (в кожаном переплете)	 978-5-91657-511-8	Джеймс  Хьюмс	http://www.mann-ivanov-ferber.ru/books/special/secretvelikihoratorov/	2017-02-28 17:02:40	2017-03-03 20:11:23	t
1448	3684	9	Вторая космическая	978-5-91657-297-1	Джеффри Мур	http://www.mann-ivanov-ferber.ru/books/paperbook/escapevelocity/	2017-02-28 17:02:40	2017-03-03 20:11:33	t
1474	3319	14	Малыш и Карлсон		  	http://www.mann-ivanov-ferber.ru/books/apps/karlson/	2017-02-28 17:02:40	2017-03-03 20:11:42	t
1520	2772	10	Эра Facebook	978-5-91657-187-5	Клара Ших	http://www.mann-ivanov-ferber.ru/books/mif/thefacebookera/	2017-02-28 17:02:41	2017-03-03 20:11:52	t
1503	2679	9	Бизнес-фитнес	978-5-91657-159-2	 Ричардсон Марк 	http://www.mann-ivanov-ferber.ru/books/mif/howfitisyourbusiness/	2017-02-28 17:02:41	2017-03-03 20:11:52	t
1488	5378	9	И ботаники делают бизнес	978-5-91657-285-8	Максим Котин	http://www.mann-ivanov-ferber.ru/books/paperbook/botaniki/	2017-02-28 17:02:40	2017-03-03 20:11:53	t
1445	3198	9	Сантехники и провидцы	978-5-91657-266-7	Питер Норман	http://www.mann-ivanov-ferber.ru/books/paperbook/plumbers/	2017-02-28 17:02:40	2017-03-03 20:12:03	t
1435	3861	9	Мартышкин труд. Уолл-стрит изнутри	978-5-91657-338-1	Джон Рольф	http://www.mann-ivanov-ferber.ru/books/paperbook/monkeybusiness/	2017-02-28 17:02:40	2017-03-03 20:12:04	t
1433	4082	9	Разумное распределение активов	978-5-91657-343-5	Уильям Бернстайн	http://www.mann-ivanov-ferber.ru/books/paperbook/theintelligentassetallocator/	2017-02-28 17:02:40	2017-03-03 20:12:08	t
1423	4459	13	Как рыба в воде. Полное погружение. Библия триатлета. Библия велосипедиста.		Терри  Лафлин	http://www.mann-ivanov-ferber.ru/books/special/sportkomplect2/	2017-02-28 17:02:39	2017-03-03 20:12:16	t
1390	7223	11	Куда уходят деньги	978-5-91657-812-6	Юлия Сахаровская	http://www.mann-ivanov-ferber.ru/books/paperbook/money/	2017-02-28 17:02:39	2017-03-03 20:12:17	t
1509	2994	15	Пишу как пишется	 978-5-91657-141-7	Джон Леннон	http://www.mann-ivanov-ferber.ru/books/paperbook/inhisownwrite/	2017-02-28 17:02:41	2017-03-03 20:12:17	t
1511	5313	15	iPad. Исчерпывающее руководство	 978-5-91657-169-1	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/ipad-1/	2017-02-28 17:02:41	2017-03-03 20:12:26	t
1581	1933	9	Письма о главном	978-5-902862-28-4	Джон Тимпсон	http://www.mann-ivanov-ferber.ru/books/mif/020/	2017-02-28 17:02:42	2017-03-03 20:12:39	t
1578	1959	9	Ответы на 74 ключевых вопроса о современном бизнесе	978-5-902862-35-2	Джек Уэлч	http://www.mann-ivanov-ferber.ru/books/mif/022/	2017-02-28 17:02:42	2017-03-03 20:12:40	t
1575	2045	10	4D брэндинг	5-315-00032-X	Томас Гэд	http://www.mann-ivanov-ferber.ru/books/sse/4d-branding/	2017-02-28 17:02:42	2017-03-03 20:12:40	t
1552	2283	9	Жизнь внутри пузыря	978-5-902862-79-6	Игорь Ашманов	http://www.mann-ivanov-ferber.ru/books/mif/035/	2017-02-28 17:02:41	2017-03-03 20:12:50	t
1539	2366	9	Рост бизнеса под увеличительным стеклом		Патрик Вигери	http://www.mann-ivanov-ferber.ru/books/mif/045/	2017-02-28 17:02:41	2017-03-03 20:12:50	t
1536	2954	13	Жизнь на полной мощности!	978-5-91657-132-5	Джим  Лоэр	http://www.mann-ivanov-ferber.ru/books/paperbook/pfe/	2017-02-28 17:02:41	2017-03-03 20:12:51	t
1534	2471	9	У всех спад, у вас – подъем		Джефф Колвин	http://www.mann-ivanov-ferber.ru/books/mif/theupsideofthedownturn/	2017-02-28 17:02:41	2017-03-03 20:12:51	t
1571	2085	9	Демократическое предприятие	5-315-00041-9	Линда Грэттон	http://www.mann-ivanov-ferber.ru/books/sse/democratic/	2017-02-28 17:02:41	2017-03-03 20:12:52	t
1567	2128	15	Команда победителей	5-315-00036-2	Джулиан Биркиншоу	http://www.mann-ivanov-ferber.ru/books/sse/leadership/	2017-02-28 17:02:41	2017-03-03 20:12:53	t
1613	18391	11	Избавление от хлама		Вернер Тики Кюстенмахер	http://www.mann-ivanov-ferber.ru/books/izbavlenie-ot-xlama/	2017-02-28 17:02:42	2017-03-03 20:13:45	t
1549	2273	9	Почему люди должны следовать за вами?	978-5-902862-78-9	Роб Гоффи	http://www.mann-ivanov-ferber.ru/books/sse/why/	2017-02-28 17:02:41	2017-03-03 20:13:21	t
1554	2194	9	Бизнес в стиле фанк навсегда	978-5-902862-58-1	Кьелл Нордстрем	http://www.mann-ivanov-ferber.ru/books/sse/fb-forever/	2017-02-28 17:02:41	2017-03-03 20:13:20	t
1558	3670	13	Библия триатлета. Библия велосипедиста. Полное погружение		Джо Фрил	http://www.mann-ivanov-ferber.ru/books/special/komplectsport/	2017-02-28 17:02:41	2017-03-03 20:13:20	t
1611	18396	11	Умение говорить «нет»		Петра Кунце	http://www.mann-ivanov-ferber.ru/books/umenie-govorit-net/	2017-02-28 17:02:42	2017-03-03 20:13:54	t
1608	18401	11	Джедайские техники		Максим Дорофеев	http://www.mann-ivanov-ferber.ru/books/dzhedajskie-texniki/	2017-02-28 17:02:42	2017-03-03 20:13:55	t
1531	2605	11	Тайный язык денег	978-5-91657-059-5	Дэвид Крюгер	http://www.mann-ivanov-ferber.ru/books/mif/thesecretlanguageofmoney/	2017-02-28 17:02:41	2017-03-03 20:13:22	t
1528	2741	15	Предсказуемая иррациональность	 978-5-91657-086-1	Дэн Ариели	http://www.mann-ivanov-ferber.ru/books/sse/predictablyirrationals/	2017-02-28 17:02:41	2017-03-03 20:13:22	t
1526	2747	9	Управление фирмой, оказывающей профессиональные услуги	978-5-91657-527-9	Дэвид Майстер	http://www.mann-ivanov-ferber.ru/books/mif/mtpsf/	2017-02-28 17:02:41	2017-03-03 20:13:23	t
1541	2331	9	К черту цены! Создавайте ценность	978-5-902862-99-4	Том Снайдер	http://www.mann-ivanov-ferber.ru/books/mif/042/	2017-02-28 17:02:41	2017-03-03 20:13:23	t
1525	2750	9	Как привести дела в порядок	978-5-91657-248-3	Дэвид Аллен	http://www.mann-ivanov-ferber.ru/books/mif/kak-privesti-dela-v-poryadok/	2017-02-28 17:02:41	2017-03-03 20:13:25	t
1717	6686	10	Прибыльная контекстная реклама.	978-5-91657-813-3	Василий Смирнов	http://www.mann-ivanov-ferber.ru/books/mif/yandex/	2017-03-02 13:26:30	2017-03-03 20:13:25	t
1590	18633	14	Натвори что хочешь! Секреты друзей	978-5-00100-518-6	Labor Ateliergemeinschaft	http://www.mann-ivanov-ferber.ru/books/natvori-chto-xochesh-sekretyi-druzej/	2017-02-28 17:02:42	2017-03-03 20:13:26	t
1621	18337	10	Инструменты маркетинга для отдела продаж		Игорь Манн	http://www.mann-ivanov-ferber.ru/books/marketingovyij-chemodanchik/	2017-02-28 17:02:42	2017-03-03 20:13:37	t
1569	2115	9	Все верные решения	5-315-00039-7	Константинос Маркидес	http://www.mann-ivanov-ferber.ru/books/sse/right-moves/	2017-02-28 17:02:41	2017-03-03 20:12:53	t
1562	2141	9	Сверху вниз	5-315-00042-7	Гарольд Ливитт	http://www.mann-ivanov-ferber.ru/books/sse/top-down/	2017-02-28 17:02:41	2017-03-03 20:13:01	t
1543	2421	11	Записки автоматизатора	978-5-902862-97-0	Андрей Орлов	http://www.mann-ivanov-ferber.ru/books/paperbook/itnotes/	2017-02-28 17:02:41	2017-03-03 20:13:21	t
1606	18428	14	Древние чудовища России	978-5-00100-322-9	Антон Нелихов	http://www.mann-ivanov-ferber.ru/books/drevnie-chudovishha-rossii/	2017-02-28 17:02:42	2017-03-03 20:13:55	t
1603	18466	9	Теряя сигнал		Джеки Макниш	http://www.mann-ivanov-ferber.ru/books/teryaya-signal/	2017-02-28 17:02:42	2017-03-03 20:13:56	t
1425	6274	9	Школа продаж	978-5-91657-497-5	Александр  Деревицкий	http://www.mann-ivanov-ferber.ru/books/paperbook/school-sales/	2017-02-28 17:02:39	2017-03-03 20:13:57	t
1597	18478	13	Как смотреть футбол		Рууд Гуллит	http://www.mann-ivanov-ferber.ru/books/kak-smotret-futbol/	2017-02-28 17:02:42	2017-03-03 20:13:57	t
1583	1892	9	Формула времени	978-5-91657-131-8	Глеб Архангельский	http://www.mann-ivanov-ferber.ru/books/mif/016/	2017-02-28 17:02:42	2017-03-03 20:12:26	t
1594	18487	14	KUMON. Давай клеить! Забавные животные	978-5-00100-531-5	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-kleit-zabavnyie-zhivotnyie/	2017-02-28 17:02:42	2017-03-03 20:13:58	t
1588	18650	9	Семь преобразующих языков		Роберт Киган	http://www.mann-ivanov-ferber.ru/books/sem-preobrazuyushhix-yazyikov/	2017-02-28 17:02:42	2017-03-03 20:13:58	t
1619	18351	12	Привычка работать вместе		Твайла Тарп	http://www.mann-ivanov-ferber.ru/books/privyichka-rabotat-vmeste/	2017-02-28 17:02:42	2017-03-03 20:13:59	t
1522	2830	9	Материальная мотивация продавцов		Радмило Лукич	http://www.mann-ivanov-ferber.ru/books/paperbook/sellersmotivation/	2017-02-28 17:02:41	2017-03-03 20:14:09	t
1600	18472	11	Бизнес и/или любовь		Ольга Лукина	http://www.mann-ivanov-ferber.ru/books/biznes-iili-lyubov/	2017-02-28 17:02:42	2017-03-03 20:14:09	t
1672	1709	10	Re: Маркетинг	 978-5-902862-20-8	Николай Терещенко	http://www.mann-ivanov-ferber.ru/books/mif/007/	2017-03-01 07:10:57	2017-03-03 20:14:17	t
1654	17621	11	Как читать, запоминать и никогда не забывать	978-5-00100-378-6	Марк Тигелаар	http://www.mann-ivanov-ferber.ru/books/kak-chitat-zapominat-i-nikogda-ne-zabyivat/	2017-02-28 17:02:43	2017-03-03 20:14:17	t
1675	1812	9	Путь менеджера	5-902862-16-7	  	http://www.mann-ivanov-ferber.ru/books/mif/011/	2017-03-01 07:10:57	2017-03-03 20:14:38	t
1248	5740	13	Здоровье начинается с правильной еды	978-5-91657-727-3	Даллас и Мелисса Хартвиг	http://www.mann-ivanov-ferber.ru/books/healthy_eating/zdorove_nachinaetsya_s_pravilnoy_edy/	2017-02-28 17:02:37	2017-03-03 20:17:27	t
1681	1971	9	100 шагов по сбору долгов	978-5-902862-36-9	Александр Шумович	http://www.mann-ivanov-ferber.ru/books/mif/023/	2017-03-01 07:10:57	2017-03-03 20:16:47	t
1060	1984	11	Принцип пирамиды Минто	978-5-91657-780-8	Барбара Минто	http://www.mann-ivanov-ferber.ru/books/mif/025/	2017-02-28 17:02:34	2017-03-03 20:16:48	t
1585	1775	9	Реинжиниринг корпорации	978-5-91657-203-2	Майкл Хаммер	http://www.mann-ivanov-ferber.ru/books/mif/008/	2017-02-28 17:02:42	2017-03-03 20:16:58	t
1523	2619	9	Выбор сильнейших	978-5-91657-438-8	Клаудио Фернандес Араос	http://www.mann-ivanov-ferber.ru/books/mif/greatpeopledecisions/	2017-02-28 17:02:41	2017-03-03 20:16:58	t
1360	4779	10	Искренняя лояльность	978-5-91657-377-0	Фред Райхельд	http://www.mann-ivanov-ferber.ru/books/mif/ultimate-question/	2017-02-28 17:02:39	2017-03-03 20:17:15	t
1577	1592	11	Связи решают все	978-5-902862-43-7	Дарси Резак	http://www.mann-ivanov-ferber.ru/books/mif/024/	2017-02-28 17:02:42	2017-03-03 20:17:16	t
1673	1783	9	Миграция ценности	5-902862-09-4	Адриан Сливотски	http://www.mann-ivanov-ferber.ru/books/mif/009/	2017-03-01 07:10:57	2017-03-03 20:14:28	t
1680	1906	9	Путь собственника	978-5-902862-27-7	Кэтрин Кэтлин	http://www.mann-ivanov-ferber.ru/books/mif/018/	2017-03-01 07:10:57	2017-03-03 20:16:47	t
1148	8355	9	Инвесторы против спекулянтов	978-500057-029-6	Джон Богл	http://www.mann-ivanov-ferber.ru/books/a-large-library-of-investor/the-clash-of-the-cultures/	2017-02-28 17:02:35	2017-03-03 20:17:27	t
1670	1699	9	Стратегии, которые работают	5-902862-03-5	Карл Штерн	http://www.mann-ivanov-ferber.ru/books/mif/004/	2017-03-01 07:10:57	2017-03-03 20:17:32	t
1660	14914	9	Окружи себя лучшими	978-5-00057-725-7	Клаудио Фернандес Араос	http://www.mann-ivanov-ferber.ru/books/snachala-kto-potom-chto/	2017-02-28 17:03:45	2017-03-03 20:17:29	t
1683	6197	9	Обнимите своих сотрудников	978-5-91657-739-6	Джек  Митчелл	http://www.mann-ivanov-ferber.ru/books/mif/029/	2017-03-01 07:10:57	2017-03-03 20:17:28	f
1688	2446	8090	Секреты идеального магазина		Стэнли  Маркус	http://www.mann-ivanov-ferber.ru/books/mif/047/	2017-03-01 07:10:57	2017-03-03 20:17:30	t
1245	6017	9	Идеальный питч	978-5-91657-726-6	Орен Клафф	http://www.mann-ivanov-ferber.ru/books/mif/pitch/	2017-02-28 17:02:37	2017-03-03 20:17:30	t
1649	17871	9	Совещания по Адизесу		Шохам Адизес	http://www.mann-ivanov-ferber.ru/books/soveshhaniya-po-adizesu/	2017-02-28 17:02:43	2017-03-03 20:17:31	t
1662	10894	13	Осознанная медитация	978-5-00057-221-4	Видьямала Берч	http://www.mann-ivanov-ferber.ru/books/meditacija_dlja_sdorovja/	2017-02-28 17:03:46	2017-03-03 20:17:32	t
1684	2020	\N	Блоги	978-5-902862-68-0	Антон Попов	http://www.mann-ivanov-ferber.ru/books/mif/030/	2017-03-01 07:10:57	2017-03-03 20:16:49	t
1651	17852	9	Идеальный командный игрок		Патрик Ленсиони	http://www.mann-ivanov-ferber.ru/books/idealnyij-komandnyij-igrok/	2017-02-28 17:02:43	2017-03-03 20:17:33	t
1647	17950	9	Почему не все любят ходить на работу	978-5-00100-644-2	Патрик Ленсиони	http://www.mann-ivanov-ferber.ru/books/pochemu-ne-vse-lyubyat-xodit-na-rabotu/	2017-02-28 17:02:43	2017-03-03 20:17:33	t
1643	18030	13	Бег по правилу 80/20		Мэт Фицджеральд	http://www.mann-ivanov-ferber.ru/books/sport/beg-po-pravilu-8020/	2017-02-28 17:02:42	2017-03-03 20:17:34	t
1641	18033	15	Атомы у нас дома		Крис Вудфорд	http://www.mann-ivanov-ferber.ru/books/atomyi-u-nas-doma/	2017-02-28 17:02:42	2017-03-03 20:17:35	t
1639	18038	12	Давно пора!		Барбара Шер	http://www.mann-ivanov-ferber.ru/books/davno-pora/	2017-02-28 17:02:42	2017-03-03 20:17:35	t
1637	18117	9	Руководство по DevOps		Джин Ким	http://www.mann-ivanov-ferber.ru/books/rukovodstvo-po-devops/	2017-02-28 17:02:42	2017-03-03 20:17:36	t
1632	18143	12	Скетчбук художника		Кэти Джонсон	http://www.mann-ivanov-ferber.ru/books/sketchbuk-xudozhnika/	2017-02-28 17:02:42	2017-03-03 20:17:36	t
1687	3810	10	Пришел, увидел, убедил	978-5-91657-312-1	Стефани Палмер	http://www.mann-ivanov-ferber.ru/books/mif/043/	2017-03-01 07:10:57	2017-03-03 20:17:29	f
1627	18169	12	Ботанические портреты		Билли Шоуэлл	http://www.mann-ivanov-ferber.ru/books/botanicheskie-portretyi/	2017-02-28 17:02:42	2017-03-03 20:17:37	t
1624	18322	2	Революция платформ		Сангит Пол Чаудари	http://www.mann-ivanov-ferber.ru/books/revolyucziya-platform/	2017-02-28 17:02:42	2017-03-03 20:17:41	t
956	1618	10	Клиенты на всю жизнь	978-5-00100-216-1	Карл Сьюэлл	http://www.mann-ivanov-ferber.ru/books/mif/001/	2017-02-28 17:02:23	2017-03-03 20:17:42	t
1657	17604	9	Мозг продающий		Хелен Кенсетт	http://www.mann-ivanov-ferber.ru/books/prodayushhij-mozg/	2017-02-28 17:02:43	2017-03-03 20:17:52	t
1659	17505	9	Стремление к расцвету	978-5-00100-389-2	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/stremlenie-k-rasczvetu/	2017-02-28 17:02:43	2017-03-03 20:17:52	t
1667	10296	9	Геймификация в бизнесе	978-5-00057-093-7	Гейб Зикерманн	http://www.mann-ivanov-ferber.ru/books/geimifikaciya_v_biznese/	2017-02-28 17:03:48	2017-03-03 20:17:53	t
1674	1797	10	Маркетинговая машина	5-902862-17-5	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/mif/010/	2017-03-01 07:10:57	2017-03-03 20:18:08	t
1685	2002	8090	Маркетинг. А теперь вопросы		Игорь Манн	http://www.mann-ivanov-ferber.ru/books/mif/031/	2017-03-01 07:10:57	2017-03-03 20:18:24	t
1676	1839	9	Первый среди равных	5-902862-18-3	Дэвид Майстер	http://www.mann-ivanov-ferber.ru/books/mif/013/	2017-03-01 07:10:57	2017-03-03 20:18:27	t
1177	8926	10	Партизанский маркетинг в туризме	978-5-91657-419-7	Александр Шнайдерман	http://www.mann-ivanov-ferber.ru/books/partizanskij_marketing_v_turizme/	2017-02-28 17:02:36	2017-03-03 20:18:28	t
489	13454	12	Скетчбук, который научит вас рисовать	978-5-00100-174-4	Робин Ланда	http://www.mann-ivanov-ferber.ru/books/sketchbuk_kotoryj_nauchit_vas_risovat/	2017-02-28 16:57:26	2017-03-03 20:18:28	t
919	18174	11	Тренируем мозг. Тетрадь для развития памяти и интеллекта №4	978-5-00100-589-6	Рюта Кавашима	http://www.mann-ivanov-ferber.ru/books/treniruem-mozg-4/	2017-02-28 17:02:19	2017-03-03 20:18:29	t
1411	6531	11	Нетворкинг для интровертов	978-5-91657-590-3	Девора Зак	http://www.mann-ivanov-ferber.ru/books/paperbook/netvorking-dlya-introvertov/	2017-02-28 17:02:39	2017-03-03 20:18:29	t
655	11792	14	Нескучалка. Рисуем и играем в дороге	978-5-00057-192-7	Ксения  Дрызлова	http://www.mann-ivanov-ferber.ru/books/neskuchalka_3-5/	2017-02-28 16:57:29	2017-03-03 20:18:30	t
917	10174	13	Возраст счастья	978-5-91657-526-2	Владимир Яковлев	http://www.mann-ivanov-ferber.ru/books/special/age-of-happiness/	2017-02-28 16:57:33	2017-03-03 20:18:31	t
761	6716	9	От слайдов к историям	978-5-91657-756-3	Мартин Сайкс	http://www.mann-ivanov-ferber.ru/books/paperbook/stories-move-mountains/	2017-02-28 16:57:30	2017-03-03 20:18:31	t
1665	8509	11	Несмотря ни на что	978-5-91657-995-6	Марк Макгиннесс	http://www.mann-ivanov-ferber.ru/books/mif/resilience/	2017-02-28 17:03:48	2017-03-03 20:18:32	t
1003	7468	12	Птица за птицей	978-5-00057-196-5	Энн Ламотт	http://www.mann-ivanov-ferber.ru/books/paperbook/bird-bird/	2017-02-28 17:02:30	2017-03-03 20:18:34	t
987	11922	9	Разрыв шаблона	978-5-00057-403-4	Тина  Силиг	http://www.mann-ivanov-ferber.ru/books/tvorcheskoe_mishlenie/	2017-02-28 17:02:29	2017-03-03 20:18:35	t
559	10851	15	Теория игр	978-5-00100-503-2	Авинаш Диксит	http://www.mann-ivanov-ferber.ru/books/strategicheskoe_mishlenie/	2017-02-28 16:57:27	2017-03-03 20:18:35	t
48	17776	11	Бизнесхак на каждый день	978-5-00100-477-6	Игорь Манн	http://www.mann-ivanov-ferber.ru/books/biznesxak-na-kazhdyij-den/	2017-02-28 16:57:19	2017-03-03 20:18:36	t
1049	6490	11	Талант ни при чем!	978-5-91657-420-3	Джефф Колвин	http://www.mann-ivanov-ferber.ru/books/paperbook/talant-ni-pri-chem/	2017-02-28 17:02:33	2017-03-03 20:18:36	t
1232	7399	10	Обнимите своих клиентов. Обнимите своих сотрудников (комплект из 2 книг)		Джек  Митчелл	http://www.mann-ivanov-ferber.ru/books/special/set8/	2017-02-28 17:02:37	2017-03-03 20:18:44	t
1	18488	14	KUMON. Давай вырезать! Вкусные задания	978-5-00100-532-2	  	http://www.mann-ivanov-ferber.ru/books/kumon-davaj-vyirezat-vkusnyie-zadaniya/	2017-02-28 16:57:19	2017-03-03 20:18:44	t
284	15895	13	Как отучить ребенка от сладкого	978-5-00057-933-6	Джейкоб Тейтельбаум	http://www.mann-ivanov-ferber.ru/books/kak-otuchit-rebenka-ot-sladkogo/	2017-02-28 16:57:23	2017-03-03 20:18:45	t
702	7397	10	Управление контент-маркетингом	978-5-00057-076-0	Роберт Роуз	http://www.mann-ivanov-ferber.ru/books/paperbook/managing-content-marketing/	2017-02-28 16:57:29	2017-03-03 20:18:45	t
743	7363	14	Мифы воспитания	978-5-91657-405-0	По Бронсон и Эшли Мерримен	http://www.mann-ivanov-ferber.ru/books/paperbook/new-thinking-about-children/	2017-02-28 16:57:30	2017-03-03 20:18:46	t
1718	17485	14	Как все устроено сегодня	978-5-00100-234-5	Дэвид Маколи	http://www.mann-ivanov-ferber.ru/books/children/new-way-things-work/	2017-03-02 13:26:32	2017-03-03 20:18:47	t
939	18068	12	Между надо и хочу. Подарочный комплект	978-5-00100-412-7	Эль Луна	http://www.mann-ivanov-ferber.ru/books/mezhdu-nado-i-hochu-podarochnyij-komplekt/	2017-02-28 17:02:21	2017-03-03 20:18:47	t
1690	18630	11	Харизма лидера. Подарочный комплект	978-5-00057-747-9	Радислав Гандапас	http://www.mann-ivanov-ferber.ru/books/xarizma_lidera_podarochnyij_komplekt/	2017-03-02 09:08:35	2017-03-03 20:18:47	t
246	6866	14	Азбука	978-5-91657-798-3	Юлия Тараканова	http://www.mann-ivanov-ferber.ru/books/children/abc/	2017-02-28 16:57:22	2017-03-03 20:18:48	t
1682	2094	9	Инструменты McKinsey	978-5-902862-56-7	Итан Расиел	http://www.mann-ivanov-ferber.ru/books/mif/027/	2017-03-01 07:10:57	2017-03-03 20:19:01	f
352	10308	11	Отказываюсь выбирать!	978-5-00100-485-1	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/otkazyvayus_vybirat/	2017-02-28 16:57:24	2017-03-03 20:19:02	t
689	7350	10	Google AdWords. Исчерпывающее руководство	978-5-00057-117-0	Брэд  Геддс	http://www.mann-ivanov-ferber.ru/books/paperbook/advanced-google-adwords/	2017-02-28 16:57:29	2017-03-03 20:19:12	t
157	16817	12	От листка к лепестку	978-5-00100-105-8	Ребекка Тусс и Патрик Фарелл	http://www.mann-ivanov-ferber.ru/books/ot-listka-k-lepestku/	2017-02-28 16:57:21	2017-03-03 20:19:13	t
61	17920	14	Kumon. 3D поделки из бумаги. Тираннозавр и апатозавр 	978-5-00100-256-7	  	http://www.mann-ivanov-ferber.ru/books/kumon-3d-podelki-iz-bumagi-tirannozavr-i-apatozavr/	2017-02-28 16:57:20	2017-03-03 20:19:14	t
98	16004	13	Растительная диета	978-5-00057-997-8	Линдси Никсон	http://www.mann-ivanov-ferber.ru/books/rastitelnaya-dieta/	2017-02-28 16:57:20	2017-03-03 20:19:14	t
591	10995	11	Трудные диалоги	978-5-00100-460-8	Керри Паттерсон	http://www.mann-ivanov-ferber.ru/books/trudnie_dialogi/	2017-02-28 16:57:28	2017-03-03 20:19:15	t
503	11306	11	Память не изменяет	978-5-00100-478-3	Анхельс Наварро	http://www.mann-ivanov-ferber.ru/books/pamyat_ne_izmenyaet/	2017-02-28 16:57:26	2017-03-03 20:19:15	t
91	17210	11	Почему я отвлекаюсь	978-5-00100-249-9	Эдвард М. Хэлловэлл	http://www.mann-ivanov-ferber.ru/books/pochemu-ya-otvlekayus/	2017-02-28 16:57:20	2017-03-03 20:19:16	t
147	15458	11	Работа твоей мечты	978-5-00100-403-5	Барбара Шер	http://www.mann-ivanov-ferber.ru/books/rabota-tvoej-mechty/	2017-02-28 16:57:21	2017-03-03 20:19:17	t
1722	15279	9	Автоматический покупатель	978-5-00057-663-2	Джон Уорриллоу	http://www.mann-ivanov-ferber.ru/books/avtomaticheskij-pokupatel/	2017-03-02 13:26:40	2017-03-03 20:19:18	t
556	12807	11	Цель кажется недостижимой, пока она не достигнута	978-5-00057-302-0	Росс и Катрин Петрас	http://www.mann-ivanov-ferber.ru/books/net_nichego_nevozmozhnogo/	2017-02-28 16:57:27	2017-03-03 20:19:19	t
1726	15866	15	Советы из каменного века		Мэтт Грэм	http://www.mann-ivanov-ferber.ru/books/sovety-iz-kamennogo-veka/	2017-03-02 13:26:41	2017-03-03 20:19:19	t
1731	16269	12	Творческий блокнот		Дария Бикбаева	http://www.mann-ivanov-ferber.ru/books/tvorcheskij-bloknot/	2017-03-02 13:26:42	2017-03-03 20:19:20	t
1727	15868	12	1 строчка в день		  	http://www.mann-ivanov-ferber.ru/books/1-strochka-v-den/	2017-03-02 13:26:41	2017-03-03 20:19:26	t
1729	15972	14	Бумажный Новый год	978-5-00057-626-7	Лидия Крук	http://www.mann-ivanov-ferber.ru/books/bumazhnyj-novyj-god/	2017-03-02 13:26:42	2017-03-03 20:19:27	t
381	14652	11	5 принципов проактивного мышления	978-5-00057-529-1	Джон Миллер	http://www.mann-ivanov-ferber.ru/books/principy-proaktivnosti/	2017-02-28 16:57:24	2017-03-03 20:19:32	t
1732	16315	11	Психология чемпионов		Боб Ротелла и Боб Куллен	http://www.mann-ivanov-ferber.ru/books/psihologiya-chempionov/	2017-03-02 13:26:43	2017-03-03 20:19:43	t
1734	16576	10	Переворот бренда		Марти Ньюмейер	http://www.mann-ivanov-ferber.ru/books/s-nog-na-golovu/	2017-03-02 13:26:43	2017-03-03 20:19:43	t
1735	16528	15	Sonin.ru		Константин Сонин	http://www.mann-ivanov-ferber.ru/books/soninru/	2017-03-02 13:26:43	2017-03-03 20:19:44	t
1736	16669	13	Как быть веганом		Элизабет Кастория	http://www.mann-ivanov-ferber.ru/books/kak-byt-veganom/	2017-03-02 13:26:43	2017-03-03 20:19:45	t
1723	16677	13	Сила растений		Рич Ролл	http://www.mann-ivanov-ferber.ru/books/sila-rastenij/	2017-03-02 13:26:41	2017-03-03 20:19:54	t
431	12818	9	Не работайте с м*даками	978-5-00100-425-7	Роберт  Саттон	http://www.mann-ivanov-ferber.ru/books/rabota_bez_vreditelej/	2017-02-28 16:57:25	2017-03-03 20:19:54	t
1738	16691	13	Осознанность в спорте		Джордж Мемфорд	http://www.mann-ivanov-ferber.ru/books/osoznannost-v-sporte/	2017-03-02 13:26:43	2017-03-03 20:20:04	t
1740	16913	13	Голубые зоны на практике		Дэн Бюттнер	http://www.mann-ivanov-ferber.ru/books/golubye-zony-na-praktike/	2017-03-02 13:26:44	2017-03-03 20:20:04	t
424	14474	11	Включаем обаяние по методике спецслужб	978-5-00057-791-2	Джек Шафер	http://www.mann-ivanov-ferber.ru/books/knopka-like/	2017-02-28 16:57:25	2017-03-03 20:20:05	t
1615	18362	14	Натвори что хочешь! Безумные идеи	978-5-00100-519-3	Labor Ateliergemeinschaft	http://www.mann-ivanov-ferber.ru/books/natvori-chto-hochesh-bezumnyie-idei/	2017-02-28 17:02:42	2017-03-03 20:20:06	t
204	16016	9	Новые размышления о менеджменте	978-5-00100-209-3	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/novye-razmyshleniya-o-menedzhmente/	2017-02-28 16:57:22	2017-03-03 20:20:07	t
1745	17412	15	Охота на простака	978-5-00100-467-7	Джордж Акерлоф	http://www.mann-ivanov-ferber.ru/books/oxota-na-prostaka/	2017-03-02 13:26:45	2017-03-03 20:20:07	t
1746	17419	11	Медитация	978-5-00100-283-3	Ульрих Хоффманн	http://www.mann-ivanov-ferber.ru/books/meditacziya-prostye-praktiki/	2017-03-02 13:26:45	2017-03-03 20:20:08	t
1748	17473	12	Магия кадра		Джек Дайкинга	http://www.mann-ivanov-ferber.ru/books/magiya-kadra/	2017-03-02 13:26:45	2017-03-03 20:20:10	t
1749	17474	12	642 идеи для раскрашивания		  	http://www.mann-ivanov-ferber.ru/books/642-idei-dlya-raskrashivaniya/	2017-03-02 13:26:45	2017-03-03 20:20:10	t
958	17620	9	Фондовый рынок США для начинающих инвесторов	978-5-00100-328-1	Игорь Клюшнев	http://www.mann-ivanov-ferber.ru/books/fondovyij-ryinok-ssha-dlya-nachinayushhego-investora/	2017-02-28 17:02:24	2017-03-03 20:20:11	t
1743	17323	9	Чему я научился, потеряв миллион долларов		Джим Пол	http://www.mann-ivanov-ferber.ru/books/chemu-ya-nauchilsya-poteryav-million-dollarov/	2017-03-02 13:26:45	2017-03-03 20:20:12	t
595	12045	15	На кофеине	978-5-00057-271-9	Мюррей Карпентер	http://www.mann-ivanov-ferber.ru/books/na_kofeine/	2017-02-28 16:57:28	2017-03-03 20:20:12	t
1671	1765	\N	Бизнес — это поединок	5-902862-06-Х	Джеймс Мерфи	http://www.mann-ivanov-ferber.ru/books/mif/006/	2017-03-01 07:10:57	2017-03-03 20:19:11	t
496	13096	13	Рецепты «Китайского исследования»	978-5-00057-415-7	Лиэнн Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/recepty_kitajskogo_issledovaniya/	2017-02-28 16:57:26	2017-03-03 20:20:13	t
1741	17114	13	Вилки вместо ножей на практике		Алона Пульде	http://www.mann-ivanov-ferber.ru/books/vilki-vmesto-nozhej-na-praktike/	2017-03-02 13:26:44	2017-03-03 20:20:14	t
386	14870	13	Китайское исследование на практике	978-5-00057-888-9	Томас Кэмпбелл	http://www.mann-ivanov-ferber.ru/books/kitajskoe-issledovanie-na-praktike/	2017-02-28 16:57:24	2017-03-03 20:20:14	t
71	17622	15	Книга Нового года и Рождества. Наши дни	978-5-00100-398-4	Галина Егоренкова	http://www.mann-ivanov-ferber.ru/books/kniga-novogo-goda-i-rozhdestva/	2017-02-28 16:57:20	2017-03-03 20:20:15	t
70	17994	14	Дело о пропавшем кольце	978-5-00100-375-5	Юлия Луговская	http://www.mann-ivanov-ferber.ru/books/delo-o-propavshem-kolcze/	2017-02-28 16:57:20	2017-03-03 20:20:15	t
94	17995	14	Дело о новогодней елке	978-5-00100-376-2	Юлия Луговская	http://www.mann-ivanov-ferber.ru/books/delo-o-novogodnej-elke/	2017-02-28 16:57:20	2017-03-03 20:20:16	t
96	17984	5	Блокнот для записей МИФа (твердая обложка)	978-5-00100-373-1	  	http://www.mann-ivanov-ferber.ru/books/bloknot-dlya-zapisej-mif-tverdyij-pereplet/	2017-02-28 16:57:20	2017-03-03 20:20:16	t
312	18150	14	Морщинки на бабулином лице	978-5-00100-342-7	Симона Чираоло	http://www.mann-ivanov-ferber.ru/books/morshhinki-na-babulinom-licze/	2017-02-28 16:57:23	2017-03-03 20:20:18	t
328	16110	14	Играем в искусство: от реализма к абстракционизму	978-5-00057-732-5	Наташа Кайя	http://www.mann-ivanov-ferber.ru/books/igraem-v-iskusstvo/	2017-02-28 16:57:24	2017-03-03 20:20:19	t
599	10852	11	Творческая личность	978-5-00057-246-7	Отто Крегер	http://www.mann-ivanov-ferber.ru/books/tvorcheskaja_lichnost/	2017-02-28 16:57:28	2017-03-03 20:20:19	t
1730	16160	15	Один под парусами вокруг света		Джошуа Слокам	http://www.mann-ivanov-ferber.ru/books/odin-pod-parusami-vokrug-sveta/	2017-03-02 13:26:42	2017-03-03 20:20:34	t
1733	16339	11	Внимательность на работе		Дэвид Джеллс	http://www.mann-ivanov-ferber.ru/books/osoznannost-na-rabote/	2017-03-02 13:26:43	2017-03-03 20:20:35	t
1737	16681	12	Как написать книгу за 100 дней		Ольга Соломатина	http://www.mann-ivanov-ferber.ru/books/kak-napisat-knigu-za-100-dnej/	2017-03-02 13:26:43	2017-03-03 20:20:44	t
1739	16700	12	712 новых идей, о чем написать		  	http://www.mann-ivanov-ferber.ru/books/712-novyh-idej-o-chem-napisat/	2017-03-02 13:26:43	2017-03-03 20:20:44	t
1742	17208	15	Главная теория Эйнштейна		Джон Гриббин	http://www.mann-ivanov-ferber.ru/books/glavnaya-teoriya-ejnshtejna/	2017-03-02 13:26:44	2017-03-03 20:20:54	t
668	10054	11	Серьезный разговор об ответственности	978-5-00057-081-4	Керри Паттерсон	http://www.mann-ivanov-ferber.ru/books/sereznyj_razgovor_ob_otvetstvennosti/	2017-02-28 16:57:29	2017-03-03 20:20:54	t
1030	6607	9	Помогите им вырасти или смотрите, как они уходят		Беверли Кей	http://www.mann-ivanov-ferber.ru/books/paperbook/help-them-grow/	2017-02-28 17:02:32	2017-03-03 20:20:55	t
1721	14879	9	Управлять своим начальником — это нормально		Брюс Тулган	http://www.mann-ivanov-ferber.ru/books/upravljat-svoim-nachalnikom-jeto-normalno/	2017-03-02 13:26:39	2017-03-03 20:20:56	t
1557	4415	15	Отзывчивый веб-дизайн. Эмоциональный веб-дизайн. Основы контентной стратегии. Сначала мобильные		Аарон Уолтер	http://www.mann-ivanov-ferber.ru/books/special/komplect-2/	2017-02-28 17:02:41	2017-03-03 20:20:56	t
1725	15856	9	Новые размышления о политике		Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/novye-razmyshleniya-o-politike/	2017-03-02 13:26:41	2017-03-03 20:20:57	t
1728	15919	12	Как стать гениальным художником, не имея ни капли таланта		Леонид Тишков	http://www.mann-ivanov-ferber.ru/books/kak-stat-genialnym-hudozhnikom-ne-imeya-ni-kapli-talanta/	2017-03-02 13:26:42	2017-03-03 20:20:57	t
1744	17401	13	Как есть меньше		Джиллиан Райли	http://www.mann-ivanov-ferber.ru/books/kak-est-menshe/	2017-03-02 13:26:45	2017-03-03 20:21:08	t
1747	17420	11	Осознанность		Дорис Идинг	http://www.mann-ivanov-ferber.ru/book/osoznannost-prostye-praktiki/	2017-03-02 13:26:45	2017-03-03 20:21:11	t
1752	18017	14	Юному эрудиту. Подарочный комплект		Гийом Плантвен	http://www.mann-ivanov-ferber.ru/books/yunomu-eruditu/	2017-03-02 13:26:47	2017-03-03 20:21:11	t
1634	18120	9	100 ключевых моделей и концепций управления		Фонс Тромпенаарс	http://www.mann-ivanov-ferber.ru/books/100-klyuchevyix-modelej-i-konczepczij-upravleniya/	2017-02-28 17:02:42	2017-03-03 20:21:12	t
270	16148	10	Искусство проведения мероприятий	978-5-00100-010-5	Александр Шумович	http://www.mann-ivanov-ferber.ru/books/iskusstvo-provedeniya-meropriyatij/	2017-02-28 16:57:23	2017-03-03 20:21:13	t
306	15715	15	Исчезающие носки, новогодние обещания и еще 97 загадок бытия	978-5-00057-829-2	Дэн Ариели	http://www.mann-ivanov-ferber.ru/books/ischezayushie-noski/	2017-02-28 16:57:23	2017-03-03 20:21:28	t
64	17919	14	Kumon. 3D поделки из бумаги. Трицератопс и птеранодон 	978-5-00100-255-0	  	http://www.mann-ivanov-ferber.ru/books/kumon-3d-podelki-iz-bumagi-triczeratops-i-pteranodon/	2017-02-28 16:57:20	2017-03-03 20:21:29	t
1756	18667	14	Маминой помощнице. Подарочный комплект	978-5-00100-508-7	Катерина Дронова	http://www.mann-ivanov-ferber.ru/books/maminoj_pomoshhnicze/	2017-03-03 16:56:19	2017-03-03 20:21:30	t
234	17050	12	Линия — это точка, которая пошла погулять	978-5-00100-138-6	Джо Фернихо	http://www.mann-ivanov-ferber.ru/books/liniya-eto-tochka-kotoraya-poshla-pogulyat/	2017-02-28 16:57:22	2017-03-03 20:21:30	t
512	18409	15	Женщина. Подарочный комплект	978-5-00100-345-8	Джон Готтман	http://www.mann-ivanov-ferber.ru/books/zhenshhina-podarochnyij-komplekt/	2017-02-28 16:57:26	2017-03-03 20:21:31	t
14	18424	14	Великие изобретения Леонардо да Винчи и Жюля Верна	978-5-00100-349-6	Розенн Ботуон	http://www.mann-ivanov-ferber.ru/books/velikie-izobreteniya-leonardo-da-vinchi-i-zhyulya-verna/	2017-02-28 16:57:19	2017-03-03 18:46:01	t
146	17496	15	Женщины, которые изменили мир	978-5-00057-451-5	Наталья Оленцова	http://www.mann-ivanov-ferber.ru/books/zhenshhinyi-kotoryie-izmenili-mir/	2017-02-28 16:57:21	2017-03-03 19:00:16	t
260	16867	14	100. Альбом для раскрашивания	978-5-00100-058-7	Доминика Липневская	http://www.mann-ivanov-ferber.ru/books/100-albom-dlya-raskrashivsniya/	2017-02-28 16:57:22	2017-03-03 19:10:16	t
1517	2391	11	Эмоциональный интеллект 2.0	978-5-91657-109-7	Тревис Бредбери	http://www.mann-ivanov-ferber.ru/books/mif/emotionalintelligence20/	2017-02-28 17:02:41	2017-03-03 19:11:15	t
325	16015	14	KUMON. Учимся умножать. Простые примеры	978-5-00057-755-4	  	http://www.mann-ivanov-ferber.ru/books/kumon-uchimsya-umnozhat-prostye-primery/	2017-02-28 16:57:23	2017-03-03 19:22:37	t
419	15319	14	KUMON. Готовимся к школе. Учимся проходить лабиринты	978-5-00057-764-6	  	http://www.mann-ivanov-ferber.ru/books/gotovimsya-k-shkole-uchimsya-prohodit-labirinty/	2017-02-28 16:57:25	2017-03-03 19:24:14	t
462	14427	9	Надежная база	978-5-00057-475-1	Джордж Колризер	http://www.mann-ivanov-ferber.ru/books/fundament-liderstva/	2017-02-28 16:57:26	2017-03-03 19:26:18	t
548	11914	9	Путеводитель предпринимателя	978-5-00057-300-6	Билл Олет	http://www.mann-ivanov-ferber.ru/books/putevoditel_predrprinimatelya/	2017-02-28 16:57:27	2017-03-03 19:27:50	t
620	13369	14	KUMON. Математика. Сложение. Уровень 1	978-5-00100-663-3	  	http://www.mann-ivanov-ferber.ru/books/slozhenie_uroven_1/	2017-02-28 16:57:28	2017-03-03 19:29:45	t
627	11685	9	Меньше дел, больше жизни	978-5-00057-210-8	Ари Мейсел	http://www.mann-ivanov-ferber.ru/books/menshe_znachit_bolshe/	2017-02-28 16:57:28	2017-03-03 19:30:14	t
265	16841	14	Напиши свою книгу приключений	978-5-00100-463-9	Пол Даусвел	http://www.mann-ivanov-ferber.ru/books/napishi-svoyu-knigu-priklyuchenij/	2017-02-28 16:57:23	2017-03-03 19:10:07	t
170	16145	15	Думай как инженер	978-5-00100-502-5	Гурупрасад Мадхаван	http://www.mann-ivanov-ferber.ru/books/dumaj-kak-inzhener/	2017-02-28 16:57:21	2017-03-03 19:05:15	t
698	10210	11	Мой муж — предприниматель	978-5-00057-099-9	Яна Агарунова	http://www.mann-ivanov-ferber.ru/books/moj_muzh_predprinimatel/	2017-02-28 16:57:29	2017-03-03 19:32:37	t
741	7891	15	Физика фондового рынка	978-5-91657-946-8	Джеймс Уэзеролл	http://www.mann-ivanov-ferber.ru/books/paperbook/the-physics-of-wall-street/	2017-02-28 16:57:30	2017-03-03 19:33:25	t
726	2078	9	Как преодолеть кризисы менеджмента	978-5-91657-430-2	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/sse/mismanagement-crisis/	2017-02-28 16:57:30	2017-03-03 19:34:04	t
816	5745	14	Моё тело: от макушки до пяток	978-5-00100-601-5	Софи Дэвус	http://www.mann-ivanov-ferber.ru/books/children/my-head-toe-body-book/	2017-02-28 16:57:31	2017-03-03 19:35:41	t
857	5047	10	Партизанские маркетинговые исследования	978-5-91657-530-9	 Роберт Каден	http://www.mann-ivanov-ferber.ru/books/paperbook/guerrilla-marketing-research/	2017-02-28 16:57:32	2017-03-03 19:37:47	t
871	5366	15	Сколково: принуждение к чуду	978-5-91657-480-7	Олег Рашидов	http://www.mann-ivanov-ferber.ru/books/paperbook/skolkovo-1/	2017-02-28 16:57:32	2017-03-03 19:38:50	t
119	17572	9	Стратегия голубого океана	978-5-00100-258-1	Чан Ким и Рене Моборн	http://www.mann-ivanov-ferber.ru/books/paperbook/blueoceanstrategy/	2017-02-28 16:57:20	2017-03-03 19:39:32	t
922	15901	9	Я помню всех, кто мне когда-то не перезвонил	978-5-00100-012-9	Олег Бармин	http://www.mann-ivanov-ferber.ru/books/ya-pomnyu-vseh-kto-mne-kogda-to-ne-perezvonil/	2017-02-28 17:02:20	2017-03-03 19:40:06	t
744	7402	10	Основы интернет-маркетинга	978-5-91657-967-3	Митч Мейерсон	http://www.mann-ivanov-ferber.ru/books/paperbook/mastering-online-marketing/	2017-02-28 16:57:30	2017-03-03 19:41:16	t
1052	16224	12	365 дней очень творческого человека (желтый)	978-5-91657-744-0	Яна Франк	http://www.mann-ivanov-ferber.ru/books/365-yellow/	2017-02-28 17:02:34	2017-03-03 19:41:39	t
1161	8264	9	Хорошая стратегия, плохая стратегия	978-5-91657-906-2	Ричард Румельт	http://www.mann-ivanov-ferber.ru/books/paperbook/good-strategy-bad-strategy/	2017-02-28 17:02:35	2017-03-03 19:42:38	t
1190	8822	10	Умный маркетинг в жесткие времена	978-5-91657-920-8	Дэн Кеннеди	http://www.mann-ivanov-ferber.ru/books/umnyi_marketing_v_zhestkie_vremena/	2017-02-28 17:02:36	2017-03-03 19:51:54	t
1300	5283	9	Эффективный руководитель (в кожаном переплете)	 978-5-91657-510-1	Питер Фердинанд Друкер	http://www.mann-ivanov-ferber.ru/books/special/effective-executive/	2017-02-28 17:02:38	2017-03-03 19:52:39	t
1379	3947	12	365 дней очень творческого человека. 12 времен года. Муза и чудовище.		Яна Франк	http://www.mann-ivanov-ferber.ru/books/special/frank/	2017-02-28 17:02:39	2017-03-03 19:56:14	t
1438	3925	9	Детский клуб: как открыть и сделать прибыльным	978-5-91657-339-8	Зарина Ивантер	http://www.mann-ivanov-ferber.ru/books/paperbook/detskiy-club/	2017-02-28 17:02:40	2017-03-03 19:57:05	t
778	7119	15	Иллюстрированный Гражданский кодекс Российской Федерации	978-5-91657-849-2	Алексей Меринов (художник)	http://www.mann-ivanov-ferber.ru/books/paperbook/gk-rf/	2017-02-28 16:57:31	2017-03-03 20:21:32	t
392	15676	14	Мы и наша история	978-5-00057-867-4	Иван Поммо	http://www.mann-ivanov-ferber.ru/books/my-i-nasha-istoriya/	2017-02-28 16:57:25	2017-03-03 20:21:32	t
396	15562	14	Хорошие манеры	978-5-00057-665-6	Филипп Жальбер	http://www.mann-ivanov-ferber.ru/books/horoshie-manery/	2017-02-28 16:57:25	2017-03-03 20:21:33	t
478	11740	15	Как устроена экономика	978-5-00100-360-1	Ха-Джун Чанг	http://www.mann-ivanov-ferber.ru/books/ekonomika/	2017-02-28 16:57:26	2017-03-03 20:21:34	t
840	5499	11	В этом году я…	978-5-00100-417-2	М. Дж.  Райан	http://www.mann-ivanov-ferber.ru/books/mif/thisyeariwill/	2017-02-28 16:57:31	2017-03-03 20:21:34	t
1463	3462	\N	Правила Голдратта	978-5-91657-213-1	Элияху Голдратт	http://www.mann-ivanov-ferber.ru/books/biznesroman/pravgold/	2017-02-28 17:02:40	2017-03-03 19:56:43	t
1365	8096	9	1С:Предприятие 8.2. Практическое пособие разработчика	978-5-9677-1147-3	М.Г. Радченко	http://www.mann-ivanov-ferber.ru/books/1c-pablishing/posobie/	2017-02-28 17:02:39	2017-03-03 19:54:02	t
1515	2833	10	Конец маркетинга, каким мы его знаем	978-5-91657-112-7	Серхио Займан	http://www.mann-ivanov-ferber.ru/books/mif/theendofmarketing/	2017-02-28 17:02:41	2017-03-03 19:58:14	t
937	15173	11	Новые размышления о личном развитии	978-5-00057-826-1	Ицхак Адизес	http://www.mann-ivanov-ferber.ru/books/novye-razmyshleniya-o-lichnom-razvitii/	2017-02-28 17:02:21	2017-03-03 20:02:25	t
1026	7348	9	Карьера для интровертов	978-5-91657-844-7	Нэнси Энковиц	http://www.mann-ivanov-ferber.ru/books/paperbook/self-promotion-introverts/	2017-02-28 17:02:32	2017-03-03 20:06:07	t
1203	8921	12	Разреши себе творить. Профессия - иллюстратор (комплект из двух книг)		Натали Ратковски	http://www.mann-ivanov-ferber.ru/books/set11/	2017-02-28 17:02:36	2017-03-03 20:07:02	t
1492	3122	11	Как составить личный финансовый план и как его реализовать	978-5-91657-201-8	Владимир Савенок	http://www.mann-ivanov-ferber.ru/books/mif/finplan/	2017-02-28 17:02:40	2017-03-03 20:10:33	t
1264	5533	\N	Ваш МасBook Air может больше	978-5-91657-696-2	Пол Макфедрис	http://www.mann-ivanov-ferber.ru/books/selection/apple/macbook/	2017-02-28 17:02:37	2017-03-03 20:08:13	t
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_id_seq', 1757, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, title, created_at, updated_at) FROM stdin;
1	Книги	2017-02-28 08:54:37	2017-02-28 16:38:15
9	Бизнес  	2017-02-28 08:54:37	2017-02-28 16:38:15
10	Маркетинг	2017-02-28 08:54:37	2017-02-28 16:38:15
11	Cаморазвитие	2017-02-28 08:54:37	2017-02-28 16:38:15
12	Творчество	2017-02-28 08:54:37	2017-02-28 16:38:15
13	Здоровый образ жизни	2017-02-28 08:54:37	2017-02-28 16:38:15
14	Детские книги	2017-02-28 08:54:37	2017-02-28 16:38:15
15	Расширяющие кругозор	2017-02-28 08:54:37	2017-02-28 16:38:15
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: volumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY volumes (id, book_id, type, created_at, updated_at) FROM stdin;
49	956	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
50	916	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
51	1061	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
52	1670	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
53	908	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
54	1671	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
55	1672	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
56	1585	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
57	1673	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
58	1674	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
59	1675	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
60	1584	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
61	1676	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
62	1677	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
63	1583	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
64	1679	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
65	1680	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
66	1582	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
67	1581	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
68	1579	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
69	1578	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
70	1681	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
71	1577	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
72	1060	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
73	915	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
74	1682	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
75	1555	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
76	1683	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
77	1684	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
78	1685	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
79	1553	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
80	914	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
81	913	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
82	1552	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
83	1550	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
84	1548	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
85	1547	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
86	1686	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
87	1546	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
88	1544	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
89	1541	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
90	1687	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
91	911	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
92	1539	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
93	1537	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
94	1688	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
95	885	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
96	910	paper	2017-03-01 08:54:06	2017-03-01 08:54:06
97	918	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
98	919	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
99	1	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
100	2	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
101	3	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
102	4	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
103	5	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
104	6	paper	2017-03-01 08:54:36	2017-03-01 08:54:36
105	920	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
106	506	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
107	507	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
108	508	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
109	921	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
110	509	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
111	510	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
112	511	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
113	512	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
114	513	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
115	54	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
116	59	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
117	111	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
118	119	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
119	135	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
120	142	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
121	145	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
122	147	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
123	155	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
124	162	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
125	165	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
126	175	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
127	179	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
128	184	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
129	190	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
130	193	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
131	197	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
132	205	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
133	207	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
134	211	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
135	213	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
136	217	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
137	218	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
138	230	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
139	231	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
140	236	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
141	239	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
142	240	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
143	922	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
144	241	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
145	243	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
146	244	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
147	248	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
148	253	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
149	256	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
150	259	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
151	264	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
152	923	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
153	924	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
154	925	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
155	926	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
156	927	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
157	267	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
158	272	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
159	277	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
160	278	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
161	279	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
162	928	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
163	280	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
164	282	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
165	288	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
166	929	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
167	290	paper	2017-03-01 08:54:37	2017-03-01 08:54:37
168	291	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
169	930	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
170	295	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
171	931	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
172	298	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
173	932	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
174	301	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
175	305	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
176	308	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
177	933	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
178	934	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
179	318	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
180	319	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
181	323	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
182	935	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
183	340	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
184	341	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
185	343	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
186	347	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
187	350	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
188	352	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
189	354	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
190	356	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
191	358	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
192	360	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
193	362	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
194	364	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
195	365	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
196	367	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
197	368	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
198	369	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
199	370	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
200	375	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
201	382	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
202	383	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
203	384	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
204	936	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
205	386	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
206	388	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
207	389	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
208	390	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
209	391	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
210	392	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
211	396	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
212	400	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
213	402	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
214	403	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
215	405	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
216	408	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
217	409	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
218	412	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
219	937	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
220	414	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
221	417	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
222	418	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
223	419	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
224	420	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
225	421	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
226	424	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
227	431	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
228	433	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
229	440	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
230	444	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
231	447	paper	2017-03-01 08:54:38	2017-03-01 08:54:38
232	938	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
233	452	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
234	465	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
235	468	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
236	939	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
237	469	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
238	478	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
239	479	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
240	481	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
241	482	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
242	483	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
243	484	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
244	486	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
245	487	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
246	489	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
247	940	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
248	941	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
249	495	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
250	942	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
251	502	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
252	503	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
253	504	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
254	505	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
255	519	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
256	520	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
257	521	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
258	943	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
259	529	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
260	531	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
261	536	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
262	944	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
263	537	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
264	542	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
265	543	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
266	546	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
267	553	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
268	555	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
269	559	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
270	565	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
271	570	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
272	574	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
273	576	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
274	945	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
275	579	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
276	580	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
277	590	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
278	591	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
279	592	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
280	593	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
281	602	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
282	603	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
283	605	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
284	606	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
285	617	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
286	619	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
287	620	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
288	632	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
289	633	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
290	634	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
291	635	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
292	647	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
293	648	paper	2017-03-01 08:54:39	2017-03-01 08:54:39
294	650	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
295	655	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
296	656	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
297	658	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
298	665	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
299	667	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
300	671	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
301	676	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
302	679	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
303	681	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
304	682	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
305	946	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
306	685	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
307	947	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
308	703	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
309	948	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
310	709	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
311	719	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
312	721	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
313	726	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
314	732	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
315	733	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
316	949	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
317	746	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
318	755	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
319	764	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
320	765	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
321	766	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
322	767	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
323	768	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
324	770	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
325	774	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
326	775	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
327	776	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
328	779	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
329	784	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
330	791	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
331	800	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
332	804	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
333	808	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
334	813	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
335	814	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
336	816	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
337	819	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
338	826	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
339	950	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
340	829	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
341	951	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
342	832	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
343	833	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
344	834	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
345	835	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
346	836	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
347	837	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
348	839	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
349	840	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
350	842	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
351	843	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
352	844	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
353	952	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
354	859	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
355	865	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
356	953	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
357	954	paper	2017-03-01 08:54:40	2017-03-01 08:54:40
358	879	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
359	880	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
360	893	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
361	894	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
362	899	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
363	900	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
364	955	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
365	905	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
366	909	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
367	957	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
368	912	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
369	917	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
370	40	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
371	41	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
372	42	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
373	43	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
374	44	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
375	45	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
376	46	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
377	47	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
378	48	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
379	49	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
380	50	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
381	51	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
382	52	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
383	53	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
384	55	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
385	56	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
386	57	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
387	58	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
388	69	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
389	70	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
390	71	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
391	72	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
392	73	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
393	74	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
394	75	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
395	76	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
396	77	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
397	78	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
398	79	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
399	80	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
400	81	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
401	82	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
402	83	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
403	84	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
404	85	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
405	86	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
406	87	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
407	88	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
408	89	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
409	90	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
410	91	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
411	92	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
412	93	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
413	94	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
414	95	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
415	96	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
416	97	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
417	98	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
418	99	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
419	100	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
420	101	paper	2017-03-01 08:54:41	2017-03-01 08:54:41
421	102	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
422	103	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
423	104	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
424	105	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
425	106	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
426	107	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
427	108	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
428	109	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
429	110	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
430	112	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
431	113	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
432	131	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
433	132	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
434	133	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
435	134	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
436	958	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
437	136	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
438	137	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
439	138	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
440	139	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
441	140	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
442	141	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
443	143	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
444	144	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
445	959	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
446	146	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
447	148	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
448	149	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
449	150	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
450	151	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
451	152	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
452	153	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
453	154	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
454	156	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
455	157	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
456	158	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
457	159	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
458	160	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
459	161	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
460	163	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
461	164	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
462	166	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
463	167	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
464	168	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
465	169	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
466	170	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
467	171	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
468	172	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
469	173	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
470	174	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
471	176	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
472	177	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
473	178	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
474	180	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
475	181	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
476	182	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
477	183	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
478	185	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
479	186	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
480	187	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
481	188	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
482	189	paper	2017-03-01 08:54:42	2017-03-01 08:54:42
483	191	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
484	192	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
485	194	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
486	195	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
487	196	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
488	198	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
489	199	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
490	200	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
491	201	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
492	960	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
493	202	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
494	203	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
495	204	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
496	206	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
497	208	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
498	209	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
499	210	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
500	212	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
501	214	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
502	215	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
503	216	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
504	219	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
505	220	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
506	221	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
507	222	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
508	223	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
509	224	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
510	225	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
511	226	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
512	227	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
513	228	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
514	229	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
515	232	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
516	233	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
517	234	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
518	961	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
519	235	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
520	237	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
521	238	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
522	242	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
523	245	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
524	246	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
525	247	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
526	249	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
527	250	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
528	251	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
529	252	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
530	962	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
531	254	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
532	255	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
533	257	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
534	258	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
535	260	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
536	261	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
537	262	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
538	263	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
539	265	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
540	266	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
541	268	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
542	269	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
543	270	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
544	271	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
545	273	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
546	274	paper	2017-03-01 08:54:43	2017-03-01 08:54:43
547	275	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
548	276	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
549	281	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
550	283	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
551	284	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
552	285	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
553	286	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
554	287	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
555	289	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
556	963	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
557	292	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
558	964	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
559	293	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
560	294	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
561	296	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
562	297	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
563	299	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
564	300	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
565	302	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
566	303	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
567	304	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
568	306	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
569	307	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
570	309	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
571	310	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
572	965	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
573	311	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
574	312	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
575	313	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
576	314	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
577	966	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
578	315	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
579	316	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
580	317	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
581	320	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
582	321	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
583	322	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
584	324	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
585	325	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
586	326	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
587	327	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
588	328	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
589	329	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
590	330	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
591	331	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
592	332	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
593	333	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
594	967	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
595	968	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
596	334	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
597	342	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
598	344	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
599	345	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
600	346	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
601	348	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
602	349	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
603	969	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
604	970	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
605	351	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
606	353	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
607	355	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
608	357	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
609	359	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
610	971	paper	2017-03-01 08:54:44	2017-03-01 08:54:44
611	361	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
612	972	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
613	363	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
614	366	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
615	371	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
616	372	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
617	373	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
618	374	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
619	376	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
620	377	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
621	378	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
622	379	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
623	380	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
624	381	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
625	385	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
626	387	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
627	973	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
628	393	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
629	394	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
630	395	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
631	397	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
632	974	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
633	975	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
634	398	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
635	399	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
636	976	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
637	977	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
638	401	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
639	978	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
640	404	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
641	406	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
642	407	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
643	410	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
644	979	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
645	411	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
646	413	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
647	415	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
648	416	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
649	980	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
650	422	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
651	423	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
652	425	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
653	426	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
654	427	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
655	428	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
656	429	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
657	432	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
658	434	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
659	435	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
660	436	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
661	437	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
662	438	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
663	439	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
664	981	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
665	441	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
666	442	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
667	982	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
668	443	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
669	983	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
670	445	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
671	446	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
672	448	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
673	449	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
674	450	paper	2017-03-01 08:54:45	2017-03-01 08:54:45
675	451	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
676	453	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
677	454	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
678	455	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
679	456	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
680	457	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
681	458	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
682	459	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
683	460	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
684	461	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
685	462	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
686	463	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
687	464	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
688	466	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
689	984	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
690	467	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
691	985	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
692	470	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
693	471	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
694	472	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
695	473	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
696	474	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
697	475	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
698	476	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
699	477	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
700	480	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
701	485	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
702	488	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
703	490	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
704	491	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
705	492	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
706	493	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
707	494	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
708	496	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
709	497	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
710	498	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
711	499	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
712	500	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
713	501	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
714	514	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
715	515	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
716	516	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
717	517	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
718	518	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
719	522	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
720	523	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
721	524	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
722	525	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
723	526	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
724	527	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
725	528	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
726	530	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
727	532	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
728	533	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
729	534	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
730	535	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
731	986	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
732	987	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
733	988	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
734	538	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
735	539	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
736	540	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
737	541	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
738	989	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
739	990	paper	2017-03-01 08:54:46	2017-03-01 08:54:46
740	544	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
741	545	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
742	547	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
743	548	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
744	549	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
745	550	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
746	551	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
747	552	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
748	991	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
749	992	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
750	554	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
751	556	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
752	557	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
753	558	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
754	560	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
755	993	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
756	561	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
757	562	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
758	563	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
759	564	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
760	566	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
761	567	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
762	568	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
763	569	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
764	571	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
765	572	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
766	573	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
767	575	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
768	994	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
769	995	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
770	577	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
771	578	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
772	996	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
773	997	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
774	581	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
775	998	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
776	582	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
777	583	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
778	584	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
779	999	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
780	1000	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
781	585	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
782	586	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
783	587	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
784	588	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
785	589	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
786	594	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
787	595	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
788	596	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
789	597	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
790	598	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
791	599	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
792	600	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
793	607	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
794	608	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
795	1001	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
796	609	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
797	610	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
798	611	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
799	612	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
800	613	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
801	614	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
802	615	paper	2017-03-01 08:54:47	2017-03-01 08:54:47
803	616	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
804	618	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
805	621	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
806	622	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
807	623	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
808	624	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
809	625	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
810	1002	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
811	626	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
812	627	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
813	628	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
814	629	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
815	1003	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
816	630	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
817	631	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
818	636	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
819	637	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
820	638	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
821	639	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
822	640	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
823	641	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
824	642	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
825	643	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
826	644	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
827	645	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
828	646	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
829	649	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
830	1004	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
831	651	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
832	652	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
833	653	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
834	654	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
835	657	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
836	1005	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
837	1006	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
838	659	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
839	660	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
840	661	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
841	662	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
842	663	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
843	664	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
844	666	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
845	668	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
846	669	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
847	670	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
848	1007	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
849	672	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
850	673	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
851	674	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
852	675	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
853	1008	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
854	677	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
855	678	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
856	680	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
857	683	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
858	684	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
859	1009	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
860	686	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
861	687	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
862	1010	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
863	1011	paper	2017-03-01 08:54:48	2017-03-01 08:54:48
864	688	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
865	1012	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
866	689	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
867	690	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
868	691	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
869	1013	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
870	692	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
871	693	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
872	694	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
873	695	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
874	696	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
875	697	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
876	698	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
877	699	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
878	700	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
879	713	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
880	714	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
881	715	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
882	716	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
883	717	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
884	718	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
885	1014	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
886	1015	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
887	720	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
888	722	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
889	723	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
890	724	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
891	725	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
892	727	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
893	1016	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
894	728	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
895	729	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
896	731	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
897	734	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
898	735	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
899	736	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
900	737	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
901	738	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
902	739	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
903	740	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
904	741	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
905	742	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
906	1017	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
907	743	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
908	744	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
909	745	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
910	747	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
911	1018	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
912	1019	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
913	748	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
914	749	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
915	750	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
916	751	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
917	752	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
918	753	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
919	754	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
920	756	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
921	757	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
922	758	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
923	1020	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
924	759	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
925	760	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
926	761	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
927	762	paper	2017-03-01 08:54:49	2017-03-01 08:54:49
928	763	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
929	769	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
930	771	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
931	772	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
932	1021	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
933	773	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
934	777	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
935	778	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
936	1022	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
937	780	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
938	781	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
939	1023	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
940	782	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
941	783	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
942	1024	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
943	785	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
944	786	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
945	787	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
946	788	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
947	789	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
948	790	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
949	792	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
950	1025	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
951	793	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
952	1026	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
953	1027	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
954	794	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
955	795	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
956	796	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
957	797	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
958	1028	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
959	798	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
960	799	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
961	801	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
962	802	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
963	803	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
964	1029	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
965	805	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
966	806	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
967	807	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
968	1030	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
969	809	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
970	810	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
971	811	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
972	812	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
973	815	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
974	817	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
975	818	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
976	820	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
977	821	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
978	1031	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
979	1032	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
980	1033	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
981	822	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
982	823	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
983	824	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
984	825	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
985	827	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
986	1034	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
987	828	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
988	1035	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
989	1036	paper	2017-03-01 08:54:50	2017-03-01 08:54:50
990	1037	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
991	1038	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
992	830	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
993	831	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
994	1039	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
995	838	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
996	841	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
997	1040	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
998	1041	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
999	1042	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1000	845	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1001	1043	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1002	846	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1003	847	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1004	1044	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1005	848	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1006	849	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1007	1045	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1008	1046	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1009	862	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1010	863	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1011	864	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1012	866	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1013	867	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1014	1047	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1015	868	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1016	869	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1017	870	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1018	871	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1019	1048	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1020	872	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1021	873	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1022	874	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1023	875	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1024	876	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1025	877	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1026	1049	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1027	878	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1028	881	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1029	882	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1030	883	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1031	884	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1032	1050	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1033	886	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1034	887	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1035	1051	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1036	888	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1037	889	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1038	890	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1039	891	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1040	892	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1041	895	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1042	896	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1043	897	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1044	898	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1045	1052	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1046	1053	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1047	901	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1048	1054	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1049	1055	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1050	902	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1051	903	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1052	904	paper	2017-03-01 08:54:51	2017-03-01 08:54:51
1053	1056	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1054	906	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1055	907	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1056	1057	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1057	1058	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1058	1059	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1059	730	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1060	1062	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1061	1063	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1062	1064	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1063	1065	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1064	1066	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1065	1067	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1066	1068	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1067	1069	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1068	1070	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1069	1071	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1070	1072	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1071	1073	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1072	1074	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1073	1075	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1074	1076	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1075	1077	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1076	1078	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1077	1079	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1078	1080	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1079	1081	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1080	1082	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1081	1083	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1082	1084	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1083	1085	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1084	1086	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1085	1087	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1086	1088	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1087	1089	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1088	1090	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1089	1091	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1090	1092	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1091	1093	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1092	1094	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1093	1095	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1094	1096	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1095	1097	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1096	1098	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1097	1099	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1098	1100	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1099	1101	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1100	1102	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1101	1103	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1102	1104	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1103	1105	paper	2017-03-01 08:54:52	2017-03-01 08:54:52
1104	1106	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1105	1107	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1106	1108	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1107	1109	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1108	1110	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1109	1111	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1110	1112	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1111	1113	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1112	1114	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1113	1115	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1114	1116	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1115	1117	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1116	1118	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1117	1119	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1118	1120	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1119	1121	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1120	1122	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1121	1123	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1122	1124	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1123	1125	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1124	1126	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1125	1127	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1126	1128	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1127	1129	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1128	1130	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1129	1131	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1130	1132	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1131	1133	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1132	1134	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1133	1135	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1134	1136	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1135	1137	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1136	1138	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1137	1139	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1138	1140	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1139	1141	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1140	1142	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1141	1143	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1142	1144	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1143	1145	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1144	1146	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1145	1147	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1146	1148	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1147	1149	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1148	1150	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1149	1151	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1150	1152	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1151	1153	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1152	1154	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1153	1155	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1154	1156	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1155	1157	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1156	1158	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1157	1159	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1158	1160	paper	2017-03-01 08:54:53	2017-03-01 08:54:53
1159	1161	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1160	1162	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1161	1163	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1162	1164	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1163	1165	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1164	1166	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1165	1167	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1166	1168	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1167	1169	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1168	1170	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1169	1171	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1170	1172	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1171	1173	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1172	1174	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1173	1175	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1174	1176	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1175	1177	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1176	1178	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1177	1179	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1178	1180	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1179	1181	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1180	1182	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1181	1183	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1182	1184	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1183	1185	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1184	1186	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1185	1187	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1186	1188	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1187	1189	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1188	1190	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1189	1191	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1190	1192	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1191	1193	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1192	1194	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1193	1195	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1194	1196	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1195	1197	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1196	1198	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1197	1199	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1198	1200	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1199	1201	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1200	1202	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1201	1203	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1202	1204	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1203	1205	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1204	1206	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1205	1207	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1206	1208	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1207	1209	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1208	1210	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1209	1211	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1210	1212	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1211	1213	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1212	1214	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1213	1215	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1214	1216	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1215	1217	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1216	1218	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1217	1219	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1218	1220	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1219	1221	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1220	1222	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1221	1223	paper	2017-03-01 08:54:54	2017-03-01 08:54:54
1222	1224	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1223	1225	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1224	1226	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1225	1227	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1226	1228	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1227	1229	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1228	1230	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1229	1231	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1230	1232	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1231	1233	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1232	1234	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1233	1235	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1234	1236	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1235	1237	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1236	1238	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1237	1239	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1238	1240	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1239	1241	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1240	1242	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1241	1243	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1242	1244	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1243	1245	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1244	1246	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1245	1247	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1246	1248	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1247	1249	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1248	1250	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1249	1251	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1250	1252	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1251	1253	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1252	1254	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1253	1255	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1254	1256	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1255	1257	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1256	1258	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1257	1259	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1258	1260	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1259	1261	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1260	1262	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1261	1263	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1262	1264	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1263	1265	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1264	1266	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1265	1267	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1266	1268	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1267	1269	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1268	1270	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1269	1271	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1270	1272	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1271	1273	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1272	1274	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1273	1275	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1274	1276	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1275	1277	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1276	1278	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1277	1279	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1278	1280	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1279	1281	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1280	1282	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1281	1283	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1282	1284	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1283	1285	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1284	1286	paper	2017-03-01 08:54:55	2017-03-01 08:54:55
1285	1287	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1286	1288	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1287	1289	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1288	1290	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1289	1291	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1290	1292	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1291	1293	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1292	1294	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1293	1295	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1294	1296	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1295	1297	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1296	1298	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1297	1299	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1298	1300	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1299	1301	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1300	1302	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1301	1303	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1302	1304	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1303	1305	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1304	1306	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1305	1307	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1306	1308	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1307	1309	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1308	1310	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1309	1311	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1310	1312	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1311	1313	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1312	1314	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1313	1315	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1314	1316	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1315	1317	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1316	1318	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1317	1319	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1318	1320	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1319	1321	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1320	1322	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1321	1323	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1322	1324	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1323	1325	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1324	1326	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1325	1327	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1326	1328	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1327	1329	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1328	1330	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1329	1331	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1330	1332	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1331	1333	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1332	1334	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1333	1335	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1334	1336	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1335	1337	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1336	1338	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1337	1339	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1338	1340	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1339	1341	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1340	1342	paper	2017-03-01 08:54:56	2017-03-01 08:54:56
1341	1343	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1342	1344	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1343	1345	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1344	1346	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1345	1347	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1346	1348	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1347	1349	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1348	1350	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1349	1351	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1350	1352	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1351	1353	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1352	1354	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1353	1355	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1354	1356	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1355	1357	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1356	1358	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1357	1359	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1358	1360	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1359	1361	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1360	1362	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1361	1363	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1362	1364	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1363	1365	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1364	1366	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1365	1367	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1366	1368	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1367	1369	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1368	1370	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1369	1371	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1370	1372	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1371	1373	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1372	1374	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1373	1375	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1374	1376	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1375	1377	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1376	1378	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1377	1379	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1378	1380	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1379	1381	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1380	1382	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1381	1383	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1382	1384	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1383	1385	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1384	1386	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1385	1387	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1386	1388	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1387	1389	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1388	1390	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1389	1391	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1390	1392	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1391	1393	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1392	1394	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1393	1395	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1394	1396	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1395	1397	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1396	1398	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1397	1399	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1398	1400	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1399	1401	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1400	1402	paper	2017-03-01 08:54:57	2017-03-01 08:54:57
1401	1403	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1402	1404	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1403	1405	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1404	1406	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1405	1407	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1406	1408	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1407	1409	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1408	1410	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1409	1411	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1410	1412	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1411	1413	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1412	1414	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1413	1415	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1414	1416	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1415	1417	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1416	1418	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1417	1419	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1418	1420	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1419	1421	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1420	1422	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1421	1423	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1422	1424	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1423	1425	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1424	1426	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1425	1427	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1426	1428	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1427	1429	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1428	1430	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1429	1431	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1430	1432	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1431	1433	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1432	1434	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1433	1435	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1434	1436	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1435	1437	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1436	1438	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1437	1439	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1438	1440	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1439	1441	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1440	1442	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1441	1443	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1442	1444	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1443	1445	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1444	1446	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1445	1447	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1446	1448	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1447	1449	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1448	1450	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1449	1451	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1450	1452	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1451	1453	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1452	1454	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1453	1455	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1454	1456	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1455	1457	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1456	1458	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1457	1459	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1458	1460	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1459	1461	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1460	1462	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1461	1463	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1462	1464	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1463	1465	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1464	1466	paper	2017-03-01 08:54:58	2017-03-01 08:54:58
1465	1467	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1466	1468	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1467	1469	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1468	1470	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1469	1471	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1470	1472	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1471	1473	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1472	1474	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1473	1475	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1474	1476	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1475	1477	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1476	1478	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1477	1479	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1478	1480	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1479	1481	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1480	1482	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1481	1483	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1482	1484	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1483	1485	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1484	1486	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1485	1487	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1486	1488	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1487	1489	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1488	1490	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1489	1491	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1490	1492	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1491	1493	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1492	1494	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1493	1495	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1494	1496	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1495	1497	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1496	1498	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1497	1499	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1498	1500	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1499	1501	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1500	1502	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1501	1503	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1502	1504	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1503	1505	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1504	1506	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1505	1507	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1506	1508	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1507	1509	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1508	1510	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1509	1511	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1510	1512	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1511	1513	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1512	1514	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1513	1515	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1514	1516	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1515	1517	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1516	1518	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1517	1519	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1518	1520	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1519	1521	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1520	1522	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1521	1523	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1522	1524	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1523	1525	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1524	1526	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1525	1527	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1526	1528	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1527	1529	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1528	1530	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1529	1531	paper	2017-03-01 08:54:59	2017-03-01 08:54:59
1530	1532	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1531	1533	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1532	1534	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1533	1535	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1534	1536	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1535	1538	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1536	1540	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1537	1542	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1538	1543	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1539	1545	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1540	1549	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1541	1551	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1542	1554	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1543	1556	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1544	1557	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1545	1558	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1546	1559	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1547	1560	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1548	1561	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1549	1562	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1550	1563	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1551	1564	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1552	1565	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1553	1566	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1554	1567	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1555	1568	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1556	1569	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1557	1570	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1558	1571	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1559	1572	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1560	1573	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1561	1574	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1562	1575	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1563	1576	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1564	1580	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1565	1586	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1566	1587	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1567	1588	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1568	1589	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1569	1590	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1570	1591	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1571	1592	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1572	1593	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1573	1594	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1574	1595	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1575	1596	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1576	1597	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1577	1598	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1578	1599	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1579	1600	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1580	1601	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1581	1602	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1582	1603	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1583	1604	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1584	1605	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1585	1606	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1586	1607	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1587	1608	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1588	1609	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1589	1610	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1590	1611	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1591	1612	paper	2017-03-01 08:55:00	2017-03-01 08:55:00
1592	1613	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1593	1614	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1594	1615	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1595	1616	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1596	1617	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1597	1618	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1598	1619	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1599	1620	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1600	1621	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1601	1622	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1602	1623	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1603	1624	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1604	1625	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1605	1626	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1606	1627	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1607	1628	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1608	1629	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1609	1630	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1610	1631	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1611	1632	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1612	1633	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1613	1634	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1614	1635	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1615	1636	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1616	1637	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1617	1638	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1618	1639	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1619	1640	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1620	1641	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1621	1642	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1622	1643	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1623	1644	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1624	1645	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1625	1646	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1626	1647	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1627	1648	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1628	1649	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1629	1650	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1630	1651	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1631	1652	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1632	1653	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1633	1654	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1634	1655	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1635	1656	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1636	1657	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1637	1658	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1638	1659	paper	2017-03-01 08:55:01	2017-03-01 08:55:01
1639	2	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1640	7	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1641	10	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1642	11	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1643	17	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1644	18	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1645	21	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1646	22	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1647	23	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1648	25	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1649	26	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1650	30	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1651	31	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1652	32	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1653	34	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1654	35	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1655	37	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1656	38	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1657	430	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1658	54	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1659	119	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1660	135	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1661	142	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1662	147	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1663	165	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1664	175	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1665	190	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1666	193	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1667	197	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1668	211	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1669	217	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1670	218	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1671	236	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1672	240	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1673	241	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1674	244	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1675	248	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1676	256	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1677	259	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1678	923	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1679	272	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1680	277	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1681	278	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1682	279	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1683	928	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1684	282	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1685	288	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1686	929	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1687	290	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1688	291	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1689	930	ebook	2017-03-01 08:55:23	2017-03-01 08:55:23
1690	295	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1691	931	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1692	298	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1693	932	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1694	1064	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1695	301	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1696	318	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1697	323	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1698	935	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1699	340	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1700	343	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1701	347	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1702	350	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1703	352	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1704	358	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1705	362	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1706	375	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1707	383	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1708	384	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1709	936	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1710	386	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1711	400	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1712	402	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1713	937	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1714	414	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1715	424	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1716	431	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1717	433	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1718	440	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1719	447	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1720	452	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1721	1066	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1722	468	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1723	469	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1724	478	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1725	486	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1726	940	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1727	941	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1728	495	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1729	942	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1730	503	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1731	505	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1732	1067	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1733	520	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1734	943	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1735	944	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1736	1068	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1737	542	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1738	543	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1739	546	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1740	553	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1741	555	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1742	559	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1743	576	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1744	945	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1745	579	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1746	580	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1747	591	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1748	592	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1749	1069	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1750	605	ebook	2017-03-01 08:55:24	2017-03-01 08:55:24
1751	606	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1752	617	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1753	647	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1754	648	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1755	650	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1756	656	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1757	658	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1758	665	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1759	671	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1760	679	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1761	682	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1762	685	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1763	703	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1764	948	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1765	709	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1766	719	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1767	721	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1768	726	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1769	732	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1770	733	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1771	949	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1772	746	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1773	791	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1774	804	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1775	808	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1776	813	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1777	814	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1778	819	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1779	1071	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1780	950	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1781	829	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1782	951	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1783	832	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1784	833	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1785	1072	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1786	837	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1787	840	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1788	842	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1789	843	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1790	844	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1791	1073	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1792	865	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1793	1075	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1794	953	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1795	954	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1796	879	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1797	880	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1798	893	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1799	894	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1800	899	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1801	900	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1802	955	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1803	1079	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1804	956	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1805	905	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1806	908	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1807	909	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1808	910	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1809	957	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1810	916	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1811	40	ebook	2017-03-01 08:55:25	2017-03-01 08:55:25
1812	41	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1813	43	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1814	44	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1815	45	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1816	48	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1817	57	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1818	70	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1819	72	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1820	73	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1821	74	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1822	76	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1823	78	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1824	81	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1825	84	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1826	85	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1828	88	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1829	91	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1830	92	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1831	94	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1832	98	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1833	99	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1834	100	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1835	101	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1836	102	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1837	118	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1838	121	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1839	123	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1840	124	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1841	129	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1842	131	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1843	132	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1844	133	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1845	134	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1846	958	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1847	136	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1848	137	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1849	140	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1850	143	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1851	144	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1852	146	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1853	149	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1854	152	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1855	153	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1856	157	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1857	169	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1858	170	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1859	174	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1860	177	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1861	178	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1862	191	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1863	196	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1864	199	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1865	960	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1866	203	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1867	204	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1868	209	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1869	210	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1870	212	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1871	216	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1872	228	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1873	232	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
1874	961	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1875	235	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1876	242	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1877	1081	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1878	250	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1879	252	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1880	962	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1881	1082	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1882	1083	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1883	261	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1884	262	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1885	266	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1886	270	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1887	1084	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1888	281	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1889	1085	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1890	1086	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1891	284	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1892	285	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1893	1087	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1894	287	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1895	964	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1896	294	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1897	296	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1898	297	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1899	299	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1900	1088	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1901	300	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1902	306	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1903	307	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1904	965	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1905	1089	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1906	313	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1907	314	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1908	966	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1909	315	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1910	317	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1911	320	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1912	321	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1913	322	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1914	328	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1915	337	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1916	338	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1917	339	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1918	1660	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1919	1661	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1920	342	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1921	970	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1922	359	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1923	971	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1924	361	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1925	972	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1926	371	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1927	379	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1928	381	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1929	385	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1930	1091	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1931	387	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1932	395	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1933	1093	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1934	397	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1935	975	ebook	2017-03-01 08:55:27	2017-03-01 08:55:27
1936	976	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1937	401	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1938	978	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1939	1094	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1940	979	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1941	411	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1942	1095	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1943	415	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1944	980	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1945	423	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1946	425	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1947	426	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1948	1098	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1949	435	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1950	439	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1951	1099	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1952	1100	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1953	1101	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1954	1102	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1955	441	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1956	442	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1957	982	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1958	443	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1959	983	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1960	445	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1961	446	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1962	1103	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1963	448	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1964	449	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1965	451	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1966	453	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1967	456	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1968	457	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1969	458	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1970	459	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1971	460	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1972	461	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1973	1105	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1974	462	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1975	463	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1976	464	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1977	984	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1978	467	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1979	1106	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1980	1107	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1981	471	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1982	472	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1983	473	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1984	474	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1985	475	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1986	476	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1987	1109	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1988	477	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1989	480	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1990	1113	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1991	485	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1992	488	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1993	490	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1994	491	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1995	492	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1996	1115	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1997	494	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1998	496	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
1999	498	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
2000	499	ebook	2017-03-01 08:55:28	2017-03-01 08:55:28
2001	500	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2002	501	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2003	1116	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2004	515	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2005	517	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2006	1117	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2007	534	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2008	987	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2009	988	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2010	540	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2011	541	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2012	989	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2013	990	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2014	1119	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2015	548	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2016	1120	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2017	552	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2018	991	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2019	992	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2020	1121	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2021	554	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2022	556	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2023	557	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2024	560	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2025	993	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2026	563	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2027	566	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2028	1122	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2029	567	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2030	568	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2031	1123	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2032	571	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2033	1125	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2034	994	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2035	577	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2036	1126	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2037	1127	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2038	578	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2039	997	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2040	581	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2041	998	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2042	582	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2043	1000	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2044	585	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2045	1131	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2046	586	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2047	588	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2048	1133	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2049	595	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2050	1134	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2051	598	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2052	599	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2053	601	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2054	1136	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2055	604	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2056	1662	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2057	1663	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2058	607	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2059	608	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2060	610	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2061	611	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2062	621	ebook	2017-03-01 08:55:29	2017-03-01 08:55:29
2063	626	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2064	627	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2065	628	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2066	1137	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2067	629	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2068	1003	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2069	630	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2070	631	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2071	1138	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2072	636	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2073	637	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2074	638	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2075	639	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2076	640	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2077	641	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2078	642	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2079	644	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2080	645	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2081	646	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2082	649	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2083	1004	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2084	651	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2085	652	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2086	657	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2087	1005	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2088	660	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2089	661	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2090	662	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2091	663	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2092	664	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2093	666	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2094	668	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2095	669	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2096	670	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2097	1140	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2098	1007	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2099	674	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2100	675	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2101	1008	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2102	1142	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2103	1143	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2104	677	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2105	678	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2106	680	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2107	683	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2108	684	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2109	1009	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2110	686	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2111	1145	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2112	1011	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2113	688	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2114	1012	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2115	689	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2116	1013	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2117	1146	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2118	692	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2119	1147	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2120	1148	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2121	694	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2122	695	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2123	696	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2124	697	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2125	698	ebook	2017-03-01 08:55:30	2017-03-01 08:55:30
2126	699	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2127	701	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2128	1664	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2129	702	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2130	704	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2131	1149	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2132	1665	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2133	706	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2134	1666	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2135	707	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2136	708	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2137	1667	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2138	710	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2139	713	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2140	1151	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2141	714	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2142	715	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2143	716	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2144	717	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2145	718	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2146	1158	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2147	1015	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2148	720	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2149	722	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2150	723	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2151	724	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2152	1016	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2153	729	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2154	1161	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2155	735	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2156	1162	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2157	1163	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2158	739	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2159	1165	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2160	1166	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2161	1167	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2162	740	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2163	741	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2164	742	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2165	743	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2166	744	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2167	745	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2168	747	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2169	1018	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2170	1019	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2171	748	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2172	1172	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2173	749	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2174	1173	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2175	1174	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2176	1175	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2177	750	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2178	751	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2179	1177	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2180	752	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2181	753	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2182	1178	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2183	757	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2184	1179	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2185	1180	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2186	758	ebook	2017-03-01 08:55:31	2017-03-01 08:55:31
2187	1020	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2188	759	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2189	1181	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2190	760	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2191	763	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2192	771	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2193	1185	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2194	1021	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2195	1186	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2196	1187	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2197	777	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2198	1194	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2199	780	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2200	1197	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2201	1205	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2202	1206	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2203	785	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2204	786	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2205	787	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2206	1208	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2207	788	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2208	790	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2209	792	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2210	1025	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2211	1211	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2212	793	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2213	1213	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2214	1026	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2215	1027	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2216	795	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2217	1217	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2218	796	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2219	797	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2220	1028	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2221	1218	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2222	1220	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2223	799	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2224	1221	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2225	803	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2226	1222	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2227	1029	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2228	1224	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2229	1225	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2230	805	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2231	806	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2232	1227	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2233	1228	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2234	1030	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2235	1229	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2236	1234	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2237	809	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2238	812	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2239	1236	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2240	815	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2241	1239	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2242	821	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2243	1031	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2244	1032	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2245	1033	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2246	822	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2247	1245	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2248	823	ebook	2017-03-01 08:55:32	2017-03-01 08:55:32
2249	824	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2250	825	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2251	1247	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2252	1248	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2253	1251	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2254	1253	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2255	1258	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2256	1259	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2257	1034	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2258	828	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2259	1260	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2260	1261	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2261	1262	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2262	1263	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2263	1036	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2264	1037	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2265	1265	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2266	1266	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2267	1268	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2268	830	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2269	1269	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2270	831	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2271	1271	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2272	838	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2273	1274	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2274	1277	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2275	1668	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2276	1041	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2277	1283	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2278	845	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2279	1285	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2280	1043	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2281	846	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2282	1291	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2283	1292	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2284	1293	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2285	1294	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2286	848	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2287	849	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2288	1347	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2289	1355	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2290	862	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2291	1360	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2292	864	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2293	867	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2294	1372	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2295	868	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2296	1374	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2297	869	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2298	871	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2299	1389	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2300	873	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2301	1390	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2302	1396	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2303	1398	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2304	1411	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2305	1417	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2306	1425	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2307	881	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2308	1433	ebook	2017-03-01 08:55:33	2017-03-01 08:55:33
2309	883	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2310	884	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2311	1442	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2312	1460	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2313	1051	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2314	891	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2315	1477	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2316	896	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2317	1488	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2318	1489	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2319	1495	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2320	1502	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2321	1055	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2322	903	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2323	1514	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2324	1523	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2325	1525	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2326	1056	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2327	1530	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2328	1535	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2329	1536	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2330	911	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2331	1573	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2332	1579	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2333	730	ebook	2017-03-01 08:55:34	2017-03-01 08:55:34
2334	520	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2335	658	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2336	703	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2337	948	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2338	791	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2339	813	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2340	832	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2341	833	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2342	1072	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2343	1073	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2344	859	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2346	879	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2347	880	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2348	956	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2349	905	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2350	1669	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2351	910	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2352	957	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2353	916	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2354	567	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2355	660	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
2356	1140	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2357	677	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2358	1195	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2359	1029	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2360	806	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2361	1275	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2362	1290	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2363	1326	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2364	881	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2365	891	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2366	1551	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2367	1573	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2368	1577	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
2369	1579	audiobook	2017-03-01 08:55:48	2017-03-01 08:55:48
1827	87	ebook	2017-03-01 08:55:26	2017-03-01 08:55:26
2345	1077	audiobook	2017-03-01 08:55:47	2017-03-01 08:55:47
\.


--
-- Name: volumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('volumes_id_seq', 2369, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: volumes volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY volumes
    ADD CONSTRAINT volumes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

