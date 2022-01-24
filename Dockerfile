FROM ruby:2.7.4-alpine

RUN apk add --update build-base git

LABEL "repository"="https://github.com/andrewmcodes/standardrb-action"
LABEL "maintainer"="Andrew Mason <andrewmcodes@protonmail.com>"
LABEL "version"="0.0.2"

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
