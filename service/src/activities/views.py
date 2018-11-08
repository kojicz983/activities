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
        sdgs = SDG.objects.all()
        topics = Topic.objects.all()
        locations = Location.objects.all()
        categories = Category.objects.all()

        sdgs_json = serializer.serialize("json", sdgs)
        category_json = serializer.serialize("json", categories)
        topics_json = serializer.serialize("json", topics)
        locations_json = serializer.serialize("json", locations)

        activities = serializer.serialize("json", Activities.objects.all())

        args = {'sdgs': sdgs, 
                'topics': topics, 
                'categories': categories, 
                'locations':locations, 
                'activities': activities, 
                'sdgs_json': sdgs_json, 
                'locations_json': locations_json,
                'topics_json': topics_json 
                }
        return render(request, self.template_name, args)
    
    def post(self, request):
        sdgs = SDG.objects.all()
        topics = Topic.objects.all()
        locations = Location.objects.all()
        categories = Category.objects.all()

        sdgs_json = serializer.serialize("json", sdgs)
        category_json = serializer.serialize("json", categories)
        topics_json = serializer.serialize("json", topics)
        locations_json = serializer.serialize("json", locations)

        sdgs_filter = request.POST.get('sdgs')

        activities = serializer.serialize("json", Activities.objects.all())
        if sdgs_filter != "0":
         activities = serializer.serialize("json", Activities.objects.filter(sdg=sdgs_filter))    


        args = {'sdgs': sdgs, 
                'topics': topics, 
                'categories': categories, 
                'locations':locations, 
                'activities': activities, 
                'sdgs_json': sdgs_json, 
                'locations_json': locations_json,
                'topics_json': topics_json 
                }

        return render(request, self.template_name, args)