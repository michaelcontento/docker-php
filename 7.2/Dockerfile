# -----------------------------------------------------------------------------
# Caddy
# -----------------------------------------------------------------------------

FROM golang:1.9-alpine as caddy

RUN apk add --no-cache git \
    && git clone https://github.com/mholt/caddy /go/src/github.com/mholt/caddy \
    && git clone https://github.com/caddyserver/builds /go/src/github.com/caddyserver/builds

ARG CADDY_VERSION="0.10.10"
RUN cd /go/src/github.com/mholt/caddy \
    && git checkout -b "v$CADDY_VERSION"

RUN cd /go/src/github.com/mholt/caddy/caddy \
    && go get ./... \
    && go run build.go \
    && mv caddy /usr/bin/

# -----------------------------------------------------------------------------
# PHP
# -----------------------------------------------------------------------------

FROM alpine:3.7
LABEL maintainer="mail@michaelcontento.de"

# copy caddy
COPY --from=caddy /usr/bin/caddy /usr/bin/
EXPOSE 80

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN apk --update add ca-certificates
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

# install php (cli + fpm)
RUN apk add --no-cache \
        php7@php \
        php7-fpm@php \
        php7-opcache@php \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && php --version

# install composer
ADD https://getcomposer.org/installer /tmp/composer-setup.php
RUN apk add --no-cache \
        php7-curl@php \
        php7-json@php \
        php7-mbstring@php \
        php7-openssl@php \
        php7-phar@php \
        php7-zlib@php \
    && php /tmp/composer-setup.php -- --install-dir=/usr/bin --filename=composer \
    && rm -rf /tmp/composer-setup.php \
    && composer global require hirak/prestissimo \
    && rm -rf /root/.composer/cache \
    && composer --version

# add system configs
COPY etc/ /etc
COPY app/ /app

# start caddy
WORKDIR /app
CMD ["/usr/bin/caddy", "--conf", "/etc/caddy/Caddyfile", "--log", "stdout"]