import json
import uuid
import boto3

from datetime import datetime, timedelta

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Student-Details')

utc_now = datetime.utcnow()
ist_offset = timedelta(hours=5, minutes=30)
ist_now = utc_now + ist_offset

ist_now_str = ist_now.strftime("%a, %d %b %Y %H:%M:%S +0530 IST")


def lambda_handler(event, context):

    try:

        body = json.loads(event["body"])

        roll_number = str(body['roll_number'])
        student_name = body['student_name']
        student_class = str(body['student_class'])

        unique_id = str(uuid.uuid4())

        table.put_item(
            Item={
                'ID': unique_id,
                'roll_number': roll_number,
                'student_name': student_name,
                'student_class': student_class,
                'LatestGreetingTime': ist_now_str
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

    except Exception as e:

        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'error': str(e)
            })
        }