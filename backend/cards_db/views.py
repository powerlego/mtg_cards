from django.shortcuts import render, HttpResponse
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import api_view, permission_classes
import pymongo
from bson import json_util
import environ

# Create your views here.
env = environ.Env()
environ.Env.read_env()

mongo_client = pymongo.MongoClient(env("MONGO_CONNECTION_STRING"))

db = mongo_client["cards"]
collection = db["cards"]


@api_view(["GET"])
@permission_classes([AllowAny])
def get_collection(request):
    response = json_util.dumps(list(collection.find({})))
    return Response(response)


@api_view(["POST"])
@permission_classes([AllowAny])
def insert(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        collection.insert_one(document=json)
        return Response("Card inserted")


@api_view(["POST"])
@permission_classes([AllowAny])
def insert_all(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        collection.insert_many(documents=json)
        return Response("Cards inserted")


@api_view(["POST"])
@permission_classes([AllowAny])
def update(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        filter = json["filter"]
        card = json["update"]
        update = {"$set": card}
        collection.update_one(filter=filter, update=update)
        return Response("Card updated")


@api_view(["POST"])
@permission_classes([AllowAny])
def delete(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        filter = json["filter"]
        collection.delete_one(filter=filter)
        return Response("Card deleted")


@api_view(["GET"])
@permission_classes([AllowAny])
def get_total_card_count(request):
    total = list(
        collection.aggregate(
            pipeline=[{"$group": {"_id": None, "total": {"$sum": "$quantity"}}}]
        )
    )
    total = total[0]["total"]
    response = {"result": total}
    response = json_util.dumps(response)
    return Response(response)


@api_view(["POST"])
@permission_classes([AllowAny])
def check_duplicates(request):
    json = json_util.dumps(request.data)
    json = json_util.loads(json)
    aggregate_pipeline = [
        {
            "$match": {
                "$and": [
                    {"card.set": json["card"]["set"]},
                    {"card.collectorNumber": json["card"]["collectorNumber"]},
                ]
            }
        }
    ]
    duplicates = list(collection.aggregate(pipeline=aggregate_pipeline))
    if len(duplicates) == 0:
        return Response(json_util.dumps({"result": False}))
    else:
        return Response(json_util.dumps({"result": True}))


@api_view(["GET"])
@permission_classes([AllowAny])
def get_most_expensive_card(request):
    pipeline = [{"$sort": {"price": -1}}, {"$limit": 1}]
    card = list(collection.aggregate(pipeline=pipeline))
    card = json_util.dumps(card)
    return Response(card)


@api_view(["GET"])
@permission_classes([AllowAny])
def get_total_collection_price(request):
    aggregation_pipeline = [
        {
            "$project": {
                "_id": 1,
                "name": "$card.name",
                "finish": 1,
                "currency": 1,
                "total_price": {"$multiply": [{"$toDecimal": "$price"}, "$quantity"]},
            }
        },
        {"$group": {"_id": "$currency", "total": {"$sum": "$total_price"}}},
        {"$project": {"_id": 0, "total": 1}},
    ]
    total = list(collection.aggregate(pipeline=aggregation_pipeline))
    response = json_util.dumps(total)
    return Response(response)


@api_view(["GET"])
@permission_classes([AllowAny])
def get_color_count(request):
    aggregation_pipeline = [
        {
            "$group": {
                "_id": None,
                "white": {"$sum": {"$toInt": {"$in": ["W", "$card.colorIdentity"]}}},
                "blue": {"$sum": {"$toInt": {"$in": ["U", "$card.colorIdentity"]}}},
                "black": {"$sum": {"$toInt": {"$in": ["B", "$card.colorIdentity"]}}},
                "red": {"$sum": {"$toInt": {"$in": ["R", "$card.colorIdentity"]}}},
                "green": {"$sum": {"$toInt": {"$in": ["G", "$card.colorIdentity"]}}},
                "colorless": {
                    "$sum": {
                        "$cond": [{"$eq": [{"$size": "$card.colorIdentity"}, 0]}, 1, 0]
                    }
                },
            }
        },
        {
            "$project": {
                "_id": 0,
                "white": 1,
                "blue": 1,
                "black": 1,
                "red": 1,
                "green": 1,
                "colorless": 1,
            }
        },
    ]
    count = list(collection.aggregate(pipeline=aggregation_pipeline))[0]
    response = json_util.dumps(count)
    return Response(response)
