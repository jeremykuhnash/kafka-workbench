#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
SOURCE="$(readlink "$SOURCE")"
[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
THIS_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo "This Dir: $THIS_DIR"
source $THIS_DIR/common_env.sh

echo "Password is 'vncpassword'. Other options for startup can be found at the base image page here - https://github.com/ConSol/docker-headless-vnc-container"
docker run --shm-size=256m -it -p 5901:5901 -p 6901:6901 -v "$PWD:/headless/workspace" -e VNC_RESOLUTION=1600x1200 jeremykuhnash/kafka-workbench:$VNC_RELEASE_VERSION