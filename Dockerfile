# this is th ruby version used to run everything
FROM ruby:2.6.5-alpine

RUN apk add --update build-base git

LABEL "repository"="https://github.com/andrewmcodes/standardrb-action"
LABEL "maintainer"="Andrew Mason <andrewmcodes@protonmail.com>"
LABEL "version"="0.0.2"

# copies the files from the repo into the Docker image
COPY lib /action/lib
COPY README.md LICENSE /

# install the bundler gem ready
RUN gem install bundler

# triggers everything
ENTRYPOINT ["/action/lib/entrypoint.sh"]
