#!/bin/bash
source "/vagrant/scripts/common.sh"

function installUtilities {
	echo "install utilities"

	apt-get update
	apt-get install curl zip r-base r-base-dev sshpass openssh-server


}
echo "setup ubuntu"

installUtilities