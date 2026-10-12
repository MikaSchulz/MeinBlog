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
    server_tokens off;

    root /usr/share/nginx/html;
    index index.html;

    # Security headers on every response, error pages included. They are only
    # inherited by locations without add_header of their own, so keep it that way.
    # The CSP allows only files from this site; inline styles are needed for the
    # color variables in <head>. Embeds from other sites (e.g. videos) need an
    # extra source here.
    add_header Content-Security-Policy "default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; frame-ancestors 'none'; base-uri 'self'; form-action 'self'" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "DENY" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    add_header Permissions-Policy "camera=(), microphone=(), geolocation=()" always;

    # Compress text responses (HTML is always included)
    gzip on;
    gzip_comp_level 5;
    gzip_min_length 256;
    gzip_proxied any;
    gzip_vary on;
    gzip_types text/css application/javascript image/svg+xml application/manifest+json application/xml text/plain;

    # Long cache for static files, short for HTML. CSS and JS carry a content
    # hash in their file name (Hugo fingerprint), so changes reach visitors at once.
    location ~* \.(?:css|js|png|jpg|jpeg|gif|ico|svg|webp|woff2?|ttf|eot)$ {
        expires 7d;
        access_log off;
        try_files $uri =404;
    }

    location / {
        try_files $uri $uri/ $uri/index.html =404;
    }

    # Custom 404, in English below /en/
    error_page 404 /404.html;
    location /en/ {
        try_files $uri $uri/ $uri/index.html =404;
        error_page 404 /en/404.html;
    }
    location = /404.html {
        internal;
    }
    location = /en/404.html {
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
