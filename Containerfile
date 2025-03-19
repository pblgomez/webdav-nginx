FROM ghcr.io/linuxserver/nginx:1.26.3

RUN apk add --no-cache apache2-utils==2.4.62-r0

# customize nginx
COPY webdav.conf /config/nginx/site-confs/default
RUN set -eux; \
    rm -rf /var/www/*; \
    mkdir /var/www/dav; \
    chmod -R a+rwX /var/www

LABEL org.opencontainers.image.source=https://github.com/pblgomez/webdav-nginx

# docker entrypoint
 COPY auth.sh /custom-cont-init.d/
