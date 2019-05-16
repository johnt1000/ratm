FROM ruby:2.3-alpine

WORKDIR /app

RUN apk update \
    && apk add --virtual build-dependencies \
        build-base \
        gcc \
        curl \
        nmap \
        git \
    && apk add \
        bash

RUN gem install pry \
    colorize \
    bundle

COPY . .