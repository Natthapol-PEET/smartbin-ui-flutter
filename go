#!/usr/bin/env bash

set -e
TASK=$1
ARGS=${@:2}

help__fixLint="fix lint dart format"
task_fixLint() {
  dart format lib -l 120
}

help__cloneEngine="step-1 - flutter-engine-binaries-for-arm"
task_cloneEngine(){
    git clone https://github.com/ardera/flutter-engine-binaries-for-arm.git
}

help__codeAnalytics="run code analytics"
task_codeAnalytics() {
   flutter analyze lib --write=analyzer-output.txt
}

help__build="step-2 - flutter build bundle"
task_build(){
    echo run bash win.sh on command promp
}

help__windowsSnapshot="step-3 - build snapshot"
task_windowsSnapshot(){
    echo run bash win.sh on command promp
}

help__linuxAppSo="step-4 - build app.so"
task_linuxAppSo(){
  echo run sh wsl.sh on wsl shell
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

help__push="git add . & git commit & git push"
task_push(){
  git add .
  git commit -m $1
  git push
}

help__buildWeb="flutter build web"
task_buildWeb(){
  fvm flutter build web --release
}

help__dockerRun="docker-compose up -d"
task_dockerRun(){
  sudo docker-compose up -d
}

help__dockerDown="docker-compose down -d"
task_dockerDown(){
  sudo docker-compose down
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