smooth:
    acs-pipe -f prelim-config/B24010.yaml config smooth --strategy extend-end --start-index 1 > acs-config/ygio/B24010.yaml
    acs-pipe -f prelim-config/B24011.yaml config smooth --strategy non-agg    --start-index 0 > acs-config/ygio/B24011.yaml
    acs-pipe -f prelim-config/B24012.yaml config smooth --strategy non-agg    --start-index 1 > acs-config/ygio/B24012.yaml
    acs-pipe -f prelim-config/B24030.yaml config smooth --strategy extend-end --start-index 1 > acs-config/ygio/B24030.yaml
    acs-pipe -f prelim-config/B24031.yaml config smooth --strategy non-agg    --start-index 0 > acs-config/ygio/B24031.yaml
    acs-pipe -f prelim-config/B24032.yaml config smooth --strategy non-agg    --start-index 1 > acs-config/ygio/B24032.yaml
    acs-pipe -f prelim-config/C24010.yaml config smooth --strategy extend-end --start-index 1 > acs-config/ygio/C24010.yaml
    acs-pipe -f prelim-config/C24030.yaml config smooth --strategy extend-end --start-index 1 > acs-config/ygio/C24030.yaml
