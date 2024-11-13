FROM alpine:latest

RUN apk add --no-cache python3 py3-pip bash && \
    apk add --no-cache certbot certbot-dns-cloudflare

RUN echo "*/5 * * * * /certs/renew.sh >> /var/log/cron.log 2>&1" > /etc/crontabs/root

RUN touch /var/log/cron.log

CMD /certs/renew.sh && crond -f -l 2