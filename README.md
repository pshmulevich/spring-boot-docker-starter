# Spring Boot Docker Starter project

## Setting up Spring Boot Application

### Build your project:
`mvn clean package`

### Run and test your project locally: 
```
# Start the application and press ctrl-C to stop it at the end
java -jar target/spring-boot-docker-starter-0.0.1-SNAPSHOT.jar

# or using maven plugin:

mvn spring-boot:run

# From another terminal window, verify the application is running
curl http://localhost:8080/api/health
```

## Dockerizing the application

### Build and start your application in Docker container:
```
# Build and start the application in the docker container in detached mode (in background)
docker-compose up --build -d
# Verify the application is running
curl http://localhost:8080/api/health
# Stop docker container
docker-compose down
```

## Using Docker inspect for health check

### Test health status with this command:
```
docker inspect --format="{{json .State.Health}}" spring-boot-docker-starter_app_1
# Or
docker inspect --format="{{json .State.Health.Status}}" spring-boot-docker-starter_app_1
```

#### Use python to pretty print the json output of your response:
`docker inspect --format="{{json .State.Health}}" spring-boot-docker-starter_app_1 | python -m json.tool`

## Using Spring Boot Actuator

#### To check the health status using the actuator endpoint (enable actuator first - see application.properties):
`http://localhost:8080/actuator/health`
 
 expect to see: `{"status":"UP"}`

#### To check actuator info (see application.properties on how to configure info):
`http://localhost:8080/actuator/info`

#### Shut down the application (not the container) to see change in health status:
`curl -X POST http://localhost:8080/actuator/shutdown -k`

#### Check status after shutting down the app:
`docker inspect --format="{{json .State.Health.Status}}" spring-boot-docker-starter_app_1`

expect to see: `"unhealthy"`

