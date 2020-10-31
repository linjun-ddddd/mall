#!/bin/bash

# 改变设置
sysctl -w vm.max_map_count=262144
# 使之立即生效
sysctl -p

mkdir mydata

# 创建目录
mkdir mydata/elasticsearch/data/
# 创建并改变该目录权限
chmod 777 mydata/elasticsearch/data

# 创建目录之后将nginx.conf文件上传到该目录下面
mkdir mydata/nginx/

# add nginx config
cp -r mall/document/docker/nginx.conf mydata/nginx/nginx.conf

# add mysql config
mkdir -p mydata/mysql/data
mkdir -p mydata/mysql/log
mkdir -p mydata/mysql/conf

docker-compose -f docker-compose-env.yml up -d