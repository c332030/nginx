
# docker nginx

```shell script

program_home=/home/program

image=nginx
tag=alpine

name=nginx

docker pull $image:$tag

nginx_home=/etc/$name

docker stop $name
docker rm $name

docker run -d \
  \
  --privileged=true \
  --restart unless-stopped \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  \
  -v /etc/localtime:/etc/localtime \
  \
  -v $program_home/$name/nginx.conf:$nginx_home/nginx.conf:ro \
  -v $program_home/$name/conf:$nginx_home/conf:ro \
  \
  -v $program_home/$name/html:$nginx_home/html:ro \
  \
  -v $program_home/$name/conf/nginx:/etc/logrotate.d/nginx:ro \
  -v $program_home/$name/logs:$nginx_home/logs \
  \
  -p 80:80 \
  -p 443:443 \
  \
  --name $name \
  \
  $image:$tag

$ docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx

```
