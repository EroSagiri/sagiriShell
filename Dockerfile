FROM ubuntu:latest
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
      apt update && \
      export DEBIAN_FRONTEND=noninteractive &&\
      apt install -y tzdata && \
      ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
      dpkg-reconfigure -f noninteractive tzdata && \
      apt install -y python3 python3-pip git curl wget toilet nmap && \
      yes 1 | apt install -y openssh-server && \
      mkdir /run/sshd && \
      pip3 install requests flask requests BeautifulSoup4 nonebot 
