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

echo "*************************************************************************"
echo "Installing Go..."
echo "*************************************************************************"

GO_BUNDLE="go$GO_VERSION.$OS-$ARCH.tar.gz"
echo "GO_BUNDLE=$GO_BUNDLE"
WORK_DIR=$(mktemp -d -t ci-$(date +%Y-%m-%d-%H-%M-%S)-XXXXXXXXXX)
echo "WORK_DIR = $WORK_DIR"
curl -o $WORK_DIR/$GO_BUNDLE https://dl.google.com/go/$GO_BUNDLE
tar zxvf $WORK_DIR/$GO_BUNDLE --strip-components=1 -C /usr
#tar zxvf ../go1.13.3.linux-amd64.tar.gz --strip-components=1 -C /usr
rm -fR $WORK_DIR

echo 'Go path: '$(which go) 
go version

echo "PATH=$PATH:/root/go/bin" >> ~/.bashrc 
