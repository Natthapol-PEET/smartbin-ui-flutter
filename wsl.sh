#!/bin/sh
/mnt/d/ku-csc/smartbin-ui-flutter/flutter-engine-binaries-for-arm/arm64/gen_snapshot_linux_x64_release \
  --deterministic \
  --snapshot_kind=app-aot-elf \
  --elf=build/flutter_assets/app.so \
  --strip \
  build/kernel_snapshot.dill

sshpass -p "12345678" scp -r scp /mnt/d/ku-csc/smartbin-ui-flutter/build/flutter_assets pi@192.168.1.105:/home/pi

sshpass -p "12345678" ssh pi@192.168.1.105
flutter-pi --release flutter_assets         # manual
