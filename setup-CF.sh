#!/bin/bash

echo Entering "$(cd "$(dirname "$0")" && pwd -P)/$(basename "$0")" in `pwd`

# Fail the whole script if any command fails
set -e

export SHELLOPTS

export JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(readlink -f $(which javac))))}

git -C /tmp clone --depth 1 -q https://github.com/plume-lib/plume-scripts.git

export JSR308="${JSR308:-$(cd .. && pwd -P)}"
export CHECKERFRAMEWORK="${CHECKERFRAMEWORK:-$(pwd -P)/../checker-framework}"

## Build Checker Framework
/tmp/plume-scripts/git-clone-related eisop checker-framework ${CHECKERFRAMEWORK}

# This also builds annotation-tools
(cd $CHECKERFRAMEWORK && checker/bin-devel/build.sh downloadjdk)

echo Exiting "$(cd "$(dirname "$0")" && pwd -P)/$(basename "$0")" in `pwd`