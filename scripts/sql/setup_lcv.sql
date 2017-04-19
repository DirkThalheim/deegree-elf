-- Schema: lcv (landcover)

-- DROP SCHEMA lcv;

CREATE SCHEMA lcv AUTHORIZATION elf_admin;

COMMENT ON SCHEMA lcv IS 'Schemata für Landcover';

-- == Tabellen LandcoverDataset =======
CREATE TABLE lcv.landcoverdataset (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    name text,
    validfrom date,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto date,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT landcoverdataset_pkey PRIMARY KEY (localid)
);

CREATE TABLE lcv.landcoverdataset_member (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES lcv.landcoverdataset ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    remoteschema text,
    owns boolean,
    fk text,
    href text
);

ALTER TABLE lcv.landcoverdataset OWNER TO elf_admin;
ALTER TABLE lcv.landcoverdataset_member OWNER TO elf_admin;

-- == Tabellen LandcoverUnit =======
CREATE TABLE lcv.landcoverunit (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    CONSTRAINT landcoverunit_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('lcv', 'landcoverunit','geometry','4258','GEOMETRY', 2);

CREATE TABLE lcv.landcoverunit_landcoverobservation (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES lcv.landcoverunit ON DELETE CASCADE,
    num integer not null,
    class_owns boolean,
    class_nilreason text,
    class_remoteschema text,
    class_fk text,
    class_href text,
    observationdate timestamp,
    observationdate_nilreason text,
    observationdate_nil boolean
);
CREATE TABLE lcv.landcoverunit_mosaic (
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES lcv.landcoverunit_landcoverobservation ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    landcovervalue_class_owns boolean,
    landcovervalue_class_nilreason text,
    landcovervalue_class_remoteschema text,
    landcovervalue_class_fk text,
    landcovervalue_class_href text,
    landcovervalue_coveredpercentage integer,
    landcovervalue_coveredpercentage_nilreason text,
    landcovervalue_coveredpercentage_nil boolean
);

ALTER TABLE lcv.landcoverunit OWNER TO elf_admin;
ALTER TABLE lcv.landcoverunit_landcoverobservation OWNER TO elf_admin;
ALTER TABLE lcv.landcoverunit_mosaic OWNER TO elf_admin;

CREATE INDEX landcoverunit_gemotry_idx ON lcv.landcoverunit USING GIST (geometry);
