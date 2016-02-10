-- Schema: bu

-- DROP SCHEMA bu;

CREATE SCHEMA bu
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA bu
  IS 'Schemata für Building Units';
  
-- Schema: bu

-- DROP SCHEMA bu;

CREATE SCHEMA bu
  AUTHORIZATION elf_admin;

COMMENT ON SCHEMA bu
  IS 'Schemata für Building Units';
  
CREATE TABLE bu.building (
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    conditionofconstruction_owns boolean,
    conditionofconstruction_nilreason text,
    conditionofconstruction_remoteschema text,
    conditionofconstruction_nil boolean,
    conditionofconstruction_fk text,
    conditionofconstruction_href text,
    dateofconstruction_nilreason text,
    dateofconstruction_nil boolean,
    dateofconstruction_anypoint timestamp,
    dateofconstruction_anypoint_nilreason text,
    dateofconstruction_anypoint_nil boolean,
    dateofconstruction_beginning timestamp,
    dateofconstruction_beginning_nilreason text,
    dateofconstruction_beginning_nil boolean,
    dateofconstruction_end timestamp,
    dateofconstruction_end_nilreason text,
    dateofconstruction_end_nil boolean,
    dateofdemolition_nilreason text,
    dateofdemolition_nil boolean,
    dateofdemolition_anypoint timestamp,
    dateofdemolition_anypoint_nilreason text,
    dateofdemolition_anypoint_nil boolean,
    dateofdemolition_beginning timestamp,
    dateofdemolition_beginning_nilreason text,
    dateofdemolition_beginning_nil boolean,
    dateofdemolition_end timestamp,
    dateofdemolition_end_nilreason text,
    dateofdemolition_end_nil boolean,
    dateofrenovation_nilreason text,
    dateofrenovation_nil boolean,
    dateofrenovation_anypoint timestamp,
    dateofrenovation_anypoint_nilreason text,
    dateofrenovation_anypoint_nil boolean,
    dateofrenovation_beginning timestamp,
    dateofrenovation_beginning_nilreason text,
    dateofrenovation_beginning_nil boolean,
    dateofrenovation_end timestamp,
    dateofrenovation_end_nilreason text,
    dateofrenovation_end_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    inspireid_localid text,
    numberofdwellings integer,
    numberofdwellings_nilreason text,
    numberofdwellings_nil boolean,
    numberofbuildingunits integer,
    numberofbuildingunits_nilreason text,
    numberofbuildingunits_nil boolean,
    numberoffloorsaboveground integer,
    numberoffloorsaboveground_nilreason text,
    numberoffloorsaboveground_nil boolean,
    geometry_nilreason text,
    geometry2d_referencegeometry boolean,
    geometry2d_horizontalgeometryreference_owns boolean,
    geometry2d_horizontalgeometryreference_nilreason text,
    geometry2d_horizontalgeometryreference_remoteschema text,
    geometry2d_horizontalgeometryreference_fk text,
    geometry2d_horizontalgeometryreference_href text,
    geometry2d_verticalgeometryreference_owns boolean,
    geometry2d_verticalgeometryreference_nilreason text,
    geometry2d_verticalgeometryreference_remoteschema text,
    geometry2d_verticalgeometryreference_fk text,
    geometry2d_verticalgeometryreference_href text,
    geometry2d_horizontalgeometryestimatedaccuracy numeric,
    geometry2d_horizontalgeometryestimatedaccuracy_nilreason text,
    geometry2d_horizontalgeometryestimatedaccuracy_uom text,
    geometry2d_horizontalgeometryestimatedaccuracy_nil boolean,
    geometry2d_verticalgeometryestimatedaccuracy numeric,
    geometry2d_verticalgeometryestimatedaccuracy_nilreason text,
    geometry2d_verticalgeometryestimatedaccuracy_uom text,
    geometry2d_verticalgeometryestimatedaccuracy_nil boolean,
    CONSTRAINT building_pkey PRIMARY KEY (id)
);
ALTER TABLE bu.building OWNER TO elf_admin;
CREATE INDEX building_id_idx ON bu.building(id);

