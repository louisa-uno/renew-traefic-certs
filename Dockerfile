FROM alpine:latest

LABEL org.opencontainers.image.source = "https://github.com/louisa-uno/renew-traefic-certs"

RUN apk add --no-cache python3 py3-pip bash && \
    apk add --no-cache certbot certbot-dns-cloudflare

RUN echo "1-15/5 */6 * * * certbot renew --config-dir /certs >> /var/log/cron.log 2>&1" > /etc/crontabs/root

RUN touch /var/log/cron.log

CMD /certs/renew.sh && crond -f -l 2
