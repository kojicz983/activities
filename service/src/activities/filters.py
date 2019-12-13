from django_filters import FilterSet, RangeFilter, BaseInFilter, NumberFilter

from .models import Activities


class NumberInFilter(BaseInFilter, NumberFilter):
    pass


class ActivitiesFilter(FilterSet):
    activity_value = RangeFilter()
    category_in = NumberInFilter(field_name='categories', lookup_expr='in')

    class Meta:
        model = Activities
        fields = ('sdg', 'topic', 'donor_1', 'category_in', 'activity_value')
