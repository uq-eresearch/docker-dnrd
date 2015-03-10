FROM progrium/busybox
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au>

VOLUME /var/lib/dnrd

COPY /dnrd /usr/local/bin/dnrd

EXPOSE 53

RUN adduser -h /var/lib/dnrd -D dnrd

ENTRYPOINT ["/usr/local/bin/dnrd","-R","/var/lib/dnrd","-d","1","-c","off"]
