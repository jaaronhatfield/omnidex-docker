#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: ${0} <version>"
    exit 1
fi

VERSION=${1}

# TODO as new RPMs are made available for download,
#      supply new versions and the latest suffixes below
case "${VERSION}" in
  "5.5")
    SUFFIX="01D"
    ;;
  "5.4")
    SUFFIX="05A"
    ;;
  "5.3")
    SUFFIX="09H"
    ;;
  *)
    echo "${VERSION} is not a supported version"
    exit 1
    ;;
esac

RPM=https://www.omnidex.com/downloads/omnidex/Linux/el6/omnidex-${VERSION}-${SUFFIX}.el6.linux.x86_64.rpm

docker build --rm --build-arg RPM=${RPM} --tag omnidex-${VERSION} .
if [ $? -ne 0 ]; then
  echo -e "$(tput setaf 1)doh! docker build command failed$(tput sgr0)"
  echo
  exit 1
fi
