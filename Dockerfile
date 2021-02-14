FROM python:alpine

LABEL maintainer="marcello.desales@gmail.com"
LABEL origin="https://github.com/marcellodesales/docker-pycobertura"

#RUN apk add gcc g++ libxml2-dev libxslt-dev
# https://stackoverflow.com/questions/35931579/how-can-i-install-lxml-in-docker/57535436#57535436
RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev && \
    apk add --no-cache libxslt && \
    pip install --no-cache-dir lxml>=3.5.0 && \
    apk del .build-deps

RUN pip install pycobertura

COPY entrypoint.sh /entrypoint.sh

RUN pycobertura
ENTRYPOINT ["/entrypoint.sh"]
