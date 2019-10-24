import boto3
import requests
from requests_aws4auth import AWS4Auth

host = 'https://vpc-aws-es-2xi3large-ch7tptbb35qiz55mlf2drjsxoe.ap-southeast-1.es.amazonaws.com/' # include https:// and trailing /
region = 'ap-southeast-1' # e.g. us-west-1
service = 'es'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

# Register repository

path = '_snapshot/my-snapshot-repo' # the Elasticsearch API endpoint
url = host + path

payload = {
  "type": "s3",
  "settings": {
    "bucket": "es-prod-server-snapshot-18-jan-2019",
    "region": "ap-southeast-1",
    "role_arn": "arn:aws:iam::885332641996:role/es-prod-server-repo-role"
  }
}

headers = {"Content-Type": "application/json"}

r = requests.put(url, auth=awsauth, json=payload, headers=headers)

print(r.status_code)
print(r.text)