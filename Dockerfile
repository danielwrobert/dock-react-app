# Start with Node v8.0.0
FROM node:latest

LABEL maintainer="danielwrobert@gmail.com"

# Expose/use port 3000 on the container
EXPOSE 3000

# Upodate system and install Create React App globally
RUN apt-get update && \
    apt-get install vim -y && \
    npm install -g create-react-app

# Create app directory (if it doesn't already exist)
RUN mkdir -p /usr/src/app/

# Switch to app dir
WORKDIR /usr/src/app/

# Copy over .env (no path to .env file needed because Dockerfile and .env file are in same folder. If not, specified path would be needed.)
COPY .env /usr/src/app/

# Volume to expose inside the container
# Doesn't actually map anything. Lets user know to create that volume mapping on their container.
VOLUME /usr/src/app
