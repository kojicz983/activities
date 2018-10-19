FROM python:3.6.6

# RUN virtualenv . && . bin/activate
WORKDIR /app

COPY ./activities /app

COPY ./requirements /requirements

RUN pip install -U pip && pip install --no-cache-dir -r /requirements/base.pip

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000", "--settings=activities.settings.dev" ]