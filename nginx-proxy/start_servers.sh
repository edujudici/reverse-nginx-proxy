#!/bin/bash
filelist=""

for d in ../sites/*/ ; do
    docker-compose -f ${d}docker-compose.yml up -d
    sleep 5
done


