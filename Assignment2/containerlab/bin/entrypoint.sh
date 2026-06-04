#!/bin/bash

NODE_NAME=$(hostname)
echo "=== Configuring Network for $NODE_NAME ==="

if [ "$NODE_NAME" = "hs1" ]; then
    ip link set eth1 up
    ip addr add 10.0.1.2/24 dev eth1
    ip -6 addr add fc00:1::2/64 dev eth1
    
    ip route add default via 10.0.1.1
   
    ip -6 route add fc00:2::/64 via fc00:1::1
    
    echo "[OK] hs1 configured."

elif [ "$NODE_NAME" = "hs2" ]; then
    ip link set eth1 up
    ip addr add 10.0.2.2/24 dev eth1
    ip -6 addr add fc00:2::2/64 dev eth1
    
    ip route add default via 10.0.2.1

    ip -6 route add fc00:1::/64 via fc00:2::1
    
    echo "[OK] hs2 configured."

elif [ "$NODE_NAME" = "rt1" ]; then
    ip link set eth1 up
    ip link set eth2 up
    
    ip addr add 10.0.1.1/24 dev eth1
    ip -6 addr add fc00:1::1/64 dev eth1
    
    ip addr add 10.0.2.1/24 dev eth2
    ip -6 addr add fc00:2::1/64 dev eth2
    
    sysctl -w net.ipv4.ip_forward=1
    sysctl -w net.ipv6.conf.all.forwarding=1
    echo "[OK] rt1 configured with forwarding enabled."
fi
