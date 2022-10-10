#!/bin/sh
python $DJANGO_ROOT/manage.py makemigrations
python $DJANGO_ROOT/manage.py migrate
python $DJANGO_ROOT/manage.py collectstatic --no-input
gunicorn --chdir $DJANGO_ROOT $DJANGO_PROJECT.wsgi:application --bind 0.0.0.0:15000