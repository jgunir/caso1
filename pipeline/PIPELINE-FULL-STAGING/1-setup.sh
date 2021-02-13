#!/bin/bash
docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local
sleep 10
python3.7 -m venv py37-venv
source py37-venv/bin/activate
pip install -r todos/requirements.txt
#python src/createTable.py

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node -e "console.log('Running Node.js ' + process.version)"
node --version
npm install -g serverless