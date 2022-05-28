        add_header Strict-Transport-Security "max-age=31536000" always;
        add_header Permissions-Policy "interest-cohort=()";
        add_header X-Frame-Options sameorigin;
        add_header X-Content-Type-Options nosniff;
        add_header X-XSS-Protection "1; mode=block";