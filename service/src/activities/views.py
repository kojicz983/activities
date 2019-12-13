from django.views.generic import TemplateView

from rest_framework import viewsets

from .models import Activities, Category, Topic, SDG, Donor
from .serializers import ActivitiesSerializer
from .filters import ActivitiesFilter


class ActivitiesViewSet(viewsets.ModelViewSet):
    queryset = Activities.objects.all()
    serializer_class = ActivitiesSerializer
    filter_class = ActivitiesFilter


class IndexView(TemplateView):
    template_name = 'index.html'
    queryset = Activities.objects.all()

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['topics'] = Topic.objects.all()
        context['categories'] = Category.objects.all()
        context['sdgs'] = SDG.objects.all()
        context['donors'] = Donor.objects.all().order_by('name')
        return context
