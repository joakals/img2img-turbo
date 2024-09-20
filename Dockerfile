FROM python:3.10

WORKDIR /workdir

COPY requirements.txt ./

RUN pip install -r requirements.txt
