#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive
source /etc/os-release

apt update
apt install -y wget gnupg gnupg1 gnupg2
wget -q -O - https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add -
echo "deb [arch=amd64] https://repo.radeon.com/amdgpu/5.3.3/ubuntu ${VERSION_CODENAME} main" | tee /etc/apt/sources.list.d/amdgpu.list
apt-get update
echo "deb [arch=amd64] https://repo.radeon.com/rocm/apt/5.3.3 ${VERSION_CODENAME} main" | tee /etc/apt/sources.list.d/rocm.list
echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | tee /etc/apt/preferences.d/rocm-pin-600
apt-get update
apt-get install -y rocm-dev
