from flask import Flask, request
import requests

app = Flask(__name__)

@app.route('/produtos')
def index():
    response = requests.get('https://fakestoreapi.com/products')
    return response.text

if __name__ == '__main__':
    app.run(debug=True)
