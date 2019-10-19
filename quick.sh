#!/bin/bash

make clean && \
./make_gcw.sh && \
./make_opk.sh && \
scp ./rott.opk root@10.1.1.2:/media/data/apps/rott.opk && \
echo "ssh in and run - 
opkrun /media/data/apps/rott.opk /media/data/local/home/.rott/darkwar"

