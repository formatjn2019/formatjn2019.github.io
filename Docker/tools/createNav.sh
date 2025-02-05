#/bin/bash

find . -name "README.md" -delete
git checkout .
git pull
python create_config_and_indexs.py "$@"