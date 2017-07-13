FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y bash openssl libssl-dev curl

# ensure https repo packages get installed for nodejs repo
RUN apt-get install -y apt-transport-https

RUN apt-get install -y gawk libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev libreadline6-dev libxml2-dev libxslt1-dev

# Fix rails server bug on missing TZdata
RUN apt-get install -y tzdata

# Need git for bower
RUN apt-get install -y git

# for a JS runtime for asset precompilation and ReactJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs

# RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm install 2.1.1"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN echo 'source /etc/profile.d/rvm.sh' >> /etc/bash.bashrc

# Postgres
RUN apt-get install -y libpq-dev

# Create datalink folders for mountpoint
ENV APP iris
ENV DIRPATH /usr/local/datalink
RUN mkdir -p $DIRPATH/$APP

# Install gems
COPY iris/Gemfile* /tmp/
WORKDIR /tmp
RUN /bin/bash -l -c "rvm --create use ruby-2.1.1@iris"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "bundle install"

# Lets go to APP DIR
WORKDIR $DIRPATH/$APP
