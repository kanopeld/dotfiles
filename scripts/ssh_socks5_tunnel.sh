#!/usr/bin/env bash

while true
do
	echo "Starting ssh tunnel to pl.waw1 proxy"
	timeout 1m ssh -D 1137 -qN socks@pl.waw1
	echo "SSH tunnel closed"
done