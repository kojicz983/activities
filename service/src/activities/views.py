import json

from django.core import serializers as serializer
from django.views.generic import ListView
from django.views.generic import TemplateView
from django.shortcuts import render

from rest_framework import serializers, viewsets

from django_filters.rest_framework import DjangoFilterBackend
from django_filters import FilterSet, RangeFilter

from .models import Activities, Location, Category, Topic, SDG

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


class ActivitiesFilter(FilterSet):
    activity_value = RangeFilter()

    class Meta:
        model = Activities
        fields = ('sdg', 'topic', 'category', 'activity_value' )


class ActivitiesViewSet(viewsets.ModelViewSet):
    queryset = Activities.objects.all()
    serializer_class = ActivitiesSerializer
    filter_class = ActivitiesFilter


class IndexView(TemplateView):
    template_name='index.html'
    queryset = Activities.objects.all()

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['topics'] = Topic.objects.filter(id__in=self.queryset.values('topic').distinct())
        context['categories'] = Category.objects.filter(id__in=self.queryset.values('category').distinct())
        context['sdgs'] = SDG.objects.filter(id__in=self.queryset.values('sdg').distinct())
        return context
