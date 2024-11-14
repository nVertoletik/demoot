# Use a Maven image as the base for building
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

COPY common/prefetch/pom.xml ./
RUN mvn dependency:go-offline -B

# Copy the entire project into the container
COPY . /app

# Build the client project
RUN mvn clean install -DskipTests

# Second stage for a lightweight runtime image
FROM openjdk:17.0.1-jdk-slim

# Set working directory and copy only the generated JAR from the build stage
WORKDIR /app
COPY --from=build /app/loadgen/target/loadgen-1.0-SNAPSHOT-all.jar loadgen.jar

# Define the default command to run the client
ENTRYPOINT ["java", "-jar", "loadgen.jar"]
