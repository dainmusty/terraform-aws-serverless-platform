import json
import uuid
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Student-Details')


def lambda_handler(event, context):

    try:

        body = json.loads(event["body"])

        roll_number = str(body["roll_number"])
        student_name = body["student_name"]
        student_class = str(body["student_class"])

        unique_id = str(uuid.uuid4())

        response = table.put_item(
            Item={
                'ID': unique_id,
                'roll_number': roll_number,
                'student_name': student_name,
                'student_class': student_class,
                'created_at': datetime.utcnow().isoformat()
            }
        )

        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'message': 'Student added successfully'
            })
        }

    except Exception as error:

        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'error': str(error)
            })
        }