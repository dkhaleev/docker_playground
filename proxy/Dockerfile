#nginx
FROM alpine:3.8

RUN apk add --update nginx \
    && adduser -D -u 1000 -g 'www' www

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD nginx.conf /etc/nginx/
ADD proxy.conf /etc/nginx/conf.d/

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.0 libssl1.0

RUN rm -r /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80
EXPOSE 443