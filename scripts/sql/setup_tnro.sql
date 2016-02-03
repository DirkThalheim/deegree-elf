-- Schema: tnro

-- DROP SCHEMA tnro;

CREATE SCHEMA tnro
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA tnro
  IS 'Schemata für TransprotNetwork Roads';
  
-- == Tabellen =====

-- == ERoad ================================  

CREATE TABLE tnro.eroad (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    europeanroutenumber text,
    europeanroutenumber_nilreason text,
    europeanroutenumber_nil boolean,
    CONSTRAINT eroad_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.eroad OWNER TO elf_admin;
CREATE TABLE tnro.eroad_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.eroad ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.eroad_innetwork OWNER TO elf_admin;
CREATE TABLE tnro.eroad_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.eroad ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE tnro.eroad_link OWNER TO elf_admin;
CREATE TABLE tnro.eroad_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.eroad ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.eroad_gn_spelling OWNER TO elf_admin;
CREATE TABLE tnro.eroad_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.eroad ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.eroad_post OWNER TO elf_admin;

CREATE INDEX eroad_id_idx ON tnro.eroad(id);
CREATE INDEX eroad_innetwork_id_idx ON tnro.eroad_innetwork(id);
CREATE INDEX eroad_innetwork_parentfk_idx ON tnro.eroad_innetwork (parentfk);
CREATE INDEX eeroad_link_id_idx ON tnro.eroad_link(id);
CREATE INDEX eroad_link_parentfk_idx ON tnro.eroad_link (parentfk);
CREATE INDEX eroad_gn_spelling_id_idx ON tnro.eroad_gn_spelling(id);
CREATE INDEX eroad_gn_spelling_parentfk_idx ON tnro.eroad_gn_spelling (parentfk);
CREATE INDEX eroad_post_id_idx ON tnro.eroad_post(id);
CREATE INDEX eroad_post_parentfk_idx ON tnro.eroad_post (parentfk);

-- == FormOfWay ================================  

CREATE TABLE tnro.formofway (
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    formofway_nilreason text,
    formofway_href text,
    CONSTRAINT formofway_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.formofway OWNER TO elf_admin;
CREATE TABLE tnro.formofway_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.formofway ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.formofway_networkref OWNER TO elf_admin;

CREATE INDEX formofway_id_idx ON tnro.formofway(id);
CREATE INDEX formofway_networkref_id_idx ON tnro.formofway_networkref(id);
CREATE INDEX formofway_networkref_parentfk_idx ON tnro.formofway_networkref (parentfk);

-- == FunctionalRoadClass ================================  

CREATE TABLE tnro.functionalroadclass (
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    functionalclass text,
    CONSTRAINT functionalroadclass_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.functionalroadclass OWNER TO elf_admin;
CREATE TABLE tnro.functionalroadclass_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.functionalroadclass ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.functionalroadclass_networkref OWNER TO elf_admin;

CREATE INDEX functionalroadclass_id_idx ON tnro.functionalroadclass(id);
CREATE INDEX functionalroadclass_networkref_networkref_id_idx ON tnro.functionalroadclass_networkref(id);
CREATE INDEX functionalroadclass_networkref_networkref_parentfk_idx ON tnro.functionalroadclass_networkref (parentfk);

-- == NumberOfLanes ================================  

CREATE TABLE tnro.numberoflanes (
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    direction_nilreason text,
    direction_nil boolean,
    direction_href text,
    minmaxnumberoflanes text,
    minmaxnumberoflanes_nilreason text,
    minmaxnumberoflanes_nil boolean,
    numberoflanes integer,
    CONSTRAINT numberoflanes_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.numberoflanes OWNER TO elf_admin;
CREATE TABLE tnro.numberoflanes_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.numberoflanes ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.numberoflanes_networkref OWNER TO elf_admin;

CREATE INDEX numberoflanes_id_idx ON tnro.numberoflanes(id);
CREATE INDEX numberoflanes_networkref_networkref_id_idx ON tnro.numberoflanes_networkref(id);
CREATE INDEX numberoflanes_networkref_networkref_parentfk_idx ON tnro.numberoflanes_networkref (parentfk);

-- == Road ================================  

CREATE TABLE tnro.road (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    localroadcode text,
    localroadcode_nilreason text,
    localroadcode_nil boolean,
    nationalroadcode text,
    nationalroadcode_nilreason text,
    nationalroadcode_nil boolean,
    CONSTRAINT road_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.road OWNER TO elf_admin;
CREATE TABLE tnro.road_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.road ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.road_innetwork OWNER TO elf_admin;
CREATE TABLE tnro.road_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.road ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE tnro.road_link OWNER TO elf_admin;
CREATE TABLE tnro.road_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.road ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.road_gn_spelling OWNER TO elf_admin;
CREATE TABLE tnro.road_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.road ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.road_post OWNER TO elf_admin;

CREATE INDEX road_id_idx ON tnro.road(id);
CREATE INDEX road_innetwork_id_idx ON tnro.road_innetwork(id);
CREATE INDEX road_innetwork_parentfk_idx ON tnro.road_innetwork (parentfk);
CREATE INDEX road_link_id_idx ON tnro.road_link(id);
CREATE INDEX road_link_parentfk_idx ON tnro.road_link (parentfk);
CREATE INDEX road_gn_spelling_id_idx ON tnro.road_gn_spelling(id);
CREATE INDEX road_gn_spelling_parentfk_idx ON tnro.road_gn_spelling (parentfk);
CREATE INDEX road_post_id_idx ON tnro.road_post(id);
CREATE INDEX road_post_parentfk_idx ON tnro.road_post (parentfk);

-- == RoadArea ================================  

CREATE TABLE tnro.roadarea (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    geometry_nilreason text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT roadarea_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadarea OWNER TO elf_admin;
CREATE TABLE tnro.roadarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadarea ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadarea_innetwork OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tnro', 'roadarea','geometry','4258','GEOMETRY', 2);
CREATE TABLE tnro.roadarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadarea ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadarea_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadarea_id_idx ON tnro.roadarea(id);
CREATE INDEX roadarea_geometry_idx ON tnro.roadarea USING GIST (geometry);
CREATE INDEX roadarea_innetwork_id_idx ON tnro.roadarea_innetwork(id);
CREATE INDEX roadarea_innetwork_parentfk_idx ON tnro.roadarea_innetwork (parentfk);
CREATE INDEX roadarea_gn_spelling_id_idx ON tnro.roadarea_gn_spelling(id);
CREATE INDEX roadarea_gn_spelling_parentfk_idx ON tnro.roadarea_gn_spelling (parentfk);

-- == RoadLinkSequence ================================  

CREATE TABLE tnro.roadlinksequence(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT roadlinksequence_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadlinksequence OWNER TO elf_admin;

CREATE TABLE tnro.roadlinksequence_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadlinksequence ON DELETE CASCADE,
    href text,
    nilreason text,
    nil boolean
);
ALTER TABLE tnro.roadlinksequence_innetwork OWNER TO elf_admin;

CREATE TABLE tnro.roadlinksequence_link(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadlinksequence ON DELETE CASCADE,
    direction text,
    href text,
    nilreason text
);
ALTER TABLE tnro.roadlinksequence_link OWNER TO elf_admin;

CREATE TABLE tnro.roadlinksequence_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadlinksequence ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadlinksequence_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadlinksequence_id_idx ON tnro.roadlinksequence(id);
CREATE INDEX roadlinksequence_innetwork_id_idx ON tnro.roadlinksequence_innetwork(id);
CREATE INDEX roadlinksequence_innetwork_parentfk_idx ON tnro.roadlinksequence_innetwork (parentfk);
CREATE INDEX roadlinksequence_link_id_idx ON tnro.roadlinksequence_link(id);
CREATE INDEX roadlinksequence_link_parentfk_idx ON tnro.roadlinksequence_link (parentfk);
CREATE INDEX roadlinksequence_gn_spelling_id_idx ON tnro.roadlinksequence_gn_spelling(id);
CREATE INDEX roadlinksequence_gn_spelling_parentfk_idx ON tnro.roadlinksequence_gn_spelling (parentfk);

-- == RoadName ================================  

CREATE TABLE tnro.roadname(
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    name_gn_language text,
    name_gn_language_nilreason text,
    name_gn_language_nil boolean,
    name_gn_nativeness_owns boolean,
    name_gn_nativeness_nilreason text,
    name_gn_nativeness_gml_remoteschema text,
    name_gn_nativeness_nil boolean,
    name_gn_nativeness_fk text,
    name_gn_nativeness_href text,
    name_gn_namestatus_owns boolean,
    name_gn_namestatus_nilreason text,
    name_gn_namestatus_gml_remoteschema text,
    name_gn_namestatus_nil boolean,
    name_gn_namestatus_fk text,
    name_gn_namestatus_href text,
    name_gn_sourceofname text,
    name_gn_sourceofname_nilreason text,
    name_gn_sourceofname_nil boolean,
    CONSTRAINT roadname_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadname OWNER TO elf_admin;

CREATE TABLE tnro.roadname_networkref(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadname ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.roadname_networkref OWNER TO elf_admin;

CREATE TABLE tnro.roadname_name_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadname ON DELETE CASCADE,
    name_spellingofname text,
    name_script text,
    name_script_nilreason text,
    name_script_nil boolean,
    name_transliterationscheme text,
    name_transliterationscheme_nilreason text,
    name_transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadname_name_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadname_id_idx ON tnro.roadname(id);
CREATE INDEX roadname_networkref_id_idx ON tnro.roadname_networkref(id);
CREATE INDEX roadname_networkref_parentfk_idx ON tnro.roadname_networkref (parentfk);
CREATE INDEX roadname_name_gn_spelling_id_idx ON tnro.roadname_name_gn_spelling(id);
CREATE INDEX roadname_name_gn_spelling_parentfk_idx ON tnro.roadname_name_gn_spelling (parentfk);

-- == RoadNode ================================  

CREATE TABLE tnro.roadnode(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    geometry_nilreason text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    formofroadnode_nilreason text,
    formofroadnode_nil boolean,
    formofroadnode_href text,
    CONSTRAINT roadnode_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('tnro', 'roadnode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnro.roadnode OWNER TO elf_admin;

CREATE TABLE tnro.roadnode_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadnode ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadnode_innetwork OWNER TO elf_admin;

CREATE TABLE tnro.roadnode_spokeend(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadnode ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadnode_spokeend OWNER TO elf_admin;

CREATE TABLE tnro.roadnode_spokestart(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadnode ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadnode_spokestart OWNER TO elf_admin;

CREATE TABLE tnro.roadnode_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadnode ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadnode_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadnode_id_idx ON tnro.roadnode(id);
CREATE INDEX roadnode_geometry_idx ON tnro.roadnode USING GIST (geometry);
CREATE INDEX roadnode_innetwork_id_idx ON tnro.roadnode_innetwork(id);
CREATE INDEX roadnode_innetwork_parentfk_idx ON tnro.roadnode_innetwork (parentfk);
CREATE INDEX roadnode_spokeend_id_idx ON tnro.roadnode_spokeend(id);
CREATE INDEX roadnode_spokeend_parentfk_idx ON tnro.roadnode_spokeend (parentfk);
CREATE INDEX roadnode_spokestart_id_idx ON tnro.roadnode_spokestart(id);
CREATE INDEX roadnode_spokestart_parentfk_idx ON tnro.roadnode_spokestart (parentfk);
CREATE INDEX roadnode_gn_spelling_id_idx ON tnro.roadnode_gn_spelling(id);
CREATE INDEX roadnode_gn_spelling_parentfk_idx ON tnro.roadnode_gn_spelling (parentfk);

-- == RoadServiceArea ================================  

CREATE TABLE tnro.roadservicearea(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    geometry_nilreason text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT roadservicearea_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('tnro', 'roadservicearea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnro.roadservicearea OWNER TO elf_admin;

CREATE TABLE tnro.roadservicearea_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadservicearea ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadservicearea_innetwork OWNER TO elf_admin;


CREATE TABLE tnro.roadservicearea_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadservicearea ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadservicearea_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadservicearea_id_idx ON tnro.roadservicearea(id);
CREATE INDEX roadservicearea_innetwork_id_idx ON tnro.roadservicearea_innetwork(id);
CREATE INDEX roadservicearea_innetwork_parentfk_idx ON tnro.roadservicearea_innetwork (parentfk);
CREATE INDEX roadservicearea_geometry_idx ON tnro.roadservicearea USING GIST (geometry);
CREATE INDEX roadservicearea_gn_spelling_id_idx ON tnro.roadservicearea_gn_spelling(id);
CREATE INDEX roadservicearea_gn_spelling_parentfk_idx ON tnro.roadservicearea_gn_spelling (parentfk);

-- == RoadServiceType ================================  

CREATE TABLE tnro.roadservicetype(
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    type_nilreason text,
    type_href text,
    CONSTRAINT roadservicetype_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadservicetype OWNER TO elf_admin;

CREATE TABLE tnro.roadservicetype_networkref(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadservicetype ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.roadservicetype_networkref OWNER TO elf_admin;

CREATE TABLE tnro.roadservicetype_availablefacility(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadservicetype ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE tnro.roadservicetype_availablefacility OWNER TO elf_admin;

CREATE INDEX roadservicetype_id_idx ON tnro.roadservicetype(id);
CREATE INDEX roadservicetype_networkref_id_idx ON tnro.roadservicetype_networkref(id);
CREATE INDEX roadservicetype_networkref_parentfk_idx ON tnro.roadservicetype_networkref (parentfk);
CREATE INDEX roadservicetype_availablefacility_id_idx ON tnro.roadservicetype_availablefacility(id);
CREATE INDEX roadservicetype_availablefacility_parentfk_idx ON tnro.roadservicetype_availablefacility (parentfk);

-- == RoadSurfaceCategory ================================  

CREATE TABLE tnro.roadsurfacecategory(
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    surfacecategory_nilreason text,
    surfacecategory_href text,
    CONSTRAINT roadsurfacecategory_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadsurfacecategory OWNER TO elf_admin;

CREATE TABLE tnro.roadsurfacecategory_networkref(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadsurfacecategory ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.roadsurfacecategory_networkref OWNER TO elf_admin;

CREATE INDEX roadsurfacecategory_id_idx ON tnro.roadsurfacecategory(id);
CREATE INDEX roadsurfacecategory_networkref_id_idx ON tnro.roadsurfacecategory_networkref(id);
CREATE INDEX roadsurfacecategory_networkref_parentfk_idx ON tnro.roadsurfacecategory_networkref (parentfk);

-- == RoadWidth ================================  

CREATE TABLE tnro.roadwidth(
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    measuredroadpart_nilreason text,
    measuredroadpart_nil boolean,
    measuredroadpart_href text,
    width numeric,
    width_uom text,
    CONSTRAINT roadwidth_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.roadwidth OWNER TO elf_admin;

CREATE TABLE tnro.roadwidth_networkref(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadwidth ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.roadwidth_networkref OWNER TO elf_admin;

CREATE INDEX roadwidth_id_idx ON tnro.roadwidth(id);
CREATE INDEX roadwidth_networkref_id_idx ON tnro.roadwidth_networkref(id);
CREATE INDEX roadwidth_networkref_parentfk_idx ON tnro.roadwidth_networkref (parentfk);

-- == SpeedLimit ================================  

CREATE TABLE tnro.speedlimit(
    id text,
    inspireid_localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    areacondition_nilreason text,
    areacondition_nil boolean,
    areacondition_href text,
    direction_nilreason text,
    direction_nil boolean,
    direction_href text,
    laneextension integer,
    laneextension_nilreason text,
    laneextension_nil boolean,
    speedlimitminmaxtype text,
    speedlimitsource_nilreason text,
    speedlimitsource_nil boolean,
    speedlimitsource_href text,
    speedlimitvalue numeric,
    speedlimitvalue_uom text,
    startlane integer,
    startlane_nilreason text,
    startlane_nil boolean,
    vehicletype_nilreason text,
    vehicletype_nil boolean,
    vehicletype_href text,
    weathercondition_nilreason text,
    weathercondition_nil boolean,
    weathercondition_href text,
    CONSTRAINT speedlimit_pkey PRIMARY KEY (id)
);
ALTER TABLE tnro.speedlimit OWNER TO elf_admin;

CREATE TABLE tnro.speedlimit_networkref(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.speedlimit ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    linkreference_nilreason text,
    linkreference_href text,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_href text,
    simplelinearreference_nilreason text,
    simplelinearreference_href text,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    networkreference_nilreason text,
    networkreference_href text,
    simplepointreference_nilreason text,
    simplepointreference_href text,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean
);
ALTER TABLE tnro.speedlimit_networkref OWNER TO elf_admin;

CREATE INDEX speedlimit_id_idx ON tnro.speedlimit(id);
CREATE INDEX speedlimit_networkref_id_idx ON tnro.speedlimit_networkref(id);
CREATE INDEX speedlimit_networkref_parentfk_idx ON tnro.speedlimit_networkref (parentfk);

-- == VehicleTrafficArea ================================  

CREATE TABLE tnro.vehicletrafficarea(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    geometry_nilreason text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT vehicletrafficarea_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('tnro', 'vehicletrafficarea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnro.vehicletrafficarea OWNER TO elf_admin;

CREATE TABLE tnro.vehicletrafficarea_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.vehicletrafficarea ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.vehicletrafficarea_innetwork OWNER TO elf_admin;

CREATE TABLE tnro.vehicletrafficarea_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.vehicletrafficarea ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.vehicletrafficarea_gn_spelling OWNER TO elf_admin;

CREATE INDEX vehicletrafficarea_id_idx ON tnro.vehicletrafficarea(id);
CREATE INDEX vehicletrafficarea_geometry_idx ON tnro.vehicletrafficarea USING GIST (geometry);
CREATE INDEX vehicletrafficarea_innetwork_id_idx ON tnro.vehicletrafficarea_innetwork(id);
CREATE INDEX vehicletrafficarea_innetwork_parentfk_idx ON tnro.vehicletrafficarea_innetwork (parentfk);
CREATE INDEX vehicletrafficarea_gn_spelling_id_idx ON tnro.vehicletrafficarea_gn_spelling(id);
CREATE INDEX vehicletrafficarea_gn_spelling_parentfk_idx ON tnro.vehicletrafficarea_gn_spelling (parentfk);

-- == InterchangePoint ================================  

CREATE TABLE tnro.interchangepoint(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    geometry_nilreason text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    typeofinterchange_nilreason text,
    typeofinterchange_href text,
    CONSTRAINT interchangepoint_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('tnro', 'interchangepoint','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnro.interchangepoint OWNER TO elf_admin;

CREATE TABLE tnro.interchangepoint_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.interchangepoint ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.interchangepoint_innetwork OWNER TO elf_admin;

CREATE TABLE tnro.interchangepoint_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.interchangepoint ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.interchangepoint_gn_spelling OWNER TO elf_admin;

CREATE INDEX interchangepoint_id_idx ON tnro.interchangepoint(id);
CREATE INDEX interchangepoint_geometry_idx ON tnro.interchangepoint USING GIST (geometry);
CREATE INDEX interchangepoint_innetwork_id_idx ON tnro.interchangepoint_innetwork(id);
CREATE INDEX interchangepoint_innetwork_parentfk_idx ON tnro.interchangepoint_innetwork (parentfk);
CREATE INDEX interchangepoint_gn_spelling_id_idx ON tnro.interchangepoint_gn_spelling(id);
CREATE INDEX interchangepoint_gn_spelling_parentfk_idx ON tnro.interchangepoint_gn_spelling (parentfk);

-- == RoadLink ================================  

CREATE TABLE tnro.roadlink(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid_localid text,
    centrelinegeometry_nilreason text,
    fictitious boolean,
    endnode_nilreason text,
    endnode_href text,
    startnode_nilreason text,
    startnode_href text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_href text,
    gn_nativeness_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nilreason text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    transeuropeantransportnetwork boolean,
    CONSTRAINT roadlink_pkey PRIMARY KEY (id)
);
SELECT ADDGEOMETRYCOLUMN('tnro', 'roadlink','centrelinegeometry','4258','GEOMETRY', 2);
ALTER TABLE tnro.roadlink OWNER TO elf_admin;

CREATE TABLE tnro.roadlink_innetwork(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadlink ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    href text
);
ALTER TABLE tnro.roadlink_innetwork OWNER TO elf_admin;

CREATE TABLE tnro.roadlink_gn_spelling(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnro.roadlink ON DELETE CASCADE,
    spellingofname text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnro.roadlink_gn_spelling OWNER TO elf_admin;

CREATE INDEX roadlink_id_idx ON tnro.roadlink(id);
CREATE INDEX roadlink_centrelinegeometry_idx ON tnro.roadlink USING GIST (centrelinegeometry);
CREATE INDEX roadlink_innetwork_id_idx ON tnro.roadlink_innetwork(id);
CREATE INDEX roadlink_innetwork_parentfk_idx ON tnro.roadlink_innetwork (parentfk);
CREATE INDEX roadlink_gn_spelling_id_idx ON tnro.roadlink_gn_spelling(id);
CREATE INDEX roadlink_gn_spelling_parentfk_idx ON tnro.roadlink_gn_spelling (parentfk);
