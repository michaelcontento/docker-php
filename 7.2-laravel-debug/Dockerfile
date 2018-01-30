FROM michaelcontento/php:7.2-laravel

COPY --from=michaelcontento/php:7.2-debug \
    /usr/lib/php7/modules/xdebug.so /usr/lib/php7/modules/xdebug.so
RUN echo "zend_extension=xdebug" > /etc/php7/conf.d/00_xdebug.ini

# TODO: Replace the "COPY --from" with this line once it's available
# SEE: https://github.com/codecasts/php-alpine/issues/22
#RUN apk add --no-cache 'php7-xdebug@php>2.6'
