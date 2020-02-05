files=(B01002 B01003 B03002 B05001 B05004 B05006 B06001 B08013-mean-transportation B08013 B08014 B08136 B08301 B08303 B16001_2016) 
files=(B17001_poverty_sex_age B19001 B19013 B19013A B19013B B19013C B19013D B19013E B19013F B19013G B19013H B19013I B19083 B21002_veterans B25003 B25075 B25077 B25102) 
files=(poverty-sex-age-asianalone poverty-sex-age-blackalone poverty-sex-age-hispanic) 
files=(poverty-sex-age-nativealone poverty-sex-age-otheralone poverty-sex-age-pacificislanderalone poverty-sex-age-twoormore poverty-sex-age-whitealone) 
files=(poverty-sex-age-whitealonenothispanic)

for f in "${files[@]}"
do
    time acs-pipe --config-file="acs-config/$f.yaml" fetch --acs-key d0a3481f70837de29a56f7a3b7df087007e942e1 --skip-previous true
    time acs-pipe --config-file="acs-config/$f.yaml" process
    time acs-pipe --config-file="acs-config/$f.yaml" sql --dbms postgres --schema acs
    #time acs-pipe --config-file="acs-config/$f.yaml" tesseract cube --db-schema acs --tesseract-schema shared_acs

    # ClickHouse LOCAL
    #time acs-pipe --config-file="acs-config/$f.yaml" load --schema acs --database acs --dbms clickhouse --database-username default local --docker true
    
    # ClickHouse REMOTE
    #time acs-pipe --config-file="my-acs-config/$f.yaml" load --database acs --database-username default --schema acs  --dbms clickhouse remote --ssh-key ~/.ssh/id_rsa_dw_shared --ssh-host 35.237.4.194 --ssh-username deploy
    
    # MonetDB REMOTE
    #time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa --schema acs --dbms monetdb --database-username monetdb remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 34.70.197.119 --ssh-username deploy

    # Postgres REMOTE
    time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa_vp --schema acs --dbms postgres --database-username postgres remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 35.223.122.36 --ssh-username deploy
done