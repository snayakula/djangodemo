FROM python:3

ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN groupadd -r nonroot && useradd -r -g nonroot nonroot -d /app nonroot:

USER nonroot

ADD . /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

# Set the default command to run the application script
CMD ["./run_application.sh"]
