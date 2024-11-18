FROM maven:3.8.5-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml /app/
COPY loadgen/pom.xml /app/loadgen/
COPY order-api/pom.xml /app/order-api/
COPY order-backend/pom.xml /app/order-backend/
COPY common/pom.xml /app/common/

RUN mvn dependency:resolve-plugins dependency:go-offline -B

WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests -B

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/loadgen/target/loadgen-1.0-SNAPSHOT-all.jar loadgen.jar

ENTRYPOINT ["java", "-jar", "loadgen.jar"]
