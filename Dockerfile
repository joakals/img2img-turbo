FROM python:3.10

WORKDIR /workdir

COPY requirements.txt ./

RUN pip install -r requirements.txt

RUN apt-get update && apt-get install --yes --no-install-recommends \
    libsm6 \
    libxrender1 \
    libxext6 \
    vim
