#!/bin/bash 

yum group install -y "Development tools" --setopt=group_package_types=mandatory,default,optional

