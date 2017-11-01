FROM alpine:latest

LABEL maintainer "contact@ilyaglotov.com"
LABEL author "@spacepatcher"
LABEL repository "https://github.com/spacepatcher/Firehol-IP-Aggregator"

COPY app /app

RUN apk update \
  && apk add git \
             postgresql-dev \
             python3 \
             python3-dev \
             py3-pip \
  && apk add --virtual .deps build-base \
  && pip3 install -r /app/requirements.txt \
  && apk del .deps \
  && rm -rf /root/.cache/pip \
  && rm -rf /var/cache/apk

RUN adduser -D app \
  && chown -R app /app

USER app

WORKDIR /app

ENTRYPOINT ["./entrypoint.sh"]
