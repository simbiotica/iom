--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addr; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addr (
    gid integer NOT NULL,
    tlid bigint,
    fromhn character varying(12),
    tohn character varying(12),
    side character varying(1),
    zip character varying(5),
    plus4 character varying(4),
    fromtyp character varying(1),
    totyp character varying(1),
    fromarmid integer,
    toarmid integer,
    arid character varying(22),
    mtfcc character varying(5),
    statefp character varying(2)
);


--
-- Name: addr_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addr_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addr_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addr_gid_seq OWNED BY addr.gid;


--
-- Name: addrfeat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addrfeat (
    gid integer NOT NULL,
    tlid bigint,
    statefp character varying(2) NOT NULL,
    aridl character varying(22),
    aridr character varying(22),
    linearid character varying(22),
    fullname character varying(100),
    lfromhn character varying(12),
    ltohn character varying(12),
    rfromhn character varying(12),
    rtohn character varying(12),
    zipl character varying(5),
    zipr character varying(5),
    edge_mtfcc character varying(5),
    parityl character varying(1),
    parityr character varying(1),
    plus4l character varying(4),
    plus4r character varying(4),
    lfromtyp character varying(1),
    ltotyp character varying(1),
    rfromtyp character varying(1),
    rtotyp character varying(1),
    offsetl character varying(1),
    offsetr character varying(1),
    the_geom geometry(LineString,4269)
);


--
-- Name: addrfeat_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addrfeat_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addrfeat_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addrfeat_gid_seq OWNED BY addrfeat.gid;


