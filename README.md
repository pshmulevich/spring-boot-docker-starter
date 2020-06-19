# Spring Boot Docker Starter project

### Build your project:
`mvn clean package`

### Run and test your project locally: 
```
# Start the application and press ctrl-C to stop it at the end
java -jar target/spring-boot-docker-starter-0.0.1-SNAPSHOT.jar
# From another terminal window, verify the application is running
curl http://localhost:8080/api/health
```

### Build and start your application in Docker container:
```
# Build and start the application in the docker container in detached mode (in background)
docker-compose up --build -d
# Verify the application is running
curl http://localhost:8080/api/health
docker-compose down
```

#Alternatively, test with this command:
`docker inspect --format="{{json .State.Health}}" spring-boot-docker-starter_app_1`