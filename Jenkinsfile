#!/usr/bin/env groovy

import groovy.transform.Field
@Field buildEnvContext = []

node() {
  stage "Checkout"
  checkout scm
  stage "Build sandbox"
  readFile('./ci/citest/build.env.default')..split("\r?\n").each { name, value ->
    println "Name: $name -> Value $value"
  }
}

