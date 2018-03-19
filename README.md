#aosp-442

docker build aosp 4.4.2

## docker command

docker run
```
docker run -v /mnt/ssd3:/mnt/ssd3 -v /mnt/ssd3/ccache:/tmp/ccache -it --rm --name aosp erwinchang/aosp-442 /bin/bash
```

enable aosp ccache
```
prebuilts/misc/linux-x86/ccache/ccache -M 10G
source build/envsetup.sh
lunch aosp_arm-eng
make -j $cpus
```

## 參考來源

- [sameersbn/docker-ubuntu][1]
- [kylemanna/docker-aosp][2]
- [AOSP build environment][3]


[1]:https://github.com/sameersbn/docker-ubuntu/tree/14.04
[2]:https://github.com/kylemanna/docker-aosp
[3]:https://source.android.com/setup/initializing#setting-up-a-linux-build-environment

