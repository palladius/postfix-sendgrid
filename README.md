
Synopsis
========

Installa postfix/sendgrid using also supervisor (which i can remove when everything works)


How To
======

* Enter `cp sendgrid.secret.dist sendgrid.secret`
* Change `SENDGRID_USER`, `SENDGRID_PASS` in newly created `sendgrid.secret`
* run `make run`

This will launch a python script to send a test email to see if user and pass are correct.
It also launched supervisord which, among other things, will launch postfix.
Postfix is still not running very well, hence version < 1.0

Commands
Bugs
====

Postfix still doesn't work, but python test script we're nearly there.


Thanks
======

Thanks to Marco Strina for the first Docker/Postfix/Sendgrid working version:

* https://registry.hub.docker.com/u/mstrina/postfix_sendgrid/tags/manage/

URLs
====

* Interesting: https://github.com/noteed/docker-postfix/blob/master/Dockerfile
