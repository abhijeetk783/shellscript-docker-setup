#!/bin/sh


if [ ! -x /var/lib/docker ]; 
    then
        echo "------------------------"
        echo "|  INSTALLING DOCKER   |"
        echo "------------------------"
        echo 

        echo "************  Update existing list of packages  ************"
        apt update -y
        echo 

        echo "************  Installing prerequisite packages which let apt use packages over HTTPS  ************"
        apt install -y apt-transport-https ca-certificates curl software-properties-common
        echo 

        echo "************  Adding the GPG key for the official Docker repository to the system  ************"
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
        echo 

        echo "************  Add the Docker repository to APT sources  ************"
        add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
        echo 

        echo "************  Update the package database with the Docker packages from the newly added repo  ************"
        apt update -y
        echo 

        echo "************  Verify installation from the Docker repo instead of the default Ubuntu repo  ************"
        apt-cache policy docker-ce
        echo 

        echo "************  Install Docker  ************"
        apt install -y docker-ce
        echo 
        echo "-----------------------------------"
        echo "|  DOCKER INSTALLED SUCCESSFULLY  |"
        echo "-----------------------------------"
        echo 
        echo 
        echo 
        echo 
        echo "--------------------------------"
        echo "|  INSTALLING DOCKER COMPOSE   |"
        echo "--------------------------------"
        echo 

        echo "************  Download Latest (1.29.2) Docker compse release  ************"
        echo "************  & save the executable file at /usr/local/bin/docker-compose which will make this software globally accessible  ************"
        curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        echo 

        echo "************  Setting the correct permissions so that the docker-compose command is executable  ************"
        chmod +x /usr/local/bin/docker-compose
        echo 
        echo 
        echo "--------------------------------------------"
        echo "|  DOCKER COMPOSE INSTALLED SUCCESSFULLY   |"
        echo "--------------------------------------------"
        echo 
        echo 
else
    echo
            echo "DOCKER ALREADY INSTALLED"
    echo
fi

