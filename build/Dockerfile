# imagem default
FROM ubuntu:16.04

# Responsavel
MAINTAINER Evandro Couto "vandocouto@gmail.com"

# update e instalação de pacotes
RUN apt-get update -y ; apt-get upgrade -y && \
    apt-get install apt-utils wget openssh-server telnet -y && \
    apt-get install vim passwd ifstat unzip make gcc -y && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget http://download.redis.io/redis-stable.tar.gz && \
    tar xvzf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    make install

RUN mkdir -p /etc/redis && \
    mkdir -p /data && \
    cp -f /tmp/redis-stable/*.conf /etc/redis && \
    rm -rf /tmp/redis-stable* 

# ajustando o SSH
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -y && \
    sed -i 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd

# Exportando LANG=C
RUN echo 'export LANG=C' >> /etc/profile

# Ajustando o conf do Redis
RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf && \
    sed -i 's/# requirepass foobared/requirepass "password"/g' /etc/redis/redis.conf && \
    sed -i 's/# maxmemory <bytes>/maxmemory 1024mb/g' /etc/redis/redis.conf && \
    sed -i 's/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g' /etc/redis/redis.conf && \
    sed -i 's/bind 127.0.0.1/# bind 127.0.0.1/g' /etc/redis/redis.conf  && \
    sed -i 's/dir .\//dir \/data/g' /etc/redis/redis.conf 

# localtime
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Copiando o script de inicialização
COPY run.sh /run.sh

# expose e cmd
EXPOSE 22
EXPOSE 6379
ENTRYPOINT ["./run.sh"]
