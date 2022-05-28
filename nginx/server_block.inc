    server_tokens off;

    keepalive_timeout 70;
    sendfile on;
    client_max_body_size 80m;

    gzip on;
    gzip_disable "msie6";

    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_min_length 256;
    gzip_types application/atom+xml application/geo+json application/javascript application/x-javascript application/json application/ld+json application/manifest+json application/rdf+xml application/rss+xml application/xhtml+xml application/xml font/eot font/otf font/ttf image/svg+xml text/css text/javascript text/plain text/xml;

    include /etc/nginx/conf.d/blocked.inc;

    include /etc/nginx/conf.d/add_header.inc;

    location / {
        try_files $uri @proxy;
    }

    location @proxy {
        proxy_pass http://backend;
        proxy_buffering on;
        proxy_redirect off;
        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;

        proxy_set_header User-Agent $http_user_agent;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header Proxy "";
        proxy_pass_header Server;

        proxy_cache CACHE;
        proxy_cache_valid 200 7d;
        proxy_cache_valid 410 24h;
        proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
        add_header X-Cached $upstream_cache_status;

        tcp_nodelay on;
    }

    location /api/v1/streaming {
        proxy_pass http://streaming;
        proxy_buffering on;
        proxy_redirect off;
        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;

        proxy_set_header User-Agent $http_user_agent;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header Proxy "";

        tcp_nodelay on;
    }

    error_page 500 501 502 503 504 /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }