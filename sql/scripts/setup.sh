#! /bin/bash
source ./startPostgreSQL.sh
sleep 2
source ./createPostgreDB.sh
dir=$(git rev-parse --show-toplevel)
sed -i "s+/extra/tlian020/VirtualBox VMs/CS166-Database-Project-Phase-3+$dir+g" ../src/load_data.sql
if [ ! -d "$dir/java/classes" ]; then
  mkdir "$dir/java/classes"
fi
source ./create_db.sh
sleep 2
psql -h localhost -p $PGPORT $USER"_DB"