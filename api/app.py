
from flask import Flask, request
import threading
from utils import *

app = Flask(__name__)


@app.route("/play_sound", methods=['POST'])
def play_sound():
    try:
        x_api_key = request.headers['X-API-KEY']

        if x_api_key != '1234':
            return "Unauthorized", 401

        command = request.json['command']
        filename = map_command(command=command)

        # thr = threading.Thread(target=pygame_play_sound, args=[filename])
        # thr.start()

        return "ok!"
    except:
        return "Bad Request", 400


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4000, debug=True)
