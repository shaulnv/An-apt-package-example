#!/bin/bash

cp hello.sh ./hello-deb/usr/local/bin
dpkg-deb --build hello-deb
