rm -rf .repo/local_manifests/
rm -rf device/xioami
rm -rf kernel/xiaomi
rm -rf vendor/xiaomi
git clone https://github.com/hetdahlu/prindanpan vendor/lineage-priv/

# Clone DerpFest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1

#Temp Fix Repo tool
#cd .repo/repo;git pull -r;cd ../..;

# Clone local_manifests repository
repo init -u https://github.com/hetdah/local_manifests.git -b rising .repo/local_manifests
if [ ! 0 == 0 ]
 then   curl -o .repo/local_manifests https://github.com/hetdah/local_manifests.git
 fi

# repo sync
/opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# brunch configuration
riseup munch 

# Clean
make installclean

# Run
rise b
