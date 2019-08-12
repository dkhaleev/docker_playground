#nginx
FROM alpine:3.8

RUN apk add --update nginx \
    && adduser -D -u 1000 -g 'www' www


RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/conf.d/
RUN rm -r /etc/nginx/conf.d/default.conf

RUN echo "upstream php-upstream { server php:9001 fail_timeout=5s max_fails=5; }" > /etc/nginx/conf.d/upstream.conf

CMD ["nginx"]

EXPOSE 80
EXPOSE 443