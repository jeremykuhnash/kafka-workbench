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

echo "Pushing VSCODE version $VSCODE_RELEASE_VERSION..."
docker push jeremykuhnash/kafka-workbench:$VSCODE_RELEASE_VERSION

echo "Pushing VNC version $VNC_RELEASE_VERSION..."
docker push jeremykuhnash/kafka-workbench:$VNC_RELEASE_VERSION
