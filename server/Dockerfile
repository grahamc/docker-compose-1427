FROM debian:latest

RUN mkdir /1427
WORKDIR /1427

RUN apt-get update \
  && apt-get install -y wget make \
# install Docker
  && wget -qO- https://get.docker.com/ | sh \
# install docker-in-docker
  && wget -qO- https://raw.githubusercontent.com/docker/docker/master/hack/dind > /usr/bin/dind \
  && chmod +x /usr/bin/dind

ADD Makefile run.sh /1427/
CMD ["/1427/run.sh"]

