import os
from http.server import BaseHTTPRequestHandler, HTTPServer

name = os.getenv("STUDENT_NAME", "Dilshod")
surname = os.getenv("STUDENT_SURNAME", "Chorshanbiev")
group = os.getenv("STUDENT_GROUP", "IT2-2312")
student_id = os.getenv("STUDENT_ID", "31916")

TEXT = f"""================================
DevOps Student Application
================================
Name: {name}
Surname: {surname}
Group: {group}
Student ID: {student_id}

Application is running successfully!
"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(TEXT.encode("utf-8"))


if __name__ == "__main__":
    print(TEXT, flush=True)
    print("Listening on port 8080...", flush=True)
    HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
