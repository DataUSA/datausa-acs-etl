#files=(health/B25048 health/B25052 health/B25074 health/B25092 health/B27010 health/B28002_2016 health/C25074)
files=(health/S2703)

for f in "${files[@]}"
do
    time acs-pipe --config-file="acs-config/$f.yaml" fetch --acs-key d0a3481f70837de29a56f7a3b7df087007e942e1 --skip-previous true
    time acs-pipe --config-file="acs-config/$f.yaml" process
    time acs-pipe --config-file="acs-config/$f.yaml" sql --dbms monetdb --schema acs
    #time acs-pipe --config-file="acs-config/$f.yaml" tesseract cube --db-schema acs --tesseract-schema shared_acs

    # ClickHouse LOCAL
    #time acs-pipe --config-file="acs-config/$f.yaml" load --schema acs --database acs --dbms clickhouse --database-username default local --docker true
    
    # ClickHouse REMOTE
    #time acs-pipe --config-file="my-acs-config/$f.yaml" load --database acs --database-username default --schema acs  --dbms clickhouse remote --ssh-key ~/.ssh/id_rsa_dw_shared --ssh-host 35.237.4.194 --ssh-username deploy
    
    # MonetDB REMOTE
    time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa --schema acs --dbms monetdb --database-username monetdb remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 34.70.197.119 --ssh-username deploy

    # Postgres REMOTE
    #time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa_vp --schema acs --dbms postgres --database-username postgres remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 35.223.122.36 --ssh-username deploy
done