CREATE TABLE bu.building_elevation(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    elevation_elevationreference_owns boolean,
    elevation_elevationreference_nilreason text,
    elevation_elevationreference_remoteschema text,
    elevation_elevationreference_fk text,
    elevation_elevationreference_href text,
    elevation_elevationvalue text,
    elevation_elevationvalue_srsname text,
    elevation_elevationvalue_srsdimension integer,
    elevation_elevationvalue_axislabels text,
    elevation_elevationvalue_uomlabels text
);
ALTER TABLE bu.building_elevation OWNER TO elf_admin;
CREATE INDEX building_elevation_id_idx ON bu.building_elevation(id);
CREATE INDEX building_elevation_parentfk_idx ON bu.building_elevation (parentfk);

CREATE TABLE bu.building_externalreference(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    informationsystem text,
    informationsystemname_nilreason text,
    informationsystemname_characterstring text,
    informationsystemname_pt_freetext_id text,
    informationsystemname_pt_freetext_uuid text,
    reference text
);
ALTER TABLE bu.building_externalreference OWNER TO elf_admin;
CREATE INDEX building_externalreference_id_idx ON bu.building_externalreference(id);
CREATE INDEX building_externalreference_parentfk_idx ON bu.building_externalreference (parentfk);

CREATE TABLE bu.building_informationsystemname_pt_freete_0(
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES bu.building_externalreference ON DELETE CASCADE,
    informationsystemname_pt_freetext_type text,
    informationsystemname_pt_freetext_href text,
    informationsystemname_pt_freetext_role text,
    informationsystemname_pt_freetext_arcrole text,
    informationsystemname_pt_freetext_title text,
    informationsystemname_pt_freetext_show text,
    informationsystemname_pt_freetext_actuate text,
    informationsystemname_pt_freetext_uuidref text,
    informationsystemname_pt_freetext_nilreason text,
    informationsystemname_pt_freetext_localisedcharacterstring text,
    informationsystemname_pt_freetext_localisedcharacterstring_id text,
    informationsystemname_pt_freetext_localisedcharacterstring_locale text
);
ALTER TABLE bu.building_informationsystemname_pt_freete_0 OWNER TO elf_admin;
CREATE INDEX building_informationsystemname_pt_freete_0_id_idx ON bu.building_informationsystemname_pt_freete_0(id);
CREATE INDEX building_informationsystemname_pt_freete_0_parentfk_idx ON bu.building_informationsystemname_pt_freete_0 (parentfk);

CREATE TABLE bu.building_heightaboveground(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    heightaboveground_heightreference_owns boolean,
    heightaboveground_heightreference_nilreason text,
    heightaboveground_heightreference_remoteschema text,
    heightaboveground_heightreference_nil boolean,
    heightaboveground_heightreference_fk text,
    heightaboveground_heightreference_href text,
    heightaboveground_lowreference_owns boolean,
    heightaboveground_lowreference_nilreason text,
    heightaboveground_lowreference_remoteschema text,
    heightaboveground_lowreference_nil boolean,
    heightaboveground_lowreference_fk text,
    heightaboveground_lowreference_href text,
    heightaboveground_status_owns boolean,
    heightaboveground_status_nilreason text,
    heightaboveground_status_remoteschema text,
    heightaboveground_status_nil boolean,
    heightaboveground_status_fk text,
    heightaboveground_status_href text,
    heightaboveground_value numeric,
    heightaboveground_value_uom text
);
ALTER TABLE bu.building_heightaboveground OWNER TO elf_admin;
CREATE INDEX building_heightaboveground_id_idx ON bu.building_heightaboveground(id);
CREATE INDEX building_heightaboveground_parentfk_idx ON bu.building_heightaboveground (parentfk);

