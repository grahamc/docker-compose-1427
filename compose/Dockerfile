FROM debian:latest

RUN mkdir /1427
WORKDIR /1427

RUN apt-get update \
  && apt-get install -y wget \
# install Docker
  && wget -qO- https://get.docker.com/ | sh
# install docker-compose
RUN wget -qO- http://cl.ly/3W3a2S3t2c32/download/docker-compose-Linux-x86_64 > /usr/bin/docker-compose \
  && chmod +x /usr/bin/docker-compose

ENV DOCKER_CERT_PATH=/certs/client
ENV DOCKER_TLS_VERIFY=1
ENV DOCKER_HOST=tcp://dockerserver:2376
ADD run.sh docker-compose.yml /1427/
CMD ["/1427/run.sh"]
