-- Schema: hypw

-- DROP SCHEMA hypw;

CREATE SCHEMA hypw AUTHORIZATION elf_admin;

COMMENT ON SCHEMA hypw IS 'Schemata für Hydrography';

-- == Tabellen Physical Water =======

-- Crossing 
CREATE TABLE hypw.crossing_geographicalname (
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
CREATE TABLE hypw.crossing_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.crossing_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);

CREATE TABLE hypw.crossing_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);

CREATE TABLE hypw.crossing (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    type_href text,
    type_nil boolean,
    type_nilreason text,
    namedplace_fk integer REFERENCES hypw.crossing_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.crossing_hydroid ON DELETE RESTRICT,
    CONSTRAINT crossing_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'crossing','geometry','4258','GEOMETRY', 2);
CREATE INDEX crossing_geometry_idx ON hypw.crossing USING GIST (geometry);

ALTER TABLE hypw.crossing_geographicalname OWNER TO elf_admin;
ALTER TABLE hypw.crossing_geographicalname_spelling OWNER TO elf_admin;
ALTER TABLE hypw.crossing_hydroid OWNER TO elf_admin;
ALTER TABLE hypw.crossing OWNER TO elf_admin;


-- DamOrWeir
CREATE TABLE hypw.damorweir_geographicalname (
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
CREATE TABLE hypw.damorweir_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.damorweir_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.damorweir_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.damorweir (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hypw.damorweir_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.damorweir_hydroid ON DELETE RESTRICT,
    CONSTRAINT damorweir_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'damorweir','geometry','4258','GEOMETRY', 2);
CREATE INDEX damorweir_geometry_idx ON hypw.damorweir USING GIST (geometry);

ALTER TABLE hypw.damorweir_geographicalname OWNER TO elf;
ALTER TABLE hypw.damorweir_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.damorweir_hydroid OWNER TO elf;
ALTER TABLE hypw.damorweir OWNER TO elf;

-- DrainageBasin
CREATE TABLE hypw.drainagebasin_geographicalname (
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
CREATE TABLE hypw.drainagebasin_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.drainagebasin_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.drainagebasin_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.drainagebasin (
    localid text,
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
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    namedplace_fk integer REFERENCES hypw.drainagebasin_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.drainagebasin_hydroid ON DELETE RESTRICT,
    CONSTRAINT drainagebasin_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'drainagebasin','geometry','4258','GEOMETRY', 2);
CREATE INDEX drainagebasin_geometry_idx ON hypw.drainagebasin USING GIST (geometry);

CREATE TABLE hypw.drainagebasin_containsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.drainagebasin ON DELETE CASCADE,
    href text
);
CREATE TABLE hypw.drainagebasin_outlet (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.drainagebasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
ALTER TABLE hypw.drainagebasin_geographicalname OWNER TO elf;
ALTER TABLE hypw.drainagebasin_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.drainagebasin_hydroid OWNER TO elf;
ALTER TABLE hypw.drainagebasin OWNER TO elf;
ALTER TABLE hypw.drainagebasin_containsbasin OWNER TO elf;
ALTER TABLE hypw.drainagebasin_outlet OWNER TO elf;

-- Falls
CREATE TABLE hypw.falls_geographicalname (
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
CREATE TABLE hypw.falls_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.falls_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.falls_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.falls (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    lod_denominator_nilreason text,
    lod_denominator integer,
    height numeric,
    height_uom text,
    height_nil boolean,
    height_nilreason text,
    namedplace_fk integer REFERENCES hypw.falls_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.falls_hydroid ON DELETE RESTRICT,
    CONSTRAINT falls_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'falls','geometry','4258','GEOMETRY', 2);
CREATE INDEX falls_geometry_idx ON hypw.falls USING GIST (geometry);

ALTER TABLE hypw.falls_geographicalname OWNER TO elf;
ALTER TABLE hypw.falls_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.falls_hydroid OWNER TO elf;
ALTER TABLE hypw.falls OWNER TO elf;

-- Ford
CREATE TABLE hypw.ford_geographicalname (
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
CREATE TABLE hypw.ford_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.ford_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.ford_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.ford (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hypw.ford_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.ford_hydroid ON DELETE RESTRICT,
    CONSTRAINT ford_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'ford','geometry','4258','GEOMETRY', 2);
CREATE INDEX ford_geometry_idx ON hypw.ford USING GIST (geometry);

ALTER TABLE hypw.ford_geographicalname OWNER TO elf;
ALTER TABLE hypw.ford_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.ford_hydroid OWNER TO elf;
ALTER TABLE hypw.ford OWNER TO elf;

-- Lock
CREATE TABLE hypw.lock_geographicalname (
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
CREATE TABLE hypw.lock_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.lock_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.lock_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.lock (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hypw.lock_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.lock_hydroid ON DELETE RESTRICT,
    CONSTRAINT lock_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'lock','geometry','4258','GEOMETRY', 2);
CREATE INDEX lock_geometry_idx ON hypw.lock USING GIST (geometry);

ALTER TABLE hypw.lock_geographicalname OWNER TO elf;
ALTER TABLE hypw.lock_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.lock_hydroid OWNER TO elf;
ALTER TABLE hypw.lock OWNER TO elf;

-- Rapids
CREATE TABLE hypw.rapids_geographicalname (
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
CREATE TABLE hypw.rapids_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.rapids_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.rapids_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.rapids (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_nil boolean,
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hypw.rapids_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.rapids_hydroid ON DELETE RESTRICT,
    CONSTRAINT rapids_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'rapids','geometry','4258','GEOMETRY', 2);
CREATE INDEX rapids_geometry_idx ON hypw.rapids USING GIST (geometry);

ALTER TABLE hypw.rapids_geographicalname OWNER TO elf;
ALTER TABLE hypw.rapids_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.rapids_hydroid OWNER TO elf;
ALTER TABLE hypw.rapids OWNER TO elf;

-- RiverBasin
CREATE TABLE hypw.riverbasin_geographicalname (
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
CREATE TABLE hypw.riverbasin_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.riverbasin_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.riverbasin_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.riverbasin (
    localid text,
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
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    namedplace_fk integer REFERENCES hypw.riverbasin_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.riverbasin_hydroid ON DELETE RESTRICT,
    CONSTRAINT riverbasin_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'riverbasin','geometry','4258','GEOMETRY', 2);
CREATE INDEX riverbasin_geometry_idx ON hypw.riverbasin USING GIST (geometry);

CREATE TABLE hypw.riverbasin_containsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.riverbasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hypw.riverbasin_outlet (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.riverbasin ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
ALTER TABLE hypw.riverbasin_geographicalname OWNER TO elf;
ALTER TABLE hypw.riverbasin_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.riverbasin_hydroid OWNER TO elf;
ALTER TABLE hypw.riverbasin OWNER TO elf;
ALTER TABLE hypw.riverbasin_containsbasin OWNER TO elf;
ALTER TABLE hypw.riverbasin_outlet OWNER TO elf;

-- Shore
CREATE TABLE hypw.shore_geographicalname (
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
CREATE TABLE hypw.shore_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.shore_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.shore_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.shore (
    localid text,
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
    namedplace_fk integer REFERENCES hypw.shore_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.shore_hydroid ON DELETE RESTRICT,
    CONSTRAINT shore_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'shore','geometry','4258','GEOMETRY', 2);
CREATE INDEX shore_geometry_idx ON hypw.shore USING GIST (geometry);

ALTER TABLE hypw.shore_geographicalname OWNER TO elf;
ALTER TABLE hypw.shore_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.shore_hydroid OWNER TO elf;
ALTER TABLE hypw.shore OWNER TO elf;

-- Sluice
CREATE TABLE hypw.sluice_geographicalname (
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
CREATE TABLE hypw.sluice_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.sluice_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.sluice_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.sluice (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    namedplace_fk integer REFERENCES hypw.sluice_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.sluice_hydroid ON DELETE RESTRICT,
    CONSTRAINT sluice_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'sluice','geometry','4258','GEOMETRY', 2);
CREATE INDEX sluice_geometry_idx ON hypw.sluice USING GIST (geometry);

ALTER TABLE hypw.sluice_geographicalname OWNER TO elf;
ALTER TABLE hypw.sluice_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.sluice_hydroid OWNER TO elf;
ALTER TABLE hypw.sluice OWNER TO elf;

-- StandingWater
CREATE TABLE hypw.standingwater_geographicalname (
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
CREATE TABLE hypw.standingwater_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.standingwater_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.standingwater_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.standingwater (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
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
    namedplace_fk integer REFERENCES hypw.standingwater_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.standingwater_hydroid ON DELETE RESTRICT,
    CONSTRAINT standingwater_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'standingwater','geometry','4258','GEOMETRY', 2);
CREATE INDEX standingwater_geometry_idx ON hypw.standingwater USING GIST (geometry);

CREATE TABLE hypw.standingwater_bank (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.standingwater ON DELETE CASCADE,
    href text
);
CREATE TABLE hypw.standingwater_drainsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.standingwater ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hypw.standingwater_neighbour (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.standingwater ON DELETE CASCADE,
    href text
);
ALTER TABLE hypw.standingwater_geographicalname OWNER TO elf;
ALTER TABLE hypw.standingwater_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.standingwater_hydroid OWNER TO elf;
ALTER TABLE hypw.standingwater OWNER TO elf;
ALTER TABLE hypw.standingwater_bank OWNER TO elf;
ALTER TABLE hypw.standingwater_drainsbasin OWNER TO elf;
ALTER TABLE hypw.standingwater_neighbour OWNER TO elf;

-- Watercourse
CREATE TABLE hypw.watercourse_geographicalname (
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
CREATE TABLE hypw.watercourse_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.watercourse_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.watercourse_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.watercourse (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
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
    namedplace_fk integer REFERENCES hypw.watercourse_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.watercourse_hydroid ON DELETE RESTRICT,
    CONSTRAINT watercourse_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'watercourse','geometry','4258','GEOMETRY', 2);
CREATE INDEX watercourse_geometry_idx ON hypw.watercourse USING GIST (geometry);

CREATE TABLE hypw.watercourse_bank (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.watercourse ON DELETE CASCADE,
    href text
);
CREATE TABLE hypw.watercourse_drainsbasin (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.watercourse ON DELETE CASCADE,
    href text,
    nil boolean,
    nilreason text
);
CREATE TABLE hypw.watercourse_neighbour (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.watercourse ON DELETE CASCADE,
    href text
);
ALTER TABLE hypw.watercourse_geographicalname OWNER TO elf;
ALTER TABLE hypw.watercourse_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.watercourse_hydroid OWNER TO elf;
ALTER TABLE hypw.watercourse OWNER TO elf;
ALTER TABLE hypw.watercourse_bank OWNER TO elf;
ALTER TABLE hypw.watercourse_drainsbasin OWNER TO elf;
ALTER TABLE hypw.watercourse_neighbour OWNER TO elf;

-- Wetland
CREATE TABLE hypw.wetland_geographicalname (
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
CREATE TABLE hypw.wetland_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.wetland_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.wetland_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.wetland (
    localid text,
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
    namedplace_fk integer REFERENCES hypw.wetland_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.wetland_hydroid ON DELETE RESTRICT,
    CONSTRAINT wetland_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'wetland','geometry','4258','GEOMETRY', 2);
CREATE INDEX wetland_geometry_idx ON hypw.wetland USING GIST (geometry);

ALTER TABLE hypw.wetland_geographicalname OWNER TO elf;
ALTER TABLE hypw.wetland_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.wetland_hydroid OWNER TO elf;
ALTER TABLE hypw.wetland OWNER TO elf;

-- Embankment
CREATE TABLE hypw.embankment_geographicalname (
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
CREATE TABLE hypw.embankment_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.embankment_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.embankment_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.embankment (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    embankmenttype_href text,
    embankmenttype_nilreason text,
    predominantfeatureheight numeric,
    predominantfeatureheight_uom text,
    waterleveleffect_href text,
    waterleveleffect_nilreason text,
    namedplace_fk integer REFERENCES hypw.embankment_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.embankment_hydroid ON DELETE RESTRICT,
    CONSTRAINT embankment_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'embankment','geometry','4258','GEOMETRY', 2);
CREATE INDEX embankment_geometry_idx ON hypw.embankment USING GIST (geometry);

ALTER TABLE hypw.embankment_geographicalname OWNER TO elf;
ALTER TABLE hypw.embankment_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.embankment_hydroid OWNER TO elf;
ALTER TABLE hypw.embankment OWNER TO elf;

-- Island
CREATE TABLE hypw.island_geographicalname (
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
CREATE TABLE hypw.island_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.island_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.island_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.island (
    localid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    namedplace_fk integer REFERENCES hypw.island_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.island_hydroid ON DELETE RESTRICT,
    CONSTRAINT island_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'island','geometry','4258','GEOMETRY', 2);
CREATE INDEX island_geometry_idx ON hypw.island USING GIST (geometry);

ALTER TABLE hypw.island_geographicalname OWNER TO elf;
ALTER TABLE hypw.island_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.island_hydroid OWNER TO elf;
ALTER TABLE hypw.island OWNER TO elf;

-- LandWaterBoundary
CREATE TABLE hypw.landwaterboundary (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    origin text,
    origin_nilreason text,
    origin_nil boolean,
    waterlevelcategory_href text,
    waterlevelcategory_nil boolean,
    waterlevelcategory_nilreason text,
    CONSTRAINT landwaterboundary_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'landwaterboundary','geometry','4258','GEOMETRY', 2);
CREATE INDEX landwaterboundary_geometry_idx ON hypw.landwaterboundary USING GIST (geometry);

CREATE TABLE hypw.landwaterboundary_delimit (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES hypw.landwaterboundary ON DELETE CASCADE,
    waterleveleffect_href text
);
ALTER TABLE hypw.landwaterboundary OWNER TO elf;
ALTER TABLE hypw.landwaterboundary_delimit OWNER TO elf;

-- ShorelineConstruction
CREATE TABLE hypw.shorelineconstruction_geographicalname (
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
CREATE TABLE hypw.shorelineconstruction_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES hypw.shorelineconstruction_geographicalname ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
CREATE TABLE hypw.shorelineconstruction_hydroid (
    id serial PRIMARY KEY,
    hydroidentifier_classificationscheme text,
    hydroidentifier_localid text,
    hydroidentifier_namespace text
);
CREATE TABLE hypw.shorelineconstruction (
    localid text,
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
    lod_denominator_nilreason text,
    lod_denominator integer,
    shorelineconstructiontype_href text,
    shorelineconstructiontype_nilreason text,
    namedplace_fk integer REFERENCES hypw.shorelineconstruction_geographicalname ON DELETE RESTRICT,
    hydro_id_fk integer REFERENCES hypw.shorelineconstruction_hydroid ON DELETE RESTRICT,
    CONSTRAINT shorelineconstruction_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('hypw', 'shorelineconstruction','geometry','4258','GEOMETRY', 2);
CREATE INDEX shorelineconstruction_geometry_idx ON hypw.shorelineconstruction USING GIST (geometry);

ALTER TABLE hypw.shorelineconstruction_geographicalname OWNER TO elf;
ALTER TABLE hypw.shorelineconstruction_geographicalname_spelling OWNER TO elf;
ALTER TABLE hypw.shorelineconstruction_hydroid OWNER TO elf;
ALTER TABLE hypw.shorelineconstruction OWNER TO elf;
