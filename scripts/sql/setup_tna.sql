-- Schema: tna

-- DROP SCHEMA tna CASCADE;

CREATE SCHEMA tna
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA tna
  IS 'Schemata für Transport Network Air';

  -- == INSPIRE Transport Network ==
CREATE TABLE tna.accessrestriction (
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
    restriction_owns boolean,
    restriction_nilreason text,
    restriction_remoteschema text,
    restriction_fk text,
    restriction_href text,
    CONSTRAINT accessrestriction_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.accessrestriction OWNER TO postgres;

CREATE TABLE tna.accessrestriction_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.accessrestriction ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    simplelinearreference_element_owns boolean,
    simplelinearreference_element_nilreason text,
    simplelinearreference_element_remoteschema text,
    simplelinearreference_element_fk text,
    simplelinearreference_element_href text,
    simplelinearreference_applicabledirection_owns boolean,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_remoteschema text,
    simplelinearreference_applicabledirection_nil boolean,
    simplelinearreference_applicabledirection_fk text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    simplepointreference_element_owns boolean,
    simplepointreference_element_nilreason text,
    simplepointreference_element_remoteschema text,
    simplepointreference_element_fk text,
    simplepointreference_element_href text,
    simplepointreference_applicabledirection_owns boolean,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_remoteschema text,
    simplepointreference_applicabledirection_nil boolean,
    simplepointreference_applicabledirection_fk text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean,
    linkreference_element_owns boolean,
    linkreference_element_nilreason text,
    linkreference_element_remoteschema text,
    linkreference_element_fk text,
    linkreference_element_href text,
    linkreference_applicabledirection_owns boolean,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_remoteschema text,
    linkreference_applicabledirection_nil boolean,
    linkreference_applicabledirection_fk text,
    linkreference_applicabledirection_href text,
    networkreference_element_owns boolean,
    networkreference_element_nilreason text,
    networkreference_element_remoteschema text,
    networkreference_element_fk text,
    networkreference_element_href text
);
ALTER TABLE tna.accessrestriction_networkref OWNER TO postgres;

CREATE TABLE tna.conditionoffacility (
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
    currentstatus_owns boolean,
    currentstatus_nilreason text,
    currentstatus_remoteschema text,
    currentstatus_fk text,
    currentstatus_href text,
    CONSTRAINT conditionoffacility_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.conditionoffacility OWNER TO postgres;

CREATE TABLE tna.conditionoffacility_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.conditionoffacility ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    simplelinearreference_element_owns boolean,
    simplelinearreference_element_nilreason text,
    simplelinearreference_element_remoteschema text,
    simplelinearreference_element_fk text,
    simplelinearreference_element_href text,
    simplelinearreference_applicabledirection_owns boolean,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_remoteschema text,
    simplelinearreference_applicabledirection_nil boolean,
    simplelinearreference_applicabledirection_fk text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    simplepointreference_element_owns boolean,
    simplepointreference_element_nilreason text,
    simplepointreference_element_remoteschema text,
    simplepointreference_element_fk text,
    simplepointreference_element_href text,
    simplepointreference_applicabledirection_owns boolean,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_remoteschema text,
    simplepointreference_applicabledirection_nil boolean,
    simplepointreference_applicabledirection_fk text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean,
    linkreference_element_owns boolean,
    linkreference_element_nilreason text,
    linkreference_element_remoteschema text,
    linkreference_element_fk text,
    linkreference_element_href text,
    linkreference_applicabledirection_owns boolean,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_remoteschema text,
    linkreference_applicabledirection_nil boolean,
    linkreference_applicabledirection_fk text,
    linkreference_applicabledirection_href text,
    networkreference_element_owns boolean,
    networkreference_element_nilreason text,
    networkreference_element_remoteschema text,
    networkreference_element_fk text,
    networkreference_element_href text
);
ALTER TABLE tna.conditionoffacility_networkref OWNER TO postgres;

