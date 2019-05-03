FROM debian:stable-slim
MAINTAINER Fernao Lopes <fernao@riseup.net>

EXPOSE 80

RUN apt update && apt install -y \
python3-pip \
unixodbc-dev

RUN pip3 install --upgrade pip
RUN pip install pyodbc sqlalchemy

COPY migrate /opt/migrate
RUN chmod +x /opt/migrate/main.py

WORKDIR "/opt/migrate"
