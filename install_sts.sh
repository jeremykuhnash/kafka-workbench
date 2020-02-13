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

mkdir -p /sts
STS_BUNDLE="spring-tool-suite-4-4.5.1.RELEASE-e4.14.0-linux.gtk.x86_64.tar.gz"
WORK_DIR=$(mktemp -d -t ci-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
echo "WORK_DIR = $WORK_DIR"
URL="https://download.springsource.com/release/STS4/4.5.1.RELEASE/dist/e4.14/$STS_BUNDLE"
echo "Downloading URL: $URL (your going to have to change the URL with the BUNDLE value, btw)"
curl -o $WORK_DIR/$STS_BUNDLE $URL
tar zxvf $WORK_DIR/$STS_BUNDLE --strip-components=1 -C /sts
rm -fR $WORK_DIR

