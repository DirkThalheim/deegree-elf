-- Schema: ps

-- DROP SCHEMA ps;

CREATE SCHEMA ps AUTHORIZATION elf_admin;


COMMENT ON SCHEMA ps IS 'Schemata für ProtectedSites';

-- == ProtectedSite ================================  
CREATE TABLE ps.protectedsite (
    id text,
    geometry_nilreason text,
    geometry_remoteschema text,
    inspireid text,
    legalfoundationdate timestamp,
    legalfoundationdate_nilreason text,
    legalfoundationdate_nil boolean,
    CONSTRAINT protectedsite_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('ps', 'protectedsite', 'geometry', '4258', 'GEOMETRY', 2);
ALTER TABLE ps.protectedsite OWNER TO elf_admin;

CREATE TABLE ps.protectedsite_sitedesignation (
    id serial PRIMARY KEY,
    ps_fk text NOT NULL REFERENCES ps.protectedsite ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    designationschema_nilreason text,
    designationschema_href text,
    designation_nilreason text,
    designation_href text,
    percentageunderdesignation numeric
);
ALTER TABLE ps.protectedsite_sitedesignation OWNER TO elf_admin;

CREATE TABLE ps.sitename (
    id serial PRIMARY KEY,
    ps_fk text NOT NULL REFERENCES ps.protectedsite ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_nilreason text,
    nativeness_href text,
    namestatus_nilreason text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean
);
ALTER TABLE ps.sitename OWNER TO elf_admin;

CREATE TABLE ps.sitename_spelling (
    id serial PRIMARY KEY,
    sitename_fk integer NOT NULL REFERENCES ps.sitename ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE ps.sitename_spelling OWNER TO elf_admin;

CREATE TABLE ps.siteprotectionclassification (
    id serial PRIMARY KEY,
    ps_fk text NOT NULL REFERENCES ps.protectedsite ON DELETE CASCADE,
    classification text,
    nilreason text,
    nil boolean
);
ALTER TABLE ps.siteprotectionclassification OWNER TO elf_admin;

CREATE INDEX protectedsite_id_idx ON ps.protectedsite(id);
CREATE INDEX protectedsite_geometry_idx ON ps.protectedsite USING GIST (geometry);
CREATE INDEX protectedsite_sitedesignation_id_idx ON ps.protectedsite_sitedesignation(id);
CREATE INDEX protectedsite_sitedesignation_parentfk_idx ON ps.protectedsite_sitedesignation (ps_fk);
CREATE INDEX sitename_id_idx ON ps.sitename(id);
CREATE INDEX sitename_parentfk_idx ON ps.sitename (ps_fk);
CREATE INDEX sitename_spelling_id_idx ON ps.sitename_spelling(id);
CREATE INDEX sitename_spelling_parentfk_idx ON ps.sitename_spelling (sitename_fk);
CREATE INDEX siteprotectionclassification_id_idx ON ps.siteprotectionclassification(id);
CREATE INDEX siteprotectionclassification_parentfk_idx ON ps.siteprotectionclassification (ps_fk);
