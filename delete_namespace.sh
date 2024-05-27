#!/bin/zsh

ip netns delete wifi_ns

if [ $? -ne 0 ]; then
    echo "script failed!"
    exit 1
fi


echo "namespace wifi_ns deleted!"

