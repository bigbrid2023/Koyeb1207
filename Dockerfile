FROM ubuntu:latest

# 1. 安装基础工具
RUN apt-get update && apt-get install -y curl wget unzip

# 2. 准备工作目录
WORKDIR /app

# 3. 下载并安装 Xray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O xray.zip && \
    unzip xray.zip && \
    chmod +x xray && \
    rm xray.zip

# 4. 下载并安装 Caddy
RUN wget "https://caddyserver.com/api/download?os=linux&arch=amd64" -O caddy && \
    chmod +x caddy

# 5. 复制配置文件 (假设你已经把这两个文件上传到了 GitHub)
COPY config.json .
COPY Caddyfile .

# 6. 启动脚本：同时运行 Caddy 和 Xray
CMD ./xray -config config.json & ./caddy run --config Caddyfile --adapter caddyfile
