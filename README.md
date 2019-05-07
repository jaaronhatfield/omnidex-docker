# omnidex-docker

## About

[Omnidex](https://www.omnidex.com/) is a database search engine produced by [Dynamic Information Systems Corporation](https://www.omnidex.com/company/).

This repository was created to run released versions of Omnidex in Docker containers for the purpose of training exercises. Nothing here has been evaluated in a production environment.

## Setup

Before running any scripts, install Docker Community Edition (CE)...
* [Mac](<https://docs.docker.com/docker-for-mac/install/>)
* [Windows](<https://docs.docker.com/docker-for-windows/install/>)
* [CentOS](<https://docs.docker.com/install/linux/docker-ce/centos/>)
* [Debian](<https://docs.docker.com/install/linux/docker-ce/debian/>)
* [Fedora](<https://docs.docker.com/install/linux/docker-ce/fedora/>)
* [Ubuntu](<https://docs.docker.com/install/linux/docker-ce/ubuntu/>)

## Running docker build

The following command builds an image of Omnidex on CentOS. Supply a version as the single parameter. (5.6, etc.)
```bash
./docker-build.sh <version>
```

## Running docker exec

The following command starts a container of Omnidex on CentOS, if one is not yet running, and then attaches an interactive bash shell. If the container is already running, this command simply reattaches to the existing container instead of creating a new one. Supply a version as the single parameter. (5.6, etc.)
```bash
./docker-exec.sh <version>
```

An ./omnidex-&lt;version&gt;-data directory is mounted as /data within the container and is populated with archives for training exercises.

## Running docker stop

The following command stops a container of Omnidex on CentOS, if one is running, and then removes it. Supply a version as the single parameter. (5.6, etc.)
```bash
./docker-stop.sh <version>
```
## Links

* [Omnidex Documentation](<https://www.omnidex.com/docs/>)