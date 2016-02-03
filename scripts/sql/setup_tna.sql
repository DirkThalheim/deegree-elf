-- Schema: tna

-- DROP SCHEMA tna;

CREATE SCHEMA tna
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA tna
  IS 'Schemata für Transport Network Air';

-- == AerodromeCategory ================================  
CREATE TABLE tna.aerodromecategory (
    id text,
    inspireid text,
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
    CONSTRAINT aerodromecategory_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.aerodromecategory OWNER TO elf_admin;
CREATE TABLE tna.aerodromecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodromecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.aerodromecategory_networkref OWNER TO elf_admin;

CREATE INDEX aerodromecategory_id_idx ON tna.aerodromecategory(id);
CREATE INDEX aerodromecategory_networkref_id_idx ON tna.aerodromecategory_networkref(id);
CREATE INDEX aerodromecategory_inetworkref_parentfk_idx ON tna.aerodromecategory_networkref (parentfk);

-- == AerodromeType ================================  
CREATE TABLE tna.aerodrometype (
    id text,
    inspireid text,
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
    CONSTRAINT aerodrometype_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.aerodrometype OWNER TO elf_admin;
CREATE TABLE tna.aerodrometype_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.aerodrometype ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.aerodrometype_networkref OWNER TO elf_admin;

CREATE INDEX aerodrometype_id_idx ON tna.aerodrometype(id);
CREATE INDEX aerodrometype_networkref_id_idx ON tna.aerodrometype_networkref(id);
CREATE INDEX aerodrometype_inetworkref_parentfk_idx ON tna.aerodrometype_networkref (parentfk);

-- == ConditionOfAirFacility ================================  
CREATE TABLE tna.conditionofairfacility (
    id text,
    inspireid text,
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
    CONSTRAINT conditionofairfacility_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.conditionofairfacility OWNER TO elf_admin;
CREATE TABLE tna.conditionofairfacility_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.conditionofairfacility ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.conditionofairfacility_networkref OWNER TO elf_admin;

CREATE INDEX conditionofairfacility_id_idx ON tna.conditionofairfacility(id);
CREATE INDEX conditionofairfacility_networkref_id_idx ON tna.conditionofairfacility_networkref(id);
CREATE INDEX conditionofairfacility_inetworkref_parentfk_idx ON tna.conditionofairfacility_networkref (parentfk);

-- == ElementLength ================================  
CREATE TABLE tna.elementlength (
    id text,
    inspireid text,
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
    CONSTRAINT elementlength_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.elementlength OWNER TO elf_admin;
CREATE TABLE tna.elementlength_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.elementlength ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.elementlength_networkref OWNER TO elf_admin;

CREATE INDEX elementlength_id_idx ON tna.elementlength(id);
CREATE INDEX elementlength_networkref_id_idx ON tna.elementlength_networkref(id);
CREATE INDEX elementlength_inetworkref_parentfk_idx ON tna.elementlength_networkref (parentfk);

-- == ElementWidth ================================  
CREATE TABLE tna.elementwidth (
    id text,
    inspireid text,
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
    CONSTRAINT elementwidth_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.elementwidth OWNER TO elf_admin;
CREATE TABLE tna.elementwidth_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.elementwidth ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.elementwidth_networkref OWNER TO elf_admin;

CREATE INDEX elementwidth_id_idx ON tna.elementwidth(id);
CREATE INDEX elementwidth_networkref_id_idx ON tna.elementwidth_networkref(id);
CREATE INDEX elementwidth_inetworkref_parentfk_idx ON tna.elementwidth_networkref (parentfk);

-- == FieldElevation ================================  
CREATE TABLE tna.fieldelevation (
    id text,
    inspireid text,
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
    CONSTRAINT fieldelevation_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.fieldelevation OWNER TO elf_admin;
CREATE TABLE tna.fieldelevation_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.fieldelevation ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.fieldelevation_networkref OWNER TO elf_admin;

CREATE INDEX fieldelevation_id_idx ON tna.fieldelevation(id);
CREATE INDEX fieldelevation_networkref_id_idx ON tna.fieldelevation_networkref(id);
CREATE INDEX fieldelevation_inetworkref_parentfk_idx ON tna.fieldelevation_networkref (parentfk);

-- == LowerAltitudeLimit ================================  
CREATE TABLE tna.loweraltitudelimit (
    id text,
    inspireid text,
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
    CONSTRAINT loweraltitudelimit_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.loweraltitudelimit OWNER TO elf_admin;
CREATE TABLE tna.loweraltitudelimit_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.loweraltitudelimit ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.loweraltitudelimit_networkref OWNER TO elf_admin;

CREATE INDEX loweraltitudelimit_id_idx ON tna.loweraltitudelimit(id);
CREATE INDEX loweraltitudelimit_networkref_id_idx ON tna.loweraltitudelimit_networkref(id);
CREATE INDEX loweraltitudelimit_inetworkref_parentfk_idx ON tna.loweraltitudelimit_networkref (parentfk);

-- == SurfaceComposition ================================  
CREATE TABLE tna.surfacecomposition (
    id text,
    inspireid text,
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
    CONSTRAINT surfacecomposition_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.surfacecomposition OWNER TO elf_admin;
CREATE TABLE tna.surfacecomposition_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.surfacecomposition ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.surfacecomposition_networkref OWNER TO elf_admin;

CREATE INDEX surfacecomposition_id_idx ON tna.surfacecomposition(id);
CREATE INDEX surfacecomposition_networkref_id_idx ON tna.surfacecomposition_networkref(id);
CREATE INDEX surfacecomposition_inetworkref_parentfk_idx ON tna.surfacecomposition_networkref (parentfk);

-- == UpperAltitudeLimit ================================  
CREATE TABLE tna.upperaltitudelimit (
    id text,
    inspireid text,
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
    CONSTRAINT upperaltitudelimit_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.upperaltitudelimit OWNER TO elf_admin;
CREATE TABLE tna.upperaltitudelimit_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.upperaltitudelimit ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.upperaltitudelimit_networkref OWNER TO elf_admin;

CREATE INDEX upperaltitudelimit_id_idx ON tna.upperaltitudelimit(id);
CREATE INDEX upperaltitudelimit_networkref_id_idx ON tna.upperaltitudelimit_networkref(id);
CREATE INDEX upperaltitudelimit_inetworkref_parentfk_idx ON tna.upperaltitudelimit_networkref (parentfk);

-- == UseRestriction ================================  
CREATE TABLE tna.userestriction (
    id text,
    inspireid text,
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
    CONSTRAINT userestriction_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.userestriction OWNER TO elf_admin;
CREATE TABLE tna.userestriction_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.userestriction ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.userestriction_networkref OWNER TO elf_admin;

CREATE INDEX userestriction_id_idx ON tna.userestriction(id);
CREATE INDEX userestriction_networkref_id_idx ON tna.userestriction_networkref(id);
CREATE INDEX userestriction_inetworkref_parentfk_idx ON tna.userestriction_networkref (parentfk);

-- == AirLinkSequence ================================  
CREATE TABLE tna.airlinksequence (
    id text,
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
    CONSTRAINT airlinksequence_pkey PRIMARY KEY (id)
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

CREATE INDEX airlinksequence_id_idx ON tna.airlinksequence(id);
CREATE INDEX airlinksequence_innetwork_id_idx ON tna.airlinksequence_innetwork(id);
CREATE INDEX airlinksequence_innetwork_parentfk_idx ON tna.airlinksequence_innetwork (parentfk);
CREATE INDEX airlinksequence_link_id_idx ON tna.airlinksequence_link(id);
CREATE INDEX airlinksequence_ilink_parentfk_idx ON tna.airlinksequence_link (parentfk);
CREATE INDEX airlinksequence_gn_spelling_id_idx ON tna.airlinksequence_gn_spelling(id);
CREATE INDEX airlinksequence_gn_spelling_parentfk_idx ON tna.airlinksequence_gn_spelling (parentfk);

-- == AirRoute ================================  
CREATE TABLE tna.airroute (
    id text,
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
    CONSTRAINT airroute_pkey PRIMARY KEY (id)
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

CREATE INDEX airroute_id_idx ON tna.airroute(id);
CREATE INDEX airroute_innetwork_id_idx ON tna.airroute_innetwork(id);
CREATE INDEX airroute_innetwork_parentfk_idx ON tna.airroute_innetwork (parentfk);
CREATE INDEX airroute_link_parentfk_idx ON tna.airroute_link (parentfk);
CREATE INDEX airroute_link_id_idx ON tna.airroute_link(id);
CREATE INDEX airroute_gn_spelling_id_idx ON tna.airroute_gn_spelling(id);
CREATE INDEX airroute_gn_spelling_parentfk_idx ON tna.airroute_gn_spelling (parentfk);
CREATE INDEX airroute_post_id_idx ON tna.airroute_post(id);
CREATE INDEX airroute_post_parentfk_idx ON tna.airroute_post (parentfk);

-- == AirRouteLink ================================  
CREATE TABLE tna.airroutelink (
    id text,
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
    CONSTRAINT airroutelink_pkey PRIMARY KEY (id)
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

CREATE INDEX airroutelink_id_idx ON tna.airroutelink(id);
CREATE INDEX airroutelink_geometry_idx ON tna.airroutelink USING GIST (centrelinegeometry);
CREATE INDEX airroutelink_innetwork_id_idx ON tna.airroutelink_innetwork(id);
CREATE INDEX airroutelink_innetwork_parentfk_idx ON tna.airroutelink_innetwork (parentfk);
CREATE INDEX airroutelink_gn_spelling_id_idx ON tna.airroutelink_gn_spelling(id);
CREATE INDEX airroutelink_gn_spelling_parentfk_idx ON tna.airroutelink_gn_spelling (parentfk);

-- == ProcedureLink ================================  
CREATE TABLE tna.procedurelink (
    id text,
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
    CONSTRAINT procedurelink_pkey PRIMARY KEY (id)
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

CREATE INDEX procedurelink_id_idx ON tna.procedurelink(id);
CREATE INDEX procedurelink_geometry_idx ON tna.procedurelink USING GIST (centrelinegeometry);
CREATE INDEX procedurelink_innetwork_id_idx ON tna.procedurelink_innetwork(id);
CREATE INDEX procedurelink_innetwork_parentfk_idx ON tna.procedurelink_innetwork (parentfk);
CREATE INDEX procedurelink_gn_spelling_id_idx ON tna.procedurelink_gn_spelling(id);
CREATE INDEX procedurelink_gn_spelling_parentfk_idx ON tna.procedurelink_gn_spelling (parentfk);

-- == AirspaceArea ================================  
CREATE TABLE tna.airspacearea (
    id text,
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
    CONSTRAINT airspacearea_pkey PRIMARY KEY (id)
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

CREATE INDEX airspacearea_id_idx ON tna.airspacearea(id);
CREATE INDEX airspacearea_geometry_idx ON tna.airspacearea USING GIST (geometry);
CREATE INDEX airspacearea_innetwork_id_idx ON tna.airspacearea_innetwork(id);
CREATE INDEX airspacearea_innetwork_parentfk_idx ON tna.airspacearea_innetwork (parentfk);
CREATE INDEX airspacearea_gn_spelling_id_idx ON tna.airspacearea_gn_spelling(id);
CREATE INDEX airspacearea_gn_spelling_parentfk_idx ON tna.airspacearea_gn_spelling (parentfk);

-- == ApronArea ================================  
CREATE TABLE tna.apronarea (
    id text,
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
    CONSTRAINT apronarea_pkey PRIMARY KEY (id)
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

CREATE INDEX apronarea_id_idx ON tna.apronarea(id);
CREATE INDEX apronarea_geometry_idx ON tna.apronarea USING GIST (geometry);
CREATE INDEX apronarea_innetwork_id_idx ON tna.apronarea_innetwork(id);
CREATE INDEX apronarea_innetwork_parentfk_idx ON tna.apronarea_innetwork (parentfk);
CREATE INDEX apronarea_gn_spelling_id_idx ON tna.apronarea_gn_spelling(id);
CREATE INDEX apronarea_gn_spelling_parentfk_idx ON tna.apronarea_gn_spelling (parentfk);

-- == RunwayArea ================================  
CREATE TABLE tna.runwayarea (
    id text,
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
    CONSTRAINT runwayarea_pkey PRIMARY KEY (id)
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

CREATE INDEX runwayarea_id_idx ON tna.runwayarea(id);
CREATE INDEX runwayarea_geometry_idx ON tna.runwayarea USING GIST (geometry);
CREATE INDEX runwayarea_innetwork_id_idx ON tna.runwayarea_innetwork(id);
CREATE INDEX runwayarea_innetwork_parentfk_idx ON tna.runwayarea_innetwork (parentfk);
CREATE INDEX runwayarea_gn_spelling_id_idx ON tna.runwayarea_gn_spelling(id);
CREATE INDEX runwayarea_gn_spelling_parentfk_idx ON tna.runwayarea_gn_spelling (parentfk);

-- == TaxiwayArea ================================  
CREATE TABLE tna.taxiwayarea (
    id text,
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
    CONSTRAINT taxiwayarea_pkey PRIMARY KEY (id)
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

CREATE INDEX taxiwayarea_id_idx ON tna.taxiwayarea(id);
CREATE INDEX taxiwayarea_geometry_idx ON tna.taxiwayarea USING GIST (geometry);
CREATE INDEX taxiwayarea_innetwork_id_idx ON tna.taxiwayarea_innetwork(id);
CREATE INDEX taxiwayarea_innetwork_parentfk_idx ON tna.taxiwayarea_innetwork (parentfk);
CREATE INDEX taxiwayarea_gn_spelling_id_idx ON tna.taxiwayarea_gn_spelling(id);
CREATE INDEX taxiwayarea_gn_spelling_parentfk_idx ON tna.taxiwayarea_gn_spelling (parentfk);

-- == DesignatedPoint ================================  
CREATE TABLE tna.designatedpoint (
    id text,
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
    CONSTRAINT designatedpoint_pkey PRIMARY KEY (id)
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

CREATE INDEX designatedpoint_id_idx ON tna.designatedpoint(id);
CREATE INDEX designatedpoint_geometry_idx ON tna.designatedpoint USING GIST (geometry);
CREATE INDEX designatedpoint_innetwork_id_idx ON tna.designatedpoint_innetwork(id);
CREATE INDEX designatedpoint_innetwork_parentfk_idx ON tna.designatedpoint_innetwork (parentfk);
CREATE INDEX designatedpoint_spokeend_id_idx ON tna.designatedpoint_spokeend(id);
CREATE INDEX designatedpoint_spokeend_parentfk_idx ON tna.designatedpoint_spokeend (parentfk);
CREATE INDEX designatedpoint_spokestart_id_idx ON tna.designatedpoint_spokestart(id);
CREATE INDEX designatedpoint_spokestart_parentfk_idx ON tna.designatedpoint_spokestart (parentfk);
CREATE INDEX designatedpoint_gn_spelling_id_idx ON tna.designatedpoint_gn_spelling(id);
CREATE INDEX designatedpoint_gn_spelling_parentfk_idx ON tna.designatedpoint_gn_spelling (parentfk);

-- == InstrumentApproachProcedure ================================  
CREATE TABLE tna.instrumentapproachprocedure (
    id text,
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
    CONSTRAINT instrumentapproachprocedure_pkey PRIMARY KEY (id)
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

CREATE INDEX instrumentapproachprocedure_id_idx ON tna.instrumentapproachprocedure(id);
CREATE INDEX instrumentapproachprocedure_centrelinegeometry_idx ON tna.instrumentapproachprocedure USING GIST (centrelinegeometry);
CREATE INDEX instrumentapproachprocedure_innetwork_id_idx ON tna.instrumentapproachprocedure_innetwork(id);
CREATE INDEX instrumentapproachprocedure_innetwork_parentfk_idx ON tna.instrumentapproachprocedure_innetwork (parentfk);
CREATE INDEX instrumentapproachprocedure_gn_spelling_id_idx ON tna.instrumentapproachprocedure_gn_spelling(id);
CREATE INDEX instrumentapproachprocedure_gn_spelling_parentfk_idx ON tna.instrumentapproachprocedure_gn_spelling (parentfk);

-- == Navaid ================================  
CREATE TABLE tna.navaid (
    id text,
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
    CONSTRAINT navaid_pkey PRIMARY KEY (id)
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

CREATE INDEX navaid_id_idx ON tna.navaid(id);
CREATE INDEX navaid_geometry_idx ON tna.navaid USING GIST (geometry);
CREATE INDEX navaid_innetwork_id_idx ON tna.navaid_innetwork(id);
CREATE INDEX navaid_innetwork_parentfk_idx ON tna.navaid_innetwork (parentfk);
CREATE INDEX navaid_spokeend_id_idx ON tna.navaid_spokeend(id);
CREATE INDEX navaid_spokeend_parentfk_idx ON tna.navaid_spokeend (parentfk);
CREATE INDEX navaid_spokestart_id_idx ON tna.navaid_spokestart(id);
CREATE INDEX navaid_spokestart_parentfk_idx ON tna.navaid_spokestart (parentfk);
CREATE INDEX navaid_gn_spelling_id_idx ON tna.navaid_gn_spelling(id);
CREATE INDEX navaid_gn_spelling_parentfk_idx ON tna.navaid_gn_spelling (parentfk);

-- == RunwayCentrelinePoint ================================  
CREATE TABLE tna.runwaycentrelinepoint (
    id text,
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
    CONSTRAINT runwaycentrelinepoint_pkey PRIMARY KEY (id)
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

CREATE INDEX runwaycentrelinepoint_id_idx ON tna.runwaycentrelinepoint(id);
CREATE INDEX runwaycentrelinepoint_geometry_idx ON tna.runwaycentrelinepoint USING GIST (geometry);
CREATE INDEX runwaycentrelinepoint_innetwork_id_idx ON tna.runwaycentrelinepoint_innetwork(id);
CREATE INDEX runwaycentrelinepoint_innetwork_parentfk_idx ON tna.runwaycentrelinepoint_innetwork (parentfk);
CREATE INDEX runwaycentrelinepoint_spokeend_id_idx ON tna.runwaycentrelinepoint_spokeend(id);
CREATE INDEX runwaycentrelinepoint_spokeend_parentfk_idx ON tna.runwaycentrelinepoint_spokeend (parentfk);
CREATE INDEX runwaycentrelinepoint_spokestart_id_idx ON tna.runwaycentrelinepoint_spokestart(id);
CREATE INDEX runwaycentrelinepoint_spokestart_parentfk_idx ON tna.runwaycentrelinepoint_spokestart (parentfk);
CREATE INDEX runwaycentrelinepoint_gn_spelling_id_idx ON tna.runwaycentrelinepoint_gn_spelling(id);
CREATE INDEX runwaycentrelinepoint_gn_spelling_parentfk_idx ON tna.runwaycentrelinepoint_gn_spelling (parentfk);

-- == StandardInstrumentArrival ================================  
CREATE TABLE tna.standardinstrumentarrival (
    id text,
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
    CONSTRAINT standardinstrumentarrival_pkey PRIMARY KEY (id)
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

CREATE INDEX standardinstrumentarrival_id_idx ON tna.standardinstrumentarrival(id);
CREATE INDEX standardinstrumentarrival_centrelinegeometry_idx ON tna.standardinstrumentarrival USING GIST (centrelinegeometry);
CREATE INDEX standardinstrumentarrival_innetwork_id_idx ON tna.standardinstrumentarrival_innetwork(id);
CREATE INDEX standardinstrumentarrival_innetwork_parentfk_idx ON tna.standardinstrumentarrival_innetwork (parentfk);
CREATE INDEX standardinstrumentarrival_gn_spelling_id_idx ON tna.standardinstrumentarrival_gn_spelling(id);
CREATE INDEX standardinstrumentarrival_gn_spelling_parentfk_idx ON tna.standardinstrumentarrival_gn_spelling (parentfk);

-- == StandardInstrumentDeparture ================================  
CREATE TABLE tna.standardinstrumentdeparture (
    id text,
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
    CONSTRAINT standardinstrumentdeparture_pkey PRIMARY KEY (id)
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

CREATE INDEX standardinstrumentdeparture_id_idx ON tna.standardinstrumentdeparture(id);
CREATE INDEX standardinstrumentdeparture_centrelinegeometry_idx ON tna.standardinstrumentdeparture USING GIST (centrelinegeometry);
CREATE INDEX standardinstrumentdeparture_innetwork_id_idx ON tna.standardinstrumentdeparture_innetwork(id);
CREATE INDEX standardinstrumentdeparture_innetwork_parentfk_idx ON tna.standardinstrumentdeparture_innetwork (parentfk);
CREATE INDEX standardinstrumentdeparture_gn_spelling_id_idx ON tna.standardinstrumentdeparture_gn_spelling(id);
CREATE INDEX standardinstrumentdeparture_gn_spelling_parentfk_idx ON tna.standardinstrumentdeparture_gn_spelling (parentfk);

-- == TouchDownLiftOff ================================  
CREATE TABLE tna.touchdownliftoff (
    id text,
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
    CONSTRAINT touchdownliftoff_pkey PRIMARY KEY (id)
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

CREATE INDEX touchdownliftoff_id_idx ON tna.touchdownliftoff(id);
CREATE INDEX touchdownliftoff_geometry_idx ON tna.touchdownliftoff USING GIST (geometry);
CREATE INDEX touchdownliftoff_innetwork_id_idx ON tna.touchdownliftoff_innetwork(id);
CREATE INDEX touchdownliftoff_iinnetwork_parentfk_idx ON tna.touchdownliftoff_innetwork (parentfk);
CREATE INDEX touchdownliftoff_spokeend_id_idx ON tna.touchdownliftoff_spokeend(id);
CREATE INDEX touchdownliftoff_spokeend_parentfk_idx ON tna.touchdownliftoff_spokeend (parentfk);
CREATE INDEX touchdownliftoff_spokestart_id_idx ON tna.touchdownliftoff_spokestart(id);
CREATE INDEX touchdownliftoff_spokestart_parentfk_idx ON tna.touchdownliftoff_spokestart (parentfk);
CREATE INDEX touchdownliftoff_gn_spelling_id_idx ON tna.touchdownliftoff_gn_spelling(id);
CREATE INDEX touchdownliftoff_gn_spelling_parentfk_idx ON tna.touchdownliftoff_gn_spelling (parentfk);

-- == AerodromeArea ================================  
CREATE TABLE tna.aerodromearea (
    id text,
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
    CONSTRAINT aerodromearea_pkey PRIMARY KEY (id)
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

CREATE INDEX aerodromearea_id_idx ON tna.aerodromearea(id);
CREATE INDEX aerodromearea_geometry_idx ON tna.aerodromearea USING GIST (geometry);
CREATE INDEX aerodromearea_innetwork_id_idx ON tna.aerodromearea_innetwork(id);
CREATE INDEX aerodromearea_innetwork_parentfk_idx ON tna.aerodromearea_innetwork (parentfk);
CREATE INDEX aerodromearea_gn_spelling_id_idx ON tna.aerodromearea_gn_spelling(id);
CREATE INDEX aerodromearea_gn_spelling_parentfk_idx ON tna.aerodromearea_gn_spelling (parentfk);

-- == AerodromeNode ================================  
CREATE TABLE tna.aerodromenode (
    id text,
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
    CONSTRAINT aerodromenode_pkey PRIMARY KEY (id)
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

CREATE INDEX aerodromenode_id_idx ON tna.aerodromenode(id);
CREATE INDEX aerodromenode_geometry_idx ON tna.aerodromenode USING GIST (geometry);
CREATE INDEX aerodromenode_innetwork_id_idx ON tna.aerodromenode_innetwork(id);
CREATE INDEX aerodromenode_innetwork_parentfk_idx ON tna.aerodromenode_innetwork (parentfk);
CREATE INDEX aerodromenode_spokeend_id_idx ON tna.aerodromenode_spokeend(id);
CREATE INDEX aerodromenode_spokeend_parentfk_idx ON tna.aerodromenode_spokeend (parentfk);
CREATE INDEX aerodromenode_spokestart_id_idx ON tna.aerodromenode_spokestart(id);
CREATE INDEX aerodromenode_spokestart_parentfk_idx ON tna.aerodromenode_spokestart (parentfk);
CREATE INDEX aerodromenode_gn_spelling_id_idx ON tna.aerodromenode_gn_spelling(id);
CREATE INDEX aerodromenode_gn_spelling_parentfk_idx ON tna.aerodromenode_gn_spelling (parentfk);
CREATE INDEX aerodromenode_controltowers_id_idx ON tna.aerodromenode_controltowers(id);
CREATE INDEX aerodromenode_controltowers_parentfk_idx ON tna.aerodromenode_controltowers (parentfk);

-- == FunctionalUseCategory ================================  
CREATE TABLE tna.functionalusecategory (
    id text,
    inspireid text,
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
    CONSTRAINT functionalusecategory_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.functionalusecategory OWNER TO elf_admin;
CREATE TABLE tna.functionalusecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.functionalusecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.functionalusecategory_networkref OWNER TO elf_admin;

CREATE INDEX functionalusecategory_id_idx ON tna.functionalusecategory(id);
CREATE INDEX functionalusecategory_networkref_id_idx ON tna.functionalusecategory_networkref(id);
CREATE INDEX functionalusecategory_networkref_parentfk_idx ON tna.functionalusecategory_networkref (parentfk);

-- == RunwayLine ================================  
CREATE TABLE tna.runwayline (
    id text,
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
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    inspireid text,
    length numeric,
    length_uom text,
    CONSTRAINT runwayline_pkey PRIMARY KEY (id)
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

CREATE INDEX runwayline_id_idx ON tna.runwayline(id);
CREATE INDEX runwayline_gn_spelling_id_idx ON tna.runwayline_gn_spelling(id);
CREATE INDEX runwayline_gn_ispelling_parentfk_idx ON tna.runwayline_gn_spelling (parentfk);
CREATE INDEX runwayline_geometry_idx ON tna.runwayline USING GIST (geometry);

-- == TransportationUseCategory ================================  
CREATE TABLE tna.transportationusecategory (
    id text,
    inspireid text,
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
    CONSTRAINT transportationusecategory_pkey PRIMARY KEY (id)
);
ALTER TABLE tna.transportationusecategory OWNER TO elf_admin;
CREATE TABLE tna.transportationusecategory_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tna.transportationusecategory ON DELETE CASCADE,
    nilreason text,
    networkreference_nilreason text,
    networkreference_href text
);
ALTER TABLE tna.transportationusecategory_networkref OWNER TO elf_admin;

CREATE INDEX transportationusecategory_id_idx ON tna.transportationusecategory(id);
CREATE INDEX transportationusecategory_networkref_id_idx ON tna.transportationusecategory_networkref(id);
CREATE INDEX transportationusecategory_inetworkref_parentfk_idx ON tna.transportationusecategory_networkref (parentfk);

