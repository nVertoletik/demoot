FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests -B

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/loadgen/target/loadgen-1.0-SNAPSHOT-all.jar loadgen.jar

ENTRYPOINT ["java", "-jar", "loadgen.jar"]
