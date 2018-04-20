#!/bin/bash
docker system prune -f
docker volume prune -f
docker images -q --filter "dangling=true" | xargs -r docker rmi
## OR if old
docker ps --filter "status=exited" | awk '{print $1}' | xargs --no-run-if-empty docker rm
docker images -q --filter "dangling=true" | xargs -r docker rmi
