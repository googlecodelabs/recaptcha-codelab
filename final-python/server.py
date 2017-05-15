import json
import urllib
from os import curdir, sep
from urlparse import parse_qs
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer

SITE_VERIFY_URL = 'https://www.google.com/recaptcha/api/siteverify'
SITE_SECRET = '6LfeHx4UAAAAAFWXGh_xcL0B8vVcXnhn9q_SnQ1b'
RECAPTCHA_RESPONSE_PARAM = 'g-recaptcha-response'

class Handler(BaseHTTPRequestHandler):
  def set_headers(self):
    self.send_response(200)
    self.send_header('Content-type', 'text/html')
    self.end_headers()

  def do_GET(self):
    self.set_headers();
    self.wfile.write(open(curdir + sep + 'feedback.html').read() % '')

  def do_POST(self):
    self.set_headers();
    post_body = parse_qs(self.rfile.read(int(self.headers['Content-Length'])))

    success = False
    if RECAPTCHA_RESPONSE_PARAM in post_body:
      token = post_body[RECAPTCHA_RESPONSE_PARAM][0]
      resp = urllib.urlopen(
          SITE_VERIFY_URL, urllib.urlencode(
              {'secret': SITE_SECRET, 'response': token}, True)).read()
      if json.loads(resp).get("success"):
        success = True

    if success:
      message = 'Thanks for the feedback!'
    else:
      message = 'There was an error.'
    self.wfile.write(open(curdir + sep + 'feedback.html').read() % message)

if __name__ == '__main__':
  httpd = HTTPServer(('', 8080), Handler)
  httpd.serve_forever()
  print("Server is running at http://localhost:8080")
