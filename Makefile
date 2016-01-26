
all: build

clean: destroy-vm
	rm *.box

destroy-vm: stop-vm
	vagrant destroy -f

stop-vm:
	vagrant halt

start-vm:
	vagrant up

build: start-vm stop-vm package


package:
	provision/scripts/build.sh

add:
	vagrant box add --provider vmware_desktop --name yogendra/spark-base spark-base.box