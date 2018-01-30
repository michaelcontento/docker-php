# -----------------------------------------------------------------------------
# XDEBUG
# -----------------------------------------------------------------------------

FROM michaelcontento/php:7.2 AS xdebug

RUN apk --no-cache add \
        autoconf file g++ gcc libc-dev make pkgconf re2c php7-dev@php php7-pear@php \
        yaml-dev pcre-dev zlib-dev libmemcached-dev cyrus-sasl-dev 'php7-xml@php~7.2' \
    && ln -s /usr/bin/phpize7 /usr/bin/phpize \
    && phpize -v \
    && pecl install xdebug-2.6.0

# -----------------------------------------------------------------------------
# PHP
# -----------------------------------------------------------------------------

FROM michaelcontento/php:7.2

COPY --from=xdebug /usr/lib/php7/modules/xdebug.so /usr/lib/php7/modules/xdebug.so
RUN echo "zend_extension=xdebug" > /etc/php7/conf.d/00_xdebug.ini

# TODO: Replace the multi-stage build with this line once it's available
# SEE: https://github.com/codecasts/php-alpine/issues/22
#RUN apk add --no-cache 'php7-xdebug@php>2.6'
