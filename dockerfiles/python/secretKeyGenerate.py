# Djangoで使用する秘密鍵を生成するためのプログラム
from django.core.management.utils import get_random_secret_key

print(get_random_secret_key())