## demo app - developing with Docker

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based

### With Docker


#### To start the application


step 0: Pull mongodb and mongo-express images from docker hub.

![mongodb-and-mongo-express-docker-image-pull](app/images/mongo-and-mongo-express-docker-image.png)


Step 1: Create docker network

    docker network create mongo-network 

Step 2: start mongodb 

    docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    

![mongodb-running](app/images/starting-mongodb.png)
Step 3: start mongo-express
    
    docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   

_NOTE: creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command_

Step 4: open mongo-express from browser

    http://localhost:8081

![mongo-express-in-browser](app/images/mongo-express-dashboard.png)

Step 5: create `user-account` _db_ and `users` _collection_ in mongo-express

![users-collection](app/images/users-collection.png)

Step 6: Start your nodejs application locally - go to `app` directory of project 

    cd app
    npm install 
    node server.js
    
Step 7: Access you nodejs application UI from browser

    http://localhost:3000

![running-app](app/images/node-app.png)

step 8: Edit the record and view changes in users collection from the mongo-express browser link.

![details](app/images/db-data.png) ![collections](app/images/db-collection.png)

### With Docker Compose

#### To start the application

Step 1: start mongodb and mongo-express

    docker-compose -f mongo.yaml up

![docker-compose](app/images/docker-compose-command-executed.png)
    
_You can access the mongo-express under localhost:8081 from your browser_
    
Step 2: in mongo-express UI - create a new database "user-account"

![user-account](app/images/create-db.png)

Step 3: in mongo-express UI - create a new collection "users" in the database "user-account"  

 ![user-collection](app/images/create-collection.png)
    
Step 4: start node server 

    cd app
    npm install
    node server.js
    
Step 5: access the nodejs application from browser 

    http://localhost:3000

#### To build a docker image from the application

    docker build -t js-app:1.0 .       
    
The dot "." at the end of the command denotes location of the Dockerfile.

![docker-build-in-browser](app/images/building-docker-image.png)


![docker-image-running-on-server](app/images/running-app.png)