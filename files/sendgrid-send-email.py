#!/usr/bin/python

import os
from sendgrid import SendGridClient
from sendgrid import Mail

# https://cloud.google.com/appengine/docs/python/mail/sendgrid

HTML_BODY = '''<strong>HTML message body... cool!</strong><br/><br/>
		Superduper code is in <a href="https://github.com/palladius/postfix-sendgrid" >https://github.com/palladius/postfix-sendgrid</a>
		by Marco Strina and Riccardo Carlesso.'''

USER = os.environ['SENDGRID_USER']
PASS = os.environ['SENDGRID_PASS']
EMAIL = os.environ['TEST_EMAIL_TARGET']

# make a secure connection to SendGrid
sg = SendGridClient(USER, PASS, secure=True)

# make a message object
message = Mail()
message.set_subject('Test Email from Dockerized Sendgrid+Postfix')
message.set_html(HTML_BODY)
message.set_text('If this email reaches you, clesarly user/pass are correct.')
message.set_from('Riccardo.Docker.Image+noreply@example.com')

# add a recipient
message.add_to('Test docker postfix+sendgrid <{email}>'.format(email=EMAIL))

# use the Web API to send your message
sg.send(message)

