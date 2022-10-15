#!/bin/sh
### src直下にmanage.pyがない場合に使用 ###
# python $DJANGO_ROOT/manage.py makemigrations
# python $DJANGO_ROOT/manage.py migrate
# python $DJANGO_ROOT/manage.py collectstatic --no-input
#gunicorn --chdir $DJANGO_ROOT $DJANGO_PROJECT.wsgi:application --bind 0.0.0.0:15000

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
gunicorn $DJANGO_PROJECT.wsgi:application --bind 0.0.0.0:15000