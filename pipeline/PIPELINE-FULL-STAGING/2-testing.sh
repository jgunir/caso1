#!/bin/bash
source py37-venv/bin/activate
set -x
flake8 src
if [[ $? -ne 0 ]]
then
    exit 1
fi

radon cc src
if [[ $? -ne 0 ]]
then
    exit 1
fi

bandit -r src
if [[ $? -ne 0 ]]
then
    exit 1
fi

#ommitted by no module _sqlite3
#coverage run test/unified/TestToDoClass.py
#coverage report -m 