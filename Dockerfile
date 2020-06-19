FROM openjdk:8-jdk-alpine
  
RUN apk --update add curl

RUN mkdir /app

# Copy everything in the project into /app
COPY ./target/spring-boot-docker-starter-0.0.1-SNAPSHOT.jar /app/app.jar

# Switch to /app folder
WORKDIR /app

# Configure Docker health check
HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS http://localhost:8080/api/health || exit 1

# Configure service startup command
ENTRYPOINT ["java","-jar","app.jar"]