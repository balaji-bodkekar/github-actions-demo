FROM eclipse-temurin:17-jdk-jammy

# Updated and upgrade system packages to patch known vulnerabilities
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
