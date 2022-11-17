from django.urls import path
from . import views

urlpatterns = [
    path("collection/", views.get_collection, name="collection"),
    path("insert/", views.insert, name="insert"),
    path("insert_all/", views.insert_all, name="insert_all"),
    path("update/", views.update, name="update"),
    path("delete/", views.delete, name="delete"),
    path("get_currency/", views.get_currency, name="get_currency"),
]
