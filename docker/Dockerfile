FROM python:3.9 AS builder

LABEL maintainer="Lounes ACHAB <achab.lounes@gmail.com>"

WORKDIR /app

COPY poetry.lock pyproject.toml ./

# Install Poetry
RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.in-project true && \
    poetry install --no-dev

FROM python:3.9-alpine

WORKDIR /app/

# copy only the dependencies installation from the 1st stage image
COPY --from=builder /app/.venv/ ./.venv/

ENV VIRTUAL_ENV=/app/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY ./src/config/gunicorn_conf.py /gunicorn_conf.py
COPY ./src/scripts/start.sh /start.sh
COPY ./src/app /app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]