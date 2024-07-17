FROM mcr.microsoft.com/devcontainers/python:3.11

RUN apt upgrade -y
RUN apt update -y
RUN pip install --upgrade pip
RUN apt install -y unixodbc-dev openconnect vim inetutils-ping telnet

WORKDIR /app
ADD . /app/

RUN if [ -d "venv" ]; then rm -r venv; fi
RUN python -m venv venv

RUN . venv/bin/activate
RUN pip install -r requirements.txt
RUN pip install --upgrade pip
