#!/bin/sh

yarn && yarn build

if [ "${1}" != "" ]; then exec "$@"; fi
