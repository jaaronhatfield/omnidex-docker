#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: ${0} <version>"
    exit 1
fi

VERSION=${1}

docker stop omnidex-${VERSION} > /dev/null
if [ $? -ne 0 ]; then
  echo -e "$(tput setaf 1)doh! docker stop command failed$(tput sgr0)"
  echo
  exit 1
fi

docker rm omnidex-${VERSION} > /dev/null
if [ $? -ne 0 ]; then
  echo -e "$(tput setaf 1)doh! docker rm command failed$(tput sgr0)"
  echo
  exit 1
fi
