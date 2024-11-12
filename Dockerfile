FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY ./target/codespaces-playground-1.0-SNAPSHOT.jar codespaces-playground-1.0-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "codespaces-playground-1.0-SNAPSHOT.jar"]