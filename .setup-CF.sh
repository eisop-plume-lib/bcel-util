#!/bin/bash

echo Entering "$(cd "$(dirname "$0")" && pwd -P)/$(basename "$0")" in `pwd`

# Fail the whole script if any command fails
set -e

export SHELLOPTS

export JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(readlink -f $(which javac))))}

git -C /tmp clone --depth 1 -q https://github.com/eisop-plume-lib/git-scripts.git

export CHECKERFRAMEWORK="${CHECKERFRAMEWORK:-$(pwd -P)/../checker-framework}"

## Build Checker Framework
/tmp/git-scripts/git-clone-related eisop checker-framework ${CHECKERFRAMEWORK}

(cd $CHECKERFRAMEWORK && ./gradlew assembleForJavac)

echo Exiting "$(cd "$(dirname "$0")" && pwd -P)/$(basename "$0")" in `pwd`
