# Use a Maven image as the base for building
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Build the client project
RUN mvn clean install -DskipTests

# Second stage for a lightweight runtime image
FROM openjdk:17.0.1-jdk-slim

COPY --from=DYNATRACE_DOCKER_REGISTRY/linux/oneagent-codemodules-musl:java / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

ENV OTEL_PROPAGATORS=tracecontext
ENV OTEL_TRACES_EXPORTER=none

ENV OTEL_SERVICE_NAME=order-api
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_METRICS_PROTOCOL=http/protobuf
ENV OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=http://localhost:4318/v1/metrics
ENV OTEL_JAVA_GLOBAL_AUTOCONFIGURE_ENABLED=true
ENV OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE=DELTA
# ENV OTEL_EXPORTER_OTLP_METRICS_HEADERS=Authorization=Api-Token dt0c01.########################.################################################################

ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_LOGS_PROTOCOL=http/protobuf
ENV OTEL_EXPORTER_OTLP_LOGS_ENDPOINT=http://localhost:4318/v1/logs
# ENV OTEL_EXPORTER_OTLP_LOGS_HEADERS=Authorization=Api-Token dt0c01.########################.################################################################

# Set working directory and copy only the generated JAR from the build stage
WORKDIR /app
COPY --from=build /app/frontend/target/frontend-1.0-SNAPSHOT-all.jar frontend.jar

# Define the default command to run the client
ENTRYPOINT ["java", "-jar", "frontend.jar"]
