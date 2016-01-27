
mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
mkfile_dir := $(shell cd $(shell dirname $(mkfile_path)); pwd)
current_dir := $(notdir $(mkfile_dir))


PROJECT_NAME := spark-base
BOX_NAME := yogendra/${PROJECT_NAME}
PROJECT_ROOT :=  ${mkfile_dir}
BUILD_DIR := ${PROJECT_ROOT}/build
BOX_PACKAGE := ${BUILD_DIR}/${PROJECT_NAME}.box
WORK_DIR := ${PROJECT_ROOT}/.vagrant/machines/default/vmware_fusion
BOX_ID_FILE := ${WORK_DIR}/id
BOX_VMX := $(shell cat ${BOX_ID_FILE})
BOX_DIR := $(shell dirname ${BOX_VMX})
DISK_FILE := $(shell cat ${BOX_VMX} | grep scsi0.0.filename | sed -e 's/^.* = "//;s/"//')
DISK_PATH := ${BOX_DIR}/${DISK_FILE}
DISK_MANAGER := /Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager

.env:
	@echo "PROJECT_NAME  :${PROJECT_NAME}"
	@echo "BOX_NAME      :${BOX_NAME}"
	@echo "PROJECT_ROOT  :${PROJECT_ROOT}"
	@echo "BOX_PACKAGE   :${BOX_PACKAGE}"
	@echo "WORK_DIR      :${WORK_DIR}"
	@echo "BOX_ID_FILE   :${BOX_ID_FILE}"
	@echo "BOX_VMX       :${BOX_VMX}"
	@echo "BOX_DIR       :${BOX_DIR}"
	@echo "DISK_FILE     :${DISK_FILE}"
	@echo "DISK_PATH     :${DISK_PATH}"
	@echo "DISK_MANAGER  :${DISK_MANAGER}"

all: release

release: clean build package add

build: provision package

provision: start-vm stop-vm

package: prepare-disk archive-box

prepare-disk: defrag-disk compact-disk

clean: destroy-vm
	-rm ${BUILD_DIR}

start-vm: .env
	-vagrant up

stop-vm: .env
	vagrant halt

destroy-vm: stop-vm
	-vagrant destroy -f


add: .env
	vagrant box add --provider vmware_desktop --name yogendra/spark-base --force spark-base.box

defrag-disk: stop-vm
	${DISK_MANAGER} -d ${DISK_PATH}

compact-disk: stop-vm
	${DISK_MANAGER} -k ${DISK_PATH}

archive-box: .env
	-mkdir -f ${BUILD_DIR}
	tar -czvf ${BOX_PACKAGE} -C ${BOX_DIR}  --exclude '*log' --exclude '*plist' --exclude "*vmem" --exclude "*lck" .

