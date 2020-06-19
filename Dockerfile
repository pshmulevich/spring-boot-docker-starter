FROM openjdk:8-jdk-alpine

RUN apk add maven

RUN mkdir /app
# Copy everything in the project into /app
COPY ./target/spring-boot-docker-starter-0.0.1-SNAPSHOT.jar /app/app.jar
# Switch to /app folder
WORKDIR /app
EXPOSE 8080
# Configure Docker health check
HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1:8080 || exit 1

ENTRYPOINT ["java","-jar","app.jar"]