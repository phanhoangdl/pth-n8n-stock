FROM n8nio/n8n:latest

USER root
# Cài python và thư viện chứng khoán
RUN apk add --update python3 py3-pip
RUN pip3 install --break-system-packages vnstock pandas pandas-ta requests

USER node