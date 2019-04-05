import json
import urllib
from os import curdir, sep
from urllib.parse import parse_qs
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
  def set_headers(self):
    self.send_response(200)
    self.send_header('Content-type', 'text/html')
    self.end_headers()

  def do_GET(self):
    self.set_headers()
    self.wfile.write((open(curdir + sep + 'feedback.html').read() % '').encode(encoding="utf-8"))

  def do_POST(self):
    self.set_headers()
    message = 'Thanks for the feedback!'
    self.wfile.write((open(curdir + sep + 'feedback.html').read() % message).encode(encoding="utf-8"))


if __name__ == '__main__':
  httpd = HTTPServer(('', 8080), Handler)
  httpd.serve_forever()
  print("Server is running at http://localhost:8080")
