--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = application, pg_catalog;

--
-- Data for Name: request_type_requires_source_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE request_type_requires_source_type DISABLE TRIGGER ALL;

INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('cadastralSurvey', 'cadastreChange');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('cadastralSurvey', 'redefineCadastre');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('mortgage', 'varyMortgage');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'varyMortgage');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'regnOnTitle');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'regnDeeds');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('lease', 'registerLease');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('powerOfAttorney', 'regnPowerOfAttorney');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('standardDocument', 'regnStandardDocument');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'noteOccupation');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'noteOccupation');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'usufruct');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'waterRights');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('mortgage', 'mortgage');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'buildingRestriction');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'servitude');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'lifeEstate');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'lifeEstate');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'newApartment');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'newState');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'caveat');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'removeCaveat');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'removeCaveat');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'historicOrder');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'limitedRoadAccess');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('lease', 'varyLease');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'varyLease');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'varyRight');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'varyRight');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'removeRight');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'removeRight');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'removeRestriction');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'removeRestriction');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'cnclPowerOfAttorney');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'cnclStandardDocument');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('caveat', 'caveat');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('cadastralSurvey', 'mapExistingParcel');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('title', 'newDigitalTitle');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('relationshipTitle', 'recordRelationship');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('relationshipTitle', 'cancelRelationship');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('restrictionOrder', 'obscurationRequest');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'subdivideProperty');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('cadastralSurvey', 'newFreehold');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('application', 'newFreehold');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('application', 'mortgage');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('application', 'registerLease');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('application', 'newOwnership');


ALTER TABLE request_type_requires_source_type ENABLE TRIGGER ALL;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: level; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE level DISABLE TRIGGER ALL;

INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('cadastreObject', 'Cadastre object', 'all', 'polygon', 'primaryRight', 'be03cc56-99dd-11e3-b772-13b58d0363c9', 1, 'i', 'db:postgres', '2014-02-20 16:19:00.595', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('bffd0bb2-99dd-11e3-a43e-17754b2def8e', 'Survey Control', 'all', 'point', 'geographicLocator', 'bffee072-99dd-11e3-b838-a3032aff2862', 1, 'i', 'test', '2014-02-20 16:19:03.908', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('c06a4e0c-99dd-11e3-b4a8-df59099d962e', 'Roads', 'all', 'point', 'primaryRight', 'c06a9c2c-99dd-11e3-867c-3f6b8d26f6b4', 1, 'i', 'test', '2014-02-20 16:19:04.625', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('c1532ad2-99dd-11e3-a445-237731ad01b0', 'Parcels', 'all', 'polygon', 'primaryRight', 'c15351e2-99dd-11e3-be93-6f678d1a08cd', 1, 'i', 'test', '2014-02-20 16:19:06.145', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('road-centerline', 'Road centerline', 'all', 'unStructuredLine', 'geographicLocator', 'f099731a-cd80-11e3-8b0c-53bca1817824', 1, 'i', 'db:postgres', '2014-04-26 22:25:42.727', true);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('c03162e0-99dd-11e3-a27b-2bfeef31a969', 'Place Names', 'all', 'point', 'geographicLocator', 'c03189f0-99dd-11e3-905e-8be6604148a7', 2, 'u', 'test', '2014-04-26 22:25:42.727', true);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('house-num', 'House Number', 'all', 'point', 'geographicLocator', '4ae9b152-02f3-11e4-a6bb-db5f0510f653', 1, 'i', 'soladev', '2014-07-04 08:47:35.126', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('142b3522-3ec5-11e6-8180-8fdaec24b69c', 'LGA', 'all', 'polygon', 'mixed', '142cbbc2-3ec5-11e6-b0e4-f7ddc537ab13', 1, 'i', 'test', '2016-06-30 15:18:04.923', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('142e4262-3ec5-11e6-a9bc-53750fdfd75f', 'Ward', 'all', 'polygon', 'mixed', '142e4262-3ec5-11e6-93ec-677d006eb445', 1, 'i', 'test', '2016-06-30 15:18:04.943', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('1432d642-3ec5-11e6-b668-63979847bc7f', 'OverlappingParcels', 'all', 'polygon', 'mixed', '14345ce2-3ec5-11e6-970c-c3163495a3e9', 1, 'i', 'test', '2016-06-30 15:18:04.973', false);
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time, editable) VALUES ('gazetted', 'gazetted', 'all', 'polygon', 'geographicLocator', 'ac44ae96-4dbc-11e6-afb0-2f00bd8cfc4b', 1, 'i', 'db:postgres', '2016-07-19 16:25:37.478', true);


ALTER TABLE level ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

