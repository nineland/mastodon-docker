ARG MASTODON_VER
FROM tootsuite/mastodon:v${MASTODON_VER} AS builder

FROM nginx:alpine

LABEL maintainer="Nine Land Mastodon Administrator <mastodon-long@nine.land>"
LABEL org.opencontainers.image.description="Nginx container image for mastodon, with static files."

ENV NGINX_ENVSUBST_TEMPLATE_DIR="/etc/nginx/templates-http" \
    NGINX_BACKEND_WEB_HOST=web \
    NGINX_BACKEND_WEB_PORT=3000 \
    NGINX_BACKEND_STREAMING_HOST=streaming \
    NGINX_BACKEND_STREAMING_PORT=4000 \
    NGINX_SERVER_NAME= \
    NGINX_SSL_CERT= \
    NGINX_SSL_KEY= \
    NGINX_MASTODON_ROOT="/usr/share/mastodon/public" \
    NGINX_REAL_IP_HEADER="CF-Connecting-IP" \
    TZ=Asia/Shanghai

COPY --from=builder /opt/mastodon/public /usr/share/mastodon/public

RUN wget -O /etc/nginx/dhparam https://ssl-config.mozilla.org/ffdhe2048.txt && \
    mkdir -p /etc/nginx/templates-http && \
    mkdir -p /etc/nginx/templates-proxied && \
    mkdir -p /etc/nginx/templates-https && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/add_header.inc && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/add_header_with_hsts.inc && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/blocked.inc && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/real_ip_from.inc && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/server_block.inc && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/ssl.inc && \
    wget -P /etc/nginx/templates-http https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/http_block.inc.template && \
    wget -O /etc/nginx/templates-http/default.conf.template https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/default.conf_http.template && \
    wget -O /etc/nginx/templates-proxied/default.conf.template https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/default.conf_proxied.template && \
    wget -O /etc/nginx/templates-https/default.conf.template https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/default.conf_https.template && \
    ln -s /etc/nginx/templates-http/http_block.inc.template /etc/nginx/templates-proxied/http_block.inc.template && \
    ln -s /etc/nginx/templates-http/http_block.inc.template /etc/nginx/templates-https/http_block.inc.template && \
    mv /usr/share/mastodon/public/favicon.ico /usr/share/mastodon/public/favicon-original.ico && \
    mv /usr/share/mastodon/public/android-chrome-192x192.png /usr/share/mastodon/public/android-chrome-192x192-original.png && \
    mv /usr/share/mastodon/public/apple-touch-icon.png /usr/share/mastodon/public/apple-touch-icon-original.png && \
    mv /usr/share/mastodon/public/mstile-150x150.png /usr/share/mastodon/public/mstile-150x150-original.png && \
    rm /usr/share/mastodon/public/500.html && \
    rm /usr/share/mastodon/public/sw.js && \
    wget -P /usr/share/mastodon/public/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/favicon.ico && \
    wget -P /usr/share/mastodon/public/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/android-chrome-192x192.png && \
    wget -P /usr/share/mastodon/public/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/apple-touch-icon.png && \
    wget -P /usr/share/mastodon/public/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/mstile-150x150.png