#!/bin/sh

cp -L /lib64/libc.so.6 lib64/
cp -L /lib64/libpthread.so.0 lib64/
cp -L /lib64/ld-linux-x86-64.so.2 lib64/

docker build -t ulexus/go-minimal ./
