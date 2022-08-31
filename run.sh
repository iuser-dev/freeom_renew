#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

./decrypt.sh

if [ ! -d freenom ]; then
git clone --depth=1 https://github.com/luolongfei/freenom.git
cd freenom
else
cd freenom
git pull || true
fi

if [ ! -f .env ]; then
cp ../.env .
fi

docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app php:8 php run
