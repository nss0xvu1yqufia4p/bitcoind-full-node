#!/bin/bash
checksum="da7766775e3f9c98d7a9145429f2be8297c2672fe5b118fd3dc2411fb48e0032"
filename="bitcoin-0.21.0-x86_64-linux-gnu.tar.gz"
wget "https://bitcoin.org/bin/bitcoin-core-0.21.0/bitcoin-0.21.0-x86_64-linux-gnu.tar.gz"
test="$(echo "$checksum $filename" | sha256sum -c)"
if [[ "$test" != "$filename: OK" ]]; then
	exit 1
fi
tar xvf $filename
install -m 0755 -o root -g root -t /usr/local/bin bitcoin-0.21.0/bin/*
mkdir ~/.bitcoin
unlink /etc/nginx/sites-enabled/default
cp ./reverse-proxy.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

