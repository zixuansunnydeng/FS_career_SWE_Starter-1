from flask import Flask
from flask import jsonify
from flask_cors import CORS
import requests

from restaurant import Restaurant

app = Flask(__name__)
CORS(app)


@app.route("/")
def hello_world():
    return "Hello, World"

@app.route("/getDynamodb")
def getDBdata():
    res_data = [vars(res) for res in Restaurant.scan()]
    return jsonify(res_data)

@app.route("/getRes", methods=["GET"])
def getRes():
    output = yelp_data().json()['businesses']
    for res in output:
        resDB_data = Restaurant(
            resName=res['name'],
            city=res['location']['city'],
        )
        resDB_data.save()
    return jsonify(output)

def yelp_data():
    endpoint = "https://api.yelp.com/v3/businesses/search"
    params = {"term": "chinese", "location": "Toronto", "limit": 10}
    api_key = "hzaOAgO2PdMwrhhHpDkAV5OaI-OcSfxci56eLfJ_8NB9u-fVqu8TSRgod-J51yqIdXrfEIbqQGzBouc_y_z_71BHnLweMBEDGIiAUZ7UrXa4sZsk145FB0U0t-oAWXYx"
    header = {"Authorization": f"Bearer {api_key}"}
    r = requests.get(endpoint, headers=header, params=params)
    return r


