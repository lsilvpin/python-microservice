FROM mcr.microsoft.com/devcontainers/python:3.10
WORKDIR /app
ADD . /app/
EXPOSE 80

RUN apt upgrade -y
RUN apt update -y
RUN pip install --upgrade pip
# RUN pip install -r requirements.txt
# CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
