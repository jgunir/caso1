import json
import os
from todos import decimalencoder

import boto3
dynamodb = boto3.resource('dynamodb')


def translate(event, context):
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

    # fetch todo from the database
    result = table.get_item(
        Key={
            'id': event['pathParameters']['id']
        }
    )

    # Auto translate text with AWS Translate https://docs.aws.amazon.com/translate/latest/dg/examples-python.html
    translate = boto3.client(service_name='translate', region_name='us-east-1', use_ssl=True)
    translate = translate.translate_text(Text=result['Item']['text'], 
    SourceLanguageCode="auto", TargetLanguageCode=event['pathParameters']['lang'])

    result['Item']['text'] = translate.get('TranslatedText')

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(result['Item'],
                           cls=decimalencoder.DecimalEncoder)
    }

    return response
