#!/bin/bash

curl https://sh.rustup.rs -sSf | bash -s -- -y

pip install -r requirements.txt

./prepare.py
