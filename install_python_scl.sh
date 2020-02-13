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
echo "Installing Python3 via SCL - to enable, run: scl enable rh-python36 bash"
echo "*************************************************************************"
sudo yum install -y centos-release-scl || true
sudo yum install -y $PYTHON_SCL_VERSION
python --version 
source /opt/rh/rh-python36/enable
python --version 

echo "source /opt/rh/rh-python36/enable" >> /root/.bash_profile

echo "Installing Python tools and libs"
sudo yum -y install python-pip
sudo pip install --upgrade pip
sudo pip install virtualenv
sudo pip install -U fusepy