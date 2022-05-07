#!/bin/bash

# Will not rebuild mastodon_es_1

pushd /home/ubuntu/mastodon
sudo docker stop mastodon_sidekiq_1 mastodon_streaming_1 mastodon_web_1 mastodon_nginx_1
sudo docker rm mastodon_sidekiq_1 mastodon_streaming_1 mastodon_web_1 mastodon_nginx_1
sudo docker-compose up -d
sudo docker-compose ps -a
popd
