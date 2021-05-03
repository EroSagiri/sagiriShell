FROM ubuntu:latest
RUN \
	cp /etc/apt/sources.list /etc/apt/sources.list.default && \
	sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt update && \
	export DEBIAN_FRONTEND=noninteractive &&\
	apt install -y tzdata && \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	dpkg-reconfigure -f noninteractive tzdata && \
	apt install -y python3 python3-pip git curl wget toilet nmap openssh-server && \
	mkdir /run/sshd && \
	pip3 install -i https://mirrors.ustc.edu.cn/pypi/web/simple pip -U && \
	pip3 config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple && \
	pip3 install requests flask requests BeautifulSoup4 nonebot && \
	mkdir /backups/ && \
	cp -r /bin/ /backups/ && \
	cp -r /etc/ /backups/ && \
	cp -r /lib*/ /backups/ && \
	useradd -m bot
	mkdir /root/.ssh
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpRL99ud/nK5tgeTNRpMTo9YsxeHjSuYoR9S/PbFQd6jHgNGC8fzuF4WEx3977+bz5vzPpIFtVtFVAcr8nY09b6+OXWpA55dOa0W9qage0RrKnQb4Pr47uwuczJiL/2TrMjJ9VccfIP7xC1lk0pL+Cexp98HiJ0RYdeOQaXh2V26n7oSAn5mWevLNgc5pk3xvCluuOF9GvIPnsrxODFIfUN7HQcTIgTxmsDfZzoct0MIqt4Rfs5i1T3E1YF9SajopjnhLLb25g106F+GNGy0nigjw4EJQU3FT0L4L60u7rnJ0wGIwOSv4k2IojKBixFE58EwIVrKnmf0XF5iQlBGAt" > /root/.ssh/authorized_keys
