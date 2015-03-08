
Synopsis
========

Installa postfix/sendgrid using also supervisor (which i can remove when everything works)


How To
======

* Enter `Dockerfile`
* Change `SENDGRID_USER`, `SENDGRID_PASS`, ...
* run `make run-riccardo`

This will launch a python script to send a test email to see if user and pass are correct.
It also launched supervisord which, among other things, will launch postfix.
Postfix is still not running very well, hence version < 1.0

Commands
========

* `/config-postfix.sh`: changes password in postfix
* `/usr/bin/postfix start -D`

Bugs
====

Postfix still doesn't work, but python test script we're nearly there.


Marco
=====

Originally by Marco:

* https://registry.hub.docker.com/u/mstrina/postfix_sendgrid/tags/manage/

    # in /etc/postfix/main.cf
    smtp_sasl_password_maps = static:mstrina:<HisPassword>


URLs
====

* Interesting: https://github.com/noteed/docker-postfix/blob/master/Dockerfile
