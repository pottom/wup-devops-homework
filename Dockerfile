FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY . /app
RUN ./mvnw package -DskipTests
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
CMD ["java", "-jar", "app.jar"]