CREATE TABLE tna.verticalposition (
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
    verticalposition text,
    CONSTRAINT verticalposition_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.verticalposition OWNER TO postgres;

CREATE TABLE tna.verticalposition_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.verticalposition ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    nil boolean,
    simplelinearreference_element_owns boolean,
    simplelinearreference_element_nilreason text,
    simplelinearreference_element_remoteschema text,
    simplelinearreference_element_fk text,
    simplelinearreference_element_href text,
    simplelinearreference_applicabledirection_owns boolean,
    simplelinearreference_applicabledirection_nilreason text,
    simplelinearreference_applicabledirection_remoteschema text,
    simplelinearreference_applicabledirection_nil boolean,
    simplelinearreference_applicabledirection_fk text,
    simplelinearreference_applicabledirection_href text,
    simplelinearreference_fromposition numeric,
    simplelinearreference_fromposition_uom text,
    simplelinearreference_toposition numeric,
    simplelinearreference_toposition_uom text,
    simplelinearreference_offset numeric,
    simplelinearreference_offset_nilreason text,
    simplelinearreference_offset_uom text,
    simplelinearreference_offset_nil boolean,
    simplepointreference_element_owns boolean,
    simplepointreference_element_nilreason text,
    simplepointreference_element_remoteschema text,
    simplepointreference_element_fk text,
    simplepointreference_element_href text,
    simplepointreference_applicabledirection_owns boolean,
    simplepointreference_applicabledirection_nilreason text,
    simplepointreference_applicabledirection_remoteschema text,
    simplepointreference_applicabledirection_nil boolean,
    simplepointreference_applicabledirection_fk text,
    simplepointreference_applicabledirection_href text,
    simplepointreference_atposition numeric,
    simplepointreference_atposition_uom text,
    simplepointreference_offset numeric,
    simplepointreference_offset_nilreason text,
    simplepointreference_offset_uom text,
    simplepointreference_offset_nil boolean,
    linkreference_element_owns boolean,
    linkreference_element_nilreason text,
    linkreference_element_remoteschema text,
    linkreference_element_fk text,
    linkreference_element_href text,
    linkreference_applicabledirection_owns boolean,
    linkreference_applicabledirection_nilreason text,
    linkreference_applicabledirection_remoteschema text,
    linkreference_applicabledirection_nil boolean,
    linkreference_applicabledirection_fk text,
    linkreference_applicabledirection_href text,
    networkreference_element_owns boolean,
    networkreference_element_nilreason text,
    networkreference_element_remoteschema text,
    networkreference_element_fk text,
    networkreference_element_href text
);
ALTER TABLE tna.verticalposition_networkref OWNER TO postgres;

-- == INSPIRE Transport Network Air ==

-- == AerodromeCategory ================================  
CREATE TABLE tna.aerodromecategory (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    aerodromecategory_nilreason text,
    aerodromecategory_href text,
    CONSTRAINT aerodromecategory_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.aerodromecategory OWNER TO elf_admin;

CREATE TABLE tna.aerodromecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text    
);
ALTER TABLE tna.aerodromecategory_networkref OWNER TO elf_admin;

