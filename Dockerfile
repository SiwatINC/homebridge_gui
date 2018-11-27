FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y install sudo mc
RUN apt-get -y install node.js npm
RUN npm install -g --unsafe-perm homebridge
RUN timeout 10s homebridge || :
RUN touch /root/.homebridge/config.json
RUN npm install -g --unsafe-perm homebridge-config-ui-x
RUN apt-get -y install wget git
CMD wget -nc https://raw.githubusercontent.com/SiwatINC/unraid-ca-repository/master/docker-template/config.json -O "/root/.homebridge/config.json" || :  && npm install -g --unsafe-perm $packages && homebridge -I
