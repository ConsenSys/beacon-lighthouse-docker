#!/bin/bash

host=$1

peer_count=`curl -s "http://${host}:5052/network/peers" | jq length`

[[ $peer_count -gt 0 ]]
