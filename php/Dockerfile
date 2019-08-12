#php-fpm
FROM alpine:3.8

RUN apk update \
    && apk add mc \
    && adduser -D -u 1000 -g 'www' www

RUN apk update \
    && apk add \
    php7-fpm \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-xml \
    php7-zlib \
    php7-phar \
    php7-bcmath \
    php7-amqp \
    php7-tokenizer \
    php7-session \
    php7-simplexml \
    php7-xdebug \
    php7-memcached \
    php7-fileinfo \
    make \
    libssl1.0 \
    curl

ENV PHP_FPM_USER="www"
ENV PHP_FPM_GROUP="www"
ENV PHP_FPM_LISTEN_MODE="0660"
ENV PHP_MEMORY_LIMIT="512M"
ENV PHP_MAX_UPLOAD="50M"
ENV PHP_MAX_FILE_UPLOAD="200"
ENV PHP_MAX_POST="100M"
ENV PHP_DISPLAY_ERRORS="On"
ENV PHP_DISPLAY_STARTUP_ERRORS="On"
ENV PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR"
ENV PHP_CGI_FIX_PATHINFO=0

RUN sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = ${PHP_FPM_USER}|g" /etc/php7/php-fpm.conf \
    && sed -i "s|;listen.group\s*=\s*nobody|listen.group = ${PHP_FPM_GROUP}|g" /etc/php7/php-fpm.conf \
    && sed -i "s|;listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" /etc/php7/php-fpm.conf \
    && sed -i "s|user\s*=\s*nobody|user = ${PHP_FPM_USER}|g" /etc/php7/php-fpm.conf \
    && sed -i "s|group\s*=\s*nobody|group = ${PHP_FPM_GROUP}|g" /etc/php7/php-fpm.conf \
    && sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php7/php-fpm.conf \
    && sed -i 's/include\ \=\ \/etc\/php5\/fpm.d\/\*.conf/\;include\ \=\ \/etc\/php7\/fpm.d\/\*.conf/g' /etc/php7/php-fpm.conf

RUN echo "memory_limit=512M" >> /etc/php7/php.ini
RUN echo "date.timezone=UTC" >> /etc/php7/php.ini
RUN echo "upload_max_filesize=50M" >> /etc/php7/php.ini
RUN echo "post_max_size=50M" >> /etc/php7/php.ini
ADD symfony.pool.conf /etc/php7/php-fpm.d/

ADD ./entry.sh /entry.sh
ADD ./fpm.sh /fpm.sh

RUN chmod +x /fpm.sh /entry.sh

CMD ["/entry.sh"]

EXPOSE 9000