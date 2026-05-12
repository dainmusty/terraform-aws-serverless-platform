import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Student-Details')


def lambda_handler(event, context):

    try:

        response = table.scan()

        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps(response['Items'])
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