FROM oznu/s6-node

RUN apk add --no-cache git python make g++ libffi-dev openssl-dev avahi-compat-libdns_sd avahi-dev openrc dbus

RUN yarn global add node-gyp
RUN yarn global add homebridge

RUN mkdir /homebridge && mkdir -p /home/root/homebridge
WORKDIR /homebridge

COPY default.package.json /home/root/homebridge
COPY default.config.json /home/root/homebridge

VOLUME /homebridge

COPY root /
