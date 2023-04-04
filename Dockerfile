# Build the Spring Boot app
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ /app/src/
RUN mvn package -DskipTests

# Create the container with the built app
FROM openjdk:17-slim

WORKDIR /app

COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar
COPY ./application.properties /app/
COPY ./log4j2-weather.yml /app/
COPY ./check_env.sh /app/
COPY ./run.sh /app/

RUN chmod 0644 /app/check_env.sh

RUN apt-get update && apt-get install -y cron 

EXPOSE 8080

CMD ["/bin/sh", "/app/run.sh"]
