#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function copyStage2Scripts {
	echo "setup all stage2 scripts in /usr/local"
	mkdir -p /tmp/stage2
	cp $STAGE2_ROOT/scripts/* /tmp/stage2
	chown root:root /tmp/stage2/*
	chmod 700 /tmp/stage2/*
	mv /tmp/stage2/* /usr/local/sbin
	rm -rf /tmp/stage2
}
copyStage2Scripts