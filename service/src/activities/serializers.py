from rest_framework import serializers

from .models import Location, Category, Topic, SDG, Donor, Activities


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
