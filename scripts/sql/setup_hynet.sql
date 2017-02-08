-- Schema: hynet

-- DROP SCHEMA hynet;

CREATE SCHEMA hynet AUTHORIZATION elf_admin;

COMMENT ON SCHEMA hynet IS 'Schemata für Hydrography Network';

-- == Tabellen Hydrography Network =======

-- HydroNode
CREATE TABLE hynet.hydronode (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    hydronodecategory_owns boolean,
    hydronodecategory_nilreason text,
    hydronodecategory_remoteschema text,
    hydronodecategory_nil boolean,
    hydronodecategory_fk text,
    hydronodecategory_href text,
    spring_nilreason text,
    spring_remoteschema text,
    spring_owns boolean,
    spring_fk text,
    spring_href text,
    damorweir_nilreason text,
    damorweir_remoteschema text,
    damorweir_owns boolean,
    damorweir_fk text,
    damorweir_href text,
    lock_nilreason text,
    lock_remoteschema text,
    lock_owns boolean,
    lock_fk text,
    lock_href text,
    CONSTRAINT hydronode_pkey PRIMARY KEY (localid)
);
ALTER TABLE hynet.hydronode OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.hydronode_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('hynet', 'hydronode','geometry','4326','GEOMETRY', 2);
CREATE INDEX hydronode_geometry_idx ON hynet.hydronode USING GIST (geometry);

CREATE TABLE hynet.hydronode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.hydronode_spokeend OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.hydronode_spokestart OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_geographicalname (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationofname_pronunciationsoundlink text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationofname_pronunciationipa text,
    pronunciation_pronunciationofname_pronunciationipa_nilreason text,
    pronunciation_pronunciationofname_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE hynet.hydronode_geographicalname OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hynet.hydronode_geographicalname ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE hynet.hydronode_geographicalname_spelling OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_hydroid (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
ALTER TABLE hynet.hydronode_hydroid OWNER TO elf_admin;

CREATE TABLE hynet.hydronode_relatedhydroobject (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.hydronode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE hynet.hydronode_relatedhydroobject OWNER TO elf_admin;

-- Watercourse

CREATE TABLE hynet.watercourselink (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
    centrelinegeometry_owns boolean,
    fictitious boolean,
    endnode_owns boolean,
    endnode_nilreason text,
    endnode_remoteschema text,
    endnode_fk text,
    endnode_href text,
    startnode_owns boolean,
    startnode_nilreason text,
    startnode_remoteschema text,
    startnode_fk text,
    startnode_href text,
    flowdirection_owns boolean,
    flowdirection_nilreason text,
    flowdirection_remoteschema text,
    flowdirection_nil boolean,
    flowdirection_fk text,
    flowdirection_href text,
    length numeric,
    length_nilreason text,
    length_uom text,
    length_nil boolean,
    CONSTRAINT watercourselink_pkey PRIMARY KEY (localid)
);
ALTER TABLE hynet.watercourselink OWNER TO elf_admin;

CREATE TABLE hynet.watercourselink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselink ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.watercourselink_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('hynet', 'watercourselink','centrelinegeometry','4326','GEOMETRY', 2);
CREATE INDEX watercourselink_geometry_idx ON hynet.watercourselink USING GIST (centrelinegeometry);

CREATE TABLE hynet.watercourselink_geographicalname (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselink ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationofname_pronunciationsoundlink text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationofname_pronunciationipa text,
    pronunciation_pronunciationofname_pronunciationipa_nilreason text,
    pronunciation_pronunciationofname_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE hynet.watercourselink_geographicalname OWNER TO elf_admin;

CREATE TABLE hynet.watercourselink_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hynet.watercourselink_geographicalname ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE hynet.watercourselink_geographicalname_spelling OWNER TO elf_admin;

CREATE TABLE hynet.watercourselink_hydroid (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselink ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
ALTER TABLE hynet.watercourselink_hydroid OWNER TO elf_admin;

CREATE TABLE hynet.watercourselink_relatedhydroobject (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselink ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE hynet.watercourselink_relatedhydroobject OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    CONSTRAINT watercourselinksequence_pkey PRIMARY KEY (localid)
);
ALTER TABLE hynet.watercourselinksequence OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselinksequence ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.watercourselinksequence_innetwork OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselinksequence ON DELETE CASCADE,
    num integer not null,
    directedlink_direction text,
    directedlink_link_owns boolean,
    directedlink_link_nilreason text,
    directedlink_link_remoteschema text,
    directedlink_link_fk text,
    directedlink_link_href text
);
ALTER TABLE hynet.watercourselinksequence_link OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_geographicalname (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselinksequence ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationofname_pronunciationsoundlink text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationofname_pronunciationipa text,
    pronunciation_pronunciationofname_pronunciationipa_nilreason text,
    pronunciation_pronunciationofname_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE hynet.watercourselinksequence_geographicalname OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hynet.watercourselinksequence_geographicalname ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE hynet.watercourselinksequence_geographicalname_spelling OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_hydroid (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselinksequence ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
ALTER TABLE hynet.watercourselinksequence_hydroid OWNER TO elf_admin;

CREATE TABLE hynet.watercourselinksequence_relatedhydroobject (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourselinksequence ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE hynet.watercourselinksequence_relatedhydroobject OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    CONSTRAINT watercourseseparatedcrossing_pkey PRIMARY KEY (localid)
);
ALTER TABLE hynet.watercourseseparatedcrossing OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourseseparatedcrossing ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE hynet.watercourseseparatedcrossing_innetwork OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_element (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourseseparatedcrossing ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE hynet.watercourseseparatedcrossing_element OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_geographicalname (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourseseparatedcrossing ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationofname_pronunciationsoundlink text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationofname_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationofname_pronunciationipa text,
    pronunciation_pronunciationofname_pronunciationipa_nilreason text,
    pronunciation_pronunciationofname_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE hynet.watercourseseparatedcrossing_geographicalname OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hynet.watercourseseparatedcrossing_geographicalname ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE hynet.watercourseseparatedcrossing_geographicalname_spelling OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_hydroid (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourseseparatedcrossing ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
ALTER TABLE hynet.watercourseseparatedcrossing_hydroid OWNER TO elf_admin;

CREATE TABLE hynet.watercourseseparatedcrossing_relatedhydroobject (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hynet.watercourseseparatedcrossing ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE hynet.watercourseseparatedcrossing_relatedhydroobject OWNER TO elf_admin;



