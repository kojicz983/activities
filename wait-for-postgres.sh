#!/usr/bin/env sh

postgres_ready=false
while test "$postgres_ready" != "true"
do
  printf '.';
  logs="$(docker-compose logs postgres)";
  echo $logs | grep -q "PostgreSQL init process complete; ready for start up." && postgres_ready=true || sleep 1;
done
echo " PostgreSQL ready."
