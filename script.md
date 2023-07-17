

<!-- windows -->
flutter build bundle


<!-- windows -->
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

<!-- linux root path -->
<!-- /mnt/d/ku-csc/smartbin-gui-new/flutter-engine-binaries-for-arm/arm/gen_snapshot_linux_x64_release \
  --deterministic \
  --snapshot_kind=app-aot-elf \
  --elf=build/flutter_assets/app.so \
  --strip \
  --sim-use-hardfp \
  --no-use-integer-division  \
  build/kernel_snapshot.dill -->

/mnt/d/ku-csc/smartbin-gui-new/flutter-engine-binaries-for-arm/arm64/gen_snapshot_linux_x64_release \
  --deterministic \
  --snapshot_kind=app-aot-elf \
  --elf=build/flutter_assets/app.so \
  --strip \
  build/kernel_snapshot.dill

<!-- Generating the AOT Snapshot -->
<!-- /mnt/d/ku-csc/smartbin-gui-new/flutter-engine-binaries-for-arm/arm/gen_snapshot_linux_x64_profile \                              \
    --causal_async_stacks                                         \
    --packages=.packages                                          \
    --deterministic                                               \
    --snapshot_kind=app-aot-blobs                                 \
    --vm_snapshot_data=build/vm_snapshot_data                     \
    --isolate_snapshot_data=build/isolate_snapshot_data           \
    --vm_snapshot_instructions=build/vm_snapshot_instr            \
    --isolate_snapshot_instructions=build/isolate_snapshot_instr  \
    --no-sim-use-hardfp                                           \
    --no-use-integer-division                                     \
    --obfuscate                                               \
    --save-obfuscation-map=obfuscate.json                     \
    build/kernel_snapshot.dill -->


scp -r scp /mnt/d/ku-csc/smartbin-gui-new/app_3_10_5/build/flutter_assets pi@192.168.1.105:/home/pi
12345678


ssh pi@192.168.1.105
12345678


flutter-pi --release flutter_assets
flutter-pi --profile flutter_assets