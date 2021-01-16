ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION
LABEL MAINTAINER=marlos.irapuan@gmail.com

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install postgresql-client -y

WORKDIR /app
ADD . /app

# Declaring TMP and LOG folders as volume improves performance
# for file intensive operations.
VOLUME ./tmp
VOLUME ./log

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${PATH}:${BUNDLE_BIN}"

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
