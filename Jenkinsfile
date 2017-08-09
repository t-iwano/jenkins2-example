#!/usr/bin/env groovy

@Field buildEnvContext = [
  "BUILD_OS": "all",
  "REBUILD": "false"
]

node() {
  stage "Checkout"
  checkout scm
  stage "Build sandbox"
  println env
  println buildEnvContext
}

