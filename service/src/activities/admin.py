from django.contrib import admin
from .models import Activities, Location, Category, Topic, SDG, Donor


class LocationAdmin(admin.ModelAdmin):
    ordering = ('name', )

    class Meta:
        model = Location

    # def get_model_perms(self, request):
    #     return {}


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
        'location', 'topic', 'sdg', 'project_name', 'specific_activity',
        'donor_1', 'donor_2', 'donor_3', 'start_date', 'end_date')

    search_fields = ('topic__name', 'location__name', )

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = []
        if not request.user.is_superuser:
            self.exclude.append('owner')
        return super(ActivitiesAdmin, self).get_form(request, obj, **kwargs)

    def changelist_view(self, request, extra_context=None):
        if request.user.is_superuser:
            if 'owner' not in self.list_display:
                self.list_display += ('owner', )
            self.list_editable = ('owner', )
        return super(ActivitiesAdmin, self).changelist_view(request, extra_context)

    def save_model(self, request, obj, form, change):
        if change is False and getattr(obj, 'owner', None) is None:
            obj.owner = request.user
        obj.save()

    def get_queryset(self, request):
        if request.user.is_superuser:
            queryset = Activities.objects.all()
        else:
            queryset = Activities.objects.filter(owner=request.user)

        return queryset

    class Meta:
        model = Activities


admin.site.register(Activities, ActivitiesAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(SDG, SDGAdmin)
admin.site.register(Donor, DonorAdmin)
