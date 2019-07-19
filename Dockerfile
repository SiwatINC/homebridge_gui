FROM siwatinc/nodejsubuntu_base_image
ARG CACHEBUST=1
RUN npm install -g --unsafe-perm homebridge
RUN timeout 10s homebridge || :
RUN touch /root/.homebridge/config.json
RUN npm install -g --unsafe-perm homebridge-config-ui-x
RUN apt-get update --fix-missing
RUN apt-get -y install wget git
CMD apt-get update && wget -nc https://raw.githubusercontent.com/SiwatINC/unraid-ca-repository/master/docker-template/config.json -O "/root/.homebridge/config.json" || : && apt-get -y install $aptpackages || : && npm install -g --unsafe-perm $packages && (homebridge -I &>> /root/.homebridge/log.txt) && tail -f /dev/null
