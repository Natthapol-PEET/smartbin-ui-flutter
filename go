#!/usr/bin/env bash

set -e

help__cloneEngine="step-1 - flutter-engine-binaries-for-arm"
task_cloneEngine(){
    git clone https://github.com/ardera/flutter-engine-binaries-for-arm.git
}

help__build="step-2 - flutter build bundle"
task_build(){
    fvm flutter build bundle
}

help__windowsSnapshot="step-3 - build snapshot"
task_windowsSnapshot(){
    flutter pub get

    C:\Users\natth\fvm\default\bin\cache\dart-sdk\bin\dart.exe ^
      C:\Users\natth\fvm\default\bin\cache\dart-sdk\bin\snapshots\frontend_server.dart.snapshot ^
      --sdk-root C:\Users\natth\fvm\default\bin\cache\artifacts\engine\common\flutter_patched_sdk_product ^
      --target=flutter ^
      --aot ^
      --tfa ^
      -Ddart.vm.product=true ^
      --packages .dart_tool\package_config.json ^
      --output-dill build\kernel_snapshot.dill ^
      --verbose ^
      --depfile build\kernel_snapshot.d ^
      package:app_3_10_5/main.dart
}

help__linuxAppSo="step-4 - build app.so"
task_linuxAppSo(){
  /mnt/d/ku-csc/smartbin-gui-new/flutter-engine-binaries-for-arm/arm64/gen_snapshot_linux_x64_release \
  --deterministic \
  --snapshot_kind=app-aot-elf \
  --elf=build/flutter_assets/app.so \
  --strip \
  build/kernel_snapshot.dill
}

help__scpToPi="step-5 - tranfer folder flutter_assets to pi"
task_scpToPi(){
  # sudo apt install sshpass
  sshpass -p "12345678" scp -r scp /mnt/d/ku-csc/smartbin-gui-new/app_3_10_5/build/flutter_assets pi@192.168.1.105:/home/pi
}

help__remotePi="step-6 - remote raspberry pi"
task_remotePi(){
  sshpass -p "12345678" ssh pi@192.168.1.105
  # flutter-pi --release flutter_assets
}

## main
list_all_helps() {
  compgen -v | egrep "^help__.*"
}

NEW_LINE=$'\n'
if type -t "task_$TASK" &>/dev/null; then
  task_${TASK} ${ARGS}
else
  echo "usage: $0 <task> [<..args>]"
  echo "task:"

  HELPS=""
  for help in $(list_all_helps)
  do

    HELPS="$HELPS    ${help/help__/} |-- ${!help}$NEW_LINE"
  done

  echo "$HELPS" | column -t -s "|"
  exit 1
fi