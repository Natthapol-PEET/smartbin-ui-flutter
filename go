#!/usr/bin/env bash

set -e
TASK=$1
ARGS=${@:2}

ECR_URL="688318228301.dkr.ecr.ap-southeast-1.amazonaws.com"
FLUTTER_IMAGE="${ECR_URL}/superapp-apollo/apl-flutter"
SONAR_SCANNER_CLI_DOCKER_IMAGE="sonarsource/sonar-scanner-cli"
OWASP_DOCKER_IMAGE="owasp/dependency-check"
COVERAGE_TARGET=50
E2E_DIRECOTRY="integration_test/tests/new_test_case"

VERSION=1.2

# runs_inside_gocd() {
#   test -n "${GO_JOB_NAME}"
# }

# help__lintCheck="check lint format"
# task_lintCheck() {
#   flutter_app dart format lib -l 120  &> lint_check_result.log
#   FILE="lint_check_result.log"
#   FIND_WORD="dart"
#   arr=( $(find $FILE -type f -exec grep -l $FIND_WORD {} \; | sort -r) )

#   if [ ${#arr[@]} -eq 0 ]; then
#     echo "[INFO] All files have been formatted."
#   else
#     echo "file dose not format"
#     cat lint_check_result.log
#     echo -e "\nFix by : ./go fixLint"
#     exit 1
#   fi

#   rm lint_check_result.log
# }

# help__fixLint="fix lint dart format"
# task_fixLint() {
#   dart format lib -l 120
# }

# help__pullDependency="pull Dependency"
# task_pullDependency() {
#   flutter_app flutter pub get
# }

# help__widgetTest="run widget test"
# task_widgetTest() {
#   flutter_app flutter test test/widget_test
# }

# help__codeAnalytics="run code analytics"
# task_codeAnalytics() {
#    flutter analyze lib --write=analyzer-output.txt
# }

# help__unitTest="run unit test"
# task_unitTest() {
#   local exclude="lib/views/*,lib/shared/widgets/*,lib/configs/routes/*,lib/core/*,lib/core/analytic_manager/*,lib/core/base/*,lib/core/dio/*,lib/core/feature/*,lib/core/providers/*,lib/core/widgets/*,lib/Bindings/*,lib/controllers/user_action_conroller.dart,lib/features/home/widget/*,lib/features/home/home.dart,/lib/features/home/binding/*,lib/controllers/home_controller.dart"
#    flutter pub get
#    flutter pub run dlcov --exclude-files=$exclude -c $COVERAGE_TARGET --lcov-gen="flutter test test/unit_test --coverage"
# }

# help__publish="publish source"
# task_publish() {
#   TAG_NAME=$VERSION.$GO_PIPELINE_COUNTER
#   echo [INFO] verions: $VERSION
#   echo [INFO] tag name: $TAG_NAME
#   echo [INFO] Start publishing $TAG_NAME
#   if [ -z "$(git ls-remote origin refs/tags/$TAG_NAME)" ]
#   then
#     git config --global user.email "ks-auto-bay+gocd-agent-user@thoughtworks.com"
#     git config --global user.name "ks-auto-bay+gocd-agent-user"
#     git tag -a $TAG_NAME -m "Automatic release"
#     git push origin $TAG_NAME
#     echo [INFO] Finished publishing $TAG_NAME
#   else
#     echo [ERROR] $TAG_NAME already exists
#     exit 1
#   fi
# }

# help__securityScan="bypass wait spike this scope"
# task_securityScan() {
#   DOCKER_ARGS="${DOCKER_ARGS} -e SONAR_HOST_URL=https://sonarqube.tools.buk0.com \
#   -e SONAR_LOGIN=71262248a6b81cfd11e0d41f57b226301e5a306f"
#   sonar_app
# }

# help__dependencyCheck="Run Dependency Check"
# task_dependencyCheck() {
#   owasp_app --scan . --out dependency-check-report --format "HTML" --enableExperimental --failOnCVSS 0 --disableBundleAudit --disableOssIndex --suppression "owasp-dependency-check-suppressions.xml"
# }

# help__prepareiOSe2eTests="Prepare ios e2e test"
# task_prepareiOSe2eTests() {
#   PHONE_ID="$(xcrun simctl list devices | grep -m 1 'iPhone 14 Pro Max' | awk '{print $5}')"
#   PHONE_ID="${PHONE_ID/(/}"
#   PHONE_ID="${PHONE_ID/)/}"
#   echo $PHONE_ID
#   open -a Simulator --args -CurrentDeviceUDID $PHONE_ID
# }

# help__prepareAndroide2eTests="Prepare Android e2e test"
# task_prepareAndroide2eTests() {
#   # adb emu kill
#   # ANDROIND_PHONE_START_ID=$(emulator -list-avds | sed -n 1p)
#   # echo $ANDROIND_PHONE_START_ID
#   # emulator -avd $ANDROIND_PHONE_ID &
#   ANDROIND_PHONE_ID=$(adb devices | sed -n 2p | awk '{print $1}')
#   echo $ANDROIND_PHONE_ID
# }

# help__iOSe2eTests="Run ios e2e test"
# task_iOSe2eTests() {
#   task_prepareiOSe2eTests
#   flutter clean
#   flutter pub get
#   pushd ios
#   pod install
#   popd
#   flutter test $E2E_DIRECOTRY/all_feature_test.dart -d $PHONE_ID
# }

