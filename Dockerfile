FROM ruby:slim

MAINTAINER Andrew Mason <andrew@fixedpoint.xyz>

ADD Gemfile .

RUN bundle install

ADD . /code
WORKDIR /code

CMD ["irb"]
