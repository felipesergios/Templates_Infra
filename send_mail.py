from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import smtplib
#import email
# create message object instance
msg = MIMEMultipart()


# setup the parameters of the message
password = "youpassword"
msg['From'] = "youemail"
msg['To'] = "toEmail"
msg['Subject'] = "yourSubject"

part = MIMEBase('application', "octet-stream")
part.set_payload(open("youcontentarchive.txt", "rb").read())
encoders.encode_base64(part)
part.add_header('Content-Disposition', 'attachment; filename="youcontentarchive.txt"')

msg.attach(part)

server = smtplib.SMTP('yoursmtpserver: 587')

server.starttls()

# Login Credentials for sending the mail
server.login(msg['From'], password)


# send the message via the server.
server.sendmail(msg['From'], msg['To'], msg.as_string())

server.quit()

print("successfully sent email to %s:" % (msg['To']))
