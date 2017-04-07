FROM scratch
COPY lib64 /lib64
COPY certs /etc/ssl/certs
ENTRYPOINT ["/app"]
CMD []
