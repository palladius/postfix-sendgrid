FROM  mstrina/postfix_sendgrid:ver1.2
MAINTAINER riccardo.carlesso@gmail.com

################################################
# Change with your Sendgrid user/pass
#
ENV SENDGRID_USER CHANGE.ME@gmail.com
ENV SENDGRID_PASS T1Pi4c3rebb3!
ENV TEST_EMAIL_TARGET palladiusbonton+pfsg@gmail.com
#
################################################


ENV RICCARDO_SUPERVISORD_POSTFIX_VER 1.3
ENV RICCARDO_SUPERVISORD_POSTFIX_DESC \
  Trying to launch postfix with Sendgrid authentication \
  and to make things simpler I use supervisord to launch multiple \
  containers. Tu run postfix, try: '/usr/sbin/postfix start -d'

RUN apt-get update
RUN apt-get install -y openssh-server apache2 supervisor python-pip
# syslog-ng works on Ubuntu but not on Debian :/
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN pip install sendgrid

COPY etc/postfix/main.cf.template /etc/postfix/main.cf.template
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config-postfix.sh /config-postfix.sh
COPY README.md /
COPY sendgrid-send-email.py /sendgrid-send-email.py

RUN chmod 755 /config-postfix.sh
RUN /config-postfix.sh
RUN python /sendgrid-send-email.py
# cp /etc/hosts /var/spool/postfix/etc/hosts




#CMD ["/config-postfix.sh"]
CMD ["/usr/bin/supervisord"]

EXPOSE 22 25 80 10000


