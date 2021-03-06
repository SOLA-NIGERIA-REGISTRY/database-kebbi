-- Table: administrative.ba_unit_detail_type

-- DROP TABLE administrative.ba_unit_detail_type;

CREATE TABLE IF NOT EXISTS   administrative.ba_unit_detail_type
(
  code character varying(255) NOT NULL, -- The code for the detail type.
  display_value character varying(500) NOT NULL, -- Displayed value of the detail type.
  description character varying(10000) NOT NULL, -- The template text describing the detail.
  status character(1) NOT NULL, -- Status of the detail type.
  is_for character varying(20) , -- What the ba_unit_detail_type is for.
  field_type character varying(20) ,-- type of field,
  order_view integer,
  CONSTRAINT ba_unit_detail_type_pkey PRIMARY KEY (code),
  CONSTRAINT ba_unit_detail_type_display_value_unique UNIQUE (display_value)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE administrative.ba_unit_detail_type
  OWNER TO postgres;
COMMENT ON TABLE administrative.ba_unit_detail_type
  IS 'Code list of detail types. 
Tags: FLOSS SOLA Extension, Reference Table';
COMMENT ON COLUMN administrative.ba_unit_detail_type.code IS 'The code for the detail type.';
COMMENT ON COLUMN administrative.ba_unit_detail_type.display_value IS 'Displayed value of the detail type.';
COMMENT ON COLUMN administrative.ba_unit_detail_type.description IS 'The template text describing the detail.';
COMMENT ON COLUMN administrative.ba_unit_detail_type.status IS 'Status of the detail type.';





-- DROP TABLE administrative.ba_unit_detail;

CREATE TABLE IF NOT EXISTS  administrative.ba_unit_detail
(
  id character varying(40) NOT NULL, -- Identifier for the detail.
  ba_unit_id character varying(40) NOT NULL, -- Identifier of the ba_unit the detail relates to.
  detail_code character varying(255), -- The type of detail.
  custom_detail_text character varying(500), -- User entered text describing the detail and/or updated or revised text obtained from the template detail text.
  detail_quantity integer, -- A quantity value associted to the detail.
  detail_unit character varying(15), -- The unit of measure applicable for the detail quantity.
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), -- Identifies the all change records for the row in the ba_unit_detail_historic table
  rowversion integer NOT NULL DEFAULT 0, -- Sequential value indicating the number of times this row has been modified.
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, -- Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).
  change_user character varying(50), -- The user id of the last person to modify the row.
  change_time timestamp without time zone NOT NULL DEFAULT now(), -- The date and time the row was last modified.
  CONSTRAINT ba_unit_detail_pkey PRIMARY KEY (id),
  CONSTRAINT ba_unit_detail_detail_code_fk85 FOREIGN KEY (detail_code)
      REFERENCES administrative.ba_unit_detail_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ba_unit_detail_ba_unit_id_fk86 FOREIGN KEY (ba_unit_id)
      REFERENCES administrative.ba_unit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE administrative.ba_unit_detail
  OWNER TO postgres;
COMMENT ON TABLE administrative.ba_unit_detail
  IS 'Captures any statutory or agreed details in relation to an ba_unit. E.g. details of lease, etc. An ba_unit can have multiple details associated to it.
Tags: FLOSS SOLA Extension, Change History';
COMMENT ON COLUMN administrative.ba_unit_detail.id IS 'Identifier for the detail.';
COMMENT ON COLUMN administrative.ba_unit_detail.ba_unit_id IS 'Identifier of the ba_unit the detail relates to.';
COMMENT ON COLUMN administrative.ba_unit_detail.detail_code IS 'The type of detail.';
COMMENT ON COLUMN administrative.ba_unit_detail.custom_detail_text IS 'User entered text describing the detail and/or updated or revised text obtained from the template detail text.';
COMMENT ON COLUMN administrative.ba_unit_detail.detail_quantity IS 'A quantity value associted to the detail.';
COMMENT ON COLUMN administrative.ba_unit_detail.detail_unit IS 'The unit of measure applicable for the detail quantity.';
COMMENT ON COLUMN administrative.ba_unit_detail.rowidentifier IS 'Identifies the all change records for the row in the ba_unit_detail_historic table';
COMMENT ON COLUMN administrative.ba_unit_detail.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN administrative.ba_unit_detail.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN administrative.ba_unit_detail.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN administrative.ba_unit_detail.change_time IS 'The date and time the row was last modified.';


-- Index: administrative.ba_unit_detail_detail_code_fk85_ind

DROP INDEX administrative.ba_unit_detail_detail_code_fk85_ind;

CREATE INDEX ba_unit_detail_detail_code_fk85_ind
  ON administrative.ba_unit_detail
  USING btree
  (detail_code COLLATE pg_catalog."default");

-- Index: administrative.ba_unit_detail_index_on_rowidentifier

DROP INDEX administrative.ba_unit_detail_index_on_rowidentifier;

CREATE INDEX ba_unit_detail_index_on_rowidentifier
  ON administrative.ba_unit_detail
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

-- Index: administrative.ba_unit_detail_ba_unit_id_fk86_ind

DROP INDEX administrative.ba_unit_detail_ba_unit_id_fk86_ind;

CREATE INDEX ba_unit_detail_ba_unit_id_fk86_ind
  ON administrative.ba_unit_detail
  USING btree
  (ba_unit_id COLLATE pg_catalog."default");


-- Trigger: __track_changes on administrative.ba_unit_detail

DROP TRIGGER __track_changes ON administrative.ba_unit_detail;

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON administrative.ba_unit_detail
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

-- Trigger: __track_history on administrative.ba_unit_detail

DROP TRIGGER __track_history ON administrative.ba_unit_detail;

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON administrative.ba_unit_detail
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();



-- Table: administrative.ba_unit_detail_historic

-- DROP TABLE administrative.ba_unit_detail_historic;

CREATE TABLE IF NOT EXISTS  administrative.ba_unit_detail_historic
(
  id character varying(40),
  ba_unit_id character varying(40),
  detail_code character varying(255),
  custom_detail_text character varying(500),
  detail_quantity integer,
  detail_unit character varying(15),
  rowidentifier character varying(40),
  rowversion integer,
  change_action character(1),
  change_user character varying(50),
  change_time timestamp without time zone,
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now()
)
WITH (
  OIDS=FALSE
);
ALTER TABLE administrative.ba_unit_detail_historic
  OWNER TO postgres;

-- Index: administrative.ba_unit_detail_historic_index_on_rowidentifier

DROP INDEX administrative.ba_unit_detail_historic_index_on_rowidentifier;

CREATE INDEX ba_unit_detail_historic_index_on_rowidentifier
  ON administrative.ba_unit_detail_historic
  USING btree
  (rowidentifier COLLATE pg_catalog."default");


  