# Etapa 1: construcción usando Maven y OpenJDK 17
FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

# Copia todos los archivos del proyecto
COPY . .

# Compila el proyecto y construye el jar
RUN mvn clean install -DskipTests

# Etapa 2: imagen ligera para ejecutar la app
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copia el JAR generado desde la etapa de construcción
COPY --from=build /app/target/kata-0.0.1-SNAPSHOT.jar ./kata.jar

# Exponer el puerto 8080
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "kata.jar"]
