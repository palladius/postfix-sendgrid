# Many thanks to Marco Strina for creating the first Postfix version!

FROM  mstrina/postfix_sendgrid:ver1.2
MAINTAINER riccardo.carlesso@gmail.com

##########################################################################
# Change with your Sendgrid user/pass in "sendgrid.secret" file, eg:
#
ENV SENDGRID_USER SENDGRID_USER
ENV SENDGRID_PASS T1Pi4c3rebb3!
ENV TEST_EMAIL_TARGET EMAIL_TO_SEND_TO@gmail.com
#
##########################################################################


ENV RICCARDO_SUPERVISORD_POSTFIX_VER 1.4
ENV RICCARDO_SUPERVISORD_POSTFIX_DESC \
  Trying to launch postfix with Sendgrid authentication \
  and to make things simpler I use supervisord to launch multiple \
  containers. Tu run postfix, try: '/usr/sbin/postfix start -d'

RUN apt-get update
RUN apt-get install -y openssh-server apache2 supervisor python-pip
# syslog-ng works on Ubuntu but not on Debian :/
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN pip install sendgrid

COPY files/etc/postfix/main.cf.template /etc/postfix/main.cf.template
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY files/config-postfix.sh /config-postfix.sh
COPY files/sendgrid-send-email.py /sendgrid-send-email.py
COPY README.md /
COPY sendgrid.secret /root/sendgrid-secret-FYI.txt

RUN chmod 755 /config-postfix.sh /sendgrid-send-email.py
RUN chmod 400 /root/sendgrid-secret-FYI.txt
#RUN /config-postfix.sh
# cp /etc/hosts /var/spool/postfix/etc/hosts

# onbuild docs: https://docs.docker.com/reference/builder/#exec-form-entrypoint-example
ONBUILD RUN /config-postfix.sh



#CMD ["/config-postfix.sh"]
CMD ["/usr/bin/supervisord"]

EXPOSE 22 25 80 10000


