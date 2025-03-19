#storage/blob_storage.py
from azure.storage.blob import BlobServiceClient
from azure.core.exceptions import ResourceNotFoundError
from config.storage import ABS_CONNECTION_STRING, ABS_CONTAINER_NAME

class BlobStorage:
    def __init__(self):
        self.blob_service_client = BlobServiceClient.from_connection_string(ABS_CONNECTION_STRING)
        self.container_client = self.blob_service_client.get_container_client(ABS_CONTAINER_NAME)

    def upload_blob(self, blob_name, data, overwrite=True):
        """Upload data to a blob in Azure Blob Storage."""
        blob_client = self.container_client.get_blob_client(blob_name)
        blob_client.upload_blob(data, overwrite=overwrite)
        print(f"Uploaded {blob_name} to {self.container_client.container_name}.")

    def download_blob(self, blob_name):
        """Download a blob's content from Azure Blob Storage."""
        try:
            blob_client = self.container_client.get_blob_client(blob_name)
            download_stream = blob_client.download_blob()
            return download_stream.readall()
        except ResourceNotFoundError:
            print(f"Blob {blob_name} not found.")
            return None

    def list_objects(self, prefix=None):
        """List all blobs in a container, optionally filtered by prefix."""
        blob_list = self.container_client.list_blobs(name_starts_with=prefix)
        return [blob.name for blob in blob_list]
    
    def move_file(self, blob_name, source_prefix, destination_prefix):
        """Move a blob from one location to another within the same container."""
        try:
            print(f"Moving {blob_name} from {source_prefix} to {destination_prefix}.")
            source_blob = self.container_client.get_blob_client(source_prefix + blob_name)
            print(f"Source blob URL: {source_blob.url}")
            destination_blob = self.container_client.get_blob_client(destination_prefix + blob_name)
            print(f"Destination blob URL: {destination_blob.url}")

            # Copy the blob
            destination_blob.start_copy_from_url(source_blob.url)

            # Delete the original blob
            source_blob.delete_blob()
            return True
        except Exception as e:
            print(f"Error moving {blob_name} from {source_prefix} to {destination_prefix}: {e}")
            return False

    def delete_blob(self, blob_name):
        """Delete a blob from Azure Blob Storage."""
        try:
            blob_client = self.container_client.get_blob_client(blob_name)
            blob_client.delete_blob()
            print(f"Deleted {blob_name} from {self.container_client.container_name}.")
        except ResourceNotFoundError:
            print(f"Blob {blob_name} not found.")
