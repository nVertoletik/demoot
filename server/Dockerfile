# Use a Maven image as the base to simplify Maven and Java setup
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Build the server project
RUN mvn -f server/pom.xml clean package -DskipTests

# Run a second stage to create a lighter image
FROM openjdk:17.0.1-jdk-slim

# Set working directory and copy only the generated JAR from the build stage
WORKDIR /app
COPY --from=build /app/server/target/server-1.0-SNAPSHOT.jar server.jar

# Expose the port the server listens on
EXPOSE 8080

# Define the default command to run the server
ENTRYPOINT ["java", "-jar", "server.jar"]
