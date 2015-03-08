#!/bin/bash

# TODO(ricc): refactor using Ubuntu/Debian post-install stuff.

if echo "$SENDGRID_USER" | grep @ ; then
	echo "User seems to be correct: $SENDGRID_USER"
else
	echo "Unrecognized SENDGRID user: $SENDGRID_USER"
	exit 1
fi 

#cp /etc/postfix/main.cf /etc/postfix/main.cf.BACKUP_REMOVEME
# TODO(ricc): templatizzalo
cat /etc/postfix/main.cf.template | 
	sed -e "s/{SENDGRID_USER}/$SENDGRID_USER/g" -e s/{SENDGRID_PASS}/$SENDGRID_PASS/g |
	tee /etc/postfix/main.cf

service postfix restart

# testing
echo Subject: testing sendgrid via docker ricc strina| sendmail palladiusbonton@gmail.com

echo "Done. PS maybe worth changing ENTRYPOINT to a cat README :)"

cat /etc/postfix/main.cf