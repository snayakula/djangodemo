FROM python:3.11

ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN useradd -m -s /bin/bash nonroot
# RUN groupadd -r nonroot && useradd -r -g nonroot nonroot -d /app nonroot:

USER nonroot

RUN id

RUN ls -la

ADD . /app

COPY ./patch-requirements.txt /app/patch-requirements.txt

RUN pip install -r patch-requirements.txt

COPY . /app

# Set the default command to run the application script
CMD ["./run_application.sh"]

RUN cd /home/nonroot
RUN ls
RUN pwd
RUN ls -la
