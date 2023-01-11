import azure.functions as func
import azure.storage.blob as azureblob
from azure.storage.blob import BlobServiceClient
import json
import os

STORAGE_CONNECTION_STRING=os.environ['AzureWebJobsStorage']
CONTAINER_NAME="resume"
ACCOUNT_URL="https://reusmestorage.blob.core.windows.net"
ACCOUNT_KEY="s7nsR0EvtJ9XOasiSFsNzQVUiJJHDWx65G0i04iNb/i8CBvlqHsxk8yhbIL7BBPtyJ7RpNQyjNYT+ASt6cx83w=="
BLOBNAME="resume.json"
headers = {'Accept': 'application/json'}
def main(req: func.HttpRequest) -> func.HttpResponse:

        
        blob_service_client_instance = BlobServiceClient(
        account_url=ACCOUNT_URL, credential=ACCOUNT_KEY)

        blob_client_instance = blob_service_client_instance.get_blob_client(
        CONTAINER_NAME, BLOBNAME, snapshot=None)

        blob_data = blob_client_instance.download_blob()
        data = blob_data. content_as_text()
        
        return data
    
    
        
   
   
    
