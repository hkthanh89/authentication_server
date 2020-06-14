FROM ruby:2.6.3-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.1.4

RUN bundle install

COPY . .

# script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]