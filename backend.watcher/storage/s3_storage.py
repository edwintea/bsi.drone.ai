# storage/s3_storage.py
import boto3
from botocore.exceptions import NoCredentialsError

class S3Storage:
    def __init__(self, access_key, secret_key, bucket_name, endpoint_url=None):
        self.s3_client = boto3.client(
            's3',
            aws_access_key_id=access_key,
            aws_secret_access_key=secret_key,
            endpoint_url=endpoint_url
        )
        self.bucket_name = bucket_name

    def list_objects(self, prefix=None):
        try:
            response = self.s3_client.list_objects_v2(Bucket=self.bucket_name, Prefix=prefix)
            return [content['Key'] for content in response.get('Contents', [])]
        except NoCredentialsError:
            print("Credentials not available.")
            return []