-- == AerodromeType ================================  
CREATE TABLE tna.aerodrometype (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    aerodrometype_nilreason text,
    aerodrometype_href text,
    CONSTRAINT aerodrometype_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.aerodrometype OWNER TO elf_admin;

CREATE TABLE tna.aerodrometype_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodrometype ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.aerodrometype_networkref OWNER TO elf_admin;

-- == ConditionOfAirFacility ================================  
CREATE TABLE tna.conditionofairfacility (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    currentstatus_nilreason text,
    currentstatus_href text,
    CONSTRAINT conditionofairfacility_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.conditionofairfacility OWNER TO elf_admin;

CREATE TABLE tna.conditionofairfacility_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.conditionofairfacility ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.conditionofairfacility_networkref OWNER TO elf_admin;

-- == ElementLength ================================  
CREATE TABLE tna.elementlength (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    length numeric,
    length_uom text,
    CONSTRAINT elementlength_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.elementlength OWNER TO elf_admin;

CREATE TABLE tna.elementlength_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.elementlength ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.elementlength_networkref OWNER TO elf_admin;

-- == ElementWidth ================================  
CREATE TABLE tna.elementwidth (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    width numeric,
    width_uom text,
    CONSTRAINT elementwidth_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.elementwidth OWNER TO elf_admin;

CREATE TABLE tna.elementwidth_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.elementwidth ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.elementwidth_networkref OWNER TO elf_admin;

-- == FieldElevation ================================  
CREATE TABLE tna.fieldelevation (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    altitude numeric,
    altitude_uom text,
    CONSTRAINT fieldelevation_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.fieldelevation OWNER TO elf_admin;

CREATE TABLE tna.fieldelevation_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.fieldelevation ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.fieldelevation_networkref OWNER TO elf_admin;

-- == LowerAltitudeLimit ================================  
CREATE TABLE tna.loweraltitudelimit (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    altitude numeric,
    altitude_uom text,
    CONSTRAINT loweraltitudelimit_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.loweraltitudelimit OWNER TO elf_admin;

CREATE TABLE tna.loweraltitudelimit_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.loweraltitudelimit ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.loweraltitudelimit_networkref OWNER TO elf_admin;

-- == SurfaceComposition ================================  
CREATE TABLE tna.surfacecomposition (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    surfacecomposition_owns boolean,
    surfacecomposition_nilreason text,
    surfacecomposition_remoteschema text,
    surfacecomposition_fk text,
    surfacecomposition_href text,
    CONSTRAINT surfacecomposition_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.surfacecomposition OWNER TO elf_admin;

CREATE TABLE tna.surfacecomposition_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.surfacecomposition ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.surfacecomposition_networkref OWNER TO elf_admin;

-- == UpperAltitudeLimit ================================  
CREATE TABLE tna.upperaltitudelimit (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    altitude numeric,
    altitude_uom text,
    CONSTRAINT upperaltitudelimit_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.upperaltitudelimit OWNER TO elf_admin;

CREATE TABLE tna.upperaltitudelimit_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.upperaltitudelimit ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.upperaltitudelimit_networkref OWNER TO elf_admin;

-- == UseRestriction ================================  
CREATE TABLE tna.userestriction (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    restriction_nilreason text,
    restriction_href text,
    CONSTRAINT userestriction_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.userestriction OWNER TO elf_admin;

CREATE TABLE tna.userestriction_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.userestriction ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.userestriction_networkref OWNER TO elf_admin;

-- == AirLinkSequence ================================  
CREATE TABLE tna.airlinksequence (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_namestatus_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_sourceofname_nil boolean,
    gn_sourceofname_nilreason text,
    gn_sourceofname text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT airlinksequence_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.airlinksequence OWNER TO elf_admin;

CREATE TABLE tna.airlinksequence_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airlinksequence ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.airlinksequence_innetwork OWNER TO elf_admin;

CREATE TABLE tna.airlinksequence_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airlinksequence ON DELETE CASCADE,
    direction text,
    nilreason text,
    href text
);
ALTER TABLE tna.airlinksequence_link OWNER TO elf_admin;

CREATE TABLE tna.airlinksequence_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airlinksequence ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.airlinksequence_gn_spelling OWNER TO elf_admin;

-- == AirRoute ================================  
CREATE TABLE tna.airroute (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    airroutetype_nil boolean,
    airroutetype_nilreason text,
    airroutetype_href text,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT airroute_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.airroute OWNER TO elf_admin;

CREATE TABLE tna.airroute_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroute ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.airroute_innetwork OWNER TO elf_admin;

CREATE TABLE tna.airroute_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroute ON DELETE CASCADE,
    nilreason text,
    href text
);
ALTER TABLE tna.airroute_link OWNER TO elf_admin;

CREATE TABLE tna.airroute_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroute ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.airroute_gn_spelling OWNER TO elf_admin;

CREATE TABLE tna.airroute_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroute ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.airroute_post OWNER TO elf_admin;

-- == AirRouteLink ================================  
CREATE TABLE tna.airroutelink (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
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
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    airroutelinkclass_nil boolean,
    airroutelinkclass_nilreason text,
    airroutelinkclass_href text,
    CONSTRAINT airroutelink_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.airroutelink OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'airroutelink','centrelinegeometry','4258','GEOMETRY', 2);

CREATE TABLE tna.airroutelink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroutelink ON DELETE CASCADE,
    nil boolean,
    nilreason text,
    href text
);
ALTER TABLE tna.airroutelink_innetwork OWNER TO elf_admin;

CREATE TABLE tna.airroutelink_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airroutelink ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.airroutelink_gn_spelling OWNER TO elf_admin;

CREATE INDEX airroutelink_geometry_idx ON tna.airroutelink USING GIST (centrelinegeometry);

-- == ProcedureLink ================================  
CREATE TABLE tna.procedurelink (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
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
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT procedurelink_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.procedurelink OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'procedurelink','centrelinegeometry','4258','GEOMETRY', 2);

CREATE TABLE tna.procedurelink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.procedurelink ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.procedurelink_innetwork OWNER TO elf_admin;

CREATE TABLE tna.procedurelink_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.procedurelink ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.procedurelink_gn_spelling OWNER TO elf_admin;

CREATE INDEX procedurelink_geometry_idx ON tna.procedurelink USING GIST (centrelinegeometry);

-- == AirspaceArea ================================  
CREATE TABLE tna.airspacearea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    airspaceareatype_nilreason text,
    airspaceareatype_href text,
    CONSTRAINT airspacearea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.airspacearea OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'airspacearea','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.airspacearea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airspacearea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.airspacearea_innetwork OWNER TO elf_admin;

CREATE TABLE tna.airspacearea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.airspacearea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.airspacearea_gn_spelling OWNER TO elf_admin;

CREATE INDEX airspacearea_geometry_idx ON tna.airspacearea USING GIST (geometry);

-- == ApronArea ================================  
CREATE TABLE tna.apronarea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT apronarea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.apronarea OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'apronarea','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.apronarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.apronarea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.apronarea_innetwork OWNER TO elf_admin;

CREATE TABLE tna.apronarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.apronarea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.apronarea_gn_spelling OWNER TO elf_admin;

CREATE INDEX apronarea_geometry_idx ON tna.apronarea USING GIST (geometry);

-- == RunwayArea ================================  
CREATE TABLE tna.runwayarea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    designator_nil boolean,
    designator_nilreason text,
    designator text,
    runwaytype_nil boolean,
    runwaytype_nilreason text,
    runwaytype_href text,
    CONSTRAINT runwayarea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.runwayarea OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'runwayarea','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.runwayarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwayarea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.runwayarea_innetwork OWNER TO elf_admin;

CREATE TABLE tna.runwayarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwayarea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.runwayarea_gn_spelling OWNER TO elf_admin;

CREATE INDEX runwayarea_geometry_idx ON tna.runwayarea USING GIST (geometry);

-- == TaxiwayArea ================================  
CREATE TABLE tna.taxiwayarea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT taxiwayarea_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.taxiwayarea OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'taxiwayarea','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.taxiwayarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.taxiwayarea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.taxiwayarea_innetwork OWNER TO elf_admin;

CREATE TABLE tna.taxiwayarea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.taxiwayarea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.taxiwayarea_gn_spelling OWNER TO elf_admin;

CREATE INDEX taxiwayarea_geometry_idx ON tna.taxiwayarea USING GIST (geometry);

-- == DesignatedPoint ================================  
CREATE TABLE tna.designatedpoint (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    significantpoint boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT designatedpoint_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.designatedpoint OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'designatedpoint','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.designatedpoint_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.designatedpoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.designatedpoint_innetwork OWNER TO elf_admin;

CREATE TABLE tna.designatedpoint_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.designatedpoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.designatedpoint_spokeend OWNER TO elf_admin;

CREATE TABLE tna.designatedpoint_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.designatedpoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.designatedpoint_spokestart OWNER TO elf_admin;

CREATE TABLE tna.designatedpoint_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.designatedpoint ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.designatedpoint_gn_spelling OWNER TO elf_admin;

CREATE INDEX designatedpoint_geometry_idx ON tna.designatedpoint USING GIST (geometry);

-- == InstrumentApproachProcedure ================================  
CREATE TABLE tna.instrumentapproachprocedure (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
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
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    CONSTRAINT instrumentapproachprocedure_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.instrumentapproachprocedure OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'instrumentapproachprocedure','centrelinegeometry','4258','GEOMETRY', 2);

CREATE TABLE tna.instrumentapproachprocedure_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.instrumentapproachprocedure ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.instrumentapproachprocedure_innetwork OWNER TO elf_admin;

CREATE TABLE tna.instrumentapproachprocedure_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.instrumentapproachprocedure ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.instrumentapproachprocedure_gn_spelling OWNER TO elf_admin;

CREATE INDEX instrumentapproachprocedure_centrelinegeometry_idx ON tna.instrumentapproachprocedure USING GIST (centrelinegeometry);

-- == Navaid ================================  
CREATE TABLE tna.navaid (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    significantpoint boolean,
    navaidtype_nilreason text,
    navaidtype_href text,
    navaidtype_nil boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT navaid_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.navaid OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'navaid','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.navaid_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.navaid ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.navaid_innetwork OWNER TO elf_admin;

CREATE TABLE tna.navaid_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.navaid ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.navaid_spokeend OWNER TO elf_admin;

CREATE TABLE tna.navaid_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.navaid ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.navaid_spokestart OWNER TO elf_admin;

CREATE TABLE tna.navaid_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.navaid ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.navaid_gn_spelling OWNER TO elf_admin;

CREATE INDEX navaid_geometry_idx ON tna.navaid USING GIST (geometry);

-- == RunwayCentrelinePoint ================================  
CREATE TABLE tna.runwaycentrelinepoint (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    significantpoint boolean,
    pointrole_nilreason text,
    pointrole_href text,
    CONSTRAINT runwaycentrelinepoint_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.runwaycentrelinepoint OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'runwaycentrelinepoint','geometry','4258','GEOMETRY', 2);

CREATE TABLE tna.runwaycentrelinepoint_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwaycentrelinepoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.runwaycentrelinepoint_innetwork OWNER TO elf_admin;

CREATE TABLE tna.runwaycentrelinepoint_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwaycentrelinepoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.runwaycentrelinepoint_spokeend OWNER TO elf_admin;

CREATE TABLE tna.runwaycentrelinepoint_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwaycentrelinepoint ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.runwaycentrelinepoint_spokestart OWNER TO elf_admin;

CREATE TABLE tna.runwaycentrelinepoint_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwaycentrelinepoint ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.runwaycentrelinepoint_gn_spelling OWNER TO elf_admin;

CREATE INDEX runwaycentrelinepoint_geometry_idx ON tna.runwaycentrelinepoint USING GIST (geometry);

-- == StandardInstrumentArrival ================================  
CREATE TABLE tna.standardinstrumentarrival (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
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
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT standardinstrumentarrival_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.standardinstrumentarrival OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'standardinstrumentarrival','centrelinegeometry','4258','GEOMETRY', 2);

CREATE TABLE tna.standardinstrumentarrival_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.standardinstrumentarrival ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.standardinstrumentarrival_innetwork OWNER TO elf_admin;

CREATE TABLE tna.standardinstrumentarrival_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.standardinstrumentarrival ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.standardinstrumentarrival_gn_spelling OWNER TO elf_admin;

CREATE INDEX standardinstrumentarrival_centrelinegeometry_idx ON tna.standardinstrumentarrival USING GIST (centrelinegeometry);

-- == StandardInstrumentDeparture ================================  
CREATE TABLE tna.standardinstrumentdeparture (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    centrelinegeometry_nilreason text,
    centrelinegeometry_remoteschema text,
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
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT standardinstrumentdeparture_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.standardinstrumentdeparture OWNER TO elf_admin;
SELECT ADDGEOMETRYCOLUMN('tna', 'standardinstrumentdeparture','centrelinegeometry','4258','GEOMETRY', 2);

CREATE TABLE tna.standardinstrumentdeparture_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.standardinstrumentdeparture ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.standardinstrumentdeparture_innetwork OWNER TO elf_admin;

CREATE TABLE tna.standardinstrumentdeparture_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.standardinstrumentdeparture ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.standardinstrumentdeparture_gn_spelling OWNER TO elf_admin;

CREATE INDEX standardinstrumentdeparture_centrelinegeometry_idx ON tna.standardinstrumentdeparture USING GIST (centrelinegeometry);

-- == TouchDownLiftOff ================================  
CREATE TABLE tna.touchdownliftoff (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    significantpoint boolean,
    designator text,
    designator_nilreason text,
    designator_nil boolean,
    CONSTRAINT touchdownliftoff_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('tna', 'touchdownliftoff','geometry','4258','GEOMETRY', 2);
ALTER TABLE tna.touchdownliftoff OWNER TO elf_admin;

CREATE TABLE tna.touchdownliftoff_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.touchdownliftoff ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.touchdownliftoff_innetwork OWNER TO elf_admin;

CREATE TABLE tna.touchdownliftoff_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.touchdownliftoff ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.touchdownliftoff_spokeend OWNER TO elf_admin;

CREATE TABLE tna.touchdownliftoff_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.touchdownliftoff ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.touchdownliftoff_spokestart OWNER TO elf_admin;

CREATE TABLE tna.touchdownliftoff_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.touchdownliftoff ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.touchdownliftoff_gn_spelling OWNER TO elf_admin;

CREATE INDEX touchdownliftoff_geometry_idx ON tna.touchdownliftoff USING GIST (geometry);

-- == AerodromeArea ================================  
CREATE TABLE tna.aerodromearea (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    area numeric,
    area_uom text,
    transeuropeantransportnetwork boolean,
    CONSTRAINT aerodromearea_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('tna', 'aerodromearea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tna.aerodromearea OWNER TO elf_admin;

CREATE TABLE tna.aerodromearea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromearea ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.aerodromearea_innetwork OWNER TO elf_admin;

CREATE TABLE tna.aerodromearea_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromearea ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.aerodromearea_gn_spelling OWNER TO elf_admin;

CREATE INDEX aerodromearea_geometry_idx ON tna.aerodromearea USING GIST (geometry);

-- == AerodromeNode ================================  
CREATE TABLE tna.aerodromenode (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    inspireid text,
    geometry_nilreason text,
    geometry_remoteschema text,
    gn_nilreason text,
    gn_nil boolean,
    gn_language text,
    gn_language_nilreason text,
    gn_language_nil boolean,
    gn_nativeness_nilreason text,
    gn_nativeness_href text,
    gn_nativeness_nil boolean,
    gn_namestatus_nilreason text,
    gn_namestatus_href text,
    gn_namestatus_nil boolean,
    gn_sourceofname text,
    gn_sourceofname_nilreason text,
    gn_sourceofname_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    significantpoint boolean,
    designatoriata text,
    designatoriata_nilreason text,
    designatoriata_nil boolean,
    locationindicatoricao text,
    locationindicatoricao_nilreason text,
    locationindicatoricao_nil boolean,
    transeuropeantransportnetwork boolean,
    CONSTRAINT aerodromenode_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('tna', 'aerodromenode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tna.aerodromenode OWNER TO elf_admin;

CREATE TABLE tna.aerodromenode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromenode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.aerodromenode_innetwork OWNER TO elf_admin;

CREATE TABLE tna.aerodromenode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromenode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.aerodromenode_spokeend OWNER TO elf_admin;

CREATE TABLE tna.aerodromenode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromenode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.aerodromenode_spokestart OWNER TO elf_admin;

CREATE TABLE tna.aerodromenode_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromenode ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.aerodromenode_gn_spelling OWNER TO elf_admin;

CREATE TABLE tna.aerodromenode_controltowers (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromenode ON DELETE CASCADE,
    nilreason text,
    href text,
    nil boolean
);
ALTER TABLE tna.aerodromenode_controltowers OWNER TO elf_admin;

CREATE INDEX aerodromenode_geometry_idx ON tna.aerodromenode USING GIST (geometry);

-- == FunctionalUseCategory ================================  
CREATE TABLE tna.functionalusecategory (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    functionalusecategory_nilreason text,
    functionalusecategory_href text,
    CONSTRAINT functionalusecategory_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.functionalusecategory OWNER TO elf_admin;

CREATE TABLE tna.functionalusecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.functionalusecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.functionalusecategory_networkref OWNER TO elf_admin;

-- == RunwayLine ================================  
CREATE TABLE tna.runwayline (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    length numeric,
    length_uom text,
    CONSTRAINT runwayline_pkey PRIMARY KEY (localid)
);
SELECT ADDGEOMETRYCOLUMN('tna', 'runwayline','geometry','4258','GEOMETRY', 2);
ALTER TABLE tna.runwayline OWNER TO elf_admin;

CREATE TABLE tna.runwayline_gn_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.runwayline ON DELETE CASCADE,
    text text,
    script text,
    script_nilreason text,
    script_nil boolean,
    transliterationscheme text,
    transliterationscheme_nilreason text,
    transliterationscheme_nil boolean
);
ALTER TABLE tna.runwayline_gn_spelling OWNER TO elf_admin;

CREATE INDEX runwayline_geometry_idx ON tna.runwayline USING GIST (geometry);

-- == TransportationUseCategory ================================  
CREATE TABLE tna.transportationusecategory (
    localid text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_nil boolean,
    transportationusecategory_nilreason text,
    transportationusecategory_href text,
    CONSTRAINT transportationusecategory_pkey PRIMARY KEY (localid)
);
ALTER TABLE tna.transportationusecategory OWNER TO elf_admin;

CREATE TABLE tna.transportationusecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.transportationusecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text,
    networkreference_element_fk text
);
ALTER TABLE tna.transportationusecategory_networkref OWNER TO elf_admin;

