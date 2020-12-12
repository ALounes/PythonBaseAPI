FROM python:3.8-slim as base

RUN apt-get update; apt-get install -y curl

LABEL maintainer="Lounès ACHAB <achab.lounes@gmail.com>"

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

FROM base
 
WORKDIR /app/
ENV PYTHONPATH=/app

COPY poetry.lock pyproject.toml ./
COPY ./gunicorn_conf.py /gunicorn_conf.py

RUN poetry install --no-dev

COPY ./src/scripts/start.sh /start.sh
COPY ./src/app /app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]