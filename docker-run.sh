#!/bin/bash

[ "${USER}" == "aosp" ] && exit 0

dirx="${PWD:${#HOME}}"		# remove /ssd2/workspace/xxx/hud_bsp
dirx=${dirx#/}			# remove /
ssdx="${dirx:0:4}"
name=$(echo "$dirx" | sed 's/\//./g')
dirx=${dirx#*/}			# remove ssd2
vdir="/mnt/aosp/$dirx"
cdir="$vdir/ccache"

[ ! -d ccache ] && mkdir -p ccache
docker run -e CCACHE_DIR=$cdir -e WORK_DIR=$vdir -v $HOME/$ssdx:/mnt/aosp -it --rm --name $name erwinchang/aosp-442 /bin/bash
