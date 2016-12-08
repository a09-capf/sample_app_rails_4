FROM ruby:2.3.3-alpine
ADD . /app
WORKDIR /app
ENV RAILS_ENV=production
RUN apk --update --no-cache add make g++ musl-dev libffi-dev linux-headers postgresql-dev nodejs && \
  bundle install --deployment --without development test doc && \
  bundle exec rake assets:precompile
EXPOSE 8080
VOLUME /app/public
