FROM ruby:2.0

RUN apt-get update && apt-get install -y \
        build-essential                  \
        nodejs                           \


# infamous long-running thing, is worth separate caching
RUN gem install nokogiri


RUN mkdir -p /app 
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000
    
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]