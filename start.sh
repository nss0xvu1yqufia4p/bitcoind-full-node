#!/bin/bash
cp bitcoin.conf ~/.bitcoin/
service nginx start
bitcoind --txindex
