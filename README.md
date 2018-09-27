# aosp-442

docker build aosp 4.4.2

## docker command

docker run
```
docker run -e CCACHE_DIR=$cdir -e WORK_DIR=$vdir -v $HOME/$ssd1:/mnt/aosp -it --rm --name $name erwinchang/aosp-442 /bin/bash
```

enable aosp ccache
```
prebuilts/misc/linux-x86/ccache/ccache -M 10G
source build/envsetup.sh
lunch aosp_arm-eng
make -j4
```

### docker-run.sh

```
#!/bin/bash

[ "${USER}" == "aosp" ] && exit 0

				# /home/xxx/ssd2/workspace/erwin-hud/hud_bsp
dirx="${PWD:${#HOME}}"          # remove /home/xxx
dirx=${dirx#/}                  # remove /
ssdx="${dirx:0:4}"
name=$(echo "$dirx" | sed 's/\//./g')
dirx=${dirx#*/}                 # remove ssd2
vdir="/mnt/aosp/$dirx"
cdir="$vdir/ccache"

[ ! -d ccache ] && mkdir -p ccache
docker run -e CCACHE_DIR=$cdir -e WORK_DIR=$vdir -v $HOME/$ssdx:/mnt/aosp -it --rm --name $name erwinchang/aosp-442 /bin/bash
```

## 參考來源

- [sameersbn/docker-ubuntu][1]
- [kylemanna/docker-aosp][2]
- [AOSP build environment][3]


[1]:https://github.com/sameersbn/docker-ubuntu/tree/14.04
[2]:https://github.com/kylemanna/docker-aosp
[3]:https://source.android.com/setup/initializing#setting-up-a-linux-build-environment

