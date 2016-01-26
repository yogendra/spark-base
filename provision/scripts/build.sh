#/bin/bash
# Build box for publishing
DM=/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager


PROJECT_ROOT=$(dirname $0)/../..
echo PROJECT_ROOT: $PROJECT_ROOT

BOX_PACKAGE=$PROJECT_ROOT/spark-base.box
echo BOX_PACKAGE: $BOX_PACKAGE

WORK_DIR=$PROJECT_ROOT/.vagrant/machines/default/vmware_fusion
echo WORK_DIR: $WORK_DIR

BOX_ID_FILE=$WORK_DIR/id
echo BOX_ID_FILE: $BOX_ID_FILE

BOX_VMX=$(cat $BOX_ID_FILE)
echo BOX_VMX: $BOX_VMX

BOX_DIR=$(dirname $BOX_VMX)
echo BOX_DIR: $BOX_DIR

DISK_FILE=$BOX_DIR/$(cat $BOX_VMX | grep scsi0:0.filename | sed -e 's/^.* = "//;s/"//')
echo DISK_FILE: $DISK_FILE

echo "Defrage Disk"
"$DM" -d $DISK_FILE

echo "Compact Disk"
"$DM" -k $DISK_FILE


tar -czvf $BOX_PACKAGE -C $BOX_DIR  --exclude '*log' --exclude '*plist' .
