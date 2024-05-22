FROM ubuntu:22.04

RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt update && \
	apt upgrade -y && \
	apt install -y build-essential software-properties-common && \
	apt install -y curl git htop man unzip vim wget net-tools && \
	rm -rf /var/lib/apt/lists/*

ENV HOME /root

WORKDIR /root

CMD ["bash"]
