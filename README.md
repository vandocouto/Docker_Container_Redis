# Docker Container Redis 

<pre>
# docker volume create --name Redis
</pre>

<pre>
# echo "sysctl vm.overcommit_memory=1" >> /etc/sysctl.conf
</pre>

<hr>
- Senha do Redis: password
<pre>
- Iniciando o container
<pre>
# docker-compose up -d
</pre>
- Para acessar o container (user: root / pass: root)
<pre>
# ssh root@127.0.0.1 -p2200
</pre>
