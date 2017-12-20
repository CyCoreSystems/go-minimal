FROM scratch
COPY lib64 /lib64
COPY certs /etc/ssl/certs
COPY zoneinfo /usr/share/zoneinfo
ENTRYPOINT ["/app"]
CMD []
