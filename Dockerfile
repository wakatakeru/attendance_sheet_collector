FROM ruby:2.5.0

ENV APP_ROOT /usr/src/attendance_sheet_collector

WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y nodejs \
                       postgresql-client
                       
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle config --global build.nokogiri --use-system-libraries && \
    bundle install

COPY . $APP_ROOT

CMD ["rails", "server", "-b", "0.0.0.0"]