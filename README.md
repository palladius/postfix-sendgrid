
Synopsis
========

Installa postfix/sendgrid using also supervisor (which i can remove when everything works)


Commands
========

* `/config-postfix.sh`: changes password in postfix
* /usr/bin/postfix start -D



Marco
=====

Password id Marco: 
https://registry.hub.docker.com/u/mstrina/postfix_sendgrid/tags/manage/

# riga in /etc/postfix/main.cf
smtp_sasl_password_maps = static:mstrina:p4ssw0rd


URLs
====

* Interesting: https://github.com/noteed/docker-postfix/blob/master/Dockerfile