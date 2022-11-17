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
collection = db["currency"]


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
        collection.insert_one(json)
        return Response("Currency inserted")


@api_view(["POST"])
@permission_classes([AllowAny])
def insert_all(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        collection.insert_many(json)
        return Response("Currency inserted")


@api_view(["POST"])
@permission_classes([AllowAny])
def update(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        filter = json["filter"]
        currency = json["update"]
        update = {"$set": currency}
        collection.update_one(filter, update)
        return Response("Currency updated")


@api_view(["POST"])
@permission_classes([AllowAny])
def delete(request):
    if request.method == "POST":
        json = json_util.loads(json_util.dumps(request.data))
        filter = json["filter"]
        collection.delete_one(filter)
        return Response("Currency deleted")


@api_view(["GET"])
@permission_classes([AllowAny])
def get_currency(request):

    json = json_util.loads(json_util.dumps(request.query_params))
    aggregation_pipeline = [
        {"$match": {"currency": json["currency"]}},
        {"$sort": {"date": -1}},
        {"$limit": 1},
    ]
    currency = list(collection.aggregate(pipeline=aggregation_pipeline))[0]
    response = json_util.dumps(currency)
    return Response(response)
