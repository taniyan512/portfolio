FROM ruby:3.1.1

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs\
  mariadb-server\
  mariadb-client

WORKDIR /portfolio

COPY Gemfile /portfolio//Gemfile
COPY Gemfile.lock /portfolio//Gemfile.lock


RUN gem install bundler
RUN bundle install 

RUN mkdir -p tmp/sockets
