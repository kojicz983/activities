from django.contrib import admin
from .models import Activities, Location, Category, Topic, SDG

# Register your models here.
class LocationAdmin(admin.ModelAdmin):
    class Meta:
        model = Location

    def get_model_perms(self, request):
        return {}


class CategoryAdmin(admin.ModelAdmin):
    class Meta:
        model = Category

    def get_model_perms(self, request):
        return {}


class TopicAdmin(admin.ModelAdmin):
    class Meta:
        model = Topic

    def get_model_perms(self, request):
        return {}


class SDGAdmin(admin.ModelAdmin):
    class Meta:
        model = SDG

    def get_model_perms(self, request):
        return {}


class ActivitiesAdmin(admin.ModelAdmin):
    list_display = ('location', 'category', 'topic', 'sdg')

    class Meta:
        model = Activities

admin.site.register(Activities, ActivitiesAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(SDG, SDGAdmin)