crave clone create --projectID 86 /crave-devspaces/Rising14
cd Rising14
crave run  --no-patch -- "rm -rf .repo/local_manifests; \
git clone https://github.com/hetdah/local_manifests --depth 1 -b rising .repo/local_manifests; \
/opt/crave/resync.sh; \
source build/envsetup.sh; \
riseup munch userdebug; \
rise b"   
