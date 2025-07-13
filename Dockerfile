FROM node:22

# Create app directory
WORKDIR /usr/src/app
COPY package.json ./
RUN apt-get update && \
    apt-get install -y curl make ncat && \
    apt-get clean
#RUN curl -fL https://install-cli.jfrog.io | sh

# If you are building your code for production
RUN npm i --omit dev
EXPOSE 3000

COPY server.js ./
COPY public public/
COPY views views/
COPY fake-creds.txt /usr/src/
CMD [ "node", "server.js" ]
