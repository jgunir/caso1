#!/bin/bash
sudo yum install -y https://repo.ius.io/ius-release-el7.rpm
sudo yum update -y
sudo yum install -y python36 python36-pip

docker stop `docker ps -q`

docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local
sleep 10
python36 -m venv py36-venv
source py36-venv/bin/activate
pip install -r todos/requirements.txt
#python src/createTable.py