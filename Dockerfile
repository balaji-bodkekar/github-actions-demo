FROM eclipse-temurin:17-jre-alpine

# DevSecOps Best Practice: Patch the OS immediately
RUN apk update && apk upgrade --no-cache

# Run as non-root user
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

WORKDIR /app
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
