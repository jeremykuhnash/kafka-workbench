#!/bin/bash

# These are the (soon to be replaced by gremlinfs!) COMMON env vars used within the scripts.

echo "common_env.sh sourced or called..."

# For Go, actually.
OS="linux"
ARCH="amd64"

# Software Package Versions / supporting 
GO_VERSION="1.13.3"
GOPATH="/root/go"
PYTHON_SCL_VERSION="rh-python36"

# Java JDK and Tools
JAVA_VERSION="1.8.0"
SCALA_VERSION="2.12.10"
STS_VERSION=""

# Confluent Platform / Kafka 
CP_VERSION="5.4"
CP_SCALA_VERSION="2.12"
CP_PACKAGE_VERSION="5.4.0"

# Containers
VSCODE_RELEASE_VERSION="vscode-v1"
VNC_RELEASE_VERSION="vnc-v1"
