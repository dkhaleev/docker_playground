#nginx
FROM alpine:3.8

RUN apk add --update nginx \
    && adduser -D -u 1000 -g 'www' www

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD nginx.conf /etc/nginx/
ADD host.conf /etc/nginx/conf.d/

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.0 libssl1.0

RUN rm -r /etc/nginx/conf.d/default.conf

RUN echo "upstream php-upstream { server php:9001 fail_timeout=5s max_fails=5; }" > /etc/nginx/conf.d/upstream.conf

CMD ["nginx"]

EXPOSE ${NGINX_HTTP_EXTERNAL_PORT}