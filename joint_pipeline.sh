files=(B16001_2016) 


for f in "${files[@]}"
do
    # MonetDB
    time acs-pipe --config-file="acs-config/$f.yaml" fetch --acs-key d0a3481f70837de29a56f7a3b7df087007e942e1 --skip-previous true
    time acs-pipe --config-file="acs-config/$f.yaml" process
    time acs-pipe --config-file="acs-config/$f.yaml" sql --dbms monetdb --schema acs
    time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa --schema acs --dbms monetdb --database-username monetdb remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 34.70.197.119 --ssh-username deploy

    # PostgreSQL
    time acs-pipe --config-file="acs-config/$f.yaml" fetch --acs-key d0a3481f70837de29a56f7a3b7df087007e942e1 --skip-previous true
    time acs-pipe --config-file="acs-config/$f.yaml" process
    time acs-pipe --config-file="acs-config/$f.yaml" sql --dbms postgres --schema acs
    time acs-pipe --config-file="acs-config/$f.yaml" load --database datausa_vp --schema acs --dbms postgres --database-username postgres remote --ssh-key ~/.ssh/id_rsa_dw_deploy --ssh-host 35.223.122.36 --ssh-username deploy
done