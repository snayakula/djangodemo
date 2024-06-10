FROM python:3

ENV PYTHONUNBUFFERED 1

RUN addgroup -S nonroot \
    && adduser -S nonroot -G nonroot \
    && mkdir -p /app \
    && chown -R nonroot:nonroot /app

WORKDIR /app

ADD . /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app


