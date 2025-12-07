# 使用现成的 Xray 镜像，省去自己下载解压的麻烦
FROM teddysun/xray:latest

# 把我们的配置文件复制进去
COPY config.json /etc/xray/config.json

# 告诉 Xray 用这个配置文件启动
CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
