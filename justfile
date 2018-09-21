smooth:
    acs-pipe -f prelim-config/B24010.yaml config smooth --strategy pushdown --start-index 1 > acs-config/ygio/B24010.yaml
    acs-pipe -f prelim-config/B24011.yaml config smooth --strategy non-agg  --start-index 0 > acs-config/ygio/B24011.yaml
    acs-pipe -f prelim-config/B24012.yaml config smooth --strategy non-agg  --start-index 1 > acs-config/ygio/B24012.yaml
    acs-pipe -f prelim-config/B24030.yaml config smooth --strategy pushdown --start-index 1 > acs-config/ygio/B24030.yaml
    acs-pipe -f prelim-config/B24031.yaml config smooth --strategy non-agg  --start-index 0 > acs-config/ygio/B24031.yaml
    acs-pipe -f prelim-config/B24032.yaml config smooth --strategy non-agg  --start-index 1 > acs-config/ygio/B24032.yaml
    acs-pipe -f prelim-config/C24010.yaml config smooth --strategy pushdown --start-index 1 > acs-config/ygio/C24010.yaml
    acs-pipe -f prelim-config/C24030.yaml config smooth --strategy pushdown --start-index 1 > acs-config/ygio/C24030.yaml

remove-empty-cubes:
    rm acs-out/acs_ygh_households_with_no_internet_5.xml
    rm acs-out/acs_ygh_renters_with_gross_rent_30_percent_of_household_income_c_5.xml
    rm acs-out/acs_ygso_sex_by_occupation_5.xml
    rm acs-out/acs_ygsi_sex_by_industry_5.xml

upload-schema: remove-empty-cubes
    scp acs-out/* zeus:~/datausa-mondrian/frags/acs/.


#process-example:
#  acs-pipe -f acs-config/ygio/B24011.yaml process --years "2015-"
#  acs-pipe -f acs-config/ygio/B24011.yaml sql --schema acs
#  acs-pipe -f acs-config/ygio/B24011.yaml load --schema acs --database datausa
#  acs-pipe -f acs-config/ygio/B24011.yaml mondrian cube --db-schema acs --mondrian-schema datausa --stdout

#clear-ygio-tables:
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_for_median_earnings_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_for_median_earnings_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_c_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_c_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_c_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_c_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygo_occupation_for_median_earnings_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygo_occupation_for_median_earnings_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygso_sex_by_occupation_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygi_industry_for_median_earnings_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygi_industry_for_median_earnings_5'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_for_median_earnings_1'
#    mclient -h canon-api.datausa.io -d datausa -s 'drop table acs.acs_ygsi_sex_by_industry_for_median_earnings_5'

#process-example:
#  acs-pipe -f acs-config/ygio/B24031.yaml process --years "2015-"
#  acs-pipe -f acs-config/ygio/B24031.yaml sql --schema acs
#  acs-pipe -f acs-config/ygio/B24031.yaml load --schema acs --database datausa
#  acs-pipe -f acs-config/ygio/B24031.yaml mondrian cube --db-schema acs --mondrian-schema datausa --stdout

#add-metadata:
#  find acs-config/* -type f -exec sh -c "echo \"metadata:\n  topic: Diversity\n  subtopic: Heritage\n  units_of_measure: People\" >> {}" \;
#  find acs-config/* -type f -exec vim -p {} +

