#!/bin/bash

echo "Install HAProxy"
sudo apt-get -y update
sudo apt-get -y install curl haproxy

echo "Enable HAProxy"
sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy

echo "Configure HAProxy"
sudo mv /etc/haproxy/haproxy.cfg{,.original}

sudo echo "
global
    log 127.0.0.1 local0 notice
    maxconn 2000
    user haproxy
    group haproxy
    
defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    retries 3
    option redispatch
    timeout connect  5000
    timeout client  10000
    timeout server  10000
    
listen appname 0.0.0.0:80
    mode http
    stats enable
    stats uri /haproxy?stats
    stats realm Strictly\ Private
    stats auth A_Username:YourPassword
    stats auth Another_User:passwd
    balance roundrobin
    option httpclose
    option forwardfor
    server node1 192.168.56.11:80 check
    server node2 192.168.56.12:80 check
    " >> /etc/haproxy/haproxy.cfg

echo "Starting HAProxy Service"
sudo service haproxy start