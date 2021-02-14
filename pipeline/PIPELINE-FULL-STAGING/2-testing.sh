#!/bin/bash
source py36-venv/bin/activate
set -x
flake8 todos
if [[ $? -ne 0 ]]
then
    exit 1
fi

radon cc todos
if [[ $? -ne 0 ]]
then
    exit 1
fi

bandit -r todos
if [[ $? -ne 0 ]]
then
    exit 1
fi

#ommitted by no module _sqlite3
coverage run test/unified/TestToDoClass.py
coverage report -m