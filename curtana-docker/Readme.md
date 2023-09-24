#Process to compile curtana kernel with docker support

##Copy paste below command into your cli
```
curl -sL https://raw.githubusercontent.com/HarshitBhatt043/curtana/droidian/curtana-docker/compile.sh | bash
```
It will take tiime to compile (depends on device to device).After that copy boot img from out folder and flash using
```
fastboot flash boot boot.img
```
```
fastboot reboot
```
After the device booted.Run the below code to check docker compatibility
```
curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > check-config.sh

bash ./check-config.sh
```