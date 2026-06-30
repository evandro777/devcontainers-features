#!/bin/sh
set -e

# Basic smoke test for the alpine-openjdk feature.
java -version

# Ensure the Java home profile script was installed.
if [ -f /etc/profile.d/java.sh ]; then
  . /etc/profile.d/java.sh
  [ -n "$JAVA_HOME" ]
  [ -x "$JAVA_HOME/bin/java" ]
fi
