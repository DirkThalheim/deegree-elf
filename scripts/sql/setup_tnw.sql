-- Schema: tnw

-- DROP SCHEMA tnw CASCADE;

CREATE SCHEMA tnw AUTHORIZATION elf_admin;

COMMENT ON SCHEMA tnw
  IS 'Schemata für Water Transport Network';

-- == INSPIRE Water Transport Network ==
CREATE TABLE tnw.beacon (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT beacon_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.beacon OWNER TO elf_admin;

CREATE TABLE tnw.beacon_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.beacon ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.beacon_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.beacon_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.beacon ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.beacon_gn_spelling OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'beacon','geometry','4258','GEOMETRY', 2);
CREATE INDEX beacon_geometry_idx ON tnw.beacon USING GIST (geometry);


CREATE TABLE tnw.buoy (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT buoy_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.buoy OWNER TO elf_admin;

CREATE TABLE tnw.buoy_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.buoy ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.buoy_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.buoy_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.buoy ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.buoy_gn_spelling OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'buoy','geometry','4258','GEOMETRY', 2);
CREATE INDEX buoy_geometry_idx ON tnw.buoy USING GIST (geometry);


CREATE TABLE tnw.cemtclass (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    cemtclass text,
    CONSTRAINT cemtclass_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.cemtclass OWNER TO elf_admin;

CREATE TABLE tnw.cemtclass_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.cemtclass ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.cemtclass_networkref OWNER TO elf_admin;


CREATE TABLE tnw.conditionofwaterfacility (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    currentstatus_nilreason text,
    currentstatus_href text,
    CONSTRAINT conditionofwaterfacility_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.conditionofwaterfacility OWNER TO elf_admin;

CREATE TABLE tnw.conditionofwaterfacility_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.conditionofwaterfacility ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.conditionofwaterfacility_networkref OWNER TO elf_admin;


CREATE TABLE tnw.fairwayarea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT fairwayarea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.fairwayarea OWNER TO elf_admin;

CREATE TABLE tnw.fairwayarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.fairwayarea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.fairwayarea_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'fairwayarea','geometry','4258','GEOMETRY', 2);
CREATE INDEX fairwayarea_geometry_idx ON tnw.fairwayarea USING GIST (geometry);

CREATE TABLE tnw.fairwayarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.fairwayarea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.fairwayarea_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.ferryuse (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT ferryuse_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.ferryuse OWNER TO elf_admin;

CREATE TABLE tnw.ferryuse_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferryuse ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.ferryuse_networkref OWNER TO elf_admin;

CREATE TABLE tnw.ferryuse_ferryuse (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferryuse ON DELETE CASCADE,
    owns boolean,
    nilreason text,
    remoteschema text,
    fk text,
    href text
);
ALTER TABLE tnw.ferryuse_ferryuse OWNER TO elf_admin;


CREATE TABLE tnw.inlandwaterway (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT inlandwaterway_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.inlandwaterway OWNER TO elf_admin;

CREATE TABLE tnw.inlandwaterway_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.inlandwaterway ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.inlandwaterway_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.inlandwaterway_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.inlandwaterway ON DELETE CASCADE,
    nilreason text,
    remoteschema text,
    owns boolean,
    fk text,
    href text
);
ALTER TABLE tnw.inlandwaterway_link OWNER TO elf_admin;

CREATE TABLE tnw.inlandwaterway_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.inlandwaterway ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.inlandwaterway_gn_spelling OWNER TO elf_admin;

CREATE TABLE tnw.inlandwaterway_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.inlandwaterway ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.inlandwaterway_post OWNER TO elf_admin;


CREATE TABLE tnw.marinewaterway (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    deepwaterroute boolean,
    deepwaterroute_nilreason text,
    deepwaterroute_nil boolean,
    CONSTRAINT marinewaterway_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.marinewaterway OWNER TO elf_admin;

CREATE TABLE tnw.marinewaterway_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.marinewaterway ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.marinewaterway_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.marinewaterway_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.marinewaterway ON DELETE CASCADE,
    nilreason text,
    remoteschema text,
    owns boolean,
    fk text,
    href text
);
ALTER TABLE tnw.marinewaterway_link OWNER TO elf_admin;

CREATE TABLE tnw.marinewaterway_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.marinewaterway ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.marinewaterway_gn_spelling OWNER TO elf_admin;

CREATE TABLE tnw.marinewaterway_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.marinewaterway ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.marinewaterway_post OWNER TO elf_admin;


CREATE TABLE tnw.restrictionforwatervehicles (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    measure numeric,
    measure_uom text,
    restrictiontype_nilreason text,
    restrictiontype_href text,
    CONSTRAINT restrictionforwatervehicles_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.restrictionforwatervehicles OWNER TO elf_admin;

CREATE TABLE tnw.restrictionforwatervehicles_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.restrictionforwatervehicles ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.restrictionforwatervehicles_networkref OWNER TO elf_admin;


CREATE TABLE tnw.trafficseparationschemecrossing (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT trafficseparationschemecrossing_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.trafficseparationschemecrossing OWNER TO elf_admin;

CREATE TABLE tnw.trafficseparationschemecrossing_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemecrossing ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.trafficseparationschemecrossing_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'trafficseparationschemecrossing','geometry','4258','GEOMETRY', 2);
CREATE INDEX trafficseparationschemecrossing_geometry_idx ON tnw.trafficseparationschemecrossing USING GIST (geometry);

CREATE TABLE tnw.trafficseparationschemecrossing_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemecrossing ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.trafficseparationschemecrossing_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.trafficseparationschemelane (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT trafficseparationschemelane_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.trafficseparationschemelane OWNER TO elf_admin;

CREATE TABLE tnw.trafficseparationschemelane_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemelane ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.trafficseparationschemelane_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'trafficseparationschemelane','geometry','4258','GEOMETRY', 2);
CREATE INDEX trafficseparationschemelane_geometry_idx ON tnw.trafficseparationschemelane USING GIST (geometry);

CREATE TABLE tnw.trafficseparationschemelane_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemelane ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.trafficseparationschemelane_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.trafficseparationschemeroundabout (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT trafficseparationschemeroundabout_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.trafficseparationschemeroundabout OWNER TO elf_admin;

CREATE TABLE tnw.trafficseparationschemeroundabout_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemeroundabout ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.trafficseparationschemeroundabout_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'trafficseparationschemeroundabout','geometry','4258','GEOMETRY', 2);
CREATE INDEX trafficseparationschemeroundabout_geometry_idx ON tnw.trafficseparationschemeroundabout USING GIST (geometry);

CREATE TABLE tnw.trafficseparationschemeroundabout_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemeroundabout ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.trafficseparationschemeroundabout_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.trafficseparationschemeseparator (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT trafficseparationschemeseparator_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.trafficseparationschemeseparator OWNER TO elf_admin;

CREATE TABLE tnw.trafficseparationschemeseparator_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemeseparator ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.trafficseparationschemeseparator_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'trafficseparationschemeseparator','geometry','4258','GEOMETRY', 2);
CREATE INDEX trafficseparationschemeseparator_geometry_idx ON tnw.trafficseparationschemeseparator USING GIST (geometry);

CREATE TABLE tnw.trafficseparationschemeseparator_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.trafficseparationschemeseparator ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.trafficseparationschemeseparator_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.waterlinksequence (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT waterlinksequence_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.waterlinksequence OWNER TO elf_admin;

CREATE TABLE tnw.waterlinksequence_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterlinksequence ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.waterlinksequence_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.waterlinksequence_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterlinksequence ON DELETE CASCADE,
    directedlink_direction text,
    directedlink_link_nilreason text,
    directedlink_link_href text
);
ALTER TABLE tnw.waterlinksequence_link OWNER TO elf_admin;

CREATE TABLE tnw.waterlinksequence_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterlinksequence ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.waterlinksequence_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.watertrafficflowdirection (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    direction_nilreason text,
    direction_href text,
    CONSTRAINT watertrafficflowdirection_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.watertrafficflowdirection OWNER TO elf_admin;

CREATE TABLE tnw.watertrafficflowdirection_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.watertrafficflowdirection ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.watertrafficflowdirection_networkref OWNER TO elf_admin;


CREATE TABLE tnw.waterwaylink (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
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
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT waterwaylink_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.waterwaylink OWNER TO elf_admin;

CREATE TABLE tnw.waterwaylink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaylink ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.waterwaylink_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'waterwaylink','geometry','4258','GEOMETRY', 2);
CREATE INDEX waterwaylink_geometry_idx ON tnw.waterwaylink USING GIST (geometry);

CREATE TABLE tnw.waterwaylink_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaylink ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.waterwaylink_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.waterwaynode (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    formofwaterwaynode_nilreason text,
    formofwaterwaynode_nil boolean,
    formofwaterwaynode_href text,
    CONSTRAINT waterwaynode_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.waterwaynode OWNER TO elf_admin;

CREATE TABLE tnw.waterwaynode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaynode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.waterwaynode_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'waterwaynode','geometry','4258','GEOMETRY', 2);
CREATE INDEX waterwaynode_geometry_idx ON tnw.waterwaynode USING GIST (geometry);

CREATE TABLE tnw.waterwaynode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaynode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.waterwaynode_spokeend OWNER TO elf_admin;

CREATE TABLE tnw.waterwaynode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaynode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.waterwaynode_spokestart OWNER TO elf_admin;

CREATE TABLE tnw.waterwaynode_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.waterwaynode ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.waterwaynode_gn_spelling OWNER TO elf_admin;


-- == ELF Water Transport Network ==

CREATE TABLE tnw.ferrycrossing (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    ferrycrossingidentifier text,
    internationalconnection boolean,
    CONSTRAINT ferrycrossing_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.ferrycrossing OWNER TO elf_admin;

CREATE TABLE tnw.ferrycrossing_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferrycrossing ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.ferrycrossing_innetwork OWNER TO elf_admin;

CREATE TABLE tnw.ferrycrossing_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferrycrossing ON DELETE CASCADE,
    nilreason text,
    remoteschema text,
    owns boolean,
    fk text,
    href text
);
ALTER TABLE tnw.ferrycrossing_link OWNER TO elf_admin;

CREATE TABLE tnw.ferrycrossing_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferrycrossing ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.ferrycrossing_gn_spelling OWNER TO elf_admin;

CREATE TABLE tnw.ferrycrossing_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.ferrycrossing ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.ferrycrossing_post OWNER TO elf_admin;


CREATE TABLE tnw.portarea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    area numeric,
    area_uom text,
    CONSTRAINT portarea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.portarea OWNER TO elf_admin;

CREATE TABLE tnw.portarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portarea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.portarea_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'portarea','geometry','4258','GEOMETRY', 2);
CREATE INDEX portarea_geometry_idx ON tnw.portarea USING GIST (geometry);

CREATE TABLE tnw.portarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portarea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.portarea_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.portnode (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_nil boolean,
    gn_nativeness_href text,
    gn_namestatus_nilreason text,
    gn_namestatus_nil boolean,
    gn_namestatus_href text,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    gn_grammaticalgender_nilreason text,
    gn_grammaticalgender_nil boolean,
    gn_grammaticalgender_href text,
    gn_grammaticalnumber_nilreason text,
    gn_grammaticalnumber_nil boolean,
    gn_grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    ferrystationidentifier text,
    locationcode text,
    CONSTRAINT portnode_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.portnode OWNER TO elf_admin;

CREATE TABLE tnw.portnode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portnode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.portnode_innetwork OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('tnw', 'portnode','geometry','4258','GEOMETRY', 2);
CREATE INDEX portnode_geometry_idx ON tnw.portnode USING GIST (geometry);

CREATE TABLE tnw.portnode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portnode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.portnode_spokeend OWNER TO elf_admin;

CREATE TABLE tnw.portnode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portnode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tnw.portnode_spokestart OWNER TO elf_admin;

CREATE TABLE tnw.portnode_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.portnode ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tnw.portnode_gn_spelling OWNER TO elf_admin;


CREATE TABLE tnw.porttype (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    porttype_nilreason text,
    porttype_fk text,
    porttype_href text,
    CONSTRAINT porttype_pkey PRIMARY KEY (localid)
);
ALTER TABLE tnw.porttype OWNER TO elf_admin;

CREATE TABLE tnw.porttype_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnw.porttype ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    networkreference_nilreason text,
    href text
);
ALTER TABLE tnw.porttype_networkref OWNER TO elf_admin;

