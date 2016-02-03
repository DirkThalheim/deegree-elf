-- Schema: au

-- DROP SCHEMA au;

CREATE SCHEMA au
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA au
  IS 'Schemata für Administrative Units';
  
-- == Tabellen =====

-- == AdminBoundary ================================  
CREATE TABLE au.adminboundary (
    id text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    inspireid_localid text,
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
    CONSTRAINT adminboundary_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminboundary','geometry','4258','GEOMETRY', 2);
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

CREATE INDEX adminboundary_id_idx ON au.adminboundary(id);
CREATE INDEX adminboundary_geometry_idx ON au.adminboundary USING GIST (geometry);
CREATE INDEX adminboundary_nationallevel_id_idx ON au.adminboundary_nationallevel(id);
CREATE INDEX adminboundary_nationallevel_parentfk_idx ON au.adminboundary_nationallevel (parentfk);
CREATE INDEX adminboundary_adminunit_id_idx ON au.adminboundary_adminunit(id);
CREATE INDEX adminboundary_adminunit_parentfk_idx ON au.adminboundary_adminunit (parentfk);

-- == Condominium ================================  

CREATE TABLE au.condominium (
    id text,
    inspireid_localid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    CONSTRAINT condominium_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('au', 'condominium','geometry','4258','GEOMETRY', 2);
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

CREATE INDEX condominium_id_idx ON au.condominium(id);
CREATE INDEX condominium_geometry_idx ON au.condominium USING GIST (geometry);
CREATE INDEX condominium_adminunit_id_idx ON au.condominium_adminunit(id);
CREATE INDEX condominium_adminunit_parentfk_idx ON au.condominium_adminunit (parentfk);
CREATE INDEX condominium_name_id_idx ON au.condominium_name(id);
CREATE INDEX condominium_name_parentfk_idx ON au.condominium_name (parentfk);
CREATE INDEX condominium_name_spelling_id_idx ON au.condominium_name_spelling(id);
CREATE INDEX condominium_name_spelling_parentfk_idx ON au.condominium_name_spelling (parentfk);

-- == AdminUnit ================================  

CREATE TABLE au.adminunit (
    id text,
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
    CONSTRAINT adminunit_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminunit','geometry','4258','GEOMETRY', 2);
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

CREATE INDEX adminunit_id_idx ON au.adminunit(id);
CREATE INDEX adminunit_geometry_idx ON au.adminunit USING GIST (geometry);
CREATE INDEX adminunit_nationallevelname_id_idx ON au.adminunit_nationallevelname(id);
CREATE INDEX adminunit_nationallevelname_parentfk_idx ON au.adminunit_nationallevelname (parentfk);
CREATE INDEX adminunit_name_id_idx ON au.adminunit_name(id);
CREATE INDEX adminunit_name_parentfk_idx ON au.adminunit_name (parentfk);
CREATE INDEX adminunit_name_spelling_id_idx ON au.adminunit_name_spelling(id);
CREATE INDEX adminunit_name_spelling_parentfk_idx ON au.adminunit_name_spelling (parentfk);
CREATE INDEX adminunit_residence_id_idx ON au.adminunit_residence(id);
CREATE INDEX adminunit_residence_parentfk_idx ON au.adminunit_residence (parentfk);
CREATE INDEX adminunit_residence_geometry_idx ON au.adminunit_residence USING GIST (geometry);
CREATE INDEX adminunit_residence_name_id_idx ON au.adminunit_residence_name(id);
CREATE INDEX adminunit_residence_name_parentfk_idx ON au.adminunit_residence_name (parentfk);
CREATE INDEX adminunit_residence_name_spelling_id_idx ON au.adminunit_residence_name_spelling(id);
CREATE INDEX adminunit_residence_name_spelling_parentfk_idx ON au.adminunit_residence_name_spelling (parentfk);
CREATE INDEX adminunit_condominium_id_idx ON au.adminunit_condominium(id);
CREATE INDEX adminunit_condominium_parentfk_idx ON au.adminunit_condominium (parentfk);
CREATE INDEX adminunit_lowerlevelunit_id_idx ON au.adminunit_lowerlevelunit(id);
CREATE INDEX adminunit_lowerlevelunit_parentfk_idx ON au.adminunit_lowerlevelunit (parentfk);
CREATE INDEX adminunit_administeredby_id_idx ON au.adminunit_administeredby(id);
CREATE INDEX adminunit_administeredby_parentfk_idx ON au.adminunit_administeredby (parentfk);
CREATE INDEX adminunit_coadminister_id_idx ON au.adminunit_coadminister(id);
CREATE INDEX adminunit_coadminister_parentfk_idx ON au.adminunit_coadminister (parentfk);
CREATE INDEX adminunit_boundary_id_idx ON au.adminunit_boundary(id);
CREATE INDEX adminunit_boundary_parentfk_idx ON au.adminunit_boundary (parentfk);

-- == AdminUnitArea ================================  

CREATE TABLE au.adminunitarea (
    id text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    inspireid_localid text,
    landcovertype_nilreason text,
    landcovertype_href text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    CONSTRAINT adminunitarea_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('au', 'adminunitarea','geometry','4258','GEOMETRY', 2);
ALTER TABLE au.adminunitarea OWNER TO elf_admin;

CREATE INDEX adminunitarea_id_idx ON au.adminunitarea(id);
CREATE INDEX adminunitarea_geometry_idx ON au.adminunitarea USING GIST (geometry);

-- == n:m AdminUnit AdminUnitArea ==================

CREATE TABLE au.adminunit_adminunitarea (
    id serial PRIMARY KEY,
    fk_adminunit text NOT NULL REFERENCES au.adminunit ON DELETE CASCADE,
    href_adminunit text NOT NULL,
    fk_adminunitarea text NOT NULL REFERENCES au.adminunitarea ON DELETE CASCADE,
    href_adminunitarea text NOT NULL,
    nilreason text,
    href text
);
ALTER TABLE au.adminunit_adminunitarea OWNER TO elf_admin;

CREATE INDEX auaua_id_idx ON au.adminunit_adminunitarea(id);
CREATE INDEX auaua_fkadminunit_idx ON au.adminunit_adminunitarea (fk_adminunit);
CREATE INDEX auaua_hrefadminunit_idx ON au.adminunit_adminunitarea (href_adminunit);
CREATE INDEX auaua_fkadminunitarea_idx ON au.adminunit_adminunitarea (fk_adminunitarea);
CREATE INDEX auaua_hrefadminunitarea_idx ON au.adminunit_adminunitarea (href_adminunitarea);
