-- Schema: tnra

-- DROP SCHEMA tnra;

CREATE SCHEMA tnra AUTHORIZATION elf_admin;

COMMENT ON SCHEMA misc IS 'Schemata für Thema TransportNetwork-Rail';
  
-- == Tabellen =====

-- == tn-ra:DesignSpeed ================================  
CREATE TABLE tnra.designspeed (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    speed numeric,
    speed_uom text,
    CONSTRAINT designspeed_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.designspeed OWNER TO elf_admin;
CREATE INDEX designspeed_idx ON tnra.designspeed(id);

CREATE TABLE tnra.designspeed_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.designspeed ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.designspeed_networkref OWNER TO elf_admin;
CREATE INDEX designspeed_networkref_idx ON tnra.designspeed_networkref(id);
CREATE INDEX designspeed_networkref_parentfk_idx ON tnra.designspeed_networkref(parentfk);

-- == tn-ra:NominalTrackGauge ================================  
CREATE TABLE tnra.nominaltrackgauge (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    nominalgauge numeric,
    nominalgauge_nilreason text,
    nominalgauge_uom text,
    nominalgauge_xsi_nil boolean,
    nominalgaugecategory text,
    nominalgaugecategory_nilreason text,
    nominalgaugecategory_xsi_nil boolean,
    CONSTRAINT nominaltrackgauge_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.nominaltrackgauge OWNER TO elf_admin;
CREATE INDEX nominaltrackgauge_idx ON tnra.nominaltrackgauge(id);

CREATE TABLE tnra.nominaltrackgauge_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.nominaltrackgauge ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text);
ALTER TABLE tnra.nominaltrackgauge_networkref OWNER TO elf_admin;
CREATE INDEX nominaltrackgauge_networkref_idx ON tnra.nominaltrackgauge_networkref(id);
CREATE INDEX nominaltrackgauge_networkref_parentfk_idx ON tnra.nominaltrackgauge_networkref(parentfk);

-- == tn-ra:NumberOfTracks ================================  
CREATE TABLE tnra.numberoftracks (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    minmaxnumberoftracks text,
    minmaxnumberoftracks_nilreason text,
    minmaxnumberoftracks_xsi_nil boolean,
    numberoftracks integer,
    CONSTRAINT numberoftracks_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.numberoftracks OWNER TO elf_admin;
CREATE INDEX numberoftracks_idx ON tnra.numberoftracks(id);

CREATE TABLE tnra.numberoftracks_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.numberoftracks ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.numberoftracks_networkref OWNER TO elf_admin;
CREATE INDEX numberoftracks_networkref_idx ON tnra.numberoftracks_networkref(id);
CREATE INDEX numberoftracks_networkref_parentfk_idx ON tnra.numberoftracks_networkref(parentfk);

-- == tn-ra:RailwayArea ================================  
CREATE TABLE tnra.railwayarea (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_22 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    CONSTRAINT railwayarea_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwayarea OWNER TO elf_admin;
CREATE INDEX railwayarea_idx_idx ON tnra.railwayarea(id);

CREATE TABLE tnra.railwayarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayarea ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwayarea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwayarea_innetwork OWNER TO elf_admin;
CREATE INDEX railwayarea_innetwork_idx ON tnra.railwayarea_innetwork(id);
CREATE INDEX railwayarea_innetwork_parentfk_idx ON tnra.railwayarea_innetwork(parentfk);
CREATE INDEX railwayarea_geometry_idx ON tnra.railwayarea USING GIST (geometry);

CREATE TABLE tnra.railwayarea_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayarea ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwayarea_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwayarea_geographicalname_spelling_idx ON tnra.railwayarea_geographicalname_spelling(id);
CREATE INDEX railwayarea_geographicalname_spelling_parentfk_idx ON tnra.railwayarea_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayElectrification ================================  
CREATE TABLE tnra.railwayelectrification (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    electrified boolean,
    CONSTRAINT railwayelectrification_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwayelectrification OWNER TO elf_admin;
CREATE INDEX railwayelectrification_idx ON tnra.railwayelectrification(id);

CREATE TABLE tnra.railwayelectrification_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayelectrification ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.railwayelectrification_networkref OWNER TO elf_admin;
CREATE INDEX railwayelectrification_networkref_idx ON tnra.railwayelectrification_networkref(id);
CREATE INDEX railwayelectrification_networkref_parentfk_idx ON tnra.railwayelectrification_networkref(parentfk);

-- == tn-ra:RailwayLine ================================  
CREATE TABLE tnra.railwayline (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_16 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    railwaylinecode text,
    railwaylinecode_nilreason text,
    railwaylinecode_xsi_nil boolean,
    CONSTRAINT railwayline_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwayline OWNER TO elf_admin;
CREATE INDEX railwayline_idx ON tnra.railwayline(id);

CREATE TABLE tnra.railwayline_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayline ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwayline_innetwork OWNER TO elf_admin;
CREATE INDEX railwayline_innetwork_idx ON tnra.railwayline_innetwork(id);
CREATE INDEX railwayline_innetwork_parentfk_idx ON tnra.railwayline_innetwork(parentfk);

CREATE TABLE tnra.railwayline_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayline ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    remoteschema text,
    owns boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwayline_link OWNER TO elf_admin;
CREATE INDEX railwayline_link_idx ON tnra.railwayline_link(id);
CREATE INDEX railwayline_link_parentfk_idx ON tnra.railwayline_link(parentfk);

CREATE TABLE tnra.railwayline_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayline ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwayline_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwayline_geographicalname_spelling_idx ON tnra.railwayline_geographicalname_spelling(id);
CREATE INDEX railwayline_geographicalname_spelling_parentfk_idx ON tnra.railwayline_geographicalname_spelling(parentfk);

CREATE TABLE tnra.railwayline_tn_post (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayline ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwayline_tn_post OWNER TO elf_admin;
CREATE INDEX railwayline_tn_post_idx ON tnra.railwayline_tn_post(id);
CREATE INDEX railwayline_tn_post_parentfk_idx ON tnra.railwayline_tn_post(parentfk);

-- == tn-ra:RailwayLink ================================  
CREATE TABLE tnra.railwaylink (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    net_centrelinegeometry_nilreason text,
    net_centrelinegeometry_remoteschema text,
    net_centrelinegeometry_owns boolean,
    net_fictitious boolean,
    net_endnode_owns boolean,
    net_endnode_nilreason text,
    net_endnode_remoteschema text,
    net_endnode_fk text,
    net_endnode_href text,
    net_startnode_owns boolean,
    net_startnode_nilreason text,
    net_startnode_remoteschema text,
    net_startnode_fk text,
    net_startnode_href text,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_17 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    CONSTRAINT railwaylink_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaylink OWNER TO elf_admin;
CREATE INDEX railwaylink_idx ON tnra.railwaylink(id);

CREATE TABLE tnra.railwaylink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaylink ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwaylink','net_centrelinegeometry_value','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwaylink_innetwork OWNER TO elf_admin;
CREATE INDEX railwaylink_innetwork_idx ON tnra.railwaylink_innetwork(id);
CREATE INDEX railwaylink_innetwork_parentfk_idx ON tnra.railwaylink_innetwork(parentfk);
CREATE INDEX railwaylink_geometry_idx ON tnra.railwaylink USING GIST (net_centrelinegeometry_value);

CREATE TABLE tnra.railwaylink_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaylink ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwaylink_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwaylink_geographicalname_spelling_idx ON tnra.railwaylink_geographicalname_spelling(id);
CREATE INDEX railwaylink_geographicalname_spelling_parentfk_idx ON tnra.railwaylink_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayLinkSequence ================================  
CREATE TABLE tnra.railwaylinksequence (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_14 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    CONSTRAINT railwaylinksequence_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaylinksequence OWNER TO elf_admin;
CREATE INDEX railwaylinksequence_idx ON tnra.railwaylinksequence(id);

CREATE TABLE tnra.railwaylinksequence_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaylinksequence ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwaylinksequence_innetwork OWNER TO elf_admin;
CREATE INDEX railwaylinksequence_innetwork_idx ON tnra.railwaylinksequence_innetwork(id);
CREATE INDEX railwaylinksequence_innetwork_parentfk_idx ON tnra.railwaylinksequence_innetwork(parentfk);

CREATE TABLE tnra.railwaylinksequence_link (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaylinksequence ON DELETE CASCADE,
    num integer not null,
    net_directedlink_direction text,
    net_directedlink_link_owns boolean,
    net_directedlink_link_nilreason text,
    net_directedlink_link_remoteschema text,
    net_directedlink_link_fk text,
    net_directedlink_link_href text
);
ALTER TABLE tnra.railwaylinksequence_link OWNER TO elf_admin;
CREATE INDEX railwaylinksequence_link_idx ON tnra.railwaylinksequence_link(id);
CREATE INDEX railwaylinksequence_link_parentfk_idx ON tnra.railwaylinksequence_link(parentfk);

CREATE TABLE tnra.railwaylinksequence_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaylinksequence ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwaylinksequence_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwaylinksequence_geographicalname_spelling_idx ON tnra.railwaylinksequence_geographicalname_spelling(id);
CREATE INDEX railwaylinksequence_geographicalname_spelling_parentfk_idx ON tnra.railwaylinksequence_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayNode ================================  
CREATE TABLE tnra.railwaynode (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_19 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    formofnode_owns boolean,
    formofnode_nilreason text,
    formofnode_remoteschema text,
    formofnode_xsi_nil boolean,
    tn_ra_formofnode_fk text,
    formofnode_href text,
    CONSTRAINT railwaynode_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaynode OWNER TO elf_admin;
CREATE INDEX railwaynode_idx ON tnra.railwaynode(id);

CREATE TABLE tnra.railwaynode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaynode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwaynode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwaynode_innetwork OWNER TO elf_admin;
CREATE INDEX railwaynode_innetwork_idx ON tnra.railwaynode_innetwork(id);
CREATE INDEX railwaynode_innetwork_parentfk_idx ON tnra.railwaynode_innetwork(parentfk);
CREATE INDEX railwaynode_geometry_idx ON tnra.railwaynode USING GIST (geometry);

CREATE TABLE tnra.railwaynode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaynode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwaynode_spokeend OWNER TO elf_admin;
CREATE INDEX railwaynode_spokeend_idx ON tnra.railwaynode_spokeend(id);
CREATE INDEX railwaynode_spokeend_parentfk_idx ON tnra.railwaynode_spokeend(parentfk);

CREATE TABLE tnra.railwaynode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaynode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwaynode_spokestart OWNER TO elf_admin;
CREATE INDEX railwaynode_spokestart_idx ON tnra.railwaynode_spokestart(id);
CREATE INDEX railwaynode_spokestart_parentfk_idx ON tnra.railwaynode_spokestart(parentfk);

CREATE TABLE tnra.railwaynode_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaynode ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwaynode_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwaynode_geographicalname_spelling_idx ON tnra.railwaynode_geographicalname_spelling(id);
CREATE INDEX railwaynode_geographicalname_spelling_parentfk_idx ON tnra.railwaynode_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayStationArea ================================  
CREATE TABLE tnra.railwaystationarea (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_1 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    CONSTRAINT railwaystationarea_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaystationarea OWNER TO elf_admin;
CREATE INDEX railwaystationarea_idx ON tnra.railwaystationarea(id);

CREATE TABLE tnra.railwaystationarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationarea ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwaystationarea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwaystationarea_innetwork OWNER TO elf_admin;
CREATE INDEX railwaystationarea_innetwork_idx ON tnra.railwaystationarea_innetwork(id);
CREATE INDEX railwaystationarea_innetwork_parentfk_idx ON tnra.railwaystationarea_innetwork(parentfk);
CREATE INDEX railwaystationarea_geometry_idx ON tnra.railwaystationarea USING GIST (geometry);

CREATE TABLE tnra.railwaystationarea_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationarea ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwaystationarea_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwaystationarea_geographicalname_spelling_idx ON tnra.railwaystationarea_geographicalname_spelling(id);
CREATE INDEX railwaystationarea_geographicalname_spelling_parentfk_idx ON tnra.railwaystationarea_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayStationCode ================================  
CREATE TABLE tnra.railwaystationcode (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    stationcode text,
    CONSTRAINT railwaystationcode_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaystationcode OWNER TO elf_admin;
CREATE INDEX railwaystationcode_idx ON tnra.railwaystationcode(id);

CREATE TABLE tnra.railwaystationcode_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationcode ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.railwaystationcode_networkref OWNER TO elf_admin;
CREATE INDEX railwaystationcode_networkref_idx ON tnra.railwaystationcode_networkref(id);
CREATE INDEX railwaystationcode_networkref_parentfk_idx ON tnra.railwaystationcode_networkref(parentfk);

-- == tn-ra:RailwayStationNode ================================  
CREATE TABLE tnra.railwaystationnode (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_2 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    formofnode_owns boolean,
    formofnode_nilreason text,
    formofnode_remoteschema text,
    formofnode_xsi_nil boolean,
    tn_ra_formofnode_fk text,
    formofnode_href text,
    numberofplatforms integer,
    numberofplatforms_nilreason text,
    numberofplatforms_xsi_nil boolean,
    CONSTRAINT railwaystationnode_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaystationnode OWNER TO elf_admin;
CREATE INDEX railwaystationnode_idx ON tnra.railwaystationnode(id);

CREATE TABLE tnra.railwaystationnode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwaystationnode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwaystationnode_innetwork OWNER TO elf_admin;
CREATE INDEX railwaystationnode_innetwork_idx ON tnra.railwaystationnode_innetwork(id);
CREATE INDEX railwaystationnode_innetwork_parentfk_idx ON tnra.railwaystationnode_innetwork(parentfk);
CREATE INDEX railwaystationnode_geometry_idx ON tnra.railwaystationnode USING GIST (geometry);

CREATE TABLE tnra.railwaystationnode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwaystationnode_spokeend OWNER TO elf_admin;
CREATE INDEX railwaystationnode_spokeend_idx ON tnra.railwaystationnode_spokeend(id);
CREATE INDEX railwaystationnode_spokeend_parentfk_idx ON tnra.railwaystationnode_spokeend(parentfk);

CREATE TABLE tnra.railwaystationnode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwaystationnode_spokestart OWNER TO elf_admin;
CREATE INDEX railwaystationnode_spokestart_idx ON tnra.railwaystationnode_spokestart(id);
CREATE INDEX railwaystationnode_spokestart_parentfk_idx ON tnra.railwaystationnode_spokestart(parentfk);

CREATE TABLE tnra.railwaystationnode_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaystationnode ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwaynode_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwaynode_geographicalname_spelling_idx ON tnra.railwaynode_geographicalname_spelling(id);
CREATE INDEX railwaynode_geographicalname_spelling_parentfk_idx ON tnra.railwaynode_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayType ================================  
CREATE TABLE tnra.railwaytype (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    type_owns boolean,
    type_nilreason text,
    type_remoteschema text,
    tn_ra_type_fk text,
    type_href text,
    CONSTRAINT railwaytype_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaytype OWNER TO elf_admin;
CREATE INDEX railwaytype_idx ON tnra.railwaytype(id);

CREATE TABLE tnra.railwaytype_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwaytype ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.railwaytype_networkref OWNER TO elf_admin;
CREATE INDEX railwaytype_networkref_idx ON tnra.railwaytype_networkref(id);
CREATE INDEX railwaytype_networkref_parentfk_idx ON tnra.railwaytype_networkref(parentfk);

-- == tn-ra:RailwayUse ================================  
CREATE TABLE tnra.railwayuse (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    use_owns boolean,
    use_nilreason text,
    use_remoteschema text,
    tn_ra_use_fk text,
    use_href text,
    CONSTRAINT railwayuse_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwaytype OWNER TO elf_admin;
CREATE INDEX railwayuse_idx ON tnra.railwayuse(id);

CREATE TABLE tnra.railwayuse_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayuse ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.railwayuse_networkref OWNER TO elf_admin;
CREATE INDEX railwayuse_networkref_idx ON tnra.railwayuse_networkref(id);
CREATE INDEX railwayuse_networkref_parentfk_idx ON tnra.railwayuse_networkref(parentfk);

-- == tn-ra:RailwayYardArea ================================  
CREATE TABLE tnra.railwayyardarea (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_3 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    CONSTRAINT railwayyardarea_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwayyardarea OWNER TO elf_admin;
CREATE INDEX railwayyardarea_idx ON tnra.railwayuse(id);

CREATE TABLE tnra.railwayyardarea_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardarea ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwayyardarea','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwaystationnode_innetwork OWNER TO elf_admin;
CREATE INDEX railwayyardarea_innetwork_idx ON tnra.railwayyardarea_innetwork(id);
CREATE INDEX railwayyardarea_innetwork_parentfk_idx ON tnra.railwayyardarea_innetwork(parentfk);
CREATE INDEX railwayyardarea_innetwork_geometry_idx ON tnra.railwayyardarea_innetwork USING GIST (geometry);

CREATE TABLE tnra.railwayyardarea_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardarea ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwayyardarea_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwayyardarea_geographicalname_spelling_idx ON tnra.railwayyardarea_geographicalname_spelling(id);
CREATE INDEX railwayyardarea_geographicalname_spelling_parentfk_idx ON tnra.railwayyardarea_geographicalname_spelling(parentfk);

-- == tn-ra:RailwayYardNode ================================  
CREATE TABLE tnra.railwayyardnode (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_23 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    formofnode_owns boolean,
    formofnode_nilreason text,
    formofnode_remoteschema text,
    formofnode_xsi_nil boolean,
    tn_ra_formofnode_fk text,
    formofnode_href text,
    CONSTRAINT railwayyardnode_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.railwayyardnode OWNER TO elf_admin;
CREATE INDEX railwayyardnode_idx ON tnra.railwayyardnode(id);

CREATE TABLE tnra.railwayyardnode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'railwayyardnode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.railwayyardnode_innetwork OWNER TO elf_admin;
CREATE INDEX railwayyardnode_innetwork_idx ON tnra.railwayyardnode_innetwork(id);
CREATE INDEX railwayyardnode_innetwork_parentfk_idx ON tnra.railwayyardnode_innetwork(parentfk);
CREATE INDEX railwayyardnode_innetwork_geometry_idx ON tnra.railwayyardnode_innetwork USING GIST (geometry);

CREATE TABLE tnra.railwayyardnode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwayyardnode_spokeend OWNER TO elf_admin;
CREATE INDEX railwayyardnode_spokeend_idx ON tnra.railwayyardnode_spokeend(id);
CREATE INDEX railwayyardnode_spokeend_parentfk_idx ON tnra.railwayyardnode_spokeend(parentfk);

CREATE TABLE tnra.railwayyardnode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.railwayyardnode_spokestart OWNER TO elf_admin;
CREATE INDEX railwayyardnode_spokestart_idx ON tnra.railwayyardnode_spokestart(id);
CREATE INDEX railwayyardnode_spokestart_parentfk_idx ON tnra.railwayyardnode_spokestart(parentfk);

CREATE TABLE tnra.railwayyardnode_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.railwayyardnode ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.railwayyardnode_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX railwayyardnode_geographicalname_spelling_idx ON tnra.railwayyardnode_geographicalname_spelling(id);
CREATE INDEX railwayyardnode_geographicalname_spelling_parentfk_idx ON tnra.railwayyardnode_geographicalname_spelling(parentfk);

-- == elf-tn-ra:DesignSpeed ================================  
CREATE TABLE tnra.elf_tn_ra_designspeed (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    speed numeric,
    speed_uom text,
    elf_tn_ra_speedclass_owns boolean,
    elf_tn_ra_speedclass_nilreason text,
    elf_tn_ra_speedclass_remoteschema text,
    elf_tn_ra_speedclass_fk text,
    elf_tn_ra_speedclass_href text,
    CONSTRAINT elf_tn_ra_designspeed_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.elf_tn_ra_designspeed OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_designspeed_idx ON tnra.elf_tn_ra_designspeed(id);

CREATE TABLE tnra.elf_tn_ra_designspeed_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_designspeed ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.elf_tn_ra_designspeed_networkref OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_designspeed_networkref_idx ON tnra.elf_tn_ra_designspeed_networkref(id);
CREATE INDEX elf_tn_ra_designspeed_networkref_parentfk_idx ON tnra.elf_tn_ra_designspeed_networkref(parentfk);

-- == elf-tn-ra:RailwayClass ================================  
CREATE TABLE tnra.elf_tn_ra_railwayclass (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    elf_tn_ra_railwayclass_owns boolean,
    elf_tn_ra_railwayclass_nilreason text,
    elf_tn_ra_railwayclass_remoteschema text,
    elf_tn_ra_railwayclass_fk text,
    elf_tn_ra_railwayclass_href text,
    CONSTRAINT elf_tn_ra_railwayclass_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.elf_tn_ra_railwayclass OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwayclass_idx ON tnra.elf_tn_ra_railwayclass(id);

CREATE TABLE tnra.elf_tn_ra_railwayclass_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwayclass ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.elf_tn_ra_railwayclass_networkref OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwayclass_networkref_idx ON tnra.elf_tn_ra_railwayclass_networkref(id);
CREATE INDEX elf_tn_ra_designspeed_networkref_parentfk_idx ON tnra.elf_tn_ra_railwayclass_networkref(parentfk);

-- == elf-tn-ra:RailwayElectrification ================================  
CREATE TABLE tnra.elf_tn_ra_railwayelectrification (
    id text,
    identifier text,
    identifier_codespace text,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    electrified boolean,
    elf_tn_ra_railwaypowermethod_owns boolean,
    elf_tn_ra_railwaypowermethod_nilreason text,
    elf_tn_ra_railwaypowermethod_remoteschema text,
    elf_tn_ra_railwaypowermethod_fk text,
    elf_tn_ra_railwaypowermethod_href text,
    CONSTRAINT elf_tn_ra_railwayelectrification_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.elf_tn_ra_railwayelectrification OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwayelectrification_idx ON tnra.elf_tn_ra_railwayelectrification(id);

CREATE TABLE tnra.elf_tn_ra_railwayelectrification_networkref (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwayelectrification ON DELETE CASCADE,
    num integer not null,
    nilreason text,
    xsi_nil boolean,
    simlinearref_element_owns boolean,
    simlinearref_lement_nilreason text,
    simlinearref_element_remoteschema text,
    simlinearref_element_fk text,
    simlinearref_element_href text,
    simlinearref_applicabledirection_owns boolean,
    simlinearref_applicabledirection_nilreason text,
    simlinearref_applicabledirection_remoteschema text,
    simlinearref_applicabledirection_xsi_nil boolean,
    simlinearref_applicabledirection_fk text,
    simlinearref_applicabledirection_href text,
    simlinearref_fromposition numeric,
    simlinearref_fromposition_uom text,
    simlinearref_toposition numeric,
    simlinearref_toposition_uom text,
    simlinearref_offset numeric,
    simlinearref_offset_nilreason text,
    simlinearref_offset_uom text,
    simlinearref_offset_xsi_nil boolean,
    simpoiref_element_owns boolean,
    simpoiref_element_nilreason text,
    simpoiref_element_remoteschema text,
    simpoiref_element_fk text,
    simpoiref_element_href text,
    simpoiref_applicabledirection_owns boolean,
    simpoiref_applicabledirection_nilreason text,
    simpoiref_applicabledirection_remoteschema text,
    simpoiref_applicabledirection_xsi_nil boolean,
    simpoiref_applicabledirection_fk text,
    simpoiref_applicabledirection_href text,
    simpoiref_atposition numeric,
    simpoiref_atposition_uom text,
    simpoiref_offset numeric,
    simpoiref_offset_nilreason text,
    simpoiref_offset_uom text,
    simpoiref_offset_xsi_nil boolean,
    linkref_element_owns boolean,
    linkref_element_nilreason text,
    linkref_element_remoteschema text,
    linkref_element_fk text,
    linkref_element_href text,
    linkref_applicabledirection_owns boolean,
    linkref_applicabledirection_nilreason text,
    linkref_applicabledirection_remoteschema text,
    linkref_applicabledirection_xsi_nil boolean,
    linkref_applicabledirection_fk text,
    linkref_applicabledirection_href text,
    netref_element_owns boolean,
    netref_element_nilreason text,
    netref_element_remoteschema text,
    netref_netref_element_fk text,
    netref_element_href text
);
ALTER TABLE tnra.elf_tn_ra_railwayelectrification_networkref OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwayelectrification_networkref_idx ON tnra.elf_tn_ra_railwayelectrification_networkref(id);
CREATE INDEX elf_tn_ra_railwayelectrification_networkref_parentfk_idx ON tnra.elf_tn_ra_railwayelectrification_networkref(parentfk);

-- == elf-tn-ra:RailwayLink ================================  
CREATE TABLE tnra.elf_tn_ra_railwaylink (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    net_centrelinegeometry_nilreason text,
    net_centrelinegeometry_remoteschema text,
    net_centrelinegeometry_owns boolean,
    net_fictitious boolean,
    net_endnode_owns boolean,
    net_endnode_nilreason text,
    net_endnode_remoteschema text,
    net_endnode_fk text,
    net_endnode_href text,
    net_startnode_owns boolean,
    net_startnode_nilreason text,
    net_startnode_remoteschema text,
    net_startnode_fk text,
    net_startnode_href text,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_5 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    elf_tn_ra_transeuropeantransportnetwork boolean,
    CONSTRAINT elf_tn_ra_railwaylink_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.elf_tn_ra_railwaylink OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaylink_idx ON tnra.elf_tn_ra_railwaylink(id);

CREATE TABLE tnra.elf_tn_ra_railwaylink_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaylink ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'elf_tn_ra_railwaylink','net_centrelinegeometry_value','4258','GEOMETRY', 2);
ALTER TABLE tnra.elf_tn_ra_railwaylink_innetwork OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaylink_innetwork_idx ON tnra.elf_tn_ra_railwaylink_innetwork(id);
CREATE INDEX elf_tn_ra_railwaylink_innetwork_parentfk_idx ON tnra.elf_tn_ra_railwaylink_innetwork(parentfk);
CREATE INDEX elf_tn_ra_railwaylink_geometry_idx ON tnra.elf_tn_ra_railwaylink USING GIST (net_centrelinegeometry_value);

CREATE TABLE tnra.elf_tn_ra_railwaylink_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaylink ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.elf_tn_ra_railwaylink_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaylink_geographicalname_spelling_idx ON tnra.elf_tn_ra_railwaylink_geographicalname_spelling(id);
CREATE INDEX elf_tn_ra_railwaylink_geographicalname_spelling_parentfk_idx ON tnra.elf_tn_ra_railwaylink_geographicalname_spelling(parentfk);

-- == elf-tn-ra:RailwayStationNode ================================  
CREATE TABLE tnra.elf_tn_ra_railwaystationnode (
    id text,
    identifier text,
    identifier_codespace text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_xsi_nil boolean,
    identifier_localid text,
    identifier_namespace text,
    identifier_versionid text,
    identifier_versionid_nilreason text,
    identifier_versionid_xsi_nil boolean,
    geometry_nilreason text,
    geometry_remoteschema text,
    geometry_owns boolean,
    nilreason text,
    xsi_nil boolean,
    language text,
    language_nilreason text,
    language_xsi_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_xsi_nil boolean,
    geographicalname_nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_xsi_nil boolean,
    geographicalname_namestatus_fk text,
    namestatus_href text,
    sourceofname text,
    sourceofname_nilreason text,
    sourceofname_xsi_nil boolean,
    pronunciation_nilreason text,
    pronunciation_xsi_nil boolean,
    pronunciationofname_pronunciationsoundlink text,
    pronunciationofname_pronunciationsoundlink_nil_26 text,
    pronunciationofname_pronunciationsoundlink_xsi_nil boolean,
    pronunciationofname_pronunciationipa text,
    pronunciationofname_pronunciationipa_nilreason text,
    pronunciationofname_pronunciationipa_xsi_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_xsi_nil boolean,
    geographicalname_grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_xsi_nil boolean,
    geographicalname_grammaticalnumber_fk text,
    grammaticalnumber_href text,
    validfrom timestamp,
    validfrom_nilreason text,
    validfrom_xsi_nil boolean,
    validto timestamp,
    validto_nilreason text,
    validto_xsi_nil boolean,
    formofnode_owns boolean,
    formofnode_nilreason text,
    formofnode_remoteschema text,
    formofnode_xsi_nil boolean,
    tn_ra_formofnode_fk text,
    formofnode_href text,
    numberofplatforms integer,
    numberofplatforms_nilreason text,
    numberofplatforms_xsi_nil boolean,
    elf_tn_ra_facilitytype_owns boolean,
    elf_tn_ra_facilitytype_nilreason text,
    elf_tn_ra_facilitytype_remoteschema text,
    elf_tn_ra_facilitytype_fk text,
    elf_tn_ra_facilitytype_href text,
    CONSTRAINT elf_tn_ra_railwaystationnode_pkey PRIMARY KEY (id)
);
ALTER TABLE tnra.elf_tn_ra_railwaystationnode OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaystationnode_idx ON tnra.elf_tn_ra_railwaystationnode(id);

CREATE TABLE tnra.elf_tn_ra_railwaystationnode_innetwork (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
SELECT ADDGEOMETRYCOLUMN('tnra', 'elf_tn_ra_railwaystationnode','geometry','4258','GEOMETRY', 2);
ALTER TABLE tnra.elf_tn_ra_railwaystationnode_innetwork OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaystationnode_innetwork_idx ON tnra.elf_tn_ra_railwaystationnode_innetwork(id);
CREATE INDEX elf_tn_ra_railwaystationnode_innetwork_parentfk_idx ON tnra.elf_tn_ra_railwaystationnode_innetwork(parentfk);
CREATE INDEX elf_tn_ra_railwaystationnode_geometry_geometry_idx ON tnra.elf_tn_ra_railwaystationnode USING GIST (geometry);

CREATE TABLE tnra.elf_tn_ra_railwaystationnode_spokeend (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.elf_tn_ra_railwaystationnode_spokeend OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaystationnode_spokeend_idx ON tnra.elf_tn_ra_railwaystationnode_spokeend(id);
CREATE INDEX elf_tn_ra_railwaystationnode_spokeend_parentfk_idx ON tnra.elf_tn_ra_railwaystationnode_spokeend(parentfk);

CREATE TABLE tnra.elf_tn_ra_railwaystationnode_spokestart (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaystationnode ON DELETE CASCADE,
    num integer not null,
    owns boolean,
    nilreason text,
    remoteschema text,
    xsi_nil boolean,
    fk text,
    href text
);
ALTER TABLE tnra.elf_tn_ra_railwaystationnode_spokestart OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaystationnode_spokestart_idx ON tnra.elf_tn_ra_railwaystationnode_spokestart(id);
CREATE INDEX elf_tn_ra_railwaystationnode_spokestart_parentfk_idx ON tnra.elf_tn_ra_railwaystationnode_spokestart(parentfk);

CREATE TABLE tnra.elf_tn_ra_railwaystationnode_geographicalname_spelling (
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES tnra.elf_tn_ra_railwaystationnode ON DELETE CASCADE,
    num integer not null,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_xsi_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_xsi_nil boolean
);
ALTER TABLE tnra.elf_tn_ra_railwaystationnode_geographicalname_spelling OWNER TO elf_admin;
CREATE INDEX elf_tn_ra_railwaystationnode_geographicalname_spelling_idx ON tnra.elf_tn_ra_railwaystationnode_geographicalname_spelling(id);
CREATE INDEX elf_tn_ra_railwaystationnode_geographicalname_spelling_parentfk_idx ON tnra.elf_tn_ra_railwaystationnode_geographicalname_spelling(parentfk);