#!/bin/bash
docker system prune
docker images -q --filter "dangling=true" | xargs -r docker rmi
