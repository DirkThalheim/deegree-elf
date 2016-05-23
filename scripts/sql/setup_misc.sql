-- Schema: misc

-- DROP SCHEMA misc;

CREATE SCHEMA misc AUTHORIZATION elf_admin;

COMMENT ON SCHEMA misc IS 'Schemata für Thema Misc';
  
-- == Tabellen =====

-- == elf-gn:NamedPlace ================================  
CREATE TABLE misc.elf_gn_namedplace (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    leastdetailedviewingresolution_nilreason text,
    leastdetailedviewingresolution_owns boolean,
    leastdetailedviewingresolution_xsi_nil boolean,
    leastdetailedviewingresolution_equivalentscale_xlink_type text,
    leastdetailedviewingresolution_equivalentscale_xlink_href text,
    leastdetailedviewingresolution_equivalentscale_xlink_role text,
    leastdetailedviewingresolution_equivalentscale_xlink_arcrole text,
    leastdetailedviewingresolution_equivalentscale_xlink_title text,
    leastdetailedviewingresolution_equivalentscale_xlink_show text,
    leastdetailedviewingresolution_equivalentscale_xlink_actuate text,
    leastdetailedviewingresolution_equivalentscale_uuidref text,
    leastdetailedviewingresolution_equivalentscale_gco_nilreason text,
    leastdetailedviewingresolution_equivalentscale_id text,
    leastdetailedviewingresolution_equivalentscale_uuid text,
    leastdetailedviewingresolution_denominator_nilreason text,
    leastdetailedviewingresolution_denominator_integer integer,
    leastdetailedviewingresolution_distance_nilreason text,
    leastdetailedviewingresolution_distance_distance numeric,
    leastdetailedviewingresolution_distance_distance_uom text,
    mostdetailedviewingresolution_nilreason text,
    mostdetailedviewingresolution_owns boolean,
    mostdetailedviewingresolution_xsi_nil boolean,
    mostdetailedviewingresolution_xlink_type text,
    mostdetailedviewingresolution_xlink_href text,
    mostdetailedviewingresolution_xlink_role text,
    mostdetailedviewingresolution_xlink_arcrole text,
    mostdetailedviewingresolution_xlink_title text,
    mostdetailedviewingresolution_xlink_show text,
    mostdetailedviewingresolution_xlink_actuate text,
    mostdetailedviewingresolution_uuidref text,
    mostdetailedviewingresolution_gco_nilreason text,
    mostdetailedviewingresolution_representativefraction_id text,
    mostdetailedviewingresolution_representativefraction_uuid text,
    mostdetailedviewingresolution_denominator_nilreason text,
    mostdetailedviewingresolution_denominator_integer integer,
    mostdetailedviewingresolution_distance_nilreason text,
    mostdetailedviewingresolution_distance_distance numeric,
    mostdetailedviewingresolution_distance_distance_uom text,
    elf_gn_egntype_owns boolean,
    elf_gn_egntype_nilreason text,
    elf_gn_egntype_remoteschema text,
    elf_gn_egntype_fk text,
    elf_gn_egntype_href text,
    populationindication_populationnumber integer,
    populationrange_lower integer,
    populationrange_upper integer,
    CONSTRAINT elf_gn_namedplace_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'elf_gn_namedplace','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.elf_gn_namedplace OWNER TO elf_admin;

CREATE TABLE misc.elf_gn_namedplace_gn_localtype (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.elf_gn_namedplace ON DELETE CASCADE,
    num integer not null,
    xlink_type text,
    xlink_href text,
    xlink_role text,
    xlink_arcrole text,
    xlink_title text,
    xlink_show text,
    xlink_actuate text,
    uuidref text,
    gco_nilreason text,
    xsi_nil boolean,
    gmd_localisedcharacterstring text,
    gmd_localisedcharacterstring_id text,
    gmd_localisedcharacterstring_locale text
);
ALTER TABLE misc.elf_gn_namedplace_gn_localtype OWNER TO elf_admin;
CREATE TABLE misc.elf_gn_namedplace_gn_relatedspatialobject (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.elf_gn_namedplace ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean
);
ALTER TABLE misc.elf_gn_namedplace_gn_relatedspatialobject OWNER TO elf_admin;
CREATE TABLE misc.elf_gn_namedplace_gn_type (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.elf_gn_namedplace ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE misc.elf_gn_namedplace_gn_type OWNER TO elf_admin;

CREATE INDEX elf_gn_namedplace_id_idx ON misc.elf_gn_namedplace(id);
CREATE INDEX elf_gn_namedplace_geometry_idx ON misc.elf_gn_namedplace USING GIST (geometry);

CREATE INDEX elf_gn_namedplace_gn_localtype_id_idx ON misc.elf_gn_namedplace_gn_localtype(id);
CREATE INDEX elf_gn_namedplace_gn_localtype_parentfk_idx ON misc.elf_gn_namedplace_gn_localtype (parentfk);

CREATE INDEX elf_gn_namedplace_gn_relatedspatialobject_id_idx ON misc.elf_gn_namedplace_gn_relatedspatialobject(id);
CREATE INDEX elf_gn_namedplace_gn_relatedspatialobject_parentfk_idx ON misc.elf_gn_namedplace_gn_relatedspatialobject (parentfk);

CREATE INDEX elf_gn_namedplace_gn_type_id_idx ON misc.elf_gn_namedplace_gn_type(id);
CREATE INDEX elf_gn_namedplace_gn_type_parentfk_idx ON misc.elf_gn_namedplace_gn_type (parentfk);


-- == elf-misc:AmusementPark ================================  
CREATE TABLE misc.amusementpark (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT amusementpark_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'amusementpark','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.amusementpark OWNER TO elf_admin;

CREATE TABLE misc.amusementpark_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.amusementpark ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    geographicalname_language text,
    geographicalname_language_nilreason text,
    geographicalname_language_xsi_nil boolean,
    geographicalname_nativeness_owns boolean,
    geographicalname_nativeness_nilreason text,
    geographicalname_nativeness_remoteschema text,
    geographicalname_nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    geographicalname_nativeness_href text,
    geographicalname_namestatus_owns boolean,
    geographicalname_namestatus_nilreason text,
    geographicalname_namestatus_remoteschema text,
    geographicalname_namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    geographicalname_namestatus_href text,
    geographicalname_sourceofname text,
    geographicalname_sourceofname_nilreason text,
    geographicalname_sourceofname_xsi_nil boolean,
    geographicalname_pronunciation_nilreason text,
    geographicalname_pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text,
    elf_gn_geographicalname_elf_gn_referencename boolean
);
ALTER TABLE misc.amusementpark_name OWNER TO elf_admin;
CREATE TABLE misc.amusementpark_name_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES misc.amusementpark_name ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE misc.amusementpark_name_geographicalname_spelling OWNER TO elf_admin;

CREATE INDEX amusementpark_id_idx ON misc.amusementpark(id);
CREATE INDEX amusementpark_geometry_idx ON misc.amusementpark USING GIST (geometry);

CREATE INDEX amusementpark_name_id_idx ON misc.amusementpark_name(id);
CREATE INDEX amusementpark_name_parentfk_idx ON misc.amusementpark_name (parentfk);

CREATE INDEX amusementpark_name_geographicalname_spelling_id_idx ON misc.amusementpark_name_geographicalname_spelling(id);
CREATE INDEX amusementpark_name_geographicalname_spelling_parentfk_idx ON misc.amusementpark_name_geographicalname_spelling (parentfk);

-- == elf-misc:Cave ================================  
CREATE TABLE misc.cave (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT cave_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'cave','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.cave OWNER TO elf_admin;

CREATE TABLE misc.cave_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.cave ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    geographicalname_language text,
    geographicalname_language_nilreason text,
    geographicalname_language_xsi_nil boolean,
    geographicalname_nativeness_owns boolean,
    geographicalname_nativeness_nilreason text,
    geographicalname_nativeness_remoteschema text,
    geographicalname_nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    geographicalname_nativeness_href text,
    geographicalname_namestatus_owns boolean,
    geographicalname_namestatus_nilreason text,
    geographicalname_namestatus_remoteschema text,
    geographicalname_namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    geographicalname_namestatus_href text,
    geographicalname_sourceofname text,
    geographicalname_sourceofname_nilreason text,
    geographicalname_sourceofname_xsi_nil boolean,
    geographicalname_pronunciation_nilreason text,
    geographicalname_pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text,
    elf_gn_geographicalname_elf_gn_referencename boolean
);
ALTER TABLE misc.cave_name OWNER TO elf_admin;
CREATE TABLE misc.cave_name_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES misc.cave_name ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE misc.cave_name_geographicalname_spelling OWNER TO elf_admin;

CREATE INDEX cave_id_idx ON misc.cave(id);
CREATE INDEX cave_geometry_idx ON misc.cave USING GIST (geometry);

CREATE INDEX cave_name_id_idx ON misc.cave_name(id);
CREATE INDEX cave_name_parentfk_idx ON misc.cave_name (parentfk);

CREATE INDEX cave_name_geographicalname_spelling_id_idx ON misc.cave_name_geographicalname_spelling(id);
CREATE INDEX cave_name_geographicalname_spelling_parentfk_idx ON misc.cave_name_geographicalname_spelling (parentfk);

-- == elf-misc:DisposalSite ================================  
CREATE TABLE misc.disposalsite (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    byproduct_owns boolean,
    byproduct_nilreason text,
    byproduct_remoteschema text,
    byproduct_xsi_nil boolean,
    byproduct_fk text,
    byproduct_href text,
    CONSTRAINT disposalsite_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'disposalsite','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.disposalsite OWNER TO elf_admin;

CREATE INDEX disposalsite_id_idx ON misc.disposalsite(id);
CREATE INDEX disposalsite_geometry_idx ON misc.disposalsite USING GIST (geometry);

-- == elf-misc:ExtractionMine ================================  
CREATE TABLE misc.extractionmine (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    conditionoffacility_owns boolean,
    conditionoffacility_nilreason text,
    conditionoffacility_remoteschema text,
    conditionoffacility_xsi_nil boolean,
    conditionoffacility_fk text,
    conditionoffacility_href text,
    extractionminetype_owns boolean,
    extractionminetype_nilreason text,
    extractionminetype_remoteschema text,
    extractionminetype_xsi_nil boolean,
    extractionminetype_fk text,
    extractionminetype_href text,
    product_owns boolean,
    product_nilreason text,
    product_remoteschema text,
    product_xsi_nil boolean,
    product_fk text,
    product_href text,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT extractionmine_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'extractionmine','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.extractionmine OWNER TO elf_admin;

CREATE TABLE misc.extractionmine_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.extractionmine ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    geographicalname_language text,
    geographicalname_language_nilreason text,
    geographicalname_language_xsi_nil boolean,
    geographicalname_nativeness_owns boolean,
    geographicalname_nativeness_nilreason text,
    geographicalname_nativeness_remoteschema text,
    geographicalname_nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    geographicalname_nativeness_href text,
    geographicalname_namestatus_owns boolean,
    geographicalname_namestatus_nilreason text,
    geographicalname_namestatus_remoteschema text,
    geographicalname_namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    geographicalname_namestatus_href text,
    geographicalname_sourceofname text,
    geographicalname_sourceofname_nilreason text,
    geographicalname_sourceofname_xsi_nil boolean,
    geographicalname_pronunciation_nilreason text,
    geographicalname_pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text,
    elf_gn_geographicalname_elf_gn_referencename boolean
);
ALTER TABLE misc.extractionmine_name OWNER TO elf_admin;
CREATE TABLE misc.extractionmine_name_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES misc.extractionmine_name ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE misc.extractionmine_name_geographicalname_spelling OWNER TO elf_admin;

CREATE INDEX extractionmine_id_idx ON misc.extractionmine(id);
CREATE INDEX extractionmine_geometry_idx ON misc.extractionmine USING GIST (geometry);

CREATE INDEX extractionmine_name_id_idx ON misc.extractionmine_name(id);
CREATE INDEX extractionmine_name_parentfk_idx ON misc.extractionmine_name (parentfk);

CREATE INDEX extractionmine_name_geographicalname_spelling_id_idx ON misc.extractionmine_name_geographicalname_spelling(id);
CREATE INDEX extractionmine_name_geographicalname_spelling_parentfk_idx ON misc.extractionmine_name_geographicalname_spelling (parentfk);

-- == elf-misc:Pipe ================================  
CREATE TABLE misc.pipe (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    product_owns boolean,
    product_nilreason text,
    product_remoteschema text,
    product_xsi_nil boolean,
    product_fk text,
    product_href text,
    verticalposition text,
    verticalposition_nilreason text,
    verticalposition_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT pipe_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'pipe','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.pipe OWNER TO elf_admin;

CREATE INDEX pipe_id_idx ON misc.pipe(id);
CREATE INDEX pipe_geometry_idx ON misc.pipe USING GIST (geometry);

-- == elf-misc:PowerLine ================================  
CREATE TABLE misc.powerline (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    linearfeaturearrangement_owns boolean,
    linearfeaturearrangement_nilreason text,
    linearfeaturearrangement_remoteschema text,
    linearfeaturearrangement_xsi_nil boolean,
    linearfeaturearrangement_fk text,
    linearfeaturearrangement_href text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT powerline_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'powerline','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.powerline OWNER TO elf_admin;

CREATE INDEX powerline_id_idx ON misc.powerline(id);
CREATE INDEX powerline_geometry_idx ON misc.powerline USING GIST (geometry);

-- == elf-misc:PowerStation ================================  
CREATE TABLE misc.powerstation (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    powerstationtype_owns boolean,
    powerstationtype_nilreason text,
    powerstationtype_remoteschema text,
    powerstationtype_xsi_nil boolean,
    powerstationtype_fk text,
    powerstationtype_href text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT powerstation_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'powerstation','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.powerstation OWNER TO elf_admin;

CREATE TABLE misc.powerstation_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.powerstation ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    geographicalname_language text,
    geographicalname_language_nilreason text,
    geographicalname_language_xsi_nil boolean,
    geographicalname_nativeness_owns boolean,
    geographicalname_nativeness_nilreason text,
    geographicalname_nativeness_remoteschema text,
    geographicalname_nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    geographicalname_nativeness_href text,
    geographicalname_namestatus_owns boolean,
    geographicalname_namestatus_nilreason text,
    geographicalname_namestatus_remoteschema text,
    geographicalname_namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    geographicalname_namestatus_href text,
    geographicalname_sourceofname text,
    geographicalname_sourceofname_nilreason text,
    geographicalname_sourceofname_xsi_nil boolean,
    geographicalname_pronunciation_nilreason text,
    geographicalname_pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text,
    elf_gn_geographicalname_elf_gn_referencename boolean
);
ALTER TABLE misc.powerstation_name OWNER TO elf_admin;
CREATE TABLE misc.powerstation_name_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES misc.powerstation_name ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE misc.powerstation_name_geographicalname_spelling OWNER TO elf_admin;

CREATE INDEX powerstation_id_idx ON misc.powerstation(id);
CREATE INDEX powerstation_geometry_idx ON misc.powerstation USING GIST (geometry);

CREATE INDEX powerstation_name_id_idx ON misc.powerstation_name(id);
CREATE INDEX powerstation_name_parentfk_idx ON misc.powerstation_name (parentfk);

CREATE INDEX powerstation_name_geographicalname_spelling_id_idx ON misc.powerstation_name_geographicalname_spelling(id);
CREATE INDEX powerstation_name_geographicalname_spelling_parentfk_idx ON misc.powerstation_name_geographicalname_spelling (parentfk);

-- == elf-misc:ProcessingFacility ================================  
CREATE TABLE misc.processingfacility (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    product_owns boolean,
    product_nilreason text,
    product_remoteschema text,
    product_xsi_nil boolean,
    product_fk text,
    product_href text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT processingfacility_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'processingfacility','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.processingfacility OWNER TO elf_admin;

CREATE INDEX processingfacility_id_idx ON misc.processingfacility(id);
CREATE INDEX processingfacility_geometry_idx ON misc.processingfacility USING GIST (geometry);

-- == elf-misc:PumpingStation ================================  
CREATE TABLE misc.pumpingstation (
    id text,
    identifier text,
    identifier_codespace text,
    product_owns boolean,
    product_nilreason text,
    product_remoteschema text,
    product_xsi_nil boolean,
    product_fk text,
    product_href text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT pumpingstation_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'pumpingstation','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.pumpingstation OWNER TO elf_admin;

CREATE INDEX pumpingstation_id_idx ON misc.pumpingstation(id);
CREATE INDEX pumpingstation_geometry_idx ON misc.pumpingstation USING GIST (geometry);

-- == elf-misc:RaceTrack ================================  
CREATE TABLE misc.racetrack (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_owns boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT racetrack_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'racetrack','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.racetrack OWNER TO elf_admin;

CREATE TABLE misc.racetrack_name (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES misc.racetrack ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    geographicalname_language text,
    geographicalname_language_nilreason text,
    geographicalname_language_xsi_nil boolean,
    geographicalname_nativeness_owns boolean,
    geographicalname_nativeness_nilreason text,
    geographicalname_nativeness_remoteschema text,
    geographicalname_nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    geographicalname_nativeness_href text,
    geographicalname_namestatus_owns boolean,
    geographicalname_namestatus_nilreason text,
    geographicalname_namestatus_remoteschema text,
    geographicalname_namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    geographicalname_namestatus_href text,
    geographicalname_sourceofname text,
    geographicalname_sourceofname_nilreason text,
    geographicalname_sourceofname_xsi_nil boolean,
    geographicalname_pronunciation_nilreason text,
    geographicalname_pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nilreason text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text,
    elf_gn_geographicalname_elf_gn_referencename boolean
);
ALTER TABLE misc.racetrack_name OWNER TO elf_admin;
CREATE TABLE misc.racetrack_name_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES misc.racetrack_name ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE misc.racetrack_name_geographicalname_spelling OWNER TO elf_admin;

CREATE INDEX racetrack_id_idx ON misc.racetrack(id);
CREATE INDEX racetrack_geometry_idx ON misc.racetrack USING GIST (geometry);

CREATE INDEX racetrack_name_id_idx ON misc.racetrack_name(id);
CREATE INDEX racetrack_name_parentfk_idx ON misc.racetrack_name (parentfk);

CREATE INDEX racetrack_name_geographicalname_spelling_id_idx ON misc.racetrack_name_geographicalname_spelling(id);
CREATE INDEX racetrack_name_geographicalname_spelling_parentfk_idx ON misc.racetrack_name_geographicalname_spelling (parentfk);

-- == elf-misc:RaceTrack ================================  
CREATE TABLE misc.steepterrainface (
    id text,
    identifier text,
    identifier_codespace text,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    localid text,
    namespace text,
    versionid text,
    versionid_nilreason text,
    versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_xsi_nil boolean,
    CONSTRAINT steepterrainface_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('misc', 'steepterrainface','geometry','4258','GEOMETRY', 2);
ALTER TABLE misc.steepterrainface OWNER TO elf_admin;

CREATE INDEX steepterrainface_id_idx ON misc.steepterrainface(id);
CREATE INDEX steepterrainface_geometry_idx ON misc.steepterrainface USING GIST (geometry);
