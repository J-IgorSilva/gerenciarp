FROM maven:3.6.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /target/gerenciahospital-0.0.1-SNAPSHOT.jar gerenciahospital-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","gerenciahospital-0.0.1-SNAPSHOT.jar"] //dfd