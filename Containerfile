FROM caddy:builder-alpine AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4

FROM caddy:alpine as caddy-extended

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
