import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Student-Details')


def lambda_handler(event, context):

    try:

        response = table.scan()

        data = response['Items']

        while 'LastEvaluatedKey' in response:
            response = table.scan(
                ExclusiveStartKey=response['LastEvaluatedKey']
            )

            data.extend(response['Items'])

        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps(data)
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