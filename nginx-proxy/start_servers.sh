#!/bin/bash
filelist=""

for d in ../sites/*/ ; do
    docker-compose -f ${d}current/docker-compose-production.yml up -d
    sleep 5
done


