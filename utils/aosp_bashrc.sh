#!/bin/bash

cc_cmd=${WORK_DIR}/android_4_4_2/prebuilts/misc/linux-x86/ccache/ccache
cc_cmd2=${WORK_DIR}/android-4.3_r1.1/prebuilts/misc/linux-x86/ccache/ccache

[ "x$WORK_DIR" == "x" ] && {
	echo ""
	echo "android cacche off"
	echo "ex. $cc_cmd -M 5G"
	return
}


if [ "$USE_CCACHE" == "1" -a -f $cc_cmd ]; then
	$cc_cmd -M 5G
	echo ""
	echo "android cache enabled success"
	echo "cache patch CCACHE_DIR:$CCACHE_DIR"

elif [ "$USE_CCACHE" == "1" -a -f $cc_cmd2 ]; then
	$cc_cmd2 -M 5G
	echo ""
	echo "android cache enabled success"
	echo "cache patch CCACHE_DIR:$CCACHE_DIR"

elif [ "$USE_CCACHE" == "1" -a ! -f $cc_cmd ]; then
	echo ""
	echo "android cacche off"
	echo "ex. $cc_cmd -M 5G"
else
	echo ""
	echo "android cacche off"
fi

alias dbsp='cd ${WORK_DIR}'

echo ""
echo "command list"
echo "dbsp: cd workspace dir"
echo ""
dbsp
