FROM nginx:alpine

LABEL maintainer="Nine Land Mastodon Administrator <mastodon-long@nine.land>"

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

RUN mkdir -p /etc/nginx/templates && \
    mkdir -p /etc/nginx/https-templates && \
    wget -P /etc/nginx/conf.d https://github.com/nineland/mastodon-docker/raw/nginx/blocked.inc && \
    wget -P /etc/nginx/templates https://github.com/nineland/mastodon-docker/raw/nginx/templates/http_block.inc.template && \
    wget -P /etc/nginx/templates https://github.com/nineland/mastodon-docker/raw/nginx/templates/http_default.conf.template && \
    wget -P /etc/nginx/templates https://github.com/nineland/mastodon-docker/raw/nginx/templates/server_block.inc.template && \
    wget -P /etc/nginx/https-templates https://github.com/nineland/mastodon-docker/raw/nginx/templates/https_default.conf.template && \
    ln -s /etc/nginx/templates/http_block.inc.template /etc/nginx/https-templates/http_block.inc.template && \
    ln -s /etc/nginx/templates/server_block.inc.template /etc/nginx/https-templates/server_block.inc.template