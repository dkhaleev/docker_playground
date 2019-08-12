#!/bin/bash

docker-compose down && docker volume ls -qf dangling=true | xargs -r docker volume rm && docker system prune

docker-compose -f docker-compose.yml up --build