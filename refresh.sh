#!/bin/bash

shopt -s extglob

echo 'sudo docker-compose down'
docker-compose down

echo 'sudo rm -rf docker-persistence/app-data/git-data/!(.keep)'
rm -rf docker-persistence/app-data/git-data/!(.keep)
echo 'sudo rm -rf docker-persistence/app-data/log/!(.keep)'
rm -rf docker-persistence/app-data/log/!(.keep)
echo 'sudo rm -rf docker-persistence/postgres'
rm -rf docker-persistence/postgres
echo 'sudo rm -rf app/git-data/firehol'
rm -rf app/git-data/firehol
echo 'sudo rm -rf app/__pycache__'
rm -rf app/__pycache__
echo 'sudo truncate -s 0 app/log/run.log'
truncate -s 0 app/log/run.log


echo 'sudo docker-compose up -d'
docker-compose up -d