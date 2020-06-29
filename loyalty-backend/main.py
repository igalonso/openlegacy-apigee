import random
import json
from flask import Flask

catalog = [
    {
        "id": "OLJCESPC7Z",
        "name": "Vintage Typewriter",
        "description": "This typewriter looks good in your living room.",
        "picture": "/static/img/products/typewriter.jpg",
        "priceUsd": {
            "currencyCode": "USD",
            "units": "67",
            "nanos": 990000000
        },
        "categories": [
            "vintage"
        ]
    },
    {
        "id": "2ZYFJ3GM2N",
        "name": "Film Camera",
        "description": "This camera looks like it's a film camera, but it's actually digital.",
        "picture": "/static/img/products/film-camera.jpg",
        "priceUsd": {
            "currencyCode": "USD",
            "units": "2245"
        },
        "categories": [
            "photography",
            "vintage"
        ]
    },
    {
        "id": "66VCHSJNUP",
        "name": "Vintage Camera Lens",
        "description": "This Vintage Camera Lens give you the crappy look and feel you are searching for.",
        "priceUsd": {
            "currencyCode": "USD",
            "units": "12",
            "nanos": 490000000
        },
        "categories": [
            "photography",
            "vintage"
        ]
    },
    {
        "id": "335FDSG234",
        "name": "Vintage Laptop",
        "description": "This Vintage Laptop is perfect for Starbucks Instagram photos.",
        "priceUsd": {
            "currencyCode": "USD",
            "units": "54",
            "nanos": 2234235
        },
        "categories": [
            "photography",
            "vintage"
        ]
    },
    {
        "id": "2345324FRG",
        "name": "Vintage trippd",
        "description": "This Vintage tripod will help to unstabilize all your photos.",
        "priceUsd": {
            "currencyCode": "USD",
            "units": "44",
            "nanos": 2123332
        },
        "categories": [
            "photography",
            "vintage"
        ]
    }
]

consumed = [

    [
        {
            "id":"66VCHSJNUP",
            "units":"43",
            "timestamp":"2020-02-11'T'18:31:44"
        }
    ],
    [
        {
            "id":"335FDSG234",
            "units":"43",
            "timestamp":"2020-02-11'T'18:31:44"
        },
        {
            "id":"66VCHSJNUP",
            "units":"43",
            "timestamp":"2020-02-11'T'18:31:44"
        }

    ],
    [
        {
            "id":"OLJCESPC7Z",
            "units":"43",
            "timestamp":"2020-02-11'T'18:31:44"
        }
    ]
]

recommendations = [
    {
            "id":"66VCHSJNUP"
    },
    {
            "id":"335FDSG234",
            "id":"OLJCESPC7Z"
    },
    {
            "id":"OLJCESPC7Z",
            "id":"66VCHSJNUP"
    },
    {

            "id":"335FDSG234",
            "id":"66VCHSJNUP"
    },
    {
            "id":"2ZYFJ3GM2N",
            "id":"OLJCESPC7Z",
            "id":"66VCHSJNUP"

    },
    {
            "id":"2345324FRG"
    }
]

app = Flask(__name__)

#Catalog service
@app.route('/catalog',methods=['GET', 'POST'])
def catalogList():
    return json.dumps(catalog)

@app.route('/catalog/<int:id>')
def product(id):
    # show the post with the given id, the id is an integer
    return catalog[id%5]

#Consummer service
@app.route('/user/<int:user_id>/consumer',methods=['GET', 'POST'])
def consumerList():
    return json.dumps(consumed)

@app.route('/user/<int:user_id>/consumer/<int:id>')
def consumer(user_id,id):
    # show the post with the given id, the id is an integer
    return json.dumps(consumed[id%3])
#Recommendation service
@app.route('/user/<int:user_id>/recommendation/<int:future_points>')
def recommendation(user_id,future_points):
    # show the post with the given id, the id is an integer
    return json.dumps(recommendations[(user_id+future_points)%6]), {'Content-Type': 'application/json;'}
    
if __name__ == "__main__": 
    app.run(host ='0.0.0.0', port = 8080, debug = True)  
