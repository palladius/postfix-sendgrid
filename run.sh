#!/bin/bash

# grepping from Makefile
VER=$(egrep ^VER Makefile |  cut -f 2 -d= | sed -e 's/ //g')

if [ -f sendgrid.secret ] ; then
	# importing user/pass
	. sendgrid.secret
else
	echo "You have to copy 'sendgrid.secret.dist' into 'sendgrid.secret' and edit your Sendgrid user/pass!"
	exit 11
fi

# DEBUG
set -x

echo Running docker image with SENDGRID_USER="$SENDGRID_USER"..

docker run -it \
	-e SENDGRID_USER="$SENDGRID_USER" \
	-e SENDGRID_PASS="$SENDGRID_PASS" \
	-e TEST_EMAIL_TARGET="$TEST_EMAIL_TARGET" \
	-e SEND_TEST_EMAIL_WHEN_DONE="$SEND_TEST_EMAIL_WHEN_DONE" \
	palladius/postfix-sendgrid-supervisor:$VER bash
