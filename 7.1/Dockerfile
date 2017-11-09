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

FROM alpine:edge
LABEL maintainer="mail@michaelcontento.de"

# copy caddy
COPY --from=caddy /usr/bin/caddy /usr/bin/
EXPOSE 80

# install php (cli + fpm)
RUN apk add --no-cache \
        php7 \
        php7-fpm \
        php7-opcache \
    && php --version

# install composer
ADD https://getcomposer.org/installer /tmp/composer-setup.php
RUN apk add --no-cache \
        php7-curl \
        php7-json \
        php7-mbstring \
        php7-openssl \
        php7-phar \
        php7-zlib \
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
