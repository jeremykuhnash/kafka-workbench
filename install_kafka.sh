#!/bin/bash
set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
SOURCE="$(readlink "$SOURCE")"
[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
THIS_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo "This Dir: $THIS_DIR"
source $THIS_DIR/common_env.sh

CP_BUNDLE="confluent-$CP_PACKAGE_VERSION-$CP_SCALA_VERSION.tar.gz"
WORK_DIR=$(mktemp -d -t ci-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
echo "WORK_DIR = $WORK_DIR"
URL="https://packages.confluent.io/archive/$CP_VERSION/$CP_BUNDLE"
echo "Downloading URL: $URL"
curl -o $WORK_DIR/$CP_BUNDLE $URL
tar zxvf $WORK_DIR/$CP_BUNDLE --strip-components=1 -C /usr
rm -fR $WORK_DIR