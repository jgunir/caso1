#!/bin/bash

docker stop dynamodb || true
docker system prune -af --volumes

docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local
sleep 10
python3.6 -m venv py36-venv
source py36-venv/bin/activate
pip install -r todos/requirements.txt
#python src/createTable.py