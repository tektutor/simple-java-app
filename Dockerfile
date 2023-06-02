FROM docker.io/maven:3.6.3-jdk-11 as stage1
COPY * .
RUN mvn clean package

FROM docker.io/openjdk:8-jre-alpine 
COPY --from=stage1 target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "./app.jar" ]
