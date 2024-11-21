FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/louisa-uno/renew-traefic-certs"

RUN apk add --no-cache python3 py3-pip bash && \
    apk add --no-cache certbot certbot-dns-cloudflare

RUN echo "*/5 * * * * certbot renew --config-dir /certs" | crontab -

RUN touch /var/log/cron.log

CMD certbot renew --config-dir /certs && crond -f -l 2
