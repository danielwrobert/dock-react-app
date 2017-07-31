# Docker + Create React App

A React development environment using Docker and Create React App.

## Installation

Clone this repo to your project directory - `git clone [REPO URL] [LOCAL PROJECT DIRECTORY]`

## Setup and Usage

1. Build the Docker image by running `docker build -t react-app .`. If you choose, you can replace `react-app` with a different image name but you would then need to replace the `image` line in both the `setup-config.yml` and `docker-compose.yml` files.
1. Initialize the React project via Create React App, using the `setup-config.yml` file and `docker-compose` by running `docker-compose -f ./setup-config.yml run app create-react-app .`. Note that the `setup-config.yml` file is a copy of the `docker-compose.yml` file, with no `npm start` command - it is just used for a one-off CRA init.
1. Run your application with the Docker image by running `docker-compose up -d`.
1. Edit the application files from the shared `app` directory on your local machine.
1. Stop your Docker container by running `docker-compose stop`.
1. If you're completely finished with you application and wish to remove it from your machine, you can do so by running `docker-compose down --volumes` (you can view the full `docker-compose` CLI reference [here](https://docs.docker.com/compose/reference/overview/).

**Things to note**

The in the Docker file, we're starting from the `node:latest` image. This gives you the latest version of Node. If you're working on a project (especially if you pull other people in), you may want to explicitly set a version to ensure that everyone is working from the exact same environment. You can see the available versions [here](https://store.docker.com/images/node).

_TODO: Planning to publish image to Docker Hub and move initial setup commands to a `setup.sh` script._
