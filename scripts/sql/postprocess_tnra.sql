-- convert all network reference URLs to local
UPDATE tnra.accessrestriction_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.conditionoffacility_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.nominaltrackgauge_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.numberoftracks_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.railwayclass_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.railwayelectrification_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.railwaytype_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.railwayuse_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');
UPDATE tnra.verticalposition_networkref SET simplelinearreference_element_href = regexp_replace(simplelinearreference_element_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_RailwayLink_');

