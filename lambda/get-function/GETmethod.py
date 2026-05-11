import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('serverless-app-table')


def lambda_handler(event, context):
    """
    Get item from DynamoDB table
    """
    try:
        # Extract id from path parameters
        item_id = event['pathParameters']['id']
        
        # Get item from DynamoDB
        response = table.get_item(
            Key={'id': item_id}
        )
        
        if 'Item' not in response:
            return {
                'statusCode': 404,
                'body': json.dumps({'error': 'Item not found'})
            }
        
        return {
            'statusCode': 200,
            'body': json.dumps(response['Item'], default=str)
        }
    
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
