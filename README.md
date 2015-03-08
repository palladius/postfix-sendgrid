
Synopsis
========

Installa postfix/sendgrid using also supervisor (which i can remove when everything works)


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
