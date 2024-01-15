from django.urls import path, include
from rest_framework import routers

from products import viewsets

router = routers.SimpleRouter()
router.registrer(r'product', viewsets.ProductViewSet, basename='product')

urlpatterns = [
    path('', include(router.urls))
]