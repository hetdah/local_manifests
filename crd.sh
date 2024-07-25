#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android.git -b fourteen --git-lfs --depth=1 
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/hetdah/local_manifests --depth 1 -b rising .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=erwinabs
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
riseup munch userdebug
echo "============="

# Build rom
mka bacon
