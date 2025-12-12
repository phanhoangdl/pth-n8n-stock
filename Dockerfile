FROM n8nio/n8n:latest

USER root

# 1. Cài đặt Python và công cụ biên dịch
# Quan trọng: Cài rõ ràng 'llvm15' và 'llvm15-dev' để khớp version với thư viện Python
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    linux-headers \
    libffi-dev \
    llvm15 \
    llvm15-dev \
    cmake \
    libedit-dev \
    libxml2-dev

# 2. "Chỉ đường" cho trình biên dịch biết file cấu hình LLVM 15 nằm ở đâu
# Nếu không có dòng này, nó sẽ không tìm thấy LLVM dù đã cài
ENV LLVM_CONFIG=/usr/lib/llvm15/bin/llvm-config

# 3. Cài đặt thư viện (Giữ nguyên)
# Mẹo: Cython đôi khi cần cài trước để build các gói khác mượt hơn
RUN pip3 install --break-system-packages Cython
RUN pip3 install --break-system-packages --prefer-binary vnstock pandas pandas-ta requests

USER node