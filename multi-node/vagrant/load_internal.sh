#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 <url_of_ca_chain>"
fi

for i in w1 w2 w3 w4; do
    vagrant ssh $i -- 'cd /etc/ssl/certs && sudo wget --no-check-certificate "'$1'" && sudo update-ca-certificates | grep ardexa && sudo systemctl restart docker'
done