# help__androide2eTests="Run android e2e test"
# task_androide2eTests() {
#   assume_role $(account_id_for_name tools) pull-artifacts
#   task_prepareAndroide2eTests
#   if [ -z "${ANDROIND_PHONE_ID}" ]; then
#       echo "emulator don't open. please open"
#       exit 1
#   fi
#   flutter clean
#   flutter pub get
#   flutter test $E2E_DIRECOTRY/all_feature_test.dart -d $ANDROIND_PHONE_ID
# }

# help__androidDependencyCheckAnalyze="android Dependency CheckAnalyze"
# task_androidDependencyCheckAnalyze() {
#   ./gradlew dependencyCheckPurge
#   ./gradlew dependencyCheckUpdate
#   ./gradlew clean dependencyCheckAnalyze
# }

# help__flutterCleanAndRun="Clean Flutter pub and run"
# task_flutterCleanAndRun(){
#   cd android 
#   ./gradlew clean
#   cd ..

#   flutter clean
#   echo 'y' | flutter pub cache clean
#   flutter pub get
#   flutter doctor -v
#   # flutter run --verbose
#   flutter run
# }

# flutter_app() {
#   flut "$@"
#   local exit=$?
#   return $exit
# }

# flut() {
#   DOCKER_IMAGE="${FLUTTER_IMAGE}"
#   docker_ensure_volume superapp-gradle-cache
#   docker_ensure_volume sonarqube-cache
#   SSH_ARGS="-v ${HOME}/.ssh:/root/.ssh:cached"
#   GRADLE_CACHE_ARGS="-v superapp-gradle-cache:/root/.gradle"
#   SONARQUBE_CACHE_ARGS="-v sonarqube-cache:/root/.sonar/cache"
#   FLUTTER_CACHE="-v ${HOME}/.pub-cache:/root/.pub-cache"
#   DOCKER_ARGS="${SSH_ARGS} ${GRADLE_CACHE_ARGS} ${SONARQUBE_CACHE_ARGS} ${FLUTTER_CACHE} ${docker_user_args} ${DOCKER_ARGS}"

#   for mod in $(env | grep NON_); do
#     DOCKER_ARGS="${DOCKER_ARGS} -e ${mod}"
#   done
#   echo "${DOCKER_ARGS}"
#   docker_ecr_pull
#   docker_run "$@"
# }

# sn() {
#   DOCKER_IMAGE="${SONAR_SCANNER_CLI_DOCKER_IMAGE}"
#   DOCKER_ARGS="${DOCKER_ARGS} ${docker_user_args}"

#   docker_run "$@"
# }

# sonar_app() {
#   sn "$@"
#   local exit=$?
#   return $exit
# }

# owasp() {
#   if runs_inside_gocd; then
#     local docker_user_args="-u $(id -u)"
#   else
#     local docker_user_args=""
#   fi

#   DOCKER_IMAGE="${OWASP_DOCKER_IMAGE}"
#   DOCKER_ARGS="${DOCKER_ARGS} ${docker_user_args}"

#   docker_run "$@"
# }

# owasp_app() {
#   docker_ensure_volume owasp_app
#   owasp "$@"
#   local exit=$?
#   return $exit
# }

# account_id_for_name() {
#   case $1 in
#     'dev') echo "162113545119";;
#     'qa') echo "162113545119";;
#     'int') echo "162113545119";;
#     'uat') echo "162113545119";;
#     'prod') echo "605695755270";;
#     'tools') echo "688318228301";;
#   esac
# }

# assume_role() {
#   account_id="$1"
#   role="$2"

#   credentials=$(aws sts assume-role --role-arn "arn:aws:iam::${account_id}:role/${role}" \
#                                       --role-session-name initial --duration-seconds 2700 | jq '.Credentials')
#   export AWS_ACCESS_KEY_ID=$(echo "${credentials}" | jq -r .AccessKeyId)
#   export AWS_SECRET_ACCESS_KEY=$(echo "${credentials}" | jq -r .SecretAccessKey)
#   export AWS_SESSION_TOKEN=$(echo "${credentials}" | jq -r .SessionToken)
#   unset AWS_SECURITY_TOKEN
# }

# docker_ensure_volume() {
#   docker volume inspect $1 >/dev/null 2>&1 || docker volume create $1 >/dev/null 2>&1
# }

# docker_ecr_pull() {
#   (
#   echo -n "Pull docker ${DOCKER_IMAGE}"
#   assume_role $(account_id_for_name "tools") "pull-containers"
#   if runs_inside_gocd ; then
#     aws ecr get-login --no-include-email --region ap-southeast-1 | bash
#   else #for new aws cli
#     aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin ${ECR_URL}
#   fi

#   docker pull ${DOCKER_IMAGE}
#   )
# }

# docker_run() {
#   (
#   echo -n "Running the task in the docker ${DOCKER_IMAGE}"
#   if runs_inside_gocd; then
#     DOCKER_ARGS="${DOCKER_ARGS} -v /godata/pipelines:/godata/pipelines -v $(pwd):$(pwd) -w $(pwd)"
#   else
#     DOCKER_ARGS="${DOCKER_ARGS} -it -v $(pwd):/workspace:cached -w /workspace"
#   fi
  
#   docker run --rm \
#               --env-file <(env | grep AWS_) \
#               --env-file <(env | grep TF_) \
#              ${DOCKER_ARGS} ${DOCKER_IMAGE} "$@"
#   )
# }

help__cloneEngine="step-1 - flutter-engine-binaries-for-arm"
task_cloneEngine(){
    git clone https://github.com/ardera/flutter-engine-binaries-for-arm.git
}

help__build="step-2 - flutter build bundle"
task_build(){
    fvm flutter build bundle
}

help__build="step-1 - flutter-engine-binaries-for-arm"
task_build(){
    fvm flutter build bundle
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