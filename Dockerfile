FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /kart_racing

WORKDIR /kart_racing

COPY . /kart_racing

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --pre
RUN bundle install --binstubs

