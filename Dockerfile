FROM n8nio/n8n:latest

USER root

# Cài đặt Python và các thư viện hệ thống cần thiết
# Thêm llvm, llvm-dev, cmake để biên dịch numba/llvmlite
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    linux-headers \
    libffi-dev \
    llvm \
    llvm-dev \
    cmake \
    libedit-dev \
    libxml2-dev

# Thiết lập biến môi trường để llvmlite tìm thấy llvm-config
ENV LLVM_CONFIG=/usr/bin/llvm-config

# Cài đặt thư viện Python
# Sử dụng --prefer-binary để ưu tiên tìm bản cài sẵn (nếu có)
RUN pip3 install --break-system-packages --prefer-binary vnstock pandas pandas-ta requests

USER node