#!/bin/bash

for d in ../sites/*/ ; do
    current_dir=$(find "$d" -maxdepth 1 -type d -name '*-current')
    if [ -n "$current_dir" ]; then
        docker compose --env-file ${current_dir}/src/.env -f ${current_dir}/docker-compose-production.yml up -d
    fi
done