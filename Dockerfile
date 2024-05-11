# Dockerfile

FROM ubuntu:22.04
LABEL org.opencontainers.image.description "基于 ubuntu:22.04 原版镜像，更新软件源为腾讯云镜像，安装了必要的工具和依赖，默认用户为user，默认工作目录为/workspace"

# RUN sed -i -e 's/archive.ubuntu.com/mirrors.tencentyun.com/g' /etc/apt/sources.list  && \
# sed -i -e 's/security.ubuntu.com/mirrors.tencentyun.com/g' /etc/apt/sources.list  && \
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y apt-utils bc wget git git-lfs nano iftop htop && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i -e 's/mirrors.tencentyun.com/mirrors.tencent.com/g' /etc/apt/sources.list  && \
    mkdir -p /workspace && \
    adduser --disabled-password --gecos '' user && \
    chown -R user:user /workspace