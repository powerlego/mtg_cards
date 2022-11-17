from django.urls import path
from . import views

urlpatterns = [
    path("collection/", views.get_collection, name="collection"),
    path("insert/", views.insert, name="insert"),
    path("insert_all/", views.insert_all, name="insert_all"),
    path("update/", views.update, name="update"),
    path("delete/", views.delete, name="delete"),
    path(
        "get_total_card_count/", views.get_total_card_count, name="get_total_card_count"
    ),
    path("check_duplicates/", views.check_duplicates, name="check_duplicates"),
    path(
        "get_most_expensive_card/",
        views.get_most_expensive_card,
        name="get_most_expensive_card",
    ),
    path(
        "get_total_collection_price/",
        views.get_total_collection_price,
        name="get_total_collection_price",
    ),
    path("get_color_count/", views.get_color_count, name="get_color_count"),
]
