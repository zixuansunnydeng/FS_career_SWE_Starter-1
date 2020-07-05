from flask import Flask
from flask import jsonify

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "Hello, World!"


@app.route("/test")
def test():
    return "test"


@app.route("/param/<param>")
def profile(param):
    return f"this is my profile {param}"


@app.route("/getRes", methods=["GET"])
def getRes():
    return jsonify([
    {
        "resName": "Steve's Smoke House",
        "priceRange": "$$",
        "cuisineType1": "Steak",
        "cuisineType2": "American",
        "Rating": 4.5,
        "resImage": "assets/res1.png"
    },
    {
        "resName": "Steve",
        "priceRange": "$$",
        "cuisineType1": "Steak",
        "cuisineType2": "American",
        "Rating": 4.5,
        "resImage": "assets/res1.png"
    }
])
