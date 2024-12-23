FROM node:20-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY ./app /home/app

# Set default dir for subsequent commands to be executed in the dir
WORKDIR /home/app

# Will execute the npm install in /home/app beacause of WORKDIR
RUN npm install

CMD [ "node", "server.js" ]