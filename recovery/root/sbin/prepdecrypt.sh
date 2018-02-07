#!/sbin/sh


mkdir /s
mount -t ext4 -o ro /dev/block/mmcblk0p52 /s

if [ -f /s/build.prop ]; then
	osver=$(grep -i 'ro.build.version.release' /s/build.prop  | cut -f2 -d'=')
	patchlevel=$(grep -i 'ro.build.version.security_patch' /s/build.prop  | cut -f2 -d'=')
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
fi

mkdir -p /vendor/lib64/hw/

relink /s/xbin/strace

#cp /s/lib64/android.hidl.base@1.0.so /sbin/

relink /s/vendor/bin/qseecomd

cp /s/vendor/lib64/libdiag.so /vendor/lib64/
cp /s/vendor/lib64/libdrmfs.so /vendor/lib64/
cp /s/vendor/lib64/libdrmtime.so /vendor/lib64/
cp /s/vendor/lib64/libGPreqcancel.so /vendor/lib64/
cp /s/vendor/lib64/libGPreqcancel_svc.so /vendor/lib64/
cp /s/vendor/lib64/libqisl.so /vendor/lib64/
cp /s/vendor/lib64/libQSEEComAPI.so /vendor/lib64/
cp /s/vendor/lib64/librpmb.so /vendor/lib64/
cp /s/vendor/lib64/libsecureui.so /vendor/lib64/
cp /s/vendor/lib64/libSecureUILib.so /vendor/lib64/
cp /s/vendor/lib64/libsecureui_svcsock.so /vendor/lib64/
cp /s/vendor/lib64/libssd.so /vendor/lib64/
cp /s/vendor/lib64/libStDrvInt.so /vendor/lib64/
cp /s/vendor/lib64/libtime_genoff.so /vendor/lib64/
cp /s/vendor/lib64/libkeymasterprovision.so /vendor/lib64/
cp /s/vendor/lib64/vendor.qti.hardware.tui_comm@1.0_vendor.so /vendor/lib64/
cp /s/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so /vendor/lib64/hw/
cp /s/vendor/lib64/hw/android.hardware.keymaster@3.0-impl.so /vendor/lib64/hw/
cp /s/vendor/lib64/hw/gatekeeper.msm8952.so /vendor/lib64/hw/
cp /s/vendor/lib64/hw/keystore.msm8952.so /vendor/lib64/hw/

cp /s/vendor/manifest.xml /vendor/
cp /s/vendor/compatibility_matrix.xml /vendor/

relink /s/vendor/bin/hw/android.hardware.gatekeeper@1.0-service
relink /s/vendor/bin/hw/android.hardware.keymaster@3.0-service

umount /s

setprop crypto.ready 1
exit 0