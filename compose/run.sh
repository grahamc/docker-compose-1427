#!/bin/bash

while ! docker info; do
  sleep 1
done

docker-compose ps

