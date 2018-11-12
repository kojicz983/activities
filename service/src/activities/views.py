from django.views.generic import ListView

from rest_framework import serializers, viewsets
from .models import Activities, Location, Category, Topic, SDG
from django.shortcuts import render

from django.views.generic import TemplateView

from django.core import serializers as serializer

from rest_framework.renderers import JSONRenderer

import json


# Create your views here.
class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = '__all__'


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        fields = '__all__'


class SDGSerializer(serializers.ModelSerializer):
    class Meta:
        model = SDG
        fields = '__all__'


class ActivitiesSerializer(serializers.ModelSerializer):
    location = LocationSerializer()
    category = CategorySerializer()
    topic = TopicSerializer()
    sdg = SDGSerializer()

    class Meta:
        model = Activities
        fields = '__all__'


class ActivitiesViewSet(viewsets.ModelViewSet):
    queryset = Activities.objects.all()
    serializer_class = ActivitiesSerializer


class ActivitiesListView(ListView): 
    model = Activities


class IndexView(TemplateView):
    template_name='index.html'

    def get(self, request):
        return render(request, self.template_name, {})
