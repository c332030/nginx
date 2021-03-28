
# proxy

proxy_pass

## 报文头

- proxy_redirect off;

- sendfile on;

    允许sendfile方式传输文件，默认为off，可以在http块，server块，location块。
    
- proxy_method get;

    支持客户端的请求方法。post/get；
    
- proxy_connect_timeout 1;

    nginx服务器与被代理的服务器建立连接的超时时间，默认60秒

- proxy_read_timeout 1;

    nginx服务器想被代理服务器组发出read请求后，等待响应的超时间，默认为60秒

- proxy_send_timeout 1;

    nginx服务器想被代理服务器组发出write请求后，等待响应的超时间，默认为60秒

- proxy_http_version 1.0;

    Nginx服务器提供代理服务的http协议版本1.0，1.1，默认设置为1.0版本

- proxy_ignore_client_abort on;

    客户端断网时，nginx服务器是否终端对被代理服务器的请求。默认为off。

- proxy_ignore_headers "Expires" "Set-Cookie";

    Nginx服务器不处理设置的http相应投中的头域，这里空格隔开可以设置多个。

- proxy_intercept_errors on;

     如果被代理服务器返回的状态码为400或者大于400，设置的error_page配置起作用。默认为off。

- proxy_headers_hash_max_size 1024;

    存放http报文头的哈希表容量上限，默认为512个字符。

- proxy_headers_hash_bucket_size 128;

    nginx服务器申请存放http报文头的哈希表容量大小。默认为64个字符。

- proxy_next_upstream timeout;

    反向代理upstream中设置的服务器组，出现故障时，被代理服务器返回的状态值。error|timeout|invalid_header|http_500|http_502|http_503|http_504|http_404|off

- proxy_ssl_session_reuse on;

    默认为on，如果我们在错误日志中发现“SSL3_GET_FINSHED:digest check failed”的情况时，可以将该指令设置为off。

## 报文头设置

proxy_set_header Host $host;

- Host $host;

    只要用户在浏览器中访问的域名绑定了 VIP VIP 下面有RS；则就用$host ；host是访问URL中的域名和端口  www.taobao.com:80

- X-Real-IP $remote_addr;

    把源IP 【$remote_addr,建立HTTP连接header里面的信息】赋值给X-Real-IP;这样在代码中 $X-Real-IP来获取 源IP

- X-Forwarded-Host $host;

- X-Forwarded-Server $host;

- X-Forwarded-For $proxy_add_x_forwarded_for;

    用来表示 HTTP 请求端真实 IP

    在nginx 作为代理服务器时，设置的IP列表，会把经过的机器ip，代理机器ip都记录下来，用 【，】隔开；代码中用 echo $x-forwarded-for |awk -F, '{print $1}' 来作为源IP

- X-Forwarded-Proto https;
