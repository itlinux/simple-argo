from flask import Flask, render_template
import socket
import requests


#myurl = "http://ipconfig.io"
myurl = "https://httpbin.org/ip"
app = Flask(__name__)

def get_local_ip():
    # Get the hostname and IP address
    hostname = socket.gethostname()
    local_ip = socket.gethostbyname(hostname)
    return local_ip

def get_public_ip():
    try:
        # Make a request to httpbin to get your public IP
        response = requests.get(myurl)
        if response.status_code == 200:
            # Parse the JSON response
            ip_info = response.json()
            public_ip = ip_info.get('origin', 'Failed to retrieve IP')
            return public_ip
        else:
            return 'Failed to retrieve IP'
    except Exception as e:
        return 'Failed to retrieve IP'

@app.route('/')
def index():
    local_ip = get_local_ip()
    public_ip = get_public_ip()

    # Render the HTML template with the hostname and IP addresses
    return render_template('index.html', local_ip=local_ip, public_ip=public_ip)

if __name__ == '__main__':
    app.run(
    host="0.0.0.0",
    port=5000,
    debug=True
)

