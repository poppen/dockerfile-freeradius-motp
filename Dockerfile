FROM marcelmaatkamp/freeradius:latest

COPY config/raddb/sites-available/default /etc/raddb/sites-available/default
COPY config/raddb/sites-available/inner-tunnel /etc/raddb/site-available/inner-tunnel
COPY config/raddb/mods-enabled/motp /etc/raddb/mods-enabled/motp
COPY config/raddb/dictionary.motp /etc/raddb/dictionary.motp
COPY otpverify.sh /usr/local/bin/

# hadolint ignore=DL3018
RUN apk update && \
    apk --no-cache add \
        bash && \
    echo "\$INCLUDE	/etc/raddb/dictionary.motp" >> /etc/raddb/dictionary && \
    mkdir /var/motp && \
    mkdir /var/motp/cache && \
    mkdir /var/motp/users && \
    chown -R radius:radius /var/motp && \
    chmod 0755 /usr/local/bin/otpverify.sh
