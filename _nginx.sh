#!/bin/sh

# chkconfig: - 85 15
# description: nginx is a World Wide Web server. It is used to serve

# /usr/local/nginx/nginx


# https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.gz
# 会报错
# https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.gz

# http://zlib.net/zlib-1.2.11.tar.gz

# http://nginx.org/en/download.html
# http://nginx.org/download/nginx-1.14.0.tar.gz

# https://www.openssl.org/source/openssl-1.1.1.tar.gz


tar -zxvf nginx-1.14.0.tar.gz

./configure \
    --prefix=/usr/local/nginx

make
make install



yum -y install gcc gcc-c++ automake autoconf libtool make openssl openssl-devel pcre-devel


/usr/local/nginx/nginx

ln -s /usr/local/nginx/nginx /usr/local/bin/nginx
ln -s /usr/local/nginx/nginx /etc/init.d/nginx
ls -l /usr/local/bin/nginx


# 要先预编译（安装）才能使用以下命令
./configure \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-http_ssl_module \
    --with-pcre=/root/src/pcre-8.42 \
    --with-zlib=/root/src/zlib-1.2.11 \
	--with-openssl=/root/src/openssl-1.1.1

./configure \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-http_ssl_module \
    --with-pcre=/root/src/pcre-8.42 \
    --with-zlib=/root/src/zlib-1.2.11


# /usr/local/nginx/cert/c332030.com.crt
# /usr/local/nginx/cert/c332030.com.key


chkconfig nginx on

# cd /lib/systemd/system/
# vi nginx.service

# 执行systemctl enable nginx.service使nginx开机启动
systemctl enable nginx.service
systemctl start nginx.service


# 修改配置后重新加载生效
nginx -s reload

# 重新打开日志文件
nginx -s reopen

# 测试nginx配置文件是否正确
nginx -t -c /path/to/nginx.conf

# 快速停止nginx
nginx -s stop

# 完整有序的停止nginx
nginx -s quit

