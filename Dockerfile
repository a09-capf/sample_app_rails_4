FROM ruby:2.0.0
ADD . /app
WORKDIR /app
ENV RAILS_ENV=production
ENV PORT=3000
RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs && \
  bundle install --deployment --without development test doc && \
  bundle exec rake assets:precompile
EXPOSE 3000
VOLUME /app/public
