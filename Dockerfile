FROM mhart/alpine-node:5.11

MAINTAINER Rajat Vig <rajat.vig@gmail.com>

EXPOSE 4567

ENV DATADIR /var/lib/kinesalite

RUN \
  mkdir -p $DATADIR && \
  apk add --no-cache python make g++ nodejs && \
  npm install -g kinesalite && \
  apk del python make g++ && \
  rm -rf /tmp/* /var/cache/apk/*

WORKDIR /var/lib/kinesalite

COPY cmd.sh /var/lib/kinesalite

CMD ["./cmd.sh"]
