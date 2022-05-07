#!/bin/bash

usage=`sudo docker exec mastodon_web_1 tootctl media usage`
curl -X POST \
    -d 'title=%E5%AD%98%E5%82%A8%E4%BD%BF%E7%94%A8%E6%83%85%E5%86%B5' \
    -d 'group=mastodon' \
    -d 'isArchive=1' \
    -d 'icon=<encoded url to your own icon or just remove this line>' \
    --data-urlencode "body=${usage}" \
    https://api.day.app/<your own brak device ID, refer to https://github.com/Finb/Bark>
