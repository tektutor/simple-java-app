FROM docker.io/openjdk:latest
COPY app.jar /app.jar
ENTRYPOINT [ "java", "-jar", "/app.jar" ]
