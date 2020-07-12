import re
from datetime import datetime
from flask import Flask

import debugger


debugger.initialize_flask_server_debugger_if_needed()

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Flask with VS Code and Docker"


@app.route("/hello/<name>")
def hello_there(name):
    now = datetime.now()
    formatted_now = now.strftime("%A, %d %B, %Y at %X")

    match_object = re.match("[a-zA-Z]+", name)

    if match_object:
        clean_name = match_object.group(0)
    else:
        clean_name = "Friend"

    content = f"Hello there, {clean_name}! It's {name}"
    return content
