#!/bin/sh

if [ "x$DIAMOND_MAC" = "x" ]; then
	echo "you need to specify DIAMOND_MAC env with MAC addres of your license (in form xx:xx:xx:xx)"
	echo "script expects license in $HOME/fpga/license.dat"
	echo "script will output in $HOME/dist"
	exit 1
fi
docker run --rm --mac-address=$DIAMOND_MAC -it -e LM_LICENSE_FILE=/fpga/license.dat -v $HOME/fpga:/fpga -v $HOME/dist:/dist -v `pwd`:/scripts dok3r/ulx3s-build /scripts/build.sh

