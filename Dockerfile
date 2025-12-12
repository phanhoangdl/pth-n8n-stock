FROM n8nio/n8n:latest

USER root

# Cài đặt công cụ biên dịch cơ bản (để cài được psutil/pandas nếu cần build)
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    linux-headers

# Cài vnstock và pandas (Ưu tiên bản binary để không phải build lâu)
RUN pip3 install --break-system-packages --prefer-binary vnstock pandas requests

USER node