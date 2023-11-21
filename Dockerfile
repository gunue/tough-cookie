# Use an official Node runtime as a parent image
FROM node:14

# Update the package list
RUN apt-get update

# Install Python 2, Python 3, and OpenSSL
RUN apt-get install -y python2 python3 openssl

# Optionally, upgrade Python and OpenSSL to the latest versions
# RUN apt-get upgrade -y python2 python3 openssl

# Set the working directory in the container for your application
WORKDIR /opt/app-root/src

# Copy package.json and package-lock.json
COPY package*.json ./

# Install application dependencies (tough-cookie v4.1.3)
RUN npm install

# Install tough-cookie v2.5.0 in a separate directory
RUN mkdir -p /usr/lib/node-modules/npm/node-modules \
    && cd /usr/lib/node-modules/npm/node-modules \
    && npm install tough-cookie@2.5.0

# Bundle app source
COPY src/ .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app when the container launches
CMD ["node", "index.js"]

