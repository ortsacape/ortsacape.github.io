FROM ruby:2.3.0
EXPOSE 4000
ARG USER_ID
ARG USER_NAME
RUN useradd -u $USER_ID $USER_NAME -m
RUN chown -R $USER_NAME:$USER_NAME /usr/local/src
USER $USER_NAME
RUN gem install bundler 
WORKDIR /usr/local/src
ADD Gemfile /usr/local/src/
RUN bundle install
VOLUME /usr/local/src
CMD bundle exec jekyll serve --host '0.0.0.0' --watch --incremental
