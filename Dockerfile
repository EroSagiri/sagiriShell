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
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjiZwrBCyEd5jwJOwSPILEc759QzxXVSnDrGOEQlzMQw7P1NPYIQn4HagaSvCQiCU+LIWHJddrtEv/tONGhcBceKCUcWZmk8ZCB/m+0SJTJPWOuLs6BDZwe8/lecA/EfhOkDczQaGh7b0l/mzN88RjtTf7swFJri4oELYmgSb/qgDsBHN6OBzg4UatarJxkNLOdQzkQJrriXqWyp0To5TCfspAmttl1JVCG43kPJviZL7kqTQhL9XiiJpsYmUJbCH9i65UimjmigdQb6ozitPM6dDzw8NnHjddP8e6UBr3Iu/Xx4IH/UKlEw+3UNdghvXhXkkZxcjhHIHS2GpTxZAF JuiceSSH " > /root/.ssh/authorized_keys
