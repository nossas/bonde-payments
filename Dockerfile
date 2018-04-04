FROM alpine:3.7

ENV RUBY_ENV=production

RUN apk update && apk upgrade
RUN apk --update add ruby ruby-bundler ruby-irb ruby-bigdecimal ruby-json git postgresql-dev libxml2-dev libxslt-dev openssl libpq libffi-dev curl-dev bash libstdc++ tzdata ca-certificates build-base ruby-dev libc-dev linux-headers

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/

RUN bundle install
COPY . /usr/app

