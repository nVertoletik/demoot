# Use a Maven image as the base for building
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

COPY common/prefetch/pom.xml ./
RUN mvn dependency:go-offline -B