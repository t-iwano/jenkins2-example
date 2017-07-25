#!/bin/bash
# Run build process

set -ex -o pipefail
SCRIPT_DIR="$(cd "$(dirname $(readlink -f "$0"))" && pwd -P)"

finish_build() {
  echo "build finished"
}
trap 'finish_build' EXIT

# check the step file.
STEP_LIST_PATH=${SCRIPT_DIR}/steplist.conf
if [[ -n "${STEP_LIST_PATH}" && ! -f "${STEP_LIST_PATH}" ]]; then
  echo "ERROR: Can't find the file: ${STEP_LIST_PATH}" >&2
  exit 1
fi

for step in $(cat ${STEP_LIST_PATH}); do
  STEP_DIR=${SCRIPT_DIR}/${step}
  STEP_SCRIPT_PATH=${STEP_DIR}/build.sh

  # check the build script file.
  if [[ -n "${STEP_SCRIPT_PATH}" && ! -f "${STEP_SCRIPT_PATH}" ]]; then
    echo "ERROR: Can't find the file: ${STEP_SCRIPT_PATH}" >&2
    exit 1
  fi

  (
    post_build() {
      echo "start post build"
    }
    trap 'post_build' EXIT
    failure_build() {
      echo "build failure"
    }
    trap 'failure_build' ERR

    /bin/bash -c "${STEP_SCRIPT_PATH}"
    # success build
    echo "build success"
  )
done

