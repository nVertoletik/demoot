FROM openjdk:17-jdk-alpine

COPY --from=siz65484.live.dynatrace.com/linux/oneagent-codemodules-musl:java / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

WORKDIR /app

COPY ./target/codespaces-playground-1.0-SNAPSHOT.jar codespaces-playground-1.0-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "codespaces-playground-1.0-SNAPSHOT.jar"]