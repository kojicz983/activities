import json

from django.core import serializers as serializer
from django.views.generic import ListView
from django.views.generic import TemplateView
from django.shortcuts import render

from rest_framework import serializers, viewsets

from django_filters.rest_framework import DjangoFilterBackend
from django_filters import FilterSet, RangeFilter, BaseInFilter, NumberFilter

from .models import Activities, Location, Category, Topic, SDG, Donor

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

class DonorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Donor
        fields = '__all__'


class ActivitiesSerializer(serializers.ModelSerializer):
    location = LocationSerializer()
    sublocation = LocationSerializer()
    categories = CategorySerializer(read_only=True, many=True)
    topic = TopicSerializer()
    sdg = SDGSerializer()
    donor_1 = DonorSerializer()
    donor_2 = DonorSerializer()
    donor_3 = DonorSerializer()

    class Meta:
        model = Activities
        fields = '__all__'


class NumberInFilter(BaseInFilter, NumberFilter):
    pass


class ActivitiesFilter(FilterSet):
    activity_value = RangeFilter()
    category_in = NumberInFilter(field_name='categories', lookup_expr='in')

    class Meta:
        model = Activities
        fields = ('sdg', 'topic', 'donor_1', 'category_in', 'activity_value' )


class ActivitiesViewSet(viewsets.ModelViewSet):
    queryset = Activities.objects.all()
    serializer_class = ActivitiesSerializer
    filter_class = ActivitiesFilter


class IndexView(TemplateView):
    template_name='index.html'
    queryset = Activities.objects.all()

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['topics'] = Topic.objects.all() #filter(id__in=self.queryset.values('topic').distinct())
        context['categories'] = Category.objects.all() #.filter(id__in=self.queryset.values('category').distinct())
        context['sdgs'] = SDG.objects.all() #filter(id__in=self.queryset.values('sdg').distinct())
        context['donors'] = Donor.objects.all().order_by('name')
        return context
