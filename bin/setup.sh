#!/bin/bash

if [ "$(docker images | grep react-app)" ];
then
	echo "Image for react-app found."
else
	echo "Image for react-app not found. Building image ..."
	docker build -t react-app .
fi

echo "Configuring project container with Create React App ..."
docker-compose -f setup-config.yml run app create-react-app .
