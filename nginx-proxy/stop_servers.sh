#!/bin/bash
logger Stopping docker webserver cluster
docker-compose down

filelist=""
envfiles=()

for d in ../sites/*/ ; do
    current_dir=$(find "$d" -maxdepth 1 -type l -name '*-current')

    if [ -n "$current_dir" ]; then
        compose_file="${current_dir}/docker-compose-production.yml"
        env_file="${current_dir}/src/.env"

        if [ -f "$compose_file" ]; then
            echo "Including $compose_file"
            filelist="${filelist}-f $compose_file "
        fi

        if [ -f "$env_file" ]; then
            envfiles+=("--env-file $env_file")
        fi
    fi
done

# Junta todos os --env-file em uma única string
env_args="${envfiles[*]}"

# Exibe os arquivos incluídos (opcional)
echo "Docker Compose Filelist: $filelist"
echo "Env files: $env_args"

# Executa o docker compose down com os arquivos e os respectivos env-files
docker compose $filelist $env_args down

