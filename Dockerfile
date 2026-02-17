FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests

FROM eclipse-temurin:17-jdk-focal

WORKDIR /app

COPY --from=build /app/target/kata-0.0.1-SNAPSHOT.jar ./kata.jar

EXPOSE 8080

CMD ["java", "-jar", "kata.jar"]
