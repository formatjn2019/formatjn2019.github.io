FROM python:3.11
RUN apt update&&apt install -y git
RUN python -m pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --upgrade pip&&pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple&&pip install gitPython
RUN git config --global --add safe.directory /blog
ADD Docker/tools/createNav.sh /usr/local/bin/createNav.sh
RUN chmod +x /usr/local/bin/createNav.sh
WORKDIR /blog
CMD createNav.sh