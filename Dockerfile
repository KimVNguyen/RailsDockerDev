FROM ruby:2.5
ARG USR

#Performs Basic Installs
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install rails


#Adds current user to container
RUN useradd -ms /bin/bash $USR

CMD ["/bin/bash"]