# RailsDockerDev
Builds a docker image for development with ruby on rails.  The container will have the following components:
    
    Latest version of Ruby
    Ruby on Rails
    Node JS LTS Version 
    Sqlite3

The intent of this docker image is to provide a container with the basics to get started with Ruby on Rails development.  

This image is intended to be used by mapping a directory on the host system as a blind mount on the container.  


With this in mind a build agrument "USR" needs to be passed to the build.  This is because any file created for within the container on a linux system will be owned by the "root" user.  Creating a user that is the same as the current user will solve this problem.  

This is not a problem on Mac or Windows systems.


## To Build the Image 

A wrapper shell script has been created to build the image with the current user as the user for the docker container.  To use:

### nix Based Systems

    ./buildDocker.sh

### Windows Systems

    buildDocker.bat