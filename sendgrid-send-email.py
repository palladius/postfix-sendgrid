#!/usr/bin/python

import os
from sendgrid import SendGridClient
from sendgrid import Mail

# https://cloud.google.com/appengine/docs/python/mail/sendgrid

USER = os.environ['SENDGRID_USER']
PASS = os.environ['SENDGRID_PASS']
EMAIL = os.environ['TEST_EMAIL_TARGET']

# make a secure connection to SendGrid
sg = SendGridClient(USER, PASS, secure=True)

# make a message object
message = Mail()
message.set_subject('message subject')
message.set_html('<strong>HTML message body... cool!</strong>')
message.set_text('If this email reaches you, clesarly user/pass are correct.')
message.set_from('from.riccardo@example.com')

# add a recipient
message.add_to('Test docker postfix+sendgrid <{email}>'.format(email=EMAIL))

# use the Web API to send your message
sg.send(message)

