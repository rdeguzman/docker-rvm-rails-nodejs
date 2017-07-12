FROM ruby:2.3.1
  
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y bash openssl libssl-dev curl

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash 
RUN apt-get install -y nodejs nodejs-dev npm

RUN apt-get install -y gawk libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev libreadline6-dev

RUN apt-get install -y libssl-doc libpq-dev python-psycopg2


ENV APP_HOME /iris

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
  
ADD Gemfile* $APP_HOME/

RUN bundle install

ADD . $APP_HOME
