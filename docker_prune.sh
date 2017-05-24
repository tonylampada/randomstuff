#!/bin/bash
docker system prune -f
docker images -q --filter "dangling=true" | xargs -r docker rmi
