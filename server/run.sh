#!/bin/bash

mkdir -p /certs
rm -rf /certs/*

make all
cp ./* /certs/
mkdir /certs/client
cp ./ca.crt /certs/client/ca.pem
cp ./client.crt /certs/client/cert.pem
cp ./client.key /certs/client/key.pem

/usr/bin/dind docker -d \
     --tlsverify \
     --tlscert=/certs/server.crt \
     --tlscacert=/certs/ca.crt \
     --tlskey=/certs/server.key \
     -H=0.0.0.0:2376

