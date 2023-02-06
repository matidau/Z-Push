#!/bin/bash
#########################################################
# This script is intended to be run like this:
#
#   curl -s https://mat.id.au/zpushpatch.sh | sudo bash
#
#########################################################
#
# To patch Mail-in-a-box's Z-Push setup script and then run mailinabox setup 
# again. Points to PHP8 Z-Push repo.
# 
# This is built on the work of: 
# Josh and the the Mail-in-a-box team
# bob4os, umgfoin, cbren and the Z-Push community 
# 
# Many thanks to all the above :)
#


# Check if running on Ubuntu 22.04 which will be Mail-in-a-box v60 or above
#
# Allow point-release versions of the major releases, e.g. 22.04.1 is OK.
UBUNTU_VERSION=$( lsb_release -d | sed 's/.*:\s*//' | sed 's/\([0-9]*\.[0-9]*\)\.[0-9]/\1/' )
if [ ! "$UBUNTU_VERSION" == "Ubuntu 22.04 LTS" ]; then
	echo "This script may be used only on a machine running Ubuntu 22.04."
	exit 1
fi

# Are we running as root?
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root. Did you leave out sudo?"
	exit 1
fi

if [ ! -f /usr/local/bin/mailinabox ]; then
	echo "File /usr/local/bin/mailinabox does not exist. Is Mail-in-a-box installed?"
	exit 1
fi

# Get cd mailinabox directory command from mailinabox script
CD_MAILINABOX_DIR=$(sed -n '2{p;q;}' /usr/local/bin/mailinabox)

# Change directory to mailinabox
$CD_MAILINABOX_DIR

SCRIPT_ZPUSH_VERSION=2$(sed -n -e '/VERSION/ s/.*\=2 *//p' setup/zpush.sh)

if [ ! "$SCRIPT_ZPUSH_VERSION" == "2.6.2" ]; then
	echo "Z-Push setup script is not pulling version 2.6.2." 
	echo "It might have already been patched."
	echo "Check that your Z-Push needs updating."
	exit 1
fi

# update Z-Push setup script
sed -i "s/VERSION=2.6.2/VERSION=2.6.4-php8-testing-0.2/g" setup/zpush.sh
sed -i "s/TARGETHASH=f0e8091a8030e5b851f5ba1f9f0e1a05b8762d80/TARGETHASH=80ee26707958ee695a86e6ffaf326ee56dce6a14/g" setup/zpush.sh
sed -i "s^https://github.com/Z-Hub/Z-Push/archive/refs/tags/^https://github.com/matidau/Z-Push/archive/refs/tags/^g" setup/zpush.sh

# Run Mail-in-a-box setup again
# Start setup script.
setup/start.sh

