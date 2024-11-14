FROM maven:3.8.5-openjdk-17-slim
WORKDIR /app

COPY common/prefetch/pom.xml ./
RUN mvn dependency:go-offline -Dmaven.repo.local=app/.m2 -B