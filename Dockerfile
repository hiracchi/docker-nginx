FROM ubuntu
MAINTAINER Toshiyuki HIRANO <hiracchi@gmail.com>

# install packages
RUN apt-get update && apt-get install -y \
    nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD run_service.sh /root/run_service.sh
RUN chmod +x /root/run_service.sh

VOLUME ["/var/www/html", "/var/log/nginx"]
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/root/run_service.sh", "nginx"]

