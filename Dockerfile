# -----------------------------------------------------------------------------
# Caddy
# -----------------------------------------------------------------------------

FROM alpine:3.6 as caddy

# TODO: Build caddy from source
RUN apk add --no-cache curl
RUN curl "https://caddyserver.com/download/linux/amd64?license=personal" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy


# -----------------------------------------------------------------------------
# Result
# -----------------------------------------------------------------------------

FROM alpine:3.6

# copy caddy
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
EXPOSE 80

# install php
RUN apk add --no-cache \
    php7-fpm \
    php7-opcache

# add system configs
ADD etc/ /etc
ADD app/ /app

# start caddy
WORKDIR /app
CMD ["/usr/bin/caddy", "--conf", "/etc/caddy/Caddyfile", "--log", "stdout"]
