FROM ruby:latest
ARG USR=root

#Performs Basic Installs

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y build-essential libpq-dev nodejs sqlite libsqlite3-dev
RUN gem install --no-rdoc --no-ri rails sqlite3


#Adds current user to container
RUN useradd -ms /bin/bash $USR
USER $USR:$USR

CMD ["/bin/bash"]