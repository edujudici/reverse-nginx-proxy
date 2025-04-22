#!/bin/bash
logger Stopping docker webserver cluster
docker-compose down

filelist=""

for d in ../sites/*/ ; do
    # Encontra o link simbólico com sufixo -current dentro de cada domínio
    current_dir=$(find "$d" -maxdepth 1 -lname '*-current' -o -name '*-current' -type l)
    echo Including $current_dir

    if [ -n "$current_dir" ]; then
        compose_file="${current_dir}/docker-compose-production.yml"
        echo Including $compose_file

        n="-f ${compose_file}"
        filelist="${filelist}$n "
    fi
done

docker compose ${filelist} down

