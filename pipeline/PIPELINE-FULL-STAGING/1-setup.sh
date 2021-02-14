#!/bin/bash
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
tar -zxvf Python-3.6.3.tgz
cd Python-3.6.3
./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make
sudo make altinstall

docker stop dynamodb || true
docker system prune -af --volumes

docker run -d --name dynamodb -p 8000:8000 amazon/dynamodb-local
sleep 10
python3.6 -m venv py36-venv
source py36-venv/bin/activate
pip install -r todos/requirements.txt
#python src/createTable.py