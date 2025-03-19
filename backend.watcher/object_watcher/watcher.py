#object_watcher/watcher.py
from storage.s3_storage import S3Storage
from storage.blob_storage import BlobStorage
from config.celery_config import app
import os

class ObjectWatcher:
    def __init__(self, storage_service):
        """Initialize with a storage service (e.g., S3Storage, BlobStorage)."""
        self.storage_service = storage_service
        self.processed_files = set()  # To track already processed files

    def watch_for_changes(self, prefix=None):
        image_extensions = ('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff')

    # Retrieve the list of objects from the storage service
        objects = self.storage_service.list_objects(prefix=prefix)

        for file_name in objects:
            if file_name.lower().endswith(image_extensions) and file_name not in self.processed_files:
                print(f"New image detected: {file_name}")
                file_name_only = os.path.basename(file_name)
                self.processed_files.add(file_name_only)
                
                # Move the file from 'input/' to 'queued/'
                
                if (self.storage_service.move_file(file_name_only, 'input/', 'queued/')):                    
                    app.send_task('workers.file_processor.process_file_task', args=['queued/' + file_name_only])
                    print(f"Moved {file_name} to queued/")

    def process_change(self, change):
        """Process the detected change."""
        pass

