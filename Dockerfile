FROM docker.io/maven:3.6.3-jdk-11 as stage1
COPY * .
RUN mvn clean package

FROM docker.io/maven:3.6.3-jdk-11
COPY --from=stage1 target/tektutor-java-app-1.0.jar tektutor-java-app-1.0.jar 
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "tektutor-java-app-1.0.jar" ]
