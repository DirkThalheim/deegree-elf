-- Schema: au

-- DROP SCHEMA au CASCADE;

CREATE SCHEMA au
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA au
  IS 'Schemata für Administrative Units';
  
-- == Tabellen =====

-- == AdminBoundary ================================  
CREATE TABLE au.adminboundary (
    localid text,
    geometry_nilreason text,
    country_nilreason text,
    country text,
    country_codelistvalue text,
    legalstatus text,
    legalstatus_nilreason text,
    legalstatus_nil boolean,
    technicalstatus text,
    technicalstatus_nilreason text,
    technicalstatus_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    CONSTRAINT adminboundary_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminboundary','geometry','4258','GEOMETRY', 2);
CREATE INDEX adminboundary_geometry_idx ON au.adminboundary USING GIST (geometry);
ALTER TABLE au.adminboundary OWNER TO elf_admin;

CREATE TABLE au.adminboundary_nationallevel (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminboundary ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminboundary_nationallevel OWNER TO elf_admin;

CREATE TABLE au.adminboundary_adminunit (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminboundary ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminboundary_adminunit OWNER TO elf_admin;


-- == Condominium ================================  

CREATE TABLE au.condominium (
    localid text,
    geometry_nilreason text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    CONSTRAINT condominium_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('au', 'condominium','geometry','4258','GEOMETRY', 2);
CREATE INDEX condominium_geometry_idx ON au.condominium USING GIST (geometry);
ALTER TABLE au.condominium OWNER TO elf_admin;

CREATE TABLE au.condominium_adminunit (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.condominium ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.condominium_adminunit OWNER TO elf_admin;

CREATE TABLE au.condominium_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.condominium ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_nilreason text,
    nativeness_href text,
    namestatus_nilreason text,
    namestatus_href text,
    sourceofname_nil boolean,
    sourceofname text,
    sourceofname_nilreason text
);
ALTER TABLE au.condominium_name OWNER TO elf_admin;

CREATE TABLE au.condominium_name_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES au.condominium_name ON DELETE CASCADE,
    text text,
    script_nil boolean,
    script_nilreason text,
    script text,
    transliterationscheme_nil boolean,
    transliterationscheme_nilreason text,
    transliterationscheme text
);
ALTER TABLE au.condominium_name_spelling OWNER TO elf_admin;


-- == AdminUnit ================================  

CREATE TABLE au.adminunit (
    localid text,
    geometry_nilreason text,
    nationalcode text,
    inspireid_localid text,
    nationallevel_nilreason text,
    nationallevel_href text,
    country_nilreason text,
    country text,
    country_codelistvalue text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    upperlevelunit_owns boolean,
    upperlevelunit_nilreason text,
    upperlevelunit_href text,
    shncode_identifier text,
    shncode_scheme text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    CONSTRAINT adminunit_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminunit','geometry','4258','GEOMETRY', 2);
CREATE INDEX adminunit_geometry_idx ON au.adminunit USING GIST (geometry);
ALTER TABLE au.adminunit OWNER TO elf_admin;

CREATE TABLE au.adminunit_nationallevelname (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    localisedcharacterstring text,
    localisedcharacterstring_id text,
    localisedcharacterstring_locale text
);
ALTER TABLE au.adminunit_nationallevelname OWNER TO elf_admin;

CREATE TABLE au.adminunit_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_nilreason text,
    nativeness_href text,
    namestatus_nilreason text,
    namestatus_href text,
    sourceofname_nil boolean,
    sourceofname text,
    sourceofname_nilreason text
);
ALTER TABLE au.adminunit_name OWNER TO elf_admin;

CREATE TABLE au.adminunit_name_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES au.adminunit_name ON DELETE CASCADE,
    text text,
    script_nil boolean,
    script_nilreason text,
    script text,
    transliterationscheme_nil boolean,
    transliterationscheme_nilreason text,
    transliterationscheme text
);
ALTER TABLE au.adminunit_name_spelling OWNER TO elf_admin;

CREATE TABLE au.adminunit_residence (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nil boolean,
    nilreason text,
    geometry_nilreason text
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminunit_residence','geometry','4258','GEOMETRY', 2);
CREATE INDEX adminunit_residence_geometry_idx ON au.adminunit_residence USING GIST (geometry);
ALTER TABLE au.adminunit_residence OWNER TO elf_admin;

CREATE TABLE au.adminunit_residence_name (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES au.adminunit_residence ON DELETE CASCADE,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_nilreason text,
    nativeness_href text,
    namestatus_nilreason text,
    namestatus_href text,
    sourceofname_nil boolean,
    sourceofname text,
    sourceofname_nilreason text
);
ALTER TABLE au.adminunit_residence_name OWNER TO elf_admin;

CREATE TABLE au.adminunit_residence_name_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES au.adminunit_residence_name ON DELETE CASCADE,
    text text,
    script_nil boolean,
    script_nilreason text,
    script text,
    transliterationscheme_nil boolean,
    transliterationscheme_nilreason text,
    transliterationscheme text
);
ALTER TABLE au.adminunit_residence_name_spelling OWNER TO elf_admin;

CREATE TABLE au.adminunit_condominium (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_condominium OWNER TO elf_admin;

CREATE TABLE au.adminunit_lowerlevelunit (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_lowerlevelunit OWNER TO elf_admin;

CREATE TABLE au.adminunit_administeredby (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_administeredby OWNER TO elf_admin;

CREATE TABLE au.adminunit_coadminister (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_coadminister OWNER TO elf_admin;

CREATE TABLE au.adminunit_boundary (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_boundary OWNER TO elf_admin;

-- == AdminUnitArea ================================  

CREATE TABLE au.adminunitarea (
    localid text,
    geometry_nilreason text,
    inspireid_localid text,
    landcovertype_nilreason text,
    landcovertype_href text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    CONSTRAINT adminunitarea_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminunitarea','geometry','4258','GEOMETRY', 2);
CREATE INDEX adminunitarea_geometry_idx ON au.adminunitarea USING GIST (geometry);
ALTER TABLE au.adminunitarea OWNER TO elf_admin;

-- == n:m AdminUnit AdminUnitArea ==================

CREATE TABLE au.adminunit_adminunitarea (
    id serial PRIMARY KEY,
    fk_adminunit text, -- NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    href_adminunit text, -- without NOT NULL constraint to enable GML import without references
    fk_adminunitarea text, -- NOT NULL REFERENCES au.adminunitarea ON DELETE CASCADE,
    href_adminunitarea text, -- without NOT NULL constraint to enable GML import without references
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_adminunitarea OWNER TO elf_admin;
