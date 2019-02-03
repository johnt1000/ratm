FROM ruby:2.3-alpine

WORKDIR /app

RUN [ "gem", "install", "pry" ]

COPY . .