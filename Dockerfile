FROM n8nio/n8n:latest

USER root

# 1. Cài đặt Python 3 và các công cụ hệ thống cần thiết
# build-base, python3-dev: Cần thiết để biên dịch các gói Python nếu không có bản binary sẵn
# git: Đề phòng vnstock cần tải dependency từ git
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    libffi-dev \
    git

# 2. Cài đặt thư viện Python
# --upgrade pip: Cập nhật pip để tránh lỗi tương thích
RUN pip3 install --break-system-packages --upgrade pip

# 3. Cài đặt vnstock và các thư viện hỗ trợ
# -U (Upgrade): BẮT BUỘC để lấy bản vnstock mới nhất hỗ trợ OOP (Quote, Company...)
# --prefer-binary: Ưu tiên tải bản cài sẵn để cài đặt nhanh hơn, đỡ tốn RAM
# pandas, requests: Thư viện nền tảng
RUN pip3 install --break-system-packages --prefer-binary -U vnstock pandas requests
RUN pip3 install --break-system-packages --prefer-binary pandas requests yfinance

USER node