#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: ${0} <version>"
    exit 1
fi

VERSION=${1}

function is_not_running {
  if [ $(docker ps -aqf "name=omnidex-${VERSION}") ]; then
    return 1
  else
    return 0
  fi
}

if is_not_running ${VERSION}; then
  if [ ! -d omnidex-${VERSION}-data ]; then
    mkdir omnidex-${VERSION}-data
    cp ./archives/* ./omnidex-${VERSION}-data
  fi
  docker run -it --name omnidex-${VERSION} --mount type=bind,source="$(pwd)"/omnidex-${VERSION}-data,target=/data -d omnidex-${VERSION} > /dev/null
  if [ $? -ne 0 ]; then
    echo -e "$(tput setaf 1)doh! docker run command failed$(tput sgr0)"
    echo
    exit 1
  fi
fi
docker exec -it omnidex-${VERSION} /bin/bash
