# Docker Container Redis 
- Ajustando a intância:
<pre>
# docker volume create --name Redis
</pre>
<pre>
# echo "sysctl vm.overcommit_memory=1" >> /etc/sysctl.conf
</pre>
<hr>

- Iniciando o container
<pre>
# cd $PWD/Docker_Container_Redis/
</pre>
<pre>
# docker-compose up -d
</pre>
- Para acessar o container (user: root / pass: root)
<pre>
# ssh root@127.0.0.1 -p2200
</pre>
<hr>
- Senha do Redis: "password"
