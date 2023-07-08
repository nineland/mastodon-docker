FROM ghcr.io/mastodon/mastodon:v3.5.10

LABEL maintainer="Nine Land Mastodon Administrator <mastodon-long@nine.land>"
LABEL org.opencontainers.image.description="Mastodon container image, with patched code for Chinese search optimization."

ENV TZ=Asia/Shanghai

RUN rm /opt/mastodon/app/chewy/accounts_index.rb && \
    rm /opt/mastodon/app/chewy/statuses_index.rb && \
    rm /opt/mastodon/app/chewy/tags_index.rb && \
    wget -P /opt/mastodon/app/chewy/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/mastodon/src/app/chewy/accounts_index.rb && \
    wget -P /opt/mastodon/app/chewy/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/mastodon/src/app/chewy/statuses_index.rb && \
    wget -P /opt/mastodon/app/chewy/ https://raw.githubusercontent.com/nineland/mastodon-docker/main/mastodon/src/app/chewy/tags_index.rb
