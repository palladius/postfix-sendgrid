# Makefile

VER = 0.9

#  v0.8 Reflecting the fact it still doesnt work.
#  v0.13 Also sends email via python script... just to check for user/pass
#
#

build:
	docker build -t palladius/postfix-sendgrid-supervisor:$(VER) .

run: build
	#docker run -it palladius/postfix-sendgrid-supervisor:$(VER) bash
	./run.sh

#run-strina:
#	docker run -it mstrina/postfix_sendgrid:ver1.2 bash

#run-riccardo:
