#!/usr/bin/env groovy

node() {
  stage "Checkout"
  checkout scm
  stage "Build sandbox"
  sh "./ci/citest/build.sh"
}

