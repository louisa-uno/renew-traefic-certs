#!/bin/bash

renew_cert() {
    local domain=$1
    certbot certonly --dns-cloudflare --config-dir /certs -d "$domain" --dns-cloudflare-credentials cloudflare.ini -n --agree-tos --email email@example.com --no-autorenew
}

main() {
    local domains=("example.com" "example2.com")

    for domain in "${domains[@]}"; do
        echo "Renewing certificate for $domain..."
        renew_cert "$domain"
    done
}

main
