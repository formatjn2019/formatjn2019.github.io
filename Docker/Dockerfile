# Stage 1: generate navigation, config, and README indexes
FROM python:3.11-slim AS config-builder

ARG BLOG_IPC
ARG BLOG_BEIAN
ARG BLOG_BEIAN_NUM
ARG BLOG_BEIAN_LINK
ENV BLOG_IPC=${BLOG_IPC} BLOG_BEIAN=${BLOG_BEIAN} \
    BLOG_BEIAN_NUM=${BLOG_BEIAN_NUM} BLOG_BEIAN_LINK=${BLOG_BEIAN_LINK}

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -i https://mirrors.aliyun.com/pypi/simple gitpython

WORKDIR /blog
COPY create_config_and_indexs.py update_markdown.py ./
COPY markdown/ ./markdown/

RUN python update_markdown.py \
    && python create_config_and_indexs.py

# Stage 2: build VuePress static site
FROM node:lts-slim AS site-builder

RUN npm config set registry https://registry.npmmirror.com

WORKDIR /blog

COPY package.json ./
RUN npm install vuepress @vuepress/theme-blog lodash.template@4.5.0

COPY --from=config-builder /blog/markdown/ ./docs/

ENV NODE_OPTIONS="--max-old-space-size=2048"

RUN npm run docs:build

# Stage 3: serve static files
FROM nginx:alpine

COPY --from=site-builder /blog/docs/.vuepress/dist /usr/share/nginx/html
COPY Docker/nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
