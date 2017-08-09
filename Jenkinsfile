#!/usr/bin/env groovy

import groovy.transform.Field
@Field buildEnvContext = [
  "BUILD_OS": "all",
  "REBUILD": "false"
]

def buildEnvDefaultPath = "./ci/test/sample/build.env.default"
def buildEnvDefault = new File(buildEnvDefaultPath)

node() {
  stage "Checkout"
  checkout scm
  stage "Build sandbox"
  println env
  println buildEnvContext
  if ( buildEnvDefault.exists() ) {
    println buildEnvDefault
  }
}

