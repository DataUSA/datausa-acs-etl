this dir is for finding geographies which used to exist in census data, but have been removed or changed.

This data is being pulled from the economic census - geo. Hopefully that data covered all the geos well; it has 2002, 2007, and 2012.

So missing-geoid.csv holds all geoid from economic census which were not found in hte 2017 tiger files, for

- state
- nation
- county
- msa


May not be perfect; I'm doing name lookups for MSA, and doing the mapping that looks correct (I assume if a name appears in same state, it should be mapped). Counties should be correct.

Probably, will just need to wait for bug reports if I did an incorrect mapping.
