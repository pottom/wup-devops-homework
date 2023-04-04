FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/wup-devops-homework.jar /app
CMD ["java", "-jar", "wup-devops-homework.jar"]
