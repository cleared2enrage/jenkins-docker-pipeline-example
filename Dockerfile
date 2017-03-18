FROM python:3.5

RUN mkdir /home/app
WORKDIR /home/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .
