# Used a lightweight Alpine-based JRE image
FROM eclipse-temurin:17-jre-alpine

# Created working directory inside container
WORKDIR /app

# Coped JAR into container
COPY target/*.jar app.jar

# Command to run the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
