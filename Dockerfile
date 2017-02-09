FROM ruby:2.0

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
        sqlite3 \
        nodejs

RUN mkdir -p /app 
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

RUN ["rake", "db:reset"]
RUN ["rake", "db:import_csv"]
RUN ["rake", "test:prepare"]

CMD ["rails", "server", "-b", "0.0.0.0"]