#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR

. ./key.sh

gpg --batch --yes --decrypt --passphrase=$KEY .env.txz.gpg | tar xJvf -
