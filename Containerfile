FROM caddy:builder-alpine AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:alpine as caddy-cloudflare

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
