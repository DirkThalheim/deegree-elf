-- convert all network reference URLs to local
UPDATE tnro.accessrestriction_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');
UPDATE tnro.conditionoffacility_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');
UPDATE tnro.formofway_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');
UPDATE tnro.functionalroadclass_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');
UPDATE tnro.roadsurfacecategory_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');
UPDATE tnro.verticalposition_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RoadLink_');