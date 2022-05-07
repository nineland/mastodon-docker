#!/bin/bash

clean_cache=`sudo docker exec mastodon_web_1 tootctl cache clear`
clean_outside=`sudo docker exec mastodon_web_1 tootctl media remove`
body="清理缓存："$'\n'"${clean_cache}"$'\n'"清理外站媒体：""${clean_outside}"
curl -X POST \
    -d 'title=%E5%AD%98%E5%82%A8%E6%AF%8F%E6%97%A5%E6%B8%85%E7%90%86' \
    -d 'group=mastodon' \
    -d 'isArchive=1' \
    -d 'icon=<encoded url to your own icon or just remove this line>' \
    --data-urlencode "body=${body}" \
    https://api.day.app/<your own brak device ID, refer to https://github.com/Finb/Bark>
