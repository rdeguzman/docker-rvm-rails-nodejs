FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y bash openssl libssl-dev curl
RUN apt-get install -y gawk libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev libreadline6-dev
RUN apt-get install -y node 

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm install 2.1.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN echo 'source /etc/profile.d/rvm.sh' >> /etc/bash.bashrc
