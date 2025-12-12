FROM n8nio/n8n:latest

USER root

# --- KHẮC PHỤC LỖI Ở ĐÂY ---
# Cài đặt Python VÀ các công cụ biên dịch (Compiler)
# build-base: Chứa gcc, make... để biên dịch C
# python3-dev: Chứa các file header của Python
# linux-headers: Cần thiết cho thư viện psutil
RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    linux-headers \
    libffi-dev

# Cài đặt thư viện Python
# Thêm --prefer-binary để ưu tiên cài bản có sẵn thay vì biên dịch lại (giúp build nhanh hơn)
RUN pip3 install --break-system-packages --prefer-binary vnstock pandas pandas-ta requests

USER node