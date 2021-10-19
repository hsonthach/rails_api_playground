FROM ruby:3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD bin/rails server -p 3001 -b 0.0.0.0