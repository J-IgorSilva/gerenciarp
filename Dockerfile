FROM maven:4.0.0-opendjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM opendjdk:17-jdk-slim
COPY --from=build /target/gerenciahospital-0.0.1-SNAPSHOT.jar gerenciahospital-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","gerenciahospital-0.0.1-SNAPSHOT.jar"] //dfd