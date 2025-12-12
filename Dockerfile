FROM n8nio/n8n:latest

USER root

# 1. Cài đặt các công cụ hệ thống cơ bản để Python hoạt động
# build-base và python3-dev giúp biên dịch các gói Python cơ bản nếu cần
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    libffi-dev

# 2. Cài đặt thư viện: vnstock, pandas, requests
# --prefer-binary: Ưu tiên tải bản cài sẵn để đỡ phải build lâu
RUN pip3 install --break-system-packages --prefer-binary vnstock pandas requests

USER node