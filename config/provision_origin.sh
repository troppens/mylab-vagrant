#!/bin/bash

#
# Custom provision script for node 'origin'
#

echo "===> Enable tracing of shell commands <================================="
set -x

echo "===> Enable EPEL repo <================================================="
yum --assumeyes install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

echo "===> Install Ansible <=================================================="
yum --assumeyes install ansible

echo "===> Install Git <======================================================"
yum --assumeyes install git

echo "==> Git clone 'https://github.com/troppens/mylab.git' to /root/mylab <=="
git clone https://github.com/troppens/mylab.git /root/mylab

echo "===> Update kernel <===================================================="
yum --assumeyes update kernel

echo "===> Reboot <==========================================================="
shutdown -r now
