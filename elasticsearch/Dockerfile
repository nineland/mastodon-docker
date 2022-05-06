ARG ES_VER
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:${ES_VER}

LABEL maintainer="Nine Land Mastodon Administrator <mastodon-long@nine.land>"
LABEL org.opencontainers.image.description="Elasticsearch container image, with analysis plugin ik and stconvert for Chinese search optimization."

ARG ES_VER
ENV TZ=Asia/Shanghai

RUN curl -L "https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ES_VER}/elasticsearch-analysis-ik-${ES_VER}.zip" -o /tmp/ik.zip && \
    curl -L "https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v${ES_VER}/elasticsearch-analysis-stconvert-${ES_VER}.zip" -o /tmp/stconvert.zip && \
    unzip -q /tmp/ik.zip -d /usr/share/elasticsearch/plugins/ik && \
    unzip -q /tmp/stconvert.zip -d /usr/share/elasticsearch/plugins/stconvert && \
    rm /tmp/ik.zip && \
    rm /tmp/stconvert.zip