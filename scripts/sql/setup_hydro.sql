-- Schema: hydro

-- DROP SCHEMA hydro;

CREATE SCHEMA hydro AUTHORIZATION elf;

COMMENT ON SCHEMA hydro IS 'Schemata für Hydrography';

-- == Tabellen Physical Water =======

-- Crossing 
CREATE TABLE hydro.crossing_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.crossing_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.crossing_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);

CREATE TABLE hydro.crossing_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);

CREATE TABLE hydro.crossing (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    type_href text,
    type_nil boolean,
    type_nilreason text,
    namedplace_fk integer REFERENCES hydro.crossing_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.crossing_hydroid ON DELETE RESTRICT,
    CONSTRAINT crossing_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'crossing','geometry','4258','GEOMETRY', 2);

ALTER TABLE hydro.crossing_geographicalname OWNER TO elf_admin;
ALTER TABLE hydro.crossing_geographicalname_spelling OWNER TO elf_admin;
ALTER TABLE hydro.crossing_hydroid OWNER TO elf_admin;
ALTER TABLE hydro.crossing OWNER TO elf_admin;

CREATE INDEX crossing_id_idx ON hydro.crossing(id);
CREATE INDEX crossing_hydro_id_idx ON hydro.crossing(hydro_id_fk);
CREATE INDEX crossing_namedplace_idx ON hydro.crossing(namedplace_fk);
CREATE INDEX crossing_geometry_idx ON hydro.crossing USING GIST (geometry);
CREATE INDEX crossing_geographicalname_id_idx ON hydro.crossing_geographicalname(id);
CREATE INDEX crossing_geographicalname_spelling_id_idx ON hydro.crossing_geographicalname_spelling(id);
CREATE INDEX crossing_geographicalname_spelling_parentfk_idx ON hydro.crossing_geographicalname_spelling(parentfk);
CREATE INDEX crossing_hydroid_id_idx ON hydro.crossing_hydroid(id);


