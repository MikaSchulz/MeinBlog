# syntax=docker/dockerfile:1.6

# ---------- Build stage ----------
FROM hugomods/hugo:0.139.3 AS builder

WORKDIR /src
COPY site/ ./

# Build static site. baseURL is overridden via build arg so the same image can
# be used for staging/prod by changing the Dokploy build arg if desired.
ARG HUGO_BASEURL=https://eyetealer.me/
ARG HUGO_ENV=production
ENV HUGO_ENVIRONMENT=${HUGO_ENV}
RUN hugo --minify --gc --baseURL "${HUGO_BASEURL}"

# ---------- Runtime stage ----------
FROM nginx:1.27-alpine

# Replace default nginx site config with one tailored for static Hugo output.
RUN rm /etc/nginx/conf.d/default.conf
COPY <<'EOF' /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;
    index index.html;

    # Long cache for hashed assets, short for HTML.
    location ~* \.(?:css|js|png|jpg|jpeg|gif|ico|svg|woff2?|ttf|eot)$ {
        expires 7d;
        add_header Cache-Control "public, max-age=604800";
        access_log off;
        try_files $uri =404;
    }

    location / {
        try_files $uri $uri/ $uri/index.html =404;
    }

    # Custom 404
    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}
EOF

COPY --from=builder /src/public /usr/share/nginx/html

EXPOSE 80

# Use 127.0.0.1 explicitly — `localhost` resolves to ::1 in nginx:alpine
# but the server only listens on IPv4, which would fail the healthcheck.
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q -O- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
