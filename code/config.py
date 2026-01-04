import os
from datetime import timedelta

class Config:
    # Database configuration
    SQLALCHEMY_DATABASE_URI = os.environ.get("DATABASE_URL","mysql+pymysql://admin:Gdsdteam4_123@team4-db.ck1s0emywc4t.us-east-1.rds.amazonaws.com:3306/team4appdb_test")
    SQLALCHEMY_DATABASE_URI = os.environ.get("DATABASE_URL")
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # JWT configuration
    SECRET_KEY = os.environ.get("SECRET_KEY") or "fallback"
    JWT_ACCESS_TOKEN_EXPIRES = timedelta(days=1)

    # CORS configuration
    CORS_HEADERS = "Content-Type"

    # AWS S3 configuration
    AWS_ACCESS_KEY_ID = os.environ.get("AWS_ACCESS_KEY_ID")
    AWS_SECRET_ACCESS_KEY = os.environ.get("AWS_SECRET_ACCESS_KEY")
    S3_BUCKET = os.environ.get("S3_BUCKET")
    S3_REGION = os.environ.get("S3_REGION")
    CORS_HEADERS = 'Content-Type'

    # AWS Configuration
    AWS_ACCESS_KEY_ID = os.environ.get('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')
    S3_BUCKET = os.environ.get('S3_BUCKET')
    S3_REGION = os.environ.get('S3_REGION')