import json
import uuid
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Student-Details')


def lambda_handler(event, context):

    body = json.loads(event["body"])

    item = {
        "ID": str(uuid.uuid4()),
        "roll_number": body["roll_number"],
        "student_name": body["student_name"],
        "student_class": body["student_class"],
        "created_at": datetime.utcnow().isoformat()
    }

    table.put_item(Item=item)

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({
            "message": "Student added successfully"
        })
    }