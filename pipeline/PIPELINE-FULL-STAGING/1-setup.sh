#!/bin/bash
sudo yum install -y https://repo.ius.io/ius-release-el7.rpm
sudo yum update
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip


docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local
sleep 10
python3.6 -m venv py36-venv
source py36-venv/bin/activate
pip install -r todos/requirements.txt
#python src/createTable.py