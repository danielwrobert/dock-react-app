# Start with Node v8.0.0
FROM node:latest

LABEL maintainer="danielwrobert@gmail.com"

# Upodate system and install Create React App globally
RUN apt-get update && \
    npm install -g create-react-app

# Create src directory (if it doesn't already exist)
RUN mkdir -p /usr/src/

# Switch to src dir
WORKDIR /usr/src/

# Create new app in an `app` dir with CRA
RUN create-react-app app

# Switch to app dir
WORKDIR /usr/src/app/

# Copy over .env (no path to .env file needed because Dockerfile and .env file are in same folder. If not, specified path would be needed.)
COPY .env /usr/src/app/

# Expose/use port 3000 on the container
EXPOSE 3000

# Start the node app with the npm start command
CMD ["npm", "start"]

# Volume to expose inside the container
VOLUME /usr/src/app/
