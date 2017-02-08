-- convert all network reference URLs to local
UPDATE tna.aerodromecategory_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');
UPDATE tna.aerodrometype_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');
UPDATE tna.conditionofairfacility_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');
UPDATE tna.fieldelevation_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');
UPDATE tna.functionalusecategory_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');
UPDATE tna.transportationusecategory_networkref SET networkreference_href = regexp_replace(networkreference_href, 'http://example.org/#(_EG.ERM:)?', '#ELF_AerodromeNode_');