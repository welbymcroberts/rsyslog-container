FROM alpine:20210804
RUN apk --no-cache update \
    && apk --no-cache add \
       rsyslog 
RUN adduser -s /bin/false -D rsyslog rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "rsyslogd", "-n"]
