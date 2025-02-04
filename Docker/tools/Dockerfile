FROM python:3.11
RUN apt update&&apt install -y git
RUN python -m pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --upgrade pip&&pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple&&pip install gitPython
RUN git config --global --add safe.directory /blog
ADD create_config_and_indexs.py /usr/local/bin/create_config_and_indexs.py
WORKDIR /blog
CMD bash -c "find ./docs -name README.md -delete&&git checkout .&&git pull&&python /usr/local/bin/create_config_and_indexs.py /"