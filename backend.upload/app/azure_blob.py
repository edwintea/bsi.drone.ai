from azure.storage.blob.aio import BlobServiceClient  # Use the async version
from azure.storage.blob import BlobClient

class AzureBlobStorage:
    def __init__(self, connection_string: str, container_name: str):
        self.blob_service_client = BlobServiceClient.from_connection_string(connection_string)
        self.container_name = container_name
        self.container_client = self.blob_service_client.get_container_client(container_name)

        # Create the container if it doesn't exist
        try:
            self.container_client.create_container()
        except Exception as e:
            print(f"Container already exists or could not be created: {e}")

    async def upload_blob(self, file_stream, blob_name: str):
        blob_client = self.container_client.get_blob_client(blob=blob_name)
        await blob_client.upload_blob(file_stream, blob_type="BlockBlob", overwrite=True)

    async def list_blobs(self):
        blob_list = self.container_client.list_blobs()
        # Use an async for loop to iterate over the blobs
        return [blob.name async for blob in blob_list]

    async def get_blob_url(self, blob_name: str):
        blob_client = self.container_client.get_blob_client(blob=blob_name)
        return blob_client.url