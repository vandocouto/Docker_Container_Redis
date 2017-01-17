#!/bin/bash


echo "511" > /proc/sys/net/core/somaxconn
echo never > /sys/kernel/mm/transparent_hugepage/enabled
/etc/init.d/ssh start
redis-server /etc/redis/redis.conf 
