#!/bin/bash

datetime=$(date +%Y%m%d%H%M%S)
file="/home/ubuntu/backup/mastodon_db_${datetime}.dump"
sudo docker exec mastodon_db_1 pg_dump -Fc -U postgres postgres > "${file}"
size=`ls -lh "${file}" | awk '{ print $5 }'`
body="备份文件："$'\n'"${file}"$'\n'$'\n'"备份大小："$'\n'"${size}"
curl -X POST \
    -d 'title=%E6%AF%8F%E6%97%A5%E6%95%B0%E6%8D%AE%E5%A4%87%E4%BB%BD' \
    -d 'group=mastodon' \
    -d 'isArchive=1' \
    -d 'icon=<encoded url to your own icon or just remove this line>' \
    --data-urlencode "body=${body}" \
    https://api.day.app/<your own brak device ID, refer to https://github.com/Finb/Bark>
