#!/bin/bash

# TODO(ricc): refactor using Ubuntu/Debian post-install stuff.

#TODO(ricc): use SEND_TEST_EMAIL_WHEN_DONE from ENV
SEND_TEST_EMAIL_WHEN_DONE=/bin/true

if [ "empty$SENDGRID_USER" != "empty" ] ; then
	echo "User seems to be correct: $SENDGRID_USER"
else
	echo "Unrecognized SENDGRID user: '$SENDGRID_USER'"
	env
	exit 1
fi 

#cp /etc/postfix/main.cf /etc/postfix/main.cf.BACKUP_REMOVEME
# TODO(ricc): templatizzalo
cat /etc/postfix/main.cf.template | 
	sed -e "s/{SENDGRID_USER}/$SENDGRID_USER/g" -e s/{SENDGRID_PASS}/$SENDGRID_PASS/g |
	tee /etc/postfix/main.cf

# pointless on docker but...
service postfix restart

echo "Done. PS maybe worth changing ENTRYPOINT to a cat README :)"

if $SEND_TEST_EMAIL_WHEN_DONE ; to
	# REMOVEME
	echo "Subject: testing sendgrid via docker ricc strina" | sendmail palladiusbonton@gmail.com
	/sendgrid-send-email.py
else 
	echo "Not sending any email. Be sure to see if user/pass are correctly configured."
fi

# DEBUG
cat /etc/postfix/main.cf