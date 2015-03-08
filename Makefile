# Makefile

VER = 1.3

#  v1.3 Also sends email via python script... just to check for user/pass
#
#

build-riccardo:
	docker build -t palladius/postfix-sendgrid-supervisor:$(VER) .
run-riccardo: build-riccardo
	docker run -it palladius/postfix-sendgrid-supervisor:$(VER) bash

run-strina:
	docker run -it mstrina/postfix_sendgrid:ver1.2 bash

#run-riccardo:
