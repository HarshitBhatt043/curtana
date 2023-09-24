# Process to compile curtana kernel with docker support

## Copy paste below command into your cli

```
curl -sL https://raw.githubusercontent.com/HarshitBhatt043/curtana/droidian/curtana-docker/compile.sh | bash
```

### It will take tiime to compile (depends on device to device).After that copy boot img from out folder and flash using

```
fastboot flash boot boot.img
```

```
fastboot reboot
```

## After the device booted.

### Run the below code to check docker compatibility

```
curl https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh > check-config.sh

bash ./check-config.sh
```

#### Enable apparmor if its showing apparmor_parser missing when docker compatibility ran

```
sudo systemctl unmask apparmor
```

```
sudo apt install apparmor
```

```
sudo systemctl start apparmor
```

## NOTE: I didn't found a way to give apparmor_parser access to user that's why we need to run our docker containers using --privileged

### Prevent from kernel version upgrade.

```
sudo apt-mark hold $(uname -r)
```
