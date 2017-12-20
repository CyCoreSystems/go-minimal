#!/bin/sh

cp -L /lib64/libc.so.6 lib64/
cp -L /lib64/libpthread.so.0 lib64/
cp -L /lib64/ld-linux-x86-64.so.2 lib64/

# Add CA certificates
mkdir -p certs
cp -L /etc/ssl/certs/* certs/

# Add timezone definitions
mkdir -p zoneinfo
cp -RL /usr/share/zoneinfo/* zoneinfo/

docker build -t ulexus/go-minimal ./
