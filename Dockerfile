FROM alpine:3.5
MAINTAINER Toshiyuki HIRANO <hiracchi@gmail.com>


RUN apk update \
  && apk add --no-cache nginx \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /run/nginx


COPY docker-entrypoint.sh /
EXPOSE 80 443
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/nginx", "-g", "\"daemon off;\""]


