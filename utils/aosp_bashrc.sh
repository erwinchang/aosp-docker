#!/bin/bash

[ "x$WORK_DIR" == "x" ] && exit 0

cc_cmd=${WORK_DIR}/android_4_4_2/prebuilts/misc/linux-x86/ccache/ccache

if [ "$USE_CCACHE" == "1" -a -f $cc_cmd ]; then
	$cc_cmd -M 5G

elif [ "$USE_CCACHE" == "1" -a ! -f $cc_cmd ]; then
	echo "cacche enabled command: $cc_cmd -M 5G"

fi

alias dbsp='cd ${WORK_DIR}'

echo ""
echo "command list"
echo "dbsp: cd workspace dir"
echo ""
dbsp
