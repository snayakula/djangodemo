FROM python:3

ENV PYTHONUNBUFFERED 1

# RUN groupadd -r nonroot && useradd -r -g nonroot nonroot -d /app nonroot
RUN useradd nonroot
USER nonroot

WORKDIR /app

# RUN chown -R nonroot:nonroot /app

# Switch to the nonroot user
USER nonroot

ADD . /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

# Set the default command to run the application script
CMD ["./run_application.sh"]
