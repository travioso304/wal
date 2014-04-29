#!/bin/bash
# Http Policy On/Off Script
#
# Syntax:
# scriptname.sh <on/off>
#
# Example:
# scriptname.sh on

switch=$1
test $1 || exit 1

	if [ "$switch" = 'on' ]; then
        	echo Turning On HTTP Policy Rule
 		cp $rulesconf/modsecurity_crs_30_http_policy.conf $rulesdir/
        	# service nginx restart
	fi

	if [ "$switch" = 'off' ]; then
		echo Turning Off Script
		rm $rulesdir/modsecurity_crs_30_http_policy.conf
		echo "# Rule is turned off" > $rulesdir/modsecurity_crs_30_http_policy.conf
		# service nginx restart
	fi

