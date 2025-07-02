from flask import Flask

app = Flask(__name__)  
@app.route('/')
def hello_world():

    return 'Hello, World! This is a Flask app running in a Docker container with EC2 jenkins CICD and monitoring with datadog.'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
     
