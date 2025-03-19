#config/celery_config.py
from celery import Celery
from config.db import DATABASE_URL
from config.broker import RABBITMQ_URL

app = Celery('eda_drone_bd',
             broker='pyamqp://'+RABBITMQ_URL,
             backend='db+'+DATABASE_URL,
             include=['workers.file_processor'])

app.conf.update(
    task_serializer='json',
    result_serializer='json',
    accept_content=['json'],
    timezone='UTC',
    enable_utc=True,
    task_always_eager=True,
)
