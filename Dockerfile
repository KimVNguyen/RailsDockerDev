FROM ubuntu:xenial
ARG USR=root

EXPOSE 3000

#Performs Basic Installs
RUN apt-get update && apt-get -y install curl software-properties-common python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - 
RUN apt-get install -y build-essential libpq-dev nodejs sqlite libsqlite3-dev sudo ruby2.5 ruby2.5-dev
RUN gem install --no-rdoc --no-ri rails sqlite3

#Adds current user to container
RUN useradd -ms /bin/bash $USR && \
usermod -aG sudo $USR && \
echo "$USR ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN su 

USER $USR:$USR

# CMD ["/bin/bash"]
