import sys
import os
import datetime

# Add the parent directory of 'backend' to the Python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from object_watcher.watcher import ObjectWatcher
from storage.blob_storage import BlobStorage

def start_watcher():
    blob_storage = BlobStorage()
    watcher = ObjectWatcher(blob_storage)
    watcher.watch_for_changes(prefix='input/')

if __name__ == '__main__':
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    start_watcher()
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))