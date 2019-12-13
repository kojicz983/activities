from django.contrib import admin
from .models import Activities, Location, Category, Topic, SDG, Donor


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


class DonorAdmin(admin.ModelAdmin):
    class Meta:
        model = Donor

    def get_model_perms(self, request):
        return {}


class ActivitiesAdmin(admin.ModelAdmin):
    list_display = (
        'location', 'owner', 'topic', 'sdg',
        'donor_1', 'donor_2', 'donor_3', 'start_date', 'end_date')

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = []
        if not request.user.is_superuser:
            self.exclude.append('owner')
        return super(ActivitiesAdmin, self).get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        if change is False and getattr(obj, 'owner', None) is None:
            obj.owner = request.user
        obj.save()

    def get_queryset(self, request):
        if request.user.is_superuser:
            queryset = Activities.objects.all()
        else:
            try:
                queryset = Activities.objects.filter(owner=request.user)
            except:
                queryset = Activities.objects.none()
        return queryset

    class Meta:
        model = Activities


admin.site.register(Activities, ActivitiesAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(SDG, SDGAdmin)
admin.site.register(Donor, DonorAdmin)
