ARG MASTODON_VER
FROM tootsuite/mastodon:v${MASTODON_VER} AS builder

FROM nginx:alpine

LABEL maintainer="Nine Land Mastodon Administrator <mastodon-long@nine.land>"
LABEL org.opencontainers.image.description="Nginx container image for mastodon, with static files."

ENV NGINX_BACKEND_WEB_HOST=web \
    NGINX_BACKEND_WEB_PORT=3000 \
    NGINX_BACKEND_STREAMING_HOST=streaming \
    NGINX_BACKEND_STREAMING_PORT=4000 \
    NGINX_SERVER_NAME= \
    NGINX_SSL_CERT= \
    NGINX_SSL_KEY= \
    NGINX_MASTODON_ROOT="/usr/share/mastodon/public" \
    NGINX_REAL_IP_HEADER="CF-Connecting-IP" \
    NGINX_REAL_IP_VARIABLE="\$http_cf_connecting_ip" \
    TZ=Asia/Shanghai

COPY --from=builder /opt/mastodon/public /usr/share/mastodon/public

RUN mkdir -p /etc/nginx/templates && \
    mkdir -p /etc/nginx/https-templates && \
    wget -P /etc/nginx/conf.d https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/blocked.inc && \
    wget -P /etc/nginx/templates https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/http_block.inc.template && \
    wget -P /etc/nginx/templates https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/server_block.inc.template && \
    wget -O /etc/nginx/templates/default.conf.template https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/http_default.conf.template && \
    wget -O /etc/nginx/https-templates/default.conf.template https://raw.githubusercontent.com/nineland/mastodon-docker/main/nginx/templates/https_default.conf.template && \
    ln -s /etc/nginx/templates/http_block.inc.template /etc/nginx/https-templates/http_block.inc.template && \
    ln -s /etc/nginx/templates/server_block.inc.template /etc/nginx/https-templates/server_block.inc.template && \
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