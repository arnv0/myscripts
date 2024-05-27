#!/bin/zsh

echo creating namespace for wifi...


ip netns add wifi_ns

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi

ip link add link wlp0s20f3 wlp0s20f3_vi netns wifi_ns type ipvlan mode l2

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi


ip -n wifi_ns link set lo up

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi


ip -n wifi_ns link set wlp0s20f3_vi up

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi

ip -n wifi_ns addr add 192.168.2.91/24 dev wlp0s20f3_vi

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi


ip -n wifi_ns route add default via 192.168.2.1 dev wlp0s20f3_vi

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi

echo "success! interface wifi_ns with ip 192.168.2.91 is up!"
