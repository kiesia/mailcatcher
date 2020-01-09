FROM ruby:2.6-alpine

EXPOSE 1025 1080

RUN addgroup -S mailcatcher && adduser -S -G mailcatcher mailcatcher

RUN apk update && apk add -u sqlite sqlite-dev build-base && rm -rf /var/cache/apk/*
RUN gem install mailcatcher

USER mailcatcher

CMD ["mailcatcher", "-v", "-f", "--ip", "0.0.0.0"]