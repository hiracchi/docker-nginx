FROM hiracchi/ubuntu-ja-supervisor
MAINTAINER Toshiyuki HIRANO <hiracchi@gmail.com>

# install packages
RUN apt-get update && \
    apt-get install -y \
    nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# for nginx
#RUN mkdir -p /work /work/sites-enabled /work/sites-available
#RUN cp /etc/nginx/nginx.conf /work && ln -snf /work/nginx.conf /etc/nginx/nginx.conf
#RUN cp /etc/nginx/sites-available/* /work/sites-available/
#RUN ln -snf /work/sites-available /etc/nginx/sites-available && ln -snf /work/sites-enabled /etc/nginx/sites-enabled
#RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
#RUN chown -R www-data:www-data /var/lib/nginx

# for service
COPY supervisor.nginx.conf /etc/supervisor/conf.d/nginx.conf

EXPOSE 80 443
ENTRYPOINT ["/usr/bin/supervisord"]

