    if ($http_user_agent ~* "mastodonhub.com") {
        return 403;
    }
    if ($http_user_agent ~* "beebear.party") {
        return 403;
    }
    if ($http_user_agent ~* "solagg.com") {
        return 403;
    }
    if ($http_user_agent ~* "poa.st") {
        return 403;
    }
    if ($http_user_agent ~* "iddqd.social") {
        return 403;
    }