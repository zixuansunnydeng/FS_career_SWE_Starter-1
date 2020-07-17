from flask import Flask
from flask import jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)


@app.route("/")
def hello_world():
    return "Hello, World"


@app.route("/getRes", methods=["GET"])
def getRes():
    output = yelp_data()
    return output.json()
    # return jsonify(
    #     [
    #         {
    #             "resName": "Steve's Smoke House",
    #             "priceRange": "$$",
    #             "cuisineType1": "Steak",
    #             "cuisineType2": "American",
    #             "Rating": 4.5,
    #             "resImage": "assets/res1.png",
    #         },
    #         {
    #             "resName": "Steve",
    #             "priceRange": "$$",
    #             "cuisineType1": "Steak",
    #             "cuisineType2": "American",
    #             "Rating": 4.5,
    #             "resImage": "assets/res1.png",
    #         },
    #     ]
    # )


def yelp_data():
    endpoint = "https://api.yelp.com/v3/businesses/search"
    params = {"term": "starbucks", "location": "Toronto"}
    api_key = "hzaOAgO2PdMwrhhHpDkAV5OaI-OcSfxci56eLfJ_8NB9u-fVqu8TSRgod-J51yqIdXrfEIbqQGzBouc_y_z_71BHnLweMBEDGIiAUZ7UrXa4sZsk145FB0U0t-oAWXYx"
    header = {"Authorization": f"Bearer {api_key}"}
    r = requests.get(endpoint, headers=header, params=params)
    return r
