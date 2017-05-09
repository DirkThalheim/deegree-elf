-- Schema: lcv (landcover)

-- DROP SCHEMA lcv;

CREATE SCHEMA lcv AUTHORIZATION elf_admin;

COMMENT ON SCHEMA lcv IS 'INSPIRE Schemata für Landcover';


-- == lcv:LandCoverDataset ==
CREATE TABLE lcv.landcoverdataset (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    name text,
    nomenclaturecodelist text, -- normalize?
    nomenclature_responsible_individual text, -- normalize?
    nomenclature_responsible_individual_nilreason text, -- normalize?
    nomenclature_responsible_organisation text, -- normalize?
    nomenclature_responsible_organisation_nilreason text, -- normalize?
    nomenclature_responsible_position text, -- normalize?
    nomenclature_responsible_position_nilreason text, -- normalize?
    nomenclature_responsible_role text, -- normalize?
    nomenclature_responsible_role_nilreason text, -- normalize?
    validfrom date,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto date,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT landcoverdataset_pkey PRIMARY KEY (localid)
);
ALTER TABLE lcv.landcoverdataset OWNER TO elf_admin;

CREATE TABLE lcv.landcoverdataset_member (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES lcv.landcoverdataset ON DELETE CASCADE,
    nilreason text,
    landcoverunit_fk text,
    href text
);
ALTER TABLE lcv.landcoverdataset_member OWNER TO elf_admin;


-- == lcv:LandCoverUnit ==
CREATE TABLE lcv.landcoverunit (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    CONSTRAINT landcoverunit_pkey PRIMARY KEY (localid)
);
ALTER TABLE lcv.landcoverunit OWNER TO elf_admin;

SELECT ADDGEOMETRYCOLUMN('lcv', 'landcoverunit','geometry','4258','GEOMETRY', 2);
CREATE INDEX landcoverunit_geometry_idx ON lcv.landcoverunit USING GIST (geometry);

CREATE TABLE lcv.landcoverunit_landcoverobservation (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES lcv.landcoverunit ON DELETE CASCADE,
    class_nilreason text,
    class_href text,
    observationdate timestamp,
    observationdate_nilreason text,
    observationdate_nil boolean
);
ALTER TABLE lcv.landcoverunit_landcoverobservation OWNER TO elf_admin;

CREATE TABLE lcv.landcoverunit_landcoverobservation_mosaic (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES lcv.landcoverunit_landcoverobservation ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    landcovervalue_class_nilreason text,
    landcovervalue_class_href text,
    landcovervalue_coveredpercentage integer,
    landcovervalue_coveredpercentage_nilreason text,
    landcovervalue_coveredpercentage_nil boolean
);
ALTER TABLE lcv.landcoverunit_landcoverobservation_mosaic OWNER TO elf_admin;

