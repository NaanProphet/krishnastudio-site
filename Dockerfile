FROM ruby:2.6

SHELL ["/bin/bash", "-c"]

RUN gem update --system && gem install jekyll bundler

EXPOSE 4000
