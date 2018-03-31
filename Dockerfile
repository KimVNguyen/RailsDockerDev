FROM ruby:latest
ARG USR=root

#Performs Basic Installs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install -y build-essential libpq-dev nodejs sqlite libsqlite3-dev && \
gem install --no-rdoc --no-ri rails sqlite3 rake

#Adds current user to container
RUN useradd -ms /bin/bash $USR && \
usermod -aG sudo $USR && \
echo "$USR ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $USR:$USR

CMD ["/bin/bash"]