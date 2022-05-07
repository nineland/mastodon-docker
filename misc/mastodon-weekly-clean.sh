#!/bin/bash

clean_cards=`sudo docker exec mastodon_web_1 tootctl preview_cards remove --days 14`
clean_statuses=`sudo docker exec mastodon_web_1 tootctl statuses remove --days 30`
clean_media=`sudo docker exec mastodon_web_1 tootctl media remove-orphans`
body="清理预览卡片：${clean_cards}"$'\n'$'\n'"清理无效条目："$'\n'"${clean_statuses}"$'\n'$'\n'"清理无效媒体：${clean_media}"
curl -X POST \
    -d 'title=%E5%AD%98%E5%82%A8%E6%AF%8F%E5%91%A8%E6%B8%85%E7%90%86' \
    -d 'group=mastodon' \
    -d 'isArchive=1' \
    -d 'icon=<encoded url to your own icon or just remove this line>' \
    --data-urlencode "body=${body}" \
    https://api.day.app/<your own brak device ID, refer to https://github.com/Finb/Bark>
