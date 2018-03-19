#!/bin/bash
set -e

#https://github.com/kylemanna/docker-aosp/blob/master/utils/docker_entrypoint.sh 

# Reasonable defaults if no USER_ID/GROUP_ID environment variables are set.
if [ -z ${USER_ID+x} ]; then USER_ID=1000; fi
if [ -z ${GROUP_ID+x} ]; then GROUP_ID=1000; fi

# ccache
export CCACHE_DIR=/tmp/ccache
export USE_CCACHE=1

groupadd -g 1000 -r aosp
useradd -u 1000 --create-home -r -g aosp aosp

cp /root/.gitconfig /home/aosp/.gitconfig
chown aosp:aosp /home/aosp/.gitconfig

mkdir -p /tmp/ccache /aosp
chown aosp:aosp /tmp/ccache /aosp
export HOME=/home/aosp
sudo -E -u aosp /bin/bash
