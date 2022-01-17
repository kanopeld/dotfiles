#!/usr/bin/env bash

cp varmilo-fix-fn.sh /usr/bin/fix_fn
chmod +x /usr/bin/fix_fn
chown root:users /usr/bin/fix_fn

go get -u github.com/kanopeld/timeout
chmod +x ./ssh_socks5_tunnel.sh