--
-- Name: bg; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bg (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    blkgrpce character varying(1),
    bg_id character varying(12) NOT NULL,
    namelsad character varying(13),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: changes_history_records; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE changes_history_records (
    id integer NOT NULL,
    user_id integer,
    "when" timestamp without time zone,
    how text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    what_id integer,
    what_type character varying(255),
    reviewed boolean DEFAULT false,
    who_email character varying(255),
    who_organization character varying(255)
);


--
-- Name: changes_history_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE changes_history_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changes_history_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE changes_history_records_id_seq OWNED BY changes_history_records.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE clusters (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clusters_id_seq OWNED BY clusters.id;


--
-- Name: clusters_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE clusters_projects (
    cluster_id integer,
    project_id integer
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    center_lat double precision,
    center_lon double precision,
    wiki_url character varying(255),
    wiki_description text,
    iso2_code character varying(255),
    iso3_code character varying(255),
    the_geom_geojson text,
    the_geom geometry(MultiPolygon,4326)
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: countries_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries_projects (
    country_id integer,
    project_id integer
);


--
-- Name: county; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE county (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    countyns character varying(8),
    cntyidfp character varying(5) NOT NULL,
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    csafp character varying(3),
    cbsafp character varying(5),
    metdivfp character varying(5),
    funcstat character varying(1),
    aland bigint,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: county_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE county_lookup (
    st_code integer NOT NULL,
    state character varying(2),
    co_code integer NOT NULL,
    name character varying(90)
);


--
-- Name: countysub_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countysub_lookup (
    st_code integer NOT NULL,
    state character varying(2),
    co_code integer NOT NULL,
    county character varying(90),
    cs_code integer NOT NULL,
    name character varying(90)
);


--
-- Name: cousub; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cousub (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    cousubfp character varying(5),
    cousubns character varying(8),
    cosbidfp character varying(10) NOT NULL,
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    cnectafp character varying(3),
    nectafp character varying(5),
    nctadvfp character varying(5),
    funcstat character varying(1),
    aland numeric(14,0),
    awater numeric(14,0),
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: data_denormalization; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_denormalization (
    project_id integer,
    project_name character varying(2000),
    project_description text,
    organization_id integer,
    organization_name character varying(2000),
    end_date date,
    regions text,
    regions_ids character varying(255),
    countries text,
    countries_ids character varying(255),
    sectors text,
    sector_ids character varying(255),
    clusters text,
    cluster_ids character varying(255),
    donors_ids character varying(255),
    is_active boolean,
    site_id integer,
    created_at timestamp without time zone,
    start_date date
);


--
-- Name: direction_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE direction_lookup (
    name character varying(20) NOT NULL,
    abbrev character varying(3)
);


--
-- Name: donations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE donations (
    id integer NOT NULL,
    donor_id integer,
    project_id integer,
    amount double precision,
    date date,
    office_id integer
);


--
-- Name: donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE donations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE donations_id_seq OWNED BY donations.id;


--
-- Name: donors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE donors (
    id integer NOT NULL,
    name character varying(2000),
    description text,
    website character varying(255),
    twitter character varying(255),
    facebook character varying(255),
    contact_person_name character varying(255),
    contact_company character varying(255),
    contact_person_position character varying(255),
    contact_email character varying(255),
    contact_phone_number character varying(255),
    logo_file_name character varying(255),
    logo_content_type character varying(255),
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    site_specific_information text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: donors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE donors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: donors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE donors_id_seq OWNED BY donors.id;


--
-- Name: edges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edges (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tlid bigint,
    tfidl numeric(10,0),
    tfidr numeric(10,0),
    mtfcc character varying(5),
    fullname character varying(100),
    smid character varying(22),
    lfromadd character varying(12),
    ltoadd character varying(12),
    rfromadd character varying(12),
    rtoadd character varying(12),
    zipl character varying(5),
    zipr character varying(5),
    featcat character varying(1),
    hydroflg character varying(1),
    railflg character varying(1),
    roadflg character varying(1),
    olfflg character varying(1),
    passflg character varying(1),
    divroad character varying(1),
    exttyp character varying(1),
    ttyp character varying(1),
    deckedroad character varying(1),
    artpath character varying(1),
    persist character varying(1),
    gcseflg character varying(1),
    offsetl character varying(1),
    offsetr character varying(1),
    tnidf numeric(10,0),
    tnidt numeric(10,0),
    the_geom geometry(MultiLineString,4269)
);


--
-- Name: edges_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edges_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: edges_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE edges_gid_seq OWNED BY edges.gid;


--
-- Name: faces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE faces (
    gid integer NOT NULL,
    tfid numeric(10,0),
    statefp00 character varying(2),
    countyfp00 character varying(3),
    tractce00 character varying(6),
    blkgrpce00 character varying(1),
    blockce00 character varying(4),
    cousubfp00 character varying(5),
    submcdfp00 character varying(5),
    conctyfp00 character varying(5),
    placefp00 character varying(5),
    aiannhfp00 character varying(5),
    aiannhce00 character varying(4),
    comptyp00 character varying(1),
    trsubfp00 character varying(5),
    trsubce00 character varying(3),
    anrcfp00 character varying(5),
    elsdlea00 character varying(5),
    scsdlea00 character varying(5),
    unsdlea00 character varying(5),
    uace00 character varying(5),
    cd108fp character varying(2),
    sldust00 character varying(3),
    sldlst00 character varying(3),
    vtdst00 character varying(6),
    zcta5ce00 character varying(5),
    tazce00 character varying(6),
    ugace00 character varying(5),
    puma5ce00 character varying(5),
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    blkgrpce character varying(1),
    blockce character varying(4),
    cousubfp character varying(5),
    submcdfp character varying(5),
    conctyfp character varying(5),
    placefp character varying(5),
    aiannhfp character varying(5),
    aiannhce character varying(4),
    comptyp character varying(1),
    trsubfp character varying(5),
    trsubce character varying(3),
    anrcfp character varying(5),
    ttractce character varying(6),
    tblkgpce character varying(1),
    elsdlea character varying(5),
    scsdlea character varying(5),
    unsdlea character varying(5),
    uace character varying(5),
    cd111fp character varying(2),
    sldust character varying(3),
    sldlst character varying(3),
    vtdst character varying(6),
    zcta5ce character varying(5),
    tazce character varying(6),
    ugace character varying(5),
    puma5ce character varying(5),
    csafp character varying(3),
    cbsafp character varying(5),
    metdivfp character varying(5),
    cnectafp character varying(3),
    nectafp character varying(5),
    nctadvfp character varying(5),
    lwflag character varying(1),
    "offset" character varying(1),
    atotal double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: faces_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE faces_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faces_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE faces_gid_seq OWNED BY faces.gid;


--
-- Name: featnames; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE featnames (
    gid integer NOT NULL,
    tlid bigint,
    fullname character varying(100),
    name character varying(100),
    predirabrv character varying(15),
    pretypabrv character varying(50),
    prequalabr character varying(15),
    sufdirabrv character varying(15),
    suftypabrv character varying(50),
    sufqualabr character varying(15),
    predir character varying(2),
    pretyp character varying(3),
    prequal character varying(2),
    sufdir character varying(2),
    suftyp character varying(3),
    sufqual character varying(2),
    linearid character varying(22),
    mtfcc character varying(5),
    paflag character varying(1),
    statefp character varying(2)
);


--
-- Name: featnames_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE featnames_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: featnames_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE featnames_gid_seq OWNED BY featnames.gid;


--
-- Name: geocode_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geocode_settings (
    name text NOT NULL,
    setting text,
    unit text,
    category text,
    short_desc text
);


--
-- Name: layer_styles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE layer_styles (
    id integer NOT NULL,
    title character varying(255),
    name character varying(255)
);


--
-- Name: layer_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE layer_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: layer_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE layer_styles_id_seq OWNED BY layer_styles.id;


--
-- Name: layers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE layers (
    id integer NOT NULL,
    title character varying(255),
    description text,
    credits text,
    date timestamp without time zone,
    min double precision,
    max double precision,
    units character varying(255),
    status boolean,
    cartodb_table character varying(255),
    sql text,
    long_title character varying(255)
);


--
-- Name: layers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE layers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: layers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE layers_id_seq OWNED BY layers.id;


--
-- Name: loader_lookuptables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE loader_lookuptables (
    process_order integer DEFAULT 1000 NOT NULL,
    lookup_name text NOT NULL,
    table_name text,
    single_mode boolean DEFAULT true NOT NULL,
    load boolean DEFAULT true NOT NULL,
    level_county boolean DEFAULT false NOT NULL,
    level_state boolean DEFAULT false NOT NULL,
    level_nation boolean DEFAULT false NOT NULL,
    post_load_process text,
    single_geom_mode boolean DEFAULT false,
    insert_mode character varying(1) DEFAULT 'c'::character varying NOT NULL,
    pre_load_process text,
    columns_exclude character varying(255),
    website_root_override text
);


--
-- Name: loader_platform; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE loader_platform (
    os character varying(50) NOT NULL,
    declare_sect text,
    pgbin text,
    wget text,
    unzip_command text,
    psql text,
    path_sep text,
    loader text,
    environ_set_command text,
    county_process_command text
);


--
-- Name: loader_variables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE loader_variables (
    tiger_year character varying(4) NOT NULL,
    website_root text,
    staging_fold text,
    data_schema text,
    staging_schema text
);


--
-- Name: media_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media_resources (
    id integer NOT NULL,
    "position" integer DEFAULT 0,
    element_id integer,
    element_type integer,
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_filesize integer,
    picture_updated_at timestamp without time zone,
    video_url character varying(255),
    video_embed_html text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    caption character varying(255),
    video_thumb_file_name character varying(255),
    video_thumb_content_type character varying(255),
    video_thumb_file_size integer,
    video_thumb_updated_at timestamp without time zone
);


--
-- Name: media_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE media_resources_id_seq OWNED BY media_resources.id;


--
-- Name: offices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE offices (
    id integer NOT NULL,
    donor_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: offices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE offices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE offices_id_seq OWNED BY offices.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying(255),
    description text,
    budget double precision,
    website character varying(255),
    national_staff integer,
    twitter character varying(255),
    facebook character varying(255),
    hq_address character varying(255),
    contact_email character varying(255),
    contact_phone_number character varying(255),
    donation_address character varying(255),
    zip_code character varying(255),
    city character varying(255),
    state character varying(255),
    donation_phone_number character varying(255),
    donation_website character varying(255),
    site_specific_information text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    logo_file_name character varying(255),
    logo_content_type character varying(255),
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    international_staff character varying(255),
    contact_name character varying(255),
    contact_position character varying(255),
    contact_zip character varying(255),
    contact_city character varying(255),
    contact_state character varying(255),
    contact_country character varying(255),
    donation_country character varying(255),
    estimated_people_reached integer,
    private_funding double precision,
    usg_funding double precision,
    other_funding double precision,
    private_funding_spent double precision,
    usg_funding_spent double precision,
    other_funding_spent double precision,
    spent_funding_on_relief double precision,
    spent_funding_on_reconstruction double precision,
    percen_relief integer,
    percen_reconstruction integer,
    media_contact_name character varying(255),
    media_contact_position character varying(255),
    media_contact_phone_number character varying(255),
    media_contact_email character varying(255),
    main_data_contact_name character varying(255),
    main_data_contact_position character varying(255),
    main_data_contact_phone_number character varying(255),
    main_data_contact_email character varying(255),
    main_data_contact_zip character varying(255),
    main_data_contact_city character varying(255),
    main_data_contact_state character varying(255),
    main_data_contact_country character varying(255),
    organization_id character varying(255)
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: organizations_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations_projects (
    organization_id integer,
    project_id integer
);


--
-- Name: pagc_gaz; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pagc_gaz (
    id integer NOT NULL,
    seq integer,
    word text,
    stdword text,
    token integer,
    is_custom boolean DEFAULT true NOT NULL
);


--
-- Name: pagc_gaz_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagc_gaz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagc_gaz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagc_gaz_id_seq OWNED BY pagc_gaz.id;


--
-- Name: pagc_lex; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pagc_lex (
    id integer NOT NULL,
    seq integer,
    word text,
    stdword text,
    token integer,
    is_custom boolean DEFAULT true NOT NULL
);


--
-- Name: pagc_lex_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagc_lex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagc_lex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagc_lex_id_seq OWNED BY pagc_lex.id;


--
-- Name: pagc_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pagc_rules (
    id integer NOT NULL,
    rule text,
    is_custom boolean DEFAULT true
);


--
-- Name: pagc_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pagc_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagc_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pagc_rules_id_seq OWNED BY pagc_rules.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    title character varying(255),
    body text,
    site_id integer,
    published boolean,
    permalink character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    parent_id integer,
    order_index integer
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE partners (
    id integer NOT NULL,
    site_id integer,
    name character varying(255),
    url character varying(255),
    logo_file_name character varying(255),
    logo_content_type character varying(255),
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    label character varying(255)
);


--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE partners_id_seq OWNED BY partners.id;


--
-- Name: place; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE place (
    gid integer NOT NULL,
    statefp character varying(2),
    placefp character varying(5),
    placens character varying(8),
    plcidfp character varying(7) NOT NULL,
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    cpi character varying(1),
    pcicbsa character varying(1),
    pcinecta character varying(1),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland bigint,
    awater bigint,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: place_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE place_lookup (
    st_code integer NOT NULL,
    state character varying(2),
    pl_code integer NOT NULL,
    name character varying(90)
);


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(2000),
    description text,
    primary_organization_id integer,
    implementing_organization text,
    partner_organizations text,
    cross_cutting_issues text,
    start_date date,
    end_date date,
    budget double precision,
    target text,
    estimated_people_reached bigint,
    contact_person character varying(255),
    contact_email character varying(255),
    contact_phone_number character varying(255),
    site_specific_information text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    activities text,
    intervention_id character varying(255),
    additional_information text,
    awardee_type character varying(255),
    date_provided date,
    date_updated date,
    contact_position character varying(255),
    website character varying(255),
    verbatim_location text,
    calculation_of_number_of_people_reached text,
    project_needs text,
    idprefugee_camp text,
    organization_id character varying(255),
    the_geom geometry(Geometry,4326)
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: projects_regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_regions (
    region_id integer,
    project_id integer
);


--
-- Name: projects_sectors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_sectors (
    sector_id integer,
    project_id integer
);


--
-- Name: projects_sites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_sites (
    project_id integer,
    site_id integer
);


--
-- Name: projects_synchronizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_synchronizations (
    id integer NOT NULL,
    projects_file_data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: projects_synchronizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_synchronizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_synchronizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_synchronizations_id_seq OWNED BY projects_synchronizations.id;


--
-- Name: projects_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects_tags (
    tag_id integer,
    project_id integer
);


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying(255),
    level integer,
    country_id integer,
    parent_region_id integer,
    center_lat double precision,
    center_lon double precision,
    path character varying(255),
    gadm_id integer,
    wiki_url character varying(255),
    wiki_description text,
    code character varying(255),
    the_geom_geojson text,
    ia_name text,
    the_geom geometry(Geometry,4326)
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    title character varying(255),
    url character varying(255),
    element_id integer,
    element_type integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    site_specific_information text
);


--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: secondary_unit_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE secondary_unit_lookup (
    name character varying(20) NOT NULL,
    abbrev character varying(5)
);


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectors (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sectors_id_seq OWNED BY sectors.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    data text
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: site_layers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE site_layers (
    site_id integer,
    layer_id integer,
    layer_style_id integer
);


--
-- Name: sites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sites (
    id integer NOT NULL,
    name character varying(255),
    short_description text,
    long_description text,
    contact_email character varying(255),
    contact_person character varying(255),
    url character varying(255),
    permalink character varying(255),
    google_analytics_id character varying(255),
    logo_file_name character varying(255),
    logo_content_type character varying(255),
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    theme_id integer,
    blog_url character varying(255),
    word_for_clusters character varying(255),
    word_for_regions character varying(255),
    show_global_donations_raises boolean DEFAULT false,
    project_classification integer DEFAULT 0,
    geographic_context_country_id integer,
    geographic_context_region_id integer,
    project_context_cluster_id integer,
    project_context_sector_id integer,
    project_context_organization_id integer,
    project_context_tags character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    project_context_tags_ids character varying(255),
    status boolean DEFAULT false,
    visits double precision DEFAULT 0.0,
    visits_last_week double precision DEFAULT 0.0,
    aid_map_image_file_name character varying(255),
    aid_map_image_content_type character varying(255),
    aid_map_image_file_size integer,
    aid_map_image_updated_at timestamp without time zone,
    navigate_by_country boolean DEFAULT false,
    navigate_by_level1 boolean DEFAULT false,
    navigate_by_level2 boolean DEFAULT false,
    navigate_by_level3 boolean DEFAULT false,
    map_styles text,
    overview_map_lat double precision,
    overview_map_lon double precision,
    overview_map_zoom integer,
    internal_description text,
    featured boolean DEFAULT false,
    geographic_context_geometry geometry(Geometry,4326)
);


--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE state (
    gid integer NOT NULL,
    region character varying(2),
    division character varying(2),
    statefp character varying(2) NOT NULL,
    statens character varying(8),
    stusps character varying(2) NOT NULL,
    name character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland bigint,
    awater bigint,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: state_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE state_lookup (
    st_code integer NOT NULL,
    name character varying(40),
    abbrev character varying(3),
    statefp character varying(2)
);


--
-- Name: stats; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stats (
    id integer NOT NULL,
    site_id integer,
    visits integer,
    date date
);


--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: street_type_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE street_type_lookup (
    name character varying(50) NOT NULL,
    abbrev character varying(50),
    is_hw boolean DEFAULT false NOT NULL
);


--
-- Name: tabblock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tabblock (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    blockce character varying(4),
    tabblock_id character varying(16) NOT NULL,
    name character varying(20),
    mtfcc character varying(5),
    ur character varying(1),
    uace character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    count integer DEFAULT 0
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE themes (
    id integer NOT NULL,
    name character varying(255),
    css_file character varying(255),
    thumbnail_path character varying(255),
    data text
);


--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE themes_id_seq OWNED BY themes.id;


--
-- Name: tract; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tract (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    tract_id character varying(11) NOT NULL,
    name character varying(7),
    namelsad character varying(20),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(100) DEFAULT ''::character varying,
    email character varying(100),
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(40),
    remember_token_expires_at timestamp without time zone,
    organization_id integer,
    role character varying(255),
    blocked boolean DEFAULT false,
    site_id character varying(255),
    description text,
    password_reset_token character varying(255),
    password_reset_sent_at timestamp without time zone,
    last_login timestamp without time zone,
    six_months_since_last_login_alert_sent boolean DEFAULT false,
    login_fails integer DEFAULT 0
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: zcta5; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zcta5 (
    gid integer NOT NULL,
    statefp character varying(2) NOT NULL,
    zcta5ce character varying(5) NOT NULL,
    classfp character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    partflg character varying(1),
    the_geom geometry(MultiPolygon,4269)
);


--
-- Name: zip_lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zip_lookup (
    zip integer NOT NULL,
    st_code integer,
    state character varying(2),
    co_code integer,
    county character varying(90),
    cs_code integer,
    cousub character varying(90),
    pl_code integer,
    place character varying(90),
    cnt integer
);


--
-- Name: zip_lookup_all; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zip_lookup_all (
    zip integer,
    st_code integer,
    state character varying(2),
    co_code integer,
    county character varying(90),
    cs_code integer,
    cousub character varying(90),
    pl_code integer,
    place character varying(90),
    cnt integer
);


--
-- Name: zip_lookup_base; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zip_lookup_base (
    zip character varying(5) NOT NULL,
    state character varying(40),
    county character varying(90),
    city character varying(90),
    statefp character varying(2)
);


--
-- Name: zip_state; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zip_state (
    zip character varying(5) NOT NULL,
    stusps character varying(2) NOT NULL,
    statefp character varying(2)
);


--
-- Name: zip_state_loc; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zip_state_loc (
    zip character varying(5) NOT NULL,
    stusps character varying(2) NOT NULL,
    statefp character varying(2),
    place character varying(100) NOT NULL
);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addr ALTER COLUMN gid SET DEFAULT nextval('addr_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addrfeat ALTER COLUMN gid SET DEFAULT nextval('addrfeat_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY changes_history_records ALTER COLUMN id SET DEFAULT nextval('changes_history_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY clusters ALTER COLUMN id SET DEFAULT nextval('clusters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY donations ALTER COLUMN id SET DEFAULT nextval('donations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY donors ALTER COLUMN id SET DEFAULT nextval('donors_id_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY edges ALTER COLUMN gid SET DEFAULT nextval('edges_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY faces ALTER COLUMN gid SET DEFAULT nextval('faces_gid_seq'::regclass);


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY featnames ALTER COLUMN gid SET DEFAULT nextval('featnames_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY layer_styles ALTER COLUMN id SET DEFAULT nextval('layer_styles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY layers ALTER COLUMN id SET DEFAULT nextval('layers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY media_resources ALTER COLUMN id SET DEFAULT nextval('media_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY offices ALTER COLUMN id SET DEFAULT nextval('offices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagc_gaz ALTER COLUMN id SET DEFAULT nextval('pagc_gaz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagc_lex ALTER COLUMN id SET DEFAULT nextval('pagc_lex_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pagc_rules ALTER COLUMN id SET DEFAULT nextval('pagc_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY partners ALTER COLUMN id SET DEFAULT nextval('partners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects_synchronizations ALTER COLUMN id SET DEFAULT nextval('projects_synchronizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectors ALTER COLUMN id SET DEFAULT nextval('sectors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: addr_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addr
    ADD CONSTRAINT addr_pkey PRIMARY KEY (gid);


--
-- Name: addrfeat_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addrfeat
    ADD CONSTRAINT addrfeat_pkey PRIMARY KEY (gid);


--
-- Name: changes_history_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY changes_history_records
    ADD CONSTRAINT changes_history_records_pkey PRIMARY KEY (id);


--
-- Name: clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);


--
-- Name: donors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY donors
    ADD CONSTRAINT donors_pkey PRIMARY KEY (id);


--
-- Name: edges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edges
    ADD CONSTRAINT edges_pkey PRIMARY KEY (gid);


--
-- Name: faces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY faces
    ADD CONSTRAINT faces_pkey PRIMARY KEY (gid);


--
-- Name: featnames_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY featnames
    ADD CONSTRAINT featnames_pkey PRIMARY KEY (gid);


--
-- Name: layer_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY layer_styles
    ADD CONSTRAINT layer_styles_pkey PRIMARY KEY (id);


--
-- Name: layers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY layers
    ADD CONSTRAINT layers_pkey PRIMARY KEY (id);


--
-- Name: media_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY media_resources
    ADD CONSTRAINT media_resources_pkey PRIMARY KEY (id);


--
-- Name: offices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: pagc_gaz_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagc_gaz
    ADD CONSTRAINT pagc_gaz_pkey PRIMARY KEY (id);


--
-- Name: pagc_lex_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagc_lex
    ADD CONSTRAINT pagc_lex_pkey PRIMARY KEY (id);


--
-- Name: pagc_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pagc_rules
    ADD CONSTRAINT pagc_rules_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects_synchronizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY projects_synchronizations
    ADD CONSTRAINT projects_synchronizations_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