CREATE TABLE hydro.damorweir_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.damorweir_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.damorweir_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.damorweir_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.damorweir (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hydro.damorweir_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.damorweir_hydroid ON DELETE RESTRICT,
    CONSTRAINT damorweir_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'damorweir','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.damorweir_geographicalname OWNER TO elf;
ALTER TABLE hydro.damorweir_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.damorweir_hydroid OWNER TO elf;
ALTER TABLE hydro.damorweir OWNER TO elf;

CREATE TABLE hydro.drainagebasin_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.drainagebasin_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.drainagebasin_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.drainagebasin_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.drainagebasin (
    id text,
    area numeric,
    area_nilreason text,
    area_uom text,
    area_nil boolean,
    basinorder_nilreason text,
    basinorder_nil boolean,
    basinorder_hydroordercode_order text,
    basinorder_hydroordercode_orderscheme text,
    basinorder_hydroordercode_scope text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    inspireid_localid text,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    namedplace_fk integer REFERENCES hydro.drainagebasin_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.drainagebasin_hydroid ON DELETE RESTRICT,
    CONSTRAINT drainagebasin_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'drainagebasin','geometry','4258','GEOMETRY', 2);
CREATE TABLE hydro.drainagebasin_containsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.drainagebasin ON DELETE CASCADE,
    href text
);
CREATE TABLE hydro.drainagebasin_outlet (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.drainagebasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
ALTER TABLE hydro.drainagebasin_geographicalname OWNER TO elf;
ALTER TABLE hydro.drainagebasin_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.drainagebasin_hydroid OWNER TO elf;
ALTER TABLE hydro.drainagebasin OWNER TO elf;
ALTER TABLE hydro.drainagebasin_containsbasin OWNER TO elf;
ALTER TABLE hydro.drainagebasin_outlet OWNER TO elf;

CREATE TABLE hydro.falls_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.falls_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.falls_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.falls_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.falls (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    height numeric,
    height_uom text,
    height_nil boolean,
    height_nilreason text,
    namedplace_fk integer REFERENCES hydro.falls_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.falls_hydroid ON DELETE RESTRICT,
    CONSTRAINT falls_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'falls','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.falls_geographicalname OWNER TO elf;
ALTER TABLE hydro.falls_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.falls_hydroid OWNER TO elf;
ALTER TABLE hydro.falls OWNER TO elf;

CREATE TABLE hydro.ford_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.ford_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.ford_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.ford_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.ford (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hydro.ford_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.ford_hydroid ON DELETE RESTRICT,
    CONSTRAINT ford_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'ford','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.ford_geographicalname OWNER TO elf;
ALTER TABLE hydro.ford_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.ford_hydroid OWNER TO elf;
ALTER TABLE hydro.ford OWNER TO elf;

CREATE TABLE hydro.lock_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.lock_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.lock_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.lock_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.lock (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hydro.lock_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.lock_hydroid ON DELETE RESTRICT,
    CONSTRAINT lock_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'lock','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.lock_geographicalname OWNER TO elf;
ALTER TABLE hydro.lock_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.lock_hydroid OWNER TO elf;
ALTER TABLE hydro.lock OWNER TO elf;

CREATE TABLE hydro.rapids_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.rapids_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.rapids_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.rapids_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.rapids (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hydro.rapids_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.rapids_hydroid ON DELETE RESTRICT,
    CONSTRAINT rapids_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'rapids','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.rapids_geographicalname OWNER TO elf;
ALTER TABLE hydro.rapids_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.rapids_hydroid OWNER TO elf;
ALTER TABLE hydro.rapids OWNER TO elf;

CREATE TABLE hydro.riverbasin_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.riverbasin_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.riverbasin_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.riverbasin_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.riverbasin (
    id text,
    area numeric,
    area_nilreason text,
    area_uom text,
    area_nil boolean,
    basinorder_nilreason text,
    basinorder_nil boolean,
    basinorder_hydroordercode_order text,
    basinorder_hydroordercode_orderscheme text,
    basinorder_hydroordercode_scope text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    inspireid_localid text,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    namedplace_fk integer REFERENCES hydro.riverbasin_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.riverbasin_hydroid ON DELETE RESTRICT,
    CONSTRAINT riverbasin_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'riverbasin','geometry','4258','GEOMETRY', 2);
CREATE TABLE hydro.riverbasin_containsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.riverbasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hydro.riverbasin_outlet (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.riverbasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
ALTER TABLE hydro.riverbasin_geographicalname OWNER TO elf;
ALTER TABLE hydro.riverbasin_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.riverbasin_hydroid OWNER TO elf;
ALTER TABLE hydro.riverbasin OWNER TO elf;
ALTER TABLE hydro.riverbasin_containsbasin OWNER TO elf;
ALTER TABLE hydro.riverbasin_outlet OWNER TO elf;

CREATE TABLE hydro.shore_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.shore_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.shore_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.shore_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.shore (
    id text,
    inspireid_localid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    composition_owns boolean,
    composition_nilreason text,
    composition_remoteschema text,
    composition_nil boolean,
    delineationknown boolean,
    delineationknown_nilreason text,
    delineationknown_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    namedplace_fk integer REFERENCES hydro.shore_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.shore_hydroid ON DELETE RESTRICT,
    CONSTRAINT shore_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'shore','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.shore_geographicalname OWNER TO elf;
ALTER TABLE hydro.shore_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.shore_hydroid OWNER TO elf;
ALTER TABLE hydro.shore OWNER TO elf;

CREATE TABLE hydro.sluice_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.sluice_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.sluice_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.sluice_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.sluice (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hydro.sluice_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.sluice_hydroid ON DELETE RESTRICT,
    CONSTRAINT sluice_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'sluice','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.sluice_geographicalname OWNER TO elf;
ALTER TABLE hydro.sluice_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.sluice_hydroid OWNER TO elf;
ALTER TABLE hydro.sluice OWNER TO elf;

CREATE TABLE hydro.standingwater_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.standingwater_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.standingwater_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.standingwater_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.standingwater (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    localtype_xlink_href text,
    localtype_xlink_title text,
    localtype_nilreason text,
    localtype_nil boolean,
    localtype_localisedcharacterstring text,
    localtype_localisedcharacterstring_id text,
    localtype_localisedcharacterstring_locale text,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    persistence_href text,
    persistence_nil boolean,
    persistence_nilreason text,
    tidal boolean,
    tidal_nilreason text,
    tidal_nil boolean,
    elevation numeric,
    elevation_uom text,
    elevation_nil boolean,
    elevation_nilreason text,
    meandepth numeric,
    meandepth_uom text,
    meandepth_nil boolean,
    meandepth_nilreason text,
    surfacearea numeric,
    surfacearea_uom text,
    surfacearea_nil boolean,
    surfacearea_nilreason text,
    namedplace_fk integer REFERENCES hydro.standingwater_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.standingwater_hydroid ON DELETE RESTRICT,
    CONSTRAINT standingwater_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'standingwater','geometry','4258','GEOMETRY', 2);
CREATE TABLE hydro.standingwater_bank (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.standingwater ON DELETE CASCADE,
    href text
);
CREATE TABLE hydro.standingwater_drainsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.standingwater ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hydro.standingwater_neighbour (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.standingwater ON DELETE CASCADE,
    href text
);
ALTER TABLE hydro.standingwater_geographicalname OWNER TO elf;
ALTER TABLE hydro.standingwater_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.standingwater_hydroid OWNER TO elf;
ALTER TABLE hydro.standingwater OWNER TO elf;
ALTER TABLE hydro.standingwater_bank OWNER TO elf;
ALTER TABLE hydro.standingwater_drainsbasin OWNER TO elf;
ALTER TABLE hydro.standingwater_neighbour OWNER TO elf;

CREATE TABLE hydro.watercourse_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.watercourse_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.watercourse_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.watercourse_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.watercourse (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    localtype_xlink_href text,
    localtype_xlink_title text,
    localtype_nilreason text,
    localtype_nil boolean,
    localtype_localisedcharacterstring text,
    localtype_localisedcharacterstring_id text,
    localtype_localisedcharacterstring_locale text,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    persistence_href text,
    persistence_nil boolean,
    persistence_nilreason text,
    tidal boolean,
    tidal_nilreason text,
    tidal_nil boolean,
    condition_href text,
    delineationknown boolean,
    delineationknown_nilreason text,
    delineationknown_nil boolean,
    length numeric,
    length_nilreason text,
    length_uom text,
    length_nil boolean,
    level text,
    level_nilreason text,
    level_nil boolean,
    streamorder_nilreason text,
    streamorder_nil boolean,
    streamorder_hydroordercode_order text,
    streamorder_hydroordercode_orderscheme text,
    streamorder_hydroordercode_scope text,
    width_nilreason text,
    width_nil boolean,
    width_widthrange_lower numeric,
    width_widthrange_lower_uom text,
    width_widthrange_upper numeric,
    width_widthrange_upper_uom text,
    namedplace_fk integer REFERENCES hydro.watercourse_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.watercourse_hydroid ON DELETE RESTRICT,
    CONSTRAINT watercourse_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'watercourse','geometry','4258','GEOMETRY', 2);
CREATE TABLE hydro.watercourse_bank (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.watercourse ON DELETE CASCADE,
    href text
);
CREATE TABLE hydro.watercourse_drainsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.watercourse ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hydro.watercourse_neighbour (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.watercourse ON DELETE CASCADE,
    href text
);
ALTER TABLE hydro.watercourse_geographicalname OWNER TO elf;
ALTER TABLE hydro.watercourse_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.watercourse_hydroid OWNER TO elf;
ALTER TABLE hydro.watercourse OWNER TO elf;
ALTER TABLE hydro.watercourse_bank OWNER TO elf;
ALTER TABLE hydro.watercourse_drainsbasin OWNER TO elf;
ALTER TABLE hydro.watercourse_neighbour OWNER TO elf;

CREATE TABLE hydro.wetland_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.wetland_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.wetland_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.wetland_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.wetland (
    id text,
    inspireid_localid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localtype_xlink_href text,
    localtype_xlink_title text,
    localtype_nilreason text,
    localtype_nil boolean,
    localtype_localisedcharacterstring text,
    localtype_localisedcharacterstring_id text,
    localtype_localisedcharacterstring_locale text,
    tidal boolean,
    tidal_nilreason text,
    tidal_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    namedplace_fk integer REFERENCES hydro.wetland_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.wetland_hydroid ON DELETE RESTRICT,
    CONSTRAINT wetland_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'wetland','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.wetland_geographicalname OWNER TO elf;
ALTER TABLE hydro.wetland_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.wetland_hydroid OWNER TO elf;
ALTER TABLE hydro.wetland OWNER TO elf;

CREATE TABLE hydro.embankment_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.embankment_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.embankment_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.embankment_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.embankment (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    embankmenttype_href text,
    embankmenttype_nilreason text,
    predominantfeatureheight numeric,
    predominantfeatureheight_uom text,
    waterleveleffect_href text,
    waterleveleffect_nilreason text,
    namedplace_fk integer REFERENCES hydro.embankment_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.embankment_hydroid ON DELETE RESTRICT,
    CONSTRAINT embankment_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'embankment','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.embankment_geographicalname OWNER TO elf;
ALTER TABLE hydro.embankment_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.embankment_hydroid OWNER TO elf;
ALTER TABLE hydro.embankment OWNER TO elf;

CREATE TABLE hydro.island_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.island_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.island_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.island_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.island (
    id text,
    inspireid_localid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    namedplace_fk integer REFERENCES hydro.island_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.island_hydroid ON DELETE RESTRICT,
    CONSTRAINT island_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'island','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.island_geographicalname OWNER TO elf;
ALTER TABLE hydro.island_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.island_hydroid OWNER TO elf;
ALTER TABLE hydro.island OWNER TO elf;

CREATE TABLE hydro.landwaterboundary (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    inspireid_localid text,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    waterlevelcategory_href text,
    waterlevelcategory_nil boolean,
    waterlevelcategory_nilreason text,
    CONSTRAINT landwaterboundary_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'landwaterboundary','geometry','4258','GEOMETRY', 2);
CREATE TABLE hydro.landwaterboundary_delimit (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hydro.landwaterboundary ON DELETE CASCADE,
    waterleveleffect_href text
);
ALTER TABLE hydro.landwaterboundary OWNER TO elf;
ALTER TABLE hydro.landwaterboundary_delimit OWNER TO elf;

CREATE TABLE hydro.shorelineconstruction_geographicalname (
    id serial PRIMARY KEY,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_href text,
    nativeness_nilreason text,
    namestatus_href text,
    namestatus_nilreason text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_nil boolean,
    pronunciation_nilreason text,
    pronunciation_nil boolean,
    pronunciation_pronunciationsoundlink text,
    pronunciation_pronunciationsoundlink_nilreason text,
    pronunciation_pronunciationsoundlink_nil boolean,
    pronunciation_pronunciationipa text,
    pronunciation_pronunciationipa_nilreason text,
    pronunciation_pronunciationipa_nil boolean
);
CREATE TABLE hydro.shorelineconstruction_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hydro.shorelineconstruction_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hydro.shorelineconstruction_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hydro.shorelineconstruction (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    condition_href text,
    condition_nil boolean,
    condition_nilreason text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    inspireid_localid text,
    lod_denominator_nilreason text,
    lod_denominator integer,
    shorelineconstructiontype_href text,
    shorelineconstructiontype_nilreason text,
    namedplace_fk integer REFERENCES hydro.shorelineconstruction_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hydro.shorelineconstruction_hydroid ON DELETE RESTRICT,
    CONSTRAINT shorelineconstruction_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('hydro', 'shorelineconstruction','geometry','4258','GEOMETRY', 2);
ALTER TABLE hydro.shorelineconstruction_geographicalname OWNER TO elf;
ALTER TABLE hydro.shorelineconstruction_geographicalname_spelling OWNER TO elf;
ALTER TABLE hydro.shorelineconstruction_hydroid OWNER TO elf;
ALTER TABLE hydro.shorelineconstruction OWNER TO elf;
