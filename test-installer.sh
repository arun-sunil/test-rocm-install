#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive
source /etc/os-release

apt-get update
apt-get install -y wget
wget "https://repo.radeon.com/amdgpu-install/5.3.3/ubuntu/${VERSION_CODENAME}/amdgpu-install_5.3.50303-1_all.deb"
apt-get install -y ./amdgpu-install_5.3.50303-1_all.deb
amdgpu-install --usecase=rocm --no-dkms -y
