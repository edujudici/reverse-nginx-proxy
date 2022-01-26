#!/bin/bash
logger Stopping docker webserver cluster
docker-compose down

filelist=""

for d in ../sites/*/ ; do
    echo Including $d"docker-compose.yml"
    n="-f ${d}docker-compose.yml"
    filelist="${filelist}$n "
done

docker-compose ${filelist} down

