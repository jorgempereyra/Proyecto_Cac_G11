# config.py
import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'your_secret_key'
    SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://ugbpggmt7bpmnts1:uQFy4bXcUYnIBCIyLKJt@bvscsukiuuob2dodepv4-mysql.services.clever-cloud.com/bvscsukiuuob2dodepv4'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
