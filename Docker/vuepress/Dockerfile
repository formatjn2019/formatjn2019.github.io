FROM node:lts-slim

# 创建工作目录
RUN mkdir /blog 

# 设置运行位置
WORKDIR /blog

# 安装vuepress及博客主题
RUN npm install -D vuepress
RUN npm install npm vuepress @vuepress/theme-blog
# 运行命令
CMD npm run docs:dev