CREATE TABLE bu.building_name(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
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
    pronunciation_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE bu.building_name OWNER TO elf_admin;
CREATE INDEX building_name_id_idx ON bu.building_name(id);
CREATE INDEX building_name_parentfk_idx ON bu.building_name (parentfk);

CREATE TABLE bu.building_name_spelling(
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES bu.building_name ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE bu.building_name_spelling OWNER TO elf_admin;
CREATE INDEX building_name_spelling_id_idx ON bu.building_name_spelling(id);
CREATE INDEX building_name_spelling_parentfk_idx ON bu.building_name_spelling (parentfk);

CREATE TABLE bu.building_buildingnature(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE bu.building_buildingnature OWNER TO elf_admin;
CREATE INDEX building_buildingnature_id_idx ON bu.building_buildingnature(id);
CREATE INDEX building_buildingnature_parentfk_idx ON bu.building_buildingnature (parentfk);

CREATE TABLE bu.building_currentuse(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    currentuse_currentuse_owns boolean,
    currentuse_currentuse_nilreason text,
    currentuse_currentuse_remoteschema text,
    currentuse_currentuse_fk text,
    currentuse_currentuse_href text,
    currentuse_percentage integer,
    currentuse_percentage_nilreason text,
    currentuse_percentage_nil boolean
);
ALTER TABLE bu.building_currentuse OWNER TO elf_admin;
CREATE INDEX building_currentuse_id_idx ON bu.building_currentuse(id);
CREATE INDEX building_currentuse_parentfk_idx ON bu.building_currentuse (parentfk);

CREATE TABLE bu.building_parts(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.building ON DELETE CASCADE,
    nilreason text,
    remoteschema text,
    owns boolean,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE bu.building_parts OWNER TO elf_admin;
CREATE INDEX building_parts_id_idx ON bu.building_parts(id);
CREATE INDEX building_parts_parentfk_idx ON bu.building_parts (parentfk);

SELECT ADDGEOMETRYCOLUMN('bu', 'building','geometry','4258','GEOMETRY', 2);
CREATE TABLE bu.buildingpart(
    id text,
    beginlifespanversion timestamp,
    beginlifespanversion_nilreason text,
    beginlifespanversion_nil boolean,
    conditionofconstruction_owns boolean,
    conditionofconstruction_nilreason text,
    conditionofconstruction_remoteschema text,
    conditionofconstruction_nil boolean,
    conditionofconstruction_fk text,
    conditionofconstruction_href text,
    dateofconstruction_nilreason text,
    dateofconstruction_nil boolean,
    dateofconstruction_anypoint timestamp,
    dateofconstruction_anypoint_nilreason text,
    dateofconstruction_anypoint_nil boolean,
    dateofconstruction_beginning timestamp,
    dateofconstruction_beginning_nilreason text,
    dateofconstruction_beginning_nil boolean,
    dateofconstruction_end timestamp,
    dateofconstruction_end_nilreason text,
    dateofconstruction_end_nil boolean,
    dateofdemolition_nilreason text,
    dateofdemolition_nil boolean,
    dateofdemolition_anypoint timestamp,
    dateofdemolition_anypoint_nilreason text,
    dateofdemolition_anypoint_nil boolean,
    dateofdemolition_beginning timestamp,
    dateofdemolition_beginning_nilreason text,
    dateofdemolition_beginning_nil boolean,
    dateofdemolition_end timestamp,
    dateofdemolition_end_nilreason text,
    dateofdemolition_end_nil boolean,
    dateofrenovation_nilreason text,
    dateofrenovation_nil boolean,
    dateofrenovation_anypoint timestamp,
    dateofrenovation_anypoint_nilreason text,
    dateofrenovation_anypoint_nil boolean,
    dateofrenovation_beginning timestamp,
    dateofrenovation_beginning_nilreason text,
    dateofrenovation_beginning_nil boolean,
    dateofrenovation_end timestamp,
    dateofrenovation_end_nilreason text,
    dateofrenovation_end_nil boolean,
    endlifespanversion timestamp,
    endlifespanversion_nilreason text,
    endlifespanversion_nil boolean,
    inspireid_localid text,
    numberofdwellings integer,
    numberofdwellings_nilreason text,
    numberofdwellings_nil boolean,
    numberofbuildingunits integer,
    numberofbuildingunits_nilreason text,
    numberofbuildingunits_nil boolean,
    numberoffloorsaboveground integer,
    numberoffloorsaboveground_nilreason text,
    numberoffloorsaboveground_nil boolean,
    CONSTRAINT buildingpart_pkey PRIMARY KEY (id)
);
ALTER TABLE bu.buildingpart OWNER TO elf_admin;
CREATE INDEX buildingpart_id_idx ON bu.buildingpart(id);

CREATE TABLE bu.buildingpart_elevation(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    elevation_elevationreference_owns boolean,
    elevation_elevationreference_nilreason text,
    elevation_elevationreference_remoteschema text,
    elevation_elevationreference_fk text,
    elevation_elevationreference_href text,
    elevation_elevationvalue text,
    elevation_elevationvalue_srsname text,
    elevation_elevationvalue_srsdimension integer,
    elevation_elevationvalue_axislabels text,
    elevation_elevationvalue_uomlabels text
);
ALTER TABLE bu.buildingpart_elevation OWNER TO elf_admin;
CREATE INDEX buildingpart_elevation_id_idx ON bu.buildingpart_elevation(id);
CREATE INDEX buildingpart_elevation_parentfk_idx ON bu.buildingpart_elevation (parentfk);

CREATE TABLE bu.buildingpart_externalreference(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    informationsystem text,
    informationsystemname_nilreason text,
    informationsystemname_characterstring text,
    informationsystemname_pt_freetext_id text,
    informationsystemname_pt_freetext_uuid text,
    reference text
);
ALTER TABLE bu.buildingpart_externalreference OWNER TO elf_admin;
CREATE INDEX buildingpart_externalreference_id_idx ON bu.buildingpart_externalreference(id);
CREATE INDEX buildingpart_externalreference_parentfk_idx ON bu.buildingpart_externalreference (parentfk);

CREATE TABLE bu.buildingpart_informationsystemname_pt_fr_5(
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES bu.buildingpart_externalreference ON DELETE CASCADE,
    informationsystemname_pt_freetext_type text,
    informationsystemname_pt_freetext_href text,
    informationsystemname_pt_freetext_role text,
    informationsystemname_pt_freetext_arcrole text,
    informationsystemname_pt_freetext_title text,
    informationsystemname_pt_freetext_show text,
    informationsystemname_pt_freetext_actuate text,
    informationsystemname_pt_freetext_uuidref text,
    informationsystemname_pt_freetext_nilreason text,
    informationsystemname_pt_freetext_localisedcharacterstring text,
    informationsystemname_pt_freetext_localisedcharacterstring_id text,
    informationsystemname_pt_freetext_localisedcharacterstring_locale text
);
ALTER TABLE bu.buildingpart_informationsystemname_pt_fr_5 OWNER TO elf_admin;
CREATE INDEX buildingpart_informationsystemname_pt_fr_5_id_idx ON bu.buildingpart_informationsystemname_pt_fr_5(id);
CREATE INDEX buildingpart_informationsystemname_pt_fr_5_parentfk_idx ON bu.buildingpart_informationsystemname_pt_fr_5 (parentfk);

CREATE TABLE bu.buildingpart_heightaboveground(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    heightaboveground_heightreference_owns boolean,
    heightaboveground_heightreference_nilreason text,
    heightaboveground_heightreference_remoteschema text,
    heightaboveground_heightreference_nil boolean,
    heightaboveground_heightreference_fk text,
    heightaboveground_heightreference_href text,
    heightaboveground_lowreference_owns boolean,
    heightaboveground_lowreference_nilreason text,
    heightaboveground_lowreference_remoteschema text,
    heightaboveground_lowreference_nil boolean,
    heightaboveground_lowreference_fk text,
    heightaboveground_lowreference_href text,
    heightaboveground_status_owns boolean,
    heightaboveground_status_nilreason text,
    heightaboveground_status_remoteschema text,
    heightaboveground_status_nil boolean,
    heightaboveground_status_fk text,
    heightaboveground_status_href text,
    heightaboveground_value numeric,
    heightaboveground_value_uom text
);
ALTER TABLE bu.buildingpart_heightaboveground OWNER TO elf_admin;
CREATE INDEX buildingpart_heightaboveground_id_idx ON bu.buildingpart_heightaboveground(id);
CREATE INDEX buildingpart_heightaboveground_parentfk_idx ON bu.buildingpart_heightaboveground (parentfk);

CREATE TABLE bu.buildingpart_name(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    language text,
    language_nilreason text,
    language_nil boolean,
    nativeness_owns boolean,
    nativeness_nilreason text,
    nativeness_remoteschema text,
    nativeness_nil boolean,
    nativeness_fk text,
    nativeness_href text,
    namestatus_owns boolean,
    namestatus_nilreason text,
    namestatus_remoteschema text,
    namestatus_nil boolean,
    namestatus_fk text,
    namestatus_href text,
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
    pronunciation_pronunciationipa_nil boolean,
    grammaticalgender_owns boolean,
    grammaticalgender_nilreason text,
    grammaticalgender_remoteschema text,
    grammaticalgender_nil boolean,
    grammaticalgender_fk text,
    grammaticalgender_href text,
    grammaticalnumber_owns boolean,
    grammaticalnumber_nilreason text,
    grammaticalnumber_remoteschema text,
    grammaticalnumber_nil boolean,
    grammaticalnumber_fk text,
    grammaticalnumber_href text
);
ALTER TABLE bu.buildingpart_name OWNER TO elf_admin;
CREATE INDEX buildingpart_name_id_idx ON bu.buildingpart_name(id);
CREATE INDEX buildingpart_name_parentfk_idx ON bu.buildingpart_name (parentfk);

CREATE TABLE bu.buildingpart_name_spelling(
    id serial PRIMARY KEY,
    parentfk integer NOT NULL REFERENCES bu.buildingpart_name ON DELETE CASCADE,
    spellingofname_text text,
    spellingofname_script text,
    spellingofname_script_nilreason text,
    spellingofname_script_nil boolean,
    spellingofname_transliterationscheme text,
    spellingofname_transliterationscheme_nilreason text,
    spellingofname_transliterationscheme_nil boolean
);
ALTER TABLE bu.buildingpart_name_spelling OWNER TO elf_admin;
CREATE INDEX buildingpart_name_spelling_id_idx ON bu.buildingpart_name_spelling(id);
CREATE INDEX buildingpart_name_spelling_parentfk_idx ON bu.buildingpart_name_spelling (parentfk);

CREATE TABLE bu.buildingpart_buildingnature(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    owns boolean,
    nilreason text,
    remoteschema text,
    nil boolean,
    fk text,
    href text
);
ALTER TABLE bu.buildingpart_buildingnature OWNER TO elf_admin;
CREATE INDEX buildingpart_buildingnature_id_idx ON bu.buildingpart_buildingnature(id);
CREATE INDEX buildingpart_buildingnature_parentfk_idx ON bu.buildingpart_buildingnature (parentfk);

CREATE TABLE bu.buildingpart_currentuse(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    nilreason text,
    nil boolean,
    currentuse_currentuse_owns boolean,
    currentuse_currentuse_nilreason text,
    currentuse_currentuse_remoteschema text,
    currentuse_currentuse_fk text,
    currentuse_currentuse_href text,
    currentuse_percentage integer,
    currentuse_percentage_nilreason text,
    currentuse_percentage_nil boolean
);
ALTER TABLE bu.buildingpart_currentuse OWNER TO elf_admin;
CREATE INDEX buildingpart_currentuse_id_idx ON bu.buildingpart_currentuse(id);
CREATE INDEX buildingpart_currentuse_parentfk_idx ON bu.buildingpart_currentuse (parentfk);

CREATE TABLE bu.buildingpart_geometry2d(
    id serial PRIMARY KEY,
    parentfk text NOT NULL REFERENCES bu.buildingpart ON DELETE CASCADE,
    geometry_nilreason text,
    referencegeometry boolean,
    horizontalgeometryreference_owns boolean,
    horizontalgeometryreference_nilreason text,
    horizontalgeometryreference_remoteschema text,
    horizontalgeometryreference_fk text,
    horizontalgeometryreference_href text,
    verticalgeometryreference_owns boolean,
    verticalgeometryreference_nilreason text,
    verticalgeometryreference_remoteschema text,
    verticalgeometryreference_fk text,
    verticalgeometryreference_href text,
    horizontalgeometryestimatedaccuracy numeric,
    horizontalgeometryestimatedaccuracy_nilreason text,
    horizontalgeometryestimatedaccuracy_uom text,
    horizontalgeometryestimatedaccuracy_nil boolean,
    verticalgeometryestimatedaccuracy numeric,
    verticalgeometryestimatedaccuracy_nilreason text,
    verticalgeometryestimatedaccuracy_uom text,
    verticalgeometryestimatedaccuracy_nil boolean
);
ALTER TABLE bu.buildingpart_geometry2d OWNER TO elf_admin;
CREATE INDEX buildingpart_geometry2d_id_idx ON bu.buildingpart_geometry2d(id);
CREATE INDEX buildingpart_geometry2d_parentfk_idx ON bu.buildingpart_geometry2d (parentfk);

SELECT ADDGEOMETRYCOLUMN('bu', 'buildingpart_geometry2d','geometry','4258','GEOMETRY', 